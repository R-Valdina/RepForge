<?php

/**
 * @var string $basePath
 * @var AltoRouter $router
 *
 * Workout Plan landing page.
 *
 * Displays the selected workout plan, its sections,
 * and the exercises assigned to each section.
 *
 * All workout information comes from our JSON fixtures.
 * No workout names or exercise details are hardcoded.
 */

// Tell Plates to display this page inside our shared app layout.
// The layout contains the navigation and other shared page elements.
$this->layout('app_layout');

// Load our reusable fixture loader.
// dirname(__DIR__) moves up from src/workoutplan to src.
// require_once ensures the loader is included only once.
require_once dirname(__DIR__) . '/fixture_loader.php';

// Load the four JSON datasets and convert them into PHP arrays.
// Each file represents a different group of database records.
$plans = loadFixture('workout-plans'); // Available workout plans
$sections = loadFixture('workout-plan-sections'); // Sections belonging to plans
$workoutExercises = loadFixture('workout-exercises'); // Exercise assignments
$exercises = loadFixture('exercises'); // Reusable exercise definitions


// ------------------------------------------------------
// STEP 1: DETERMINE WHICH WORKOUT PLAN TO DISPLAY
// ------------------------------------------------------

// Read the selected workout plan ID from the URL.
// Example: ?plan=2 requests the workout with ID 2.
//
// INPUT_GET tells PHP to look at the URL query parameters.
// 'plan' is the parameter name we are looking for.
// FILTER_VALIDATE_INT checks that the supplied value is an integer.
$requestedPlanId = filter_input(
        INPUT_GET,
        'plan',
        FILTER_VALIDATE_INT
);

// We haven't found a matching plan yet.
//
// null means no value has been selected.
// $selectedIndex will remember the plan's position in the array.
// We need that position later to calculate previous/next navigation.
$plan = null;
$selectedIndex = null;

// Go through each available workout plan.
//
// $index is the plan's position in the array.
// $candidate is the workout record at that position.
foreach ($plans as $index => $candidate) {

    // Compare the plan's database ID with the requested ID.
    // === requires both the value and data type to match.
    if ($candidate['Id'] === $requestedPlanId) {

        // Save the matching workout plan.
        $plan = $candidate;

        // Remember where this plan sits in the array.
        $selectedIndex = $index;

        // Stop searching because we found the requested plan.
        break;
    }
}

// If no plan ID was supplied, display the first available plan.
//
// This is only the default selection.
// It does not permanently restrict us to the first workout.
if ($requestedPlanId === null && !empty($plans)) {

    // Find the key of the first plan in the array.
    $selectedIndex = array_key_first($plans);

    // Retrieve the workout stored at that position.
    $plan = $plans[$selectedIndex];
}


// ------------------------------------------------------
// STEP 2: PREPARE THE PREVIOUS AND NEXT WORKOUT PLANS
// ------------------------------------------------------

// Start with no previous or next plan selected.
$previousPlan = null;
$nextPlan = null;

// Only calculate navigation if a valid workout was selected.
if ($selectedIndex !== null) {

    // Count how many workout plans are available.
    $planCount = count($plans);

    // Calculate the position of the previous workout.
    //
    // % is the modulo operator, which returns the remainder.
    // Adding $planCount prevents a negative position.
    //
    // This allows navigation to wrap from the first plan
    // back to the last plan.
    $previousIndex = ($selectedIndex - 1 + $planCount) % $planCount;

    // Calculate the position of the next workout.
    //
    // When we reach the last plan, modulo wraps us
    // back around to the first plan.
    $nextIndex = ($selectedIndex + 1) % $planCount;

    // Retrieve the actual workout records at those positions.
    // Their database IDs will be used to construct the arrow URLs.
    $previousPlan = $plans[$previousIndex];
    $nextPlan = $plans[$nextIndex];
}


// ------------------------------------------------------
// STEP 3: FIND THE SECTIONS FOR THE SELECTED WORKOUT
// ------------------------------------------------------

// Create an empty array to hold only the sections
// belonging to the currently selected workout plan.
$planSections = [];

// Only search for sections if a workout plan was found.
if ($plan !== null) {

    // Examine every section record from our JSON fixture.
    foreach ($sections as $section) {

        // Check whether the section belongs to our selected plan.
        //
        // WorkoutPlanId is the foreign key connecting
        // the section record to its parent workout plan.
        if ($section['WorkoutPlanId'] === $plan['Id']) {

            // Add the matching section to our new array.
            // [] appends the record to the end of the array.
            $planSections[] = $section;
        }
    }

    // Sort the selected sections into their intended display order.
    //
    // usort() sorts an array using our comparison function.
    // $a and $b represent two section records being compared.
    //
    // <=> compares their OrderInWorkoutPlan values.
    // Smaller order numbers appear first.
    usort($planSections, function ($a, $b) {
        return $a['OrderInWorkoutPlan']
                <=> $b['OrderInWorkoutPlan'];
    });
}


