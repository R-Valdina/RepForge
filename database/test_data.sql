 INSERT INTO User (Id, DisplayName, PasswordHash, ProfilePicture)
 VALUES 
(1, 'JordanMiles', '$2y$10$MockHashJordanMiles001', null),
(2, 'AlexRivera', '$2y$10$MockHashAlexRivera002', null),
(3, 'TaylorBrooks', '$2y$10$MockHashTaylorBrooks003', null),
(4, 'MorganReed', '$2y$10$MockHashMorganReed004', null),
(5, 'CaseyStone', '$2y$10$MockHashCaseyStone005', null);

INSERT INTO Measurement (Id, UserId, DateRecorded, Weight, Neck, UpperArm, ForeArm, Wrist, AcrossBreast, UnderBreast, Stomach, Hips, Thigh, Calf, Ankle, BMI, BodyFatPercentage)
VALUES
-- User 1: tracks most measurements
(1, 1, '2026-04-01', 185.4, 15.2, 13.4, 10.8, 6.5, 39.0, 36.5, 38.5, 40.0, 22.5, 15.0, 9.0, 30.9, 28.4),
(2, 1, '2026-05-01', 181.8, 15.0, 13.5, 10.8, 6.5, 38.5, 36.0, 37.6, 39.4, 22.4, 14.9, 9.0, 30.3, 27.5),
(3, 1, '2026-06-01', 177.6, 14.8, 13.5, 10.7, 6.4, 38.0, 35.8, 36.5, 38.7, 22.2, 14.8, 8.9, 29.6, 26.1),
(4, 1, '2026-07-01', 173.2, 14.6, 13.6, 10.7, 6.4, 37.5, 35.3, 35.6, 38.0, 22.1, 14.7, 8.9, 28.9, 24.8),
(5, 1, '2026-08-01', 169.5, 14.4, 13.7, 10.8, 6.4, 37.0, 35.0, 34.8, 37.4, 22.0, 14.7, 8.8, 28.3, 23.9),

-- User 2: mostly tracks weight and stomach
(6, 2, '2026-04-03', 142.0, NULL, NULL, NULL, NULL, NULL, NULL, 30.5, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 2, '2026-05-03', 143.2, NULL, NULL, NULL, NULL, NULL, NULL, 30.4, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 2, '2026-06-03', 144.8, NULL, NULL, NULL, NULL, NULL, NULL, 30.5, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 2, '2026-07-03', 146.1, NULL, NULL, NULL, NULL, NULL, NULL, 30.6, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 2, '2026-08-03', 147.5, NULL, NULL, NULL, NULL, NULL, NULL, 30.7, NULL, NULL, NULL, NULL, NULL, NULL),

-- User 3: tracks weight, stomach, hips, and body fat
(11, 3, '2026-04-05', 225.0, NULL, NULL, NULL, NULL, NULL, NULL, 43.0, 44.5, NULL, NULL, NULL, NULL, 32.8),
(12, 3, '2026-05-05', 218.5, NULL, NULL, NULL, NULL, NULL, NULL, 42.0, 43.8, NULL, NULL, NULL, NULL, 31.5),
(13, 3, '2026-06-05', 212.7, NULL, NULL, NULL, NULL, NULL, NULL, 41.0, 43.0, NULL, NULL, NULL, NULL, 30.2),
(14, 3, '2026-07-05', 207.3, NULL, NULL, NULL, NULL, NULL, NULL, 40.0, 42.4, NULL, NULL, NULL, NULL, 29.0),
(15, 3, '2026-08-05', 202.8, NULL, NULL, NULL, NULL, NULL, NULL, 39.2, 41.8, NULL, NULL, NULL, NULL, 28.1),

