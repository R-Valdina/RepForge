<?php
/** @var string $basePath */
/** @var AltoRouter $router */
/** To view a list of workout plans */

// Use our existing Plates layout
$this->layout('app_layout');

// Make the fixture loader available
require_once dirname(__DIR__) . '/fixture_loader.php';

// Load the available workout plans
$plans = loadFixture('workout-plans');
$sections = loadFixture('workout-plan-sections');
$workoutExercises = loadFixture('workout-exercises');
$exercises = loadFixture('exercises');

// Read the selected workout ID from the URL
$requestedPlanId = filter_input(
        INPUT_GET,
        'plan',
        FILTER_VALIDATE_INT
);

// Find the requested workout plan
$plan = null;
$selectedIndex = null;

foreach ($plans as $index => $candidate) {
    if ($candidate['Id'] === $requestedPlanId) {
        $plan = $candidate;
        $selectedIndex = $index;
        break;
    }
}

// If no plan was requested, select the first available
if ($requestedPlanId === null && !empty($plans)) {
    $selectedIndex = array_key_first($plans);
    $plan = $plans[$selectedIndex];
}

// Determine previous and next workout plans
$previousPlan = null;
$nextPlan = null;

if ($selectedIndex !== null) {
    $planCount = count($plans);

    // Wrap around at the beginning and end
    $previousIndex = ($selectedIndex - 1 + $planCount) % $planCount;
    $nextIndex = ($selectedIndex + 1) % $planCount;

    $previousPlan = $plans[$previousIndex];
    $nextPlan = $plans[$nextIndex];
}

// Finds sections that belong to the selected workout plan
$planSections = [];

if ($plan !== null) {
    foreach ($sections as $section) {
        if ($section['WorkoutPlanId'] === $plan['Id']) {
            $planSections[] = $section;
        }
    }
    // Sort sections by their order in the workout plan
    usort($planSections, function ($a, $b) {
        return $a['OrderInWorkoutPlan']
                <=> $b['OrderInWorkoutPlan'];
    });
}

// Create a lookup of exercise definitions by exercise ID
$exerciseById = [];
foreach ($exercises as $exercise) {
    $exerciseById[$exercise['Id']] = $exercise;
}

// Find the exercise belonging to each section
foreach ($planSections as $index => $section) { // goes through each section in the selected workout plan
    $sectionExercise = []; // empty array that will hold the exercises for the current section
    foreach ($workoutExercises as $assignment) { // goes through each workout exercise one record at a time and temp stores it in $assigment
        if ($assignment['WorkoutPlanSectionId'] === $section['Id']) { //checks if the exercise assignement belongs to the section we are currently processing
            $exerciseId = $assignment['ExerciseId']; //grabs the exercise id from the assignment record
            if (isset($exerciseById[$exerciseId])) { // checks whether the exercise definition matching the Id we just retrieved
                // combine the assigned exercise with its definition
                $definition = $exerciseById[$exerciseId];
                $sectionExercise[] = [ //add a new item to the end of the array
                        'Id' => $assignment['Id'],
                        'ExerciseId' => $exerciseId,
                        'Name' => $definition['Name'],
                        'Sets' => $assignment['Sets'],
                        'Reps' => $assignment['Reps'],
                        'Weight' => $assignment['Weight'],
                        'Duration' => $assignment['Duration'],
                        'OderInSection' => $assignment['OrderInSection'],
                        'Demonstration' => $definition['Demonstration'] ?? null
                ];
            }
        }
    }

    // Sort exercises by order in section
    usort($sectionExercise, function ($a, $b) {
        return $a['OderInSection'] <=> $b['OderInSection'];
    });

    // Attach exercise to the section for displaying
    $planSections[$index]['Exercises'] = $sectionExercise;
}
?>


<?php if ($plan !== null): ?>

    <!-- Workout title and navigation -->
    <div class="workout-navigation">

        <a href="?plan=<?= $previousPlan['Id'] ?>"
           aria-label="Previous workout plan">
            &#10094;
        </a>

        <h1>
            <?= htmlspecialchars(
                    $plan['Title'],
                    ENT_QUOTES,
                    'UTF-8'
            ) ?>
        </h1>

        <a href="?plan=<?= $nextPlan['Id'] ?>"
           aria-label="Next workout plan">
            &#10095;
        </a>

    </div>

    <!-- Workout sections and exercises -->
    <div class="workout-body">

        <?php foreach ($planSections as $section): ?>

            <h3>
                <?= htmlspecialchars($section['Name'], ENT_QUOTES, 'UTF-8') ?>
            </h3>
            <table class="workout-exercises">
                <thead>
                <tr>
                    <th>Exercise</th>
                    <th>Reps</th>
                    <th>Weight</th>
                    <th>Target Weight</th>
                    <th>Duration</th>
                    <th>Demo</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($section['Exercises'] as $exercise): ?>
                    <tr>
                        <td><?= htmlspecialchars((string)$exercise['Name'], ENT_QUOTES, 'UTF-8') ?></td>
                        <td><?= htmlspecialchars((string)($exercise['Sets'] ?? '-'), ENT_QUOTES, 'UTF-8') ?></td>
                        <td><?= htmlspecialchars((string)($exercise['Reps'] ?? '-'), ENT_QUOTES, 'UTF-8') ?></td>
                        <td><?= htmlspecialchars((string)($exercise['Weight'] ?? '-'), ENT_QUOTES, 'UTF-8') ?></td>
                        <td><?= htmlspecialchars((string)($exercise['Duration'] ?? '-'), ENT_QUOTES, 'UTF-8') ?></td>
                        <td><?php if (!empty($exercise['DemonstrationURL'])): ?>
                                <a href="<?= htmlspecialchars($exercise['DemonstrationURL'], ENT_QUOTES, 'UTF-8') ?>"
                                   target="_blank" rel="noopener noreferrer"> View Demo
                                </a>
                            <?php else: ?>
                                -
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>

        <?php endforeach; ?>

    </div>

<?php elseif ($requestedPlanId !== null): ?>

    <p>Workout plan not found.</p>

<?php else: ?>

    <p>No Workout Plans are available.</p>

<?php endif; ?>
