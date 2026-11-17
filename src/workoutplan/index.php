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
$planSections = [];

if ($plan !== null) {
    foreach ($sections as $section) {
        if ($section['WorkoutPlanId'] === $plan['Id']) {
            $planSections[] = $section;
        }
    }

    usort($planSections, function ($a, $b) {
        return $a['OrderInWorkoutPlan']
                <=> $b['OrderInWorkoutPlan'];
    });
}
?>


<?php if ($plan !== null): ?>

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
    <div class="workout-body">

        <?php foreach ($planSections as $section): ?>

            <h3>
                <?= htmlspecialchars(
                        $section['Name'],
                        ENT_QUOTES,
                        'UTF-8'
                ) ?>
            </h3>

        <?php endforeach; ?>

    </div>

<?php elseif ($requestedPlanId !== null): ?>

    <p>Workout plan not found.</p>

<?php else: ?>

    <p>No Workout Plans are available.</p>

<?php endif; ?>