-- User 4: inconsistent tracker
(16, 4, '2026-04-07', 160.2, 14.0, NULL, NULL, NULL, NULL, NULL, 34.0, 38.0, NULL, NULL, NULL, 26.7, NULL),
(17, 4, '2026-05-07', 159.4, NULL, NULL, NULL, NULL, NULL, NULL, 33.6, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 4, '2026-06-07', 160.0, 14.1, 12.7, NULL, NULL, NULL, NULL, 33.5, NULL, 21.8, NULL, NULL, 26.6, NULL),
(19, 4, '2026-07-07', 161.3, NULL, 12.9, NULL, NULL, NULL, NULL, 33.4, NULL, 22.0, NULL, NULL, NULL, NULL),
(20, 4, '2026-08-07', 162.1, 14.2, 13.1, NULL, NULL, NULL, NULL, 33.3, 38.0, 22.2, NULL, NULL, 27.0, 22.0),

-- User 5: very minimal tracker
(21, 5, '2026-04-10', 198.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 5, '2026-05-10', 194.0, NULL, NULL, NULL, NULL, NULL, NULL, 39.7, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 5, '2026-06-10', 190.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 5, '2026-07-10', 187.1, NULL, NULL, NULL, NULL, NULL, NULL, 38.2, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 5, '2026-08-10', 183.8, NULL, NULL, NULL, NULL, NULL, NULL, 37.5, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO Macro (Id, UserId, DateRecorded, TotalCalories, Protein, Carbohydrates, Fat, Sugar, Fiber)
VALUES 
-- User 1: tracks everything
(1, 1, '2026-04-01', 2100, 165, 220, 65, 48, 24),
(2, 1, '2026-05-01', 2150, 170, 225, 66, 50, 25),
(3, 1, '2026-06-01', 2200, 175, 230, 68, 47, 26),
(4, 1, '2026-07-01', 2250, 180, 235, 70, 45, 27),
(5, 1, '2026-08-01', 2300, 185, 240, 72, 44, 28),

-- User 2: only cares about total calories
(6, 2, '2026-04-03', 1800, NULL, NULL, NULL, NULL, NULL),
(7, 2, '2026-05-03', 1850, NULL, NULL, NULL, NULL, NULL),
(8, 2, '2026-06-03', 1900, NULL, NULL, NULL, NULL, NULL),
(9, 2, '2026-07-03', 1950, NULL, NULL, NULL, NULL, NULL),
(10, 2, '2026-08-03', 2000, NULL, NULL, NULL, NULL, NULL),

-- User 3: tracks calories and main macros
(11, 3, '2026-04-05', 2500, 190, 275, 75, NULL, NULL),
(12, 3, '2026-05-05', 2450, 185, 270, 73, NULL, NULL),
(13, 3, '2026-06-05', 2400, 180, 260, 72, NULL, NULL),
(14, 3, '2026-07-05', 2350, 180, 250, 70, NULL, NULL),
(15, 3, '2026-08-05', 2300, 175, 245, 68, NULL, NULL),

-- User 4: mixed / inconsistent tracking
(16, 4, '2026-04-07', 2000, 150, NULL, 60, NULL, NULL),
(17, 4, '2026-05-07', 2050, 155, 215, NULL, NULL, NULL),
(18, 4, '2026-06-07', 2100, 160, 220, 65, 40, NULL),
(19, 4, '2026-07-07', 2150, 165, 225, 67, NULL, 20),
(20, 4, '2026-08-07', 2200, 170, 230, 70, 42, 22),

-- User 5: mainly cares about protein, carbs, fat, and calories
(21, 5, '2026-04-10', 1900, 145, 190, 62, NULL, NULL),
(22, 5, '2026-05-10', 1950, 150, 195, 63, NULL, NULL),
(23, 5, '2026-06-10', 2000, 155, 200, 65, NULL, NULL),
(24, 5, '2026-07-10', 2050, 160, 205, 66, NULL, NULL),
(25, 5, '2026-08-10', 2100, 165, 210, 68, NULL, NULL);

INSERT INTO Exercise ( Id, Name, PrimaryMuscle, SecondaryMuscle, MuscleGroup, Equipment, ExerciseType, MovementType, DemonstrationURL, SourceURL)
VALUES
-- UPPER BODY PUSHING
(1, 'Incline Chest Press', 'Pectoralis Major', 'Anterior Deltoid', 'Chest', 'Plate Loaded Machine', 'Strength', 'Horizontal Push', NULL, NULL),
(2, 'Decline Chest Press', 'Pectoralis Major', 'Triceps', 'Chest', 'Plate Loaded Machine', 'Strength', 'Horizontal Push', NULL, NULL),
(3, 'Machine Chest Press', 'Pectoralis Major', 'Triceps', 'Chest', 'Machine', 'Strength', 'Horizontal Push', NULL, NULL),
(4, 'Machine Shoulder Press', 'Anterior Deltoid', 'Triceps', 'Shoulders', 'Machine', 'Strength', 'Vertical Push', NULL, NULL),
(5, 'Cable Chest Fly', 'Pectoralis Major', 'Anterior Deltoid', 'Chest', 'Cable Machine', 'Strength', 'Horizontal Adduction', NULL, NULL),
(6, 'Cable Lateral Raise', 'Lateral Deltoid', NULL, 'Shoulders', 'Cable Machine', 'Strength', 'Shoulder Abduction', NULL, NULL),
(7, 'Dumbbell Lateral Raise', 'Lateral Deltoid', NULL, 'Shoulders', 'Dumbbells', 'Strength', 'Shoulder Abduction', NULL, NULL),
(8, 'Rope Triceps Pushdown', 'Triceps', NULL, 'Arms', 'Cable Machine', 'Strength', 'Elbow Extension', NULL, NULL),
(9, 'Overhead Cable Triceps Extension', 'Triceps', NULL, 'Arms', 'Cable Machine', 'Strength', 'Elbow Extension', NULL, NULL),

-- UPPER BODY PULLING
(10, 'Lat Pulldown', 'Latissimus Dorsi', 'Biceps', 'Back', 'Cable Machine', 'Strength', 'Vertical Pull', NULL, NULL),
(11, 'Seated Cable Row', 'Latissimus Dorsi', 'Rhomboids', 'Back', 'Cable Machine', 'Strength', 'Horizontal Pull', NULL, NULL),
(12, 'Chest Supported Row', 'Rhomboids', 'Latissimus Dorsi', 'Back', 'Machine', 'Strength', 'Horizontal Pull', NULL, NULL),
(13, 'Machine High Row', 'Latissimus Dorsi', 'Rhomboids', 'Back', 'Machine', 'Strength', 'Horizontal Pull', NULL, NULL),
(14, 'Reverse Pec Deck', 'Posterior Deltoid', 'Rhomboids', 'Shoulders', 'Machine', 'Strength', 'Horizontal Abduction', NULL, NULL),
(15, 'Face Pull', 'Posterior Deltoid', 'Trapezius', 'Shoulders', 'Cable Machine', 'Strength', 'Horizontal Pull', NULL, NULL),
(16, 'Cable Biceps Curl', 'Biceps', 'Brachialis', 'Arms', 'Cable Machine', 'Strength', 'Elbow Flexion', NULL, NULL),
(17, 'Dumbbell Biceps Curl', 'Biceps', 'Brachialis', 'Arms', 'Dumbbells', 'Strength', 'Elbow Flexion', NULL, NULL),
(18, 'Hammer Curl', 'Brachialis', 'Biceps', 'Arms', 'Dumbbells', 'Strength', 'Elbow Flexion', NULL, NULL),

-- LOWER BODY - QUADRICEPS / GLUTES
(19, 'Hack Squat', 'Quadriceps', 'Gluteus Maximus', 'Legs', 'Hack Squat Machine', 'Strength', 'Squat', NULL, NULL),
(20, 'Leg Press', 'Quadriceps', 'Gluteus Maximus', 'Legs', 'Leg Press Machine', 'Strength', 'Squat', NULL, NULL),
(21, 'Single Leg Press', 'Quadriceps', 'Gluteus Maximus', 'Legs', 'Leg Press Machine', 'Strength', 'Squat', NULL, NULL),
(22, 'Bodyweight Squat', 'Quadriceps', 'Gluteus Maximus', 'Legs', 'Bodyweight', 'Strength', 'Squat', NULL, NULL),
(23, 'Goblet Squat', 'Quadriceps', 'Gluteus Maximus', 'Legs', 'Dumbbell', 'Strength', 'Squat', NULL, NULL),
(24, 'Leg Extension', 'Quadriceps', NULL, 'Legs', 'Leg Extension Machine', 'Strength', 'Knee Extension', NULL, NULL),
(25, 'Hip Abduction', 'Gluteus Medius', 'Gluteus Minimus', 'Glutes', 'Hip Abduction Machine', 'Strength', 'Hip Abduction', NULL, NULL),
(26, 'Hip Adduction', 'Adductors', NULL, 'Inner Thigh', 'Hip Adduction Machine', 'Strength', 'Hip Adduction', NULL, NULL),

-- LOWER BODY - HAMSTRINGS / GLUTES
(27, 'Seated Leg Curl', 'Hamstrings', 'Gastrocnemius', 'Legs', 'Leg Curl Machine', 'Strength', 'Knee Flexion', NULL, NULL),
(28, 'Lying Leg Curl', 'Hamstrings', 'Gastrocnemius', 'Legs', 'Leg Curl Machine', 'Strength', 'Knee Flexion', NULL, NULL),
(29, 'Hip Thrust', 'Gluteus Maximus', 'Hamstrings', 'Glutes', 'Smith Machine', 'Strength', 'Hip Extension', NULL, NULL),
(30, 'Glute Bridge', 'Gluteus Maximus', 'Hamstrings', 'Glutes', 'Bodyweight', 'Strength', 'Hip Extension', NULL, NULL),
(31, 'Cable Pull Through', 'Gluteus Maximus', 'Hamstrings', 'Glutes', 'Cable Machine', 'Strength', 'Hinge', NULL, NULL),
(32, 'Romanian Deadlift', 'Hamstrings', 'Gluteus Maximus', 'Legs', 'Dumbbells', 'Strength', 'Hinge', NULL, NULL),

-- CALVES
(33, 'Standing Calf Raise', 'Gastrocnemius', 'Soleus', 'Calves', 'Machine', 'Strength', 'Calf Raise', NULL, NULL),
(34, 'Seated Calf Raise', 'Soleus', 'Gastrocnemius', 'Calves', 'Machine', 'Strength', 'Calf Raise', NULL, NULL),
(35, 'Single Leg Calf Raise', 'Gastrocnemius', 'Soleus', 'Calves', 'Bodyweight', 'Strength', 'Calf Raise', NULL, NULL),

-- CORE
(36, 'Cable Crunch', 'Rectus Abdominis', 'Obliques', 'Core', 'Cable Machine', 'Core', 'Spinal Flexion', NULL, NULL),
(37, 'Plank', 'Transverse Abdominis', 'Rectus Abdominis', 'Core', 'Bodyweight', 'Core', 'Anti-Extension', NULL, NULL),
(38, 'Side Plank', 'Obliques', 'Transverse Abdominis', 'Core', 'Bodyweight', 'Core', 'Anti-Lateral Flexion', NULL, NULL),
(39, 'Dead Bug', 'Transverse Abdominis', 'Rectus Abdominis', 'Core', 'Bodyweight', 'Core', 'Anti-Extension', NULL, NULL),
(40, 'Bird Dog', 'Erector Spinae', 'Transverse Abdominis', 'Core', 'Bodyweight', 'Core', 'Anti-Rotation', NULL, NULL),
(41, 'Pallof Press', 'Obliques', 'Transverse Abdominis', 'Core', 'Cable Machine', 'Core', 'Anti-Rotation', NULL, NULL),
(42, 'Hanging Knee Raise', 'Rectus Abdominis', 'Hip Flexors', 'Core', 'Captain Chair', 'Core', 'Hip Flexion', NULL, NULL),
(43, 'Russian Twist', 'Obliques', 'Rectus Abdominis', 'Core', 'Medicine Ball', 'Core', 'Rotation', NULL, NULL),
(44, 'Bicycle Crunch', 'Rectus Abdominis', 'Obliques', 'Core', 'Bodyweight', 'Core', 'Rotation', NULL, NULL),

-- AGILITY / ATHLETIC TRAINING
(45, 'Agility Ladder Two Feet In', NULL, NULL, 'Full Body', 'Agility Ladder', 'Agility', 'Locomotion', NULL, NULL),
(46, 'Agility Ladder In And Out', NULL, NULL, 'Full Body', 'Agility Ladder', 'Agility', 'Lateral', NULL, NULL),
(47, 'Lateral Agility Ladder', NULL, NULL, 'Full Body', 'Agility Ladder', 'Agility', 'Lateral', NULL, NULL),
(48, 'Ickey Shuffle', NULL, NULL, 'Full Body', 'Agility Ladder', 'Agility', 'Lateral', NULL, NULL),
(49, 'Cone Shuttle Drill', 'Quadriceps', 'Gluteus Maximus', 'Full Body', 'Cones', 'Agility', 'Change of Direction', NULL, NULL),
(50, 'Lateral Cone Shuffle', 'Gluteus Medius', 'Quadriceps', 'Lower Body', 'Cones', 'Agility', 'Lateral', NULL, NULL),
(51, 'Carioca Drill', 'Gluteus Medius', 'Obliques', 'Full Body', 'Cones', 'Agility', 'Lateral', NULL, NULL),
(52, 'Forward Backpedal Drill', 'Quadriceps', 'Hamstrings', 'Full Body', 'Cones', 'Agility', 'Change of Direction', NULL, NULL),
(53, 'T Drill', 'Quadriceps', 'Gluteus Medius', 'Full Body', 'Cones', 'Agility', 'Change of Direction', NULL, NULL),
(54, 'Box Jump', 'Quadriceps', 'Gluteus Maximus', 'Lower Body', 'Plyometric Box', 'Plyometric', 'Vertical Jump', NULL, NULL),
(55, 'Lateral Bounds', 'Gluteus Medius', 'Quadriceps', 'Lower Body', 'Bodyweight', 'Plyometric', 'Lateral', NULL, NULL),

-- DYNAMIC WARM UPS
(56, 'Arm Circles', 'Deltoids', NULL, 'Shoulders', 'Bodyweight', 'Warm-Up', 'Dynamic', NULL, NULL),
(57, 'Shoulder Rolls', 'Trapezius', 'Deltoids', 'Shoulders', 'Bodyweight', 'Warm-Up', 'Dynamic', NULL, NULL),
(58, 'Arm Swings', 'Pectoralis Major', 'Posterior Deltoid', 'Upper Body', 'Bodyweight', 'Warm-Up', 'Dynamic', NULL, NULL),
(59, 'Leg Swings Front to Back', 'Hip Flexors', 'Hamstrings', 'Hips', 'Bodyweight', 'Warm-Up', 'Dynamic', NULL, NULL),
(60, 'Leg Swings Side to Side', 'Adductors', 'Gluteus Medius', 'Hips', 'Bodyweight', 'Warm-Up', 'Dynamic', NULL, NULL),
(61, 'Walking Knee Hug', 'Gluteus Maximus', 'Hamstrings', 'Lower Body', 'Bodyweight', 'Warm-Up', 'Dynamic', NULL, NULL),
(62, 'Walking Quad Pull', 'Quadriceps', 'Hip Flexors', 'Lower Body', 'Bodyweight', 'Warm-Up', 'Dynamic', NULL, NULL),
(63, 'Worlds Greatest Stretch', 'Hip Flexors', 'Hamstrings', 'Full Body', 'Bodyweight', 'Warm-Up', 'Dynamic', NULL, NULL),
(64, 'Walking Lunge With Rotation', 'Quadriceps', 'Obliques', 'Full Body', 'Bodyweight', 'Warm-Up', 'Dynamic', NULL, NULL),
(65, 'High Knees', 'Hip Flexors', 'Quadriceps', 'Lower Body', 'Bodyweight', 'Warm-Up', 'Locomotion', NULL, NULL),
(66, 'Butt Kicks', 'Hamstrings', 'Quadriceps', 'Lower Body', 'Bodyweight', 'Warm-Up', 'Locomotion', NULL, NULL),

-- ACTIVATION
(67, 'Glute Bridge Warm Up', 'Gluteus Maximus', 'Hamstrings', 'Glutes', 'Bodyweight', 'Warm-Up', 'Hip Extension', NULL, NULL),
(68, 'Band Pull Apart', 'Posterior Deltoid', 'Rhomboids', 'Upper Back', 'Resistance Band', 'Warm-Up', 'Horizontal Abduction', NULL, NULL),
(69, 'Band External Rotation', 'Rotator Cuff', 'Posterior Deltoid', 'Shoulders', 'Resistance Band', 'Warm-Up', 'External Rotation', NULL, NULL),
(70, 'Banded Lateral Walk', 'Gluteus Medius', 'Gluteus Minimus', 'Glutes', 'Resistance Band', 'Warm-Up', 'Lateral', NULL, NULL),
(71, 'Bodyweight Good Morning', 'Hamstrings', 'Gluteus Maximus', 'Posterior Chain', 'Bodyweight', 'Warm-Up', 'Hinge', NULL, NULL),

-- STATIC STRETCHES
(72, 'Standing Hamstring Stretch', 'Hamstrings', NULL, 'Legs', 'Bodyweight', 'Stretch', 'Static', NULL, NULL),
(73, 'Standing Quad Stretch', 'Quadriceps', NULL, 'Legs', 'Bodyweight', 'Stretch', 'Static', NULL, NULL),
(74, 'Hip Flexor Stretch', 'Hip Flexors', 'Quadriceps', 'Hips', 'Bodyweight', 'Stretch', 'Static', NULL, NULL),
(75, 'Figure Four Glute Stretch', 'Gluteus Maximus', 'Piriformis', 'Glutes', 'Bodyweight', 'Stretch', 'Static', NULL, NULL),
(76, 'Butterfly Stretch', 'Adductors', NULL, 'Inner Thigh', 'Bodyweight', 'Stretch', 'Static', NULL, NULL),
(77, 'Calf Stretch', 'Gastrocnemius', 'Soleus', 'Calves', 'Bodyweight', 'Stretch', 'Static', NULL, NULL),
(78, 'Doorway Chest Stretch', 'Pectoralis Major', 'Anterior Deltoid', 'Chest', 'Bodyweight', 'Stretch', 'Static', NULL, NULL),
(79, 'Cross Body Shoulder Stretch', 'Posterior Deltoid', NULL, 'Shoulders', 'Bodyweight', 'Stretch', 'Static', NULL, NULL),
(80, 'Overhead Triceps Stretch', 'Triceps', NULL, 'Arms', 'Bodyweight', 'Stretch', 'Static', NULL, NULL),
(81, 'Lat Stretch', 'Latissimus Dorsi', NULL, 'Back', 'Bodyweight', 'Stretch', 'Static', NULL, NULL),

-- COOL DOWN
(82, 'Treadmill Cool Down Walk', NULL, NULL, 'Cardiovascular', 'Treadmill', 'Cool-Down', 'Steady State', NULL, NULL),
(83, 'Stationary Bike Cool Down', NULL, NULL, 'Cardiovascular', 'Stationary Bike', 'Cool-Down', 'Steady State', NULL, NULL),e
(84, 'Easy Outdoor Walk', NULL, NULL, 'Cardiovascular', 'None', 'Cool-Down', 'Steady State', NULL, NULL),

-- GENERAL CARDIO
(85, 'Flat Treadmill Walk', 'Quadriceps', 'Hamstrings', 'Cardiovascular', 'Treadmill', 'Cardio', 'Steady State', NULL, NULL),
(86, 'Incline Treadmill Walk', 'Gluteus Maximus', 'Quadriceps', 'Cardiovascular', 'Treadmill', 'Cardio', 'Steady State', NULL, NULL),
(87, 'Outdoor Walk', 'Quadriceps', 'Hamstrings', 'Cardiovascular', 'None', 'Cardio', 'Steady State', NULL, NULL),
(88, 'Treadmill Jog', 'Quadriceps', 'Hamstrings', 'Cardiovascular', 'Treadmill', 'Cardio', 'Locomotion', NULL, NULL),
(89, 'Outdoor Jog', 'Quadriceps', 'Hamstrings', 'Cardiovascular', 'None', 'Cardio', 'Locomotion', NULL, NULL),
(90, 'Stationary Bike', 'Quadriceps', 'Hamstrings', 'Cardiovascular', 'Stationary Bike', 'Cardio', 'Steady State', NULL, NULL),
(91, 'Elliptical', 'Quadriceps', 'Gluteus Maximus', 'Cardiovascular', 'Elliptical', 'Cardio', 'Steady State', NULL, NULL),
(92, 'Stair Climber', 'Gluteus Maximus', 'Quadriceps', 'Cardiovascular', 'Stair Climber', 'Cardio', 'Steady State', NULL, NULL),
(93, 'Rowing Machine', 'Latissimus Dorsi', 'Quadriceps', 'Full Body', 'Rowing Machine', 'Cardio', 'Steady State', NULL, NULL),

-- ENDURANCE TRAINING
(94, 'Tempo Run', 'Quadriceps', 'Hamstrings', 'Cardiovascular', 'Track', 'Cardio', 'Tempo', NULL, NULL),
(95, 'Long Distance Run', 'Quadriceps', 'Hamstrings', 'Cardiovascular', 'Track', 'Cardio', 'Endurance', NULL, NULL),
(96, 'Long Distance Treadmill Run', 'Quadriceps', 'Hamstrings', 'Cardiovascular', 'Treadmill', 'Cardio', 'Endurance', NULL, NULL),
(97, 'Progression Run', 'Quadriceps', 'Hamstrings', 'Cardiovascular', 'Track', 'Cardio', 'Endurance', NULL, NULL),
(98, 'Fartlek Run', 'Quadriceps', 'Hamstrings', 'Cardiovascular', 'Track', 'Cardio', 'Interval', NULL, NULL),

-- SPRINT / ADVANCED ATHLETIC CARDIO
(99, 'Treadmill Sprint', 'Hamstrings', 'Gluteus Maximus', 'Cardiovascular', 'Treadmill', 'Cardio', 'Sprint', NULL, NULL),
(100, 'Track Sprint', 'Hamstrings', 'Gluteus Maximus', 'Cardiovascular', 'Track', 'Cardio', 'Sprint', NULL, NULL),
(101, 'Hill Sprint', 'Gluteus Maximus', 'Hamstrings', 'Cardiovascular', 'Hill', 'Cardio', 'Sprint', NULL, NULL),
(102, 'Sprint Interval Run', 'Hamstrings', 'Quadriceps', 'Cardiovascular', 'Track', 'Cardio', 'Interval', NULL, NULL),
(103, 'Shuttle Sprint', 'Quadriceps', 'Hamstrings', 'Full Body', 'Cones', 'Cardio', 'Change of Direction', NULL, NULL),
(104, 'Flying Sprint', 'Hamstrings', 'Gluteus Maximus', 'Cardiovascular', 'Track', 'Cardio', 'Sprint', NULL, NULL),
(105, 'Acceleration Sprint', 'Gluteus Maximus', 'Hamstrings', 'Cardiovascular', 'Track', 'Cardio', 'Sprint', NULL, NULL);