// ------------------------------------------------------
// STEP 4: CREATE AN EXERCISE DEFINITION LOOKUP
// ------------------------------------------------------

// Create an empty associative array.
//
// We will organize the exercise definitions using
// their database IDs as the array keys.
$exerciseById = [];

// Go through each reusable exercise definition.
foreach ($exercises as $exercise) {

    // Store the entire exercise definition under its ID.
    //
    // For example:
    // $exerciseById[56]
    //
    // This allows us to find an exercise directly by ID
    // rather than searching the whole definition list each time.
    $exerciseById[$exercise['Id']] = $exercise;
}


// ------------------------------------------------------
// STEP 5: ATTACH EXERCISES TO THEIR WORKOUT SECTIONS
// ------------------------------------------------------

// Go through each section belonging to our selected plan.
//
// $index identifies the section's position in $planSections.
// $section holds the section record at that position.
foreach ($planSections as $index => $section) {

    // Create a fresh empty array for the current section.
    //
    // It will collect only the exercises assigned to this section.
    // Starting fresh prevents exercises from another section
    // from carrying over into this one.
    $sectionExercise = [];

    // Examine each exercise assignment from the JSON fixture.
    //
    // An assignment connects an exercise definition to a
    // workout section and contains sets, reps, weight, etc.
    foreach ($workoutExercises as $assignment) {

        // Check whether this assignment belongs to
        // the section we are currently processing.
        //
        // WorkoutPlanSectionId is the foreign key connecting
        // the assignment to its workout section.
        if ($assignment['WorkoutPlanSectionId'] === $section['Id']) {

            // Retrieve the reusable exercise's ID
            // from the matching assignment.
            $exerciseId = $assignment['ExerciseId'];

            // Check that an exercise definition exists for this ID.
            //
            // isset() prevents us from accessing a missing or
            // null entry in the lookup array.
            if (isset($exerciseById[$exerciseId])) {

                // Retrieve the full reusable exercise definition.
                //
                // $assignment contains workout-specific information.
                // $definition contains general exercise information.
                $definition = $exerciseById[$exerciseId];

                // Combine the assignment and definition into
                // one record that our HTML table can display.
                //
                // [] adds this record to the current section's
                // growing exercise array.
                $sectionExercise[] = [

                    // Unique ID of this workout-exercise assignment.
                        'Id' => $assignment['Id'],

                    // ID of the reusable exercise definition.
                        'ExerciseId' => $exerciseId,

                    // Exercise name comes from the shared definition.
                        'Name' => $definition['Name'],

                    // These values belong to this specific workout.
                        'Sets' => $assignment['Sets'],
                        'Reps' => $assignment['Reps'],
                        'Weight' => $assignment['Weight'],
                        'Duration' => $assignment['Duration'],

                    // Position of the exercise within its section.
                        'OrderInSection' => $assignment['OrderInSection'],

                    // External exercise demonstration link.
                    //
                    // ?? null means use null if the URL is missing.
                        'DemonstrationURL' => $definition['DemonstrationURL'] ?? null
                ];
            }
        }
    }

    // Sort the exercises into their prescribed section order.
    //
    // This ensures exercises display in the order recorded
    // in the workout plan rather than their JSON file order.
    usort($sectionExercise, function ($a, $b) {
        return $a['OrderInSection'] <=> $b['OrderInSection'];
    });

    // Attach the sorted exercises to their parent section.
    //
    // The new Exercises key contains all exercise records
    // belonging to the section at this array position.
    //
    // We now have sections containing their own exercise arrays.
    $planSections[$index]['Exercises'] = $sectionExercise;
}

// PHP has now prepared the workout information.
// Below, we use HTML and PHP to display that information.
?>


<!-- ------------------------------------------------------
     STEP 6: DISPLAY THE SELECTED WORKOUT
     ------------------------------------------------------ -->

<?php if ($plan !== null): ?>

    <!-- Only display the workout when a valid plan was found. -->

    <!-- Workout title and previous/next navigation -->
    <div class="workout-navigation">

        <!-- Previous workout arrow -->
        <!-- The URL contains the previous plan's actual database ID. -->
        <a href="?plan=<?= $previousPlan['Id'] ?>"
           aria-label="Previous workout plan">
            &#10094;
        </a>

        <!-- Display the selected workout's title as the H1. -->
        <!-- The title comes from JSON, not hardcoded HTML. -->
        <h1>
            <?= htmlspecialchars(
                    $plan['Title'],
                    ENT_QUOTES,
                    'UTF-8'
            ) ?>
        </h1>

        <!-- Next workout arrow -->
        <!-- Clicking it requests the next plan using its ID. -->
        <a href="?plan=<?= $nextPlan['Id'] ?>"
           aria-label="Next workout plan">
            &#10095;
        </a>

    </div>


    <!-- --------------------------------------------------
         STEP 7: DISPLAY THE WORKOUT TABLE
         -------------------------------------------------- -->

    <!-- Container for all workout sections and exercises -->
    <div class="workout-body">

        <!-- Create ONE table for the entire selected workout. -->
        <table class="workout-exercises">

            <!-- Column headings appear only once at the top. -->
            <thead>
            <tr>
                <th scope="col">Exercise</th>
                <th scope="col">Sets</th>
                <th scope="col">Reps</th>
                <th scope="col">Target Weight</th>
                <th scope="col">Duration</th>
                <th scope="col">Demo</th>
            </tr>
            </thead>

            <!-- tbody contains the section headers and exercise rows. -->
            <tbody>

            <!-- Loop through the selected workout's sections. -->
            <?php foreach ($planSections as $section): ?>

                <!-- Create a full-width heading row for this section. -->
                <tr class="workout-section">

                    <!--
                    colspan="6" makes this header span all six columns.

                    The section name comes from JSON.

                    scope="rowgroup" identifies the heading
                    as a label for the section's rows.
                    -->
                    <th colspan="6" scope="rowgroup">
                        <?= htmlspecialchars(
                                $section['Name'],
                                ENT_QUOTES,
                                'UTF-8'
                        ) ?>
                    </th>
                </tr>

                <!-- Loop through the exercises attached to this section. -->
                <?php foreach ($section['Exercises'] as $exercise): ?>

                    <!-- Create one table row for the current exercise. -->
                    <tr>

                        <!-- Display the exercise name. -->
                        <!-- htmlspecialchars prevents text from being treated as HTML. -->
                        <td>
                            <?= htmlspecialchars(
                                    (string)$exercise['Name'],
                                    ENT_QUOTES,
                                    'UTF-8'
                            ) ?>
                        </td>

                        <!-- Display the prescribed number of sets. -->
                        <!-- If missing or null, display a dash. -->
                        <td>
                            <?= htmlspecialchars(
                                    (string)($exercise['Sets'] ?? '—'),
                                    ENT_QUOTES,
                                    'UTF-8'
                            ) ?>
                        </td>

                        <!-- Display the prescribed number of repetitions. -->
                        <td>
                            <?= htmlspecialchars(
                                    (string)($exercise['Reps'] ?? '—'),
                                    ENT_QUOTES,
                                    'UTF-8'
                            ) ?>
                        </td>

                        <!-- Display the workout's target weight. -->
                        <!-- Weight comes from the exercise assignment. -->
                        <td>
                            <?= htmlspecialchars(
                                    (string)($exercise['Weight'] ?? '—'),
                                    ENT_QUOTES,
                                    'UTF-8'
                            ) ?>
                        </td>

                        <!-- Display duration for timed exercises. -->
                        <!-- Missing durations display a dash. -->
                        <td>
                            <?= htmlspecialchars(
                                    (string)($exercise['Duration'] ?? '—'),
                                    ENT_QUOTES,
                                    'UTF-8'
                            ) ?>
                        </td>

                        <!-- Exercise demonstration link column -->
                        <td>

                            <!-- Check whether a demonstration URL exists. -->
                            <?php if (!empty($exercise['DemonstrationURL'])): ?>

                                <!--
                                Create an external link to the demonstration.

                                href receives the URL from our exercise data.

                                target="_blank" opens the link in a new tab.

                                rel="noopener noreferrer" improves security
                                and limits information sent to the destination.
                                -->
                                <a href="<?= htmlspecialchars(
                                        $exercise['DemonstrationURL'],
                                        ENT_QUOTES,
                                        'UTF-8'
                                ) ?>"
                                   target="_blank"
                                   rel="noopener noreferrer">
                                    View Demo
                                </a>

                            <?php else: ?>

                                <!-- No demonstration URL is available. -->
                                —

                            <?php endif; ?>

                        </td>

                    </tr>

                <?php endforeach; ?>
                <!-- End of the current section's exercise loop. -->

            <?php endforeach; ?>
            <!-- End of the workout section loop. -->

            </tbody>

        </table>
        <!-- End of the complete workout table. -->

    </div>
    <!-- End of the workout body container. -->


    <!-- ------------------------------------------------------
         STEP 8: HANDLE MISSING OR INVALID WORKOUT PLANS
         ------------------------------------------------------ -->

<?php elseif ($requestedPlanId !== null): ?>

    <!--
    A plan ID was supplied in the URL, but no matching
    workout plan was found in our fixture data.
    -->
    <p>Workout plan not found.</p>

<?php else: ?>

    <!--
    No workout plan was selected and there are no
    available workout plans to display.
    -->
    <p>No Workout Plans are available.</p>

<?php endif; ?>
<!-- End of the selected workout condition. -->
