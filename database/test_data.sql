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
(83, 'Stationary Bike Cool Down', NULL, NULL, 'Cardiovascular', 'Stationary Bike', 'Cool-Down', 'Steady State', NULL, NULL),
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

-- User 1 - Structured Push/Pull/Lower Split
-- Plans: Push, Pull, Lower 1, Lower 2, Active Recovery

-- User 1 - Structured Push/Pull/Lower Split: Workout Plans
INSERT INTO WorkoutPlan (Id, UserId, Title)
VALUES
(1, 1, 'Push'),
(2, 1, 'Pull'),
(3, 1, 'Lower 1'),
(4, 1, 'Lower 2'),
(5, 1, 'Active Recovery');

-- User 1 - Structured Push/Pull/Lower Split: Workout Plan Sections
INSERT INTO WorkoutPlanSection (Id, WorkoutPlanId, Name, OrderInWorkoutPlan)
VALUES
(1, 1, 'Dynamic Warm Up', 1),
(2, 1, 'Chest', 2),
(3, 1, 'Shoulders', 3),
(4, 1, 'Triceps', 4),
(5, 1, 'Stretch', 5),
(6, 1, 'Cool Down', 6),
(7, 2, 'Dynamic Warm Up', 1),
(8, 2, 'Back', 2),
(9, 2, 'Rear Delts', 3),
(10, 2, 'Biceps', 4),
(11, 2, 'Stretch', 5),
(12, 2, 'Cool Down', 6),
(13, 3, 'Dynamic Warm Up', 1),
(14, 3, 'Activation', 2),
(15, 3, 'Isolation', 3),
(16, 3, 'Compound', 4),
(17, 3, 'Stretch', 5),
(18, 3, 'Cool Down', 6),
(19, 4, 'Dynamic Warm Up', 1),
(20, 4, 'Activation', 2),
(21, 4, 'Isolation', 3),
(22, 4, 'Compound', 4),
(23, 4, 'Stretch', 5),
(24, 4, 'Cool Down', 6),
(25, 5, 'Mobility Warm Up', 1),
(26, 5, 'Light Cardio', 2),
(27, 5, 'Core & Stability', 3),
(28, 5, 'Full Body Stretch', 4),
(29, 5, 'Cool Down', 5);

-- User 1 - Structured Push/Pull/Lower Split: Workout Exercises
INSERT INTO WorkoutExercise (Id, ExerciseId, WorkoutPlanSectionId, OrderInSection, Sets, Reps, Weight, Duration)
VALUES
(1, 56, 1, 1, 1, 10, NULL, NULL),
(2, 57, 1, 2, 1, 10, NULL, NULL),
(3, 58, 1, 3, 1, 10, NULL, NULL),
(4, 69, 1, 4, 1, 10, NULL, NULL),
(5, 1, 2, 1, 3, 10, 70, NULL),
(6, 2, 2, 2, 3, 10, 80, NULL),
(7, 5, 2, 3, 3, 10, 25, NULL),
(8, 4, 3, 1, 3, 10, 55, NULL),
(9, 6, 3, 2, 3, 10, 15, NULL),
(10, 8, 4, 1, 3, 10, 35, NULL),
(11, 9, 4, 2, 3, 10, 30, NULL),
(12, 78, 5, 1, 1, NULL, NULL, 0.5),
(13, 79, 5, 2, 1, NULL, NULL, 0.5),
(14, 80, 5, 3, 1, NULL, NULL, 0.5),
(15, 82, 6, 1, 1, NULL, NULL, 5),
(16, 56, 7, 1, 1, 10, NULL, NULL),
(17, 57, 7, 2, 1, 10, NULL, NULL),
(18, 68, 7, 3, 1, 10, NULL, NULL),
(19, 69, 7, 4, 1, 10, NULL, NULL),
(20, 10, 8, 1, 3, 10, 85, NULL),
(21, 11, 8, 2, 3, 10, 75, NULL),
(22, 12, 8, 3, 3, 10, 70, NULL),
(23, 13, 8, 4, 3, 10, 75, NULL),
(24, 14, 9, 1, 3, 10, 50, NULL),
(25, 15, 9, 2, 3, 10, 35, NULL),
(26, 16, 10, 1, 3, 10, 30, NULL),
(27, 18, 10, 2, 3, 10, 30, NULL),
(28, 81, 11, 1, 1, NULL, NULL, 0.5),
(29, 79, 11, 2, 1, NULL, NULL, 0.5),
(30, 82, 12, 1, 1, NULL, NULL, 5),
(31, 59, 13, 1, 1, 10, NULL, NULL),
(32, 60, 13, 2, 1, 10, NULL, NULL),
(33, 61, 13, 3, 1, 10, NULL, NULL),
(34, 62, 13, 4, 1, 10, NULL, NULL),
(35, 67, 14, 1, 1, 10, NULL, NULL),
(36, 70, 14, 2, 1, 10, NULL, NULL),
(37, 33, 15, 1, 3, 10, 120, NULL),
(38, 26, 15, 2, 3, 10, 90, NULL),
(39, 24, 15, 3, 3, 10, 85, NULL),
(40, 19, 16, 1, 3, 10, 140, NULL),
(41, 20, 16, 2, 3, 10, 180, NULL),
(42, 73, 17, 1, 1, NULL, NULL, 0.5),
(43, 74, 17, 2, 1, NULL, NULL, 0.5),
(44, 77, 17, 3, 1, NULL, NULL, 0.5),
(45, 83, 18, 1, 1, NULL, NULL, 5),
(46, 59, 19, 1, 1, 10, NULL, NULL),
(47, 60, 19, 2, 1, 10, NULL, NULL),
(48, 63, 19, 3, 1, 10, NULL, NULL),
(49, 67, 20, 1, 1, 10, NULL, NULL),
(50, 71, 20, 2, 1, 10, NULL, NULL),
(51, 70, 20, 3, 1, 10, NULL, NULL),
(52, 34, 21, 1, 3, 10, 70, NULL),
(53, 25, 21, 2, 3, 10, 100, NULL),
(54, 27, 21, 3, 3, 10, 75, NULL),
(55, 29, 22, 1, 3, 10, 135, NULL),
(56, 32, 22, 2, 3, 10, 60, NULL),
(57, 21, 22, 3, 3, 10, 90, NULL),
(58, 72, 23, 1, 1, NULL, NULL, 0.5),
(59, 75, 23, 2, 1, NULL, NULL, 0.5),
(60, 77, 23, 3, 1, NULL, NULL, 0.5),
(61, 82, 24, 1, 1, NULL, NULL, 5),
(62, 56, 25, 1, 1, 10, NULL, NULL),
(63, 59, 25, 2, 1, 10, NULL, NULL),
(64, 60, 25, 3, 1, 10, NULL, NULL),
(65, 63, 25, 4, 1, 10, NULL, NULL),
(66, 87, 26, 1, 1, NULL, NULL, 30),
(67, 39, 27, 1, 3, 10, NULL, NULL),
(68, 40, 27, 2, 3, 10, NULL, NULL),
(69, 38, 27, 3, 3, NULL, NULL, 0.75),
(70, 72, 28, 1, 1, NULL, NULL, 0.5),
(71, 73, 28, 2, 1, NULL, NULL, 0.5),
(72, 74, 28, 3, 1, NULL, NULL, 0.5),
(73, 75, 28, 4, 1, NULL, NULL, 0.5),
(74, 81, 28, 5, 1, NULL, NULL, 0.5),
(75, 84, 29, 1, 1, NULL, NULL, 5);


-- User 2 - Upper/Lower/Full Body Split
-- Plans: Upper Body A, Lower Body A, Full Body, Upper Body B, Lower Body B

-- User 2 - Upper/Lower/Full Body Split: Workout Plans
INSERT INTO WorkoutPlan (Id, UserId, Title)
VALUES
(6, 2, 'Upper Body A'),
(7, 2, 'Lower Body A'),
(8, 2, 'Full Body'),
(9, 2, 'Upper Body B'),
(10, 2, 'Lower Body B');

-- User 2 - Upper/Lower/Full Body Split: Workout Plan Sections
INSERT INTO WorkoutPlanSection (Id, WorkoutPlanId, Name, OrderInWorkoutPlan)
VALUES
(30, 6, 'Warm Up', 1),
(31, 6, 'Chest & Shoulders', 2),
(32, 6, 'Back', 3),
(33, 6, 'Arms', 4),
(34, 6, 'Stretch', 5),
(35, 7, 'Warm Up', 1),
(36, 7, 'Lower Body', 2),
(37, 7, 'Core', 3),
(38, 7, 'Stretch', 4),
(39, 8, 'Dynamic Warm Up', 1),
(40, 8, 'Full Body Strength', 2),
(41, 8, 'Core', 3),
(42, 8, 'Cardio', 4),
(43, 8, 'Cool Down', 5),
(44, 9, 'Warm Up', 1),
(45, 9, 'Back & Chest', 2),
(46, 9, 'Shoulders', 3),
(47, 9, 'Arms', 4),
(48, 9, 'Stretch', 5),
(49, 10, 'Warm Up', 1),
(50, 10, 'Lower Body', 2),
(51, 10, 'Core', 3),
(52, 10, 'Stretch', 4);

-- User 2 - Upper/Lower/Full Body Split: Workout Exercises
INSERT INTO WorkoutExercise (Id, ExerciseId, WorkoutPlanSectionId, OrderInSection, Sets, Reps, Weight, Duration)
VALUES
(76, 56, 30, 1, 1, 10, NULL, NULL),
(77, 58, 30, 2, 1, 10, NULL, NULL),
(78, 68, 30, 3, 1, 10, NULL, NULL),
(79, 3, 31, 1, 3, 10, 64, NULL),
(80, 4, 31, 2, 3, 10, 44, NULL),
(81, 6, 31, 3, 3, 10, 12, NULL),
(82, 10, 32, 1, 3, 10, 68, NULL),
(83, 11, 32, 2, 3, 10, 60, NULL),
(84, 8, 33, 1, 3, 10, 28, NULL),
(85, 16, 33, 2, 3, 10, 24, NULL),
(86, 78, 34, 1, 1, NULL, NULL, 0.5),
(87, 81, 34, 2, 1, NULL, NULL, 0.5),
(88, 59, 35, 1, 1, 10, NULL, NULL),
(89, 61, 35, 2, 1, 10, NULL, NULL),
(90, 62, 35, 3, 1, 10, NULL, NULL),
(91, 20, 36, 1, 3, 10, 144, NULL),
(92, 24, 36, 2, 3, 10, 68, NULL),
(93, 27, 36, 3, 3, 10, 60, NULL),
(94, 25, 36, 4, 3, 10, 80, NULL),
(95, 33, 36, 5, 3, 10, 96, NULL),
(96, 37, 37, 1, 3, NULL, NULL, 0.75),
(97, 39, 37, 2, 3, 10, NULL, NULL),
(98, 73, 38, 1, 1, NULL, NULL, 0.5),
(99, 72, 38, 2, 1, NULL, NULL, 0.5),
(100, 77, 38, 3, 1, NULL, NULL, 0.5),
(101, 63, 39, 1, 1, 10, NULL, NULL),
(102, 58, 39, 2, 1, 10, NULL, NULL),
(103, 71, 39, 3, 1, 10, NULL, NULL),
(104, 23, 40, 1, 3, 10, 32, NULL),
(105, 3, 40, 2, 3, 10, 64, NULL),
(106, 10, 40, 3, 3, 10, 68, NULL),
(107, 32, 40, 4, 3, 10, 48, NULL),
(108, 4, 40, 5, 3, 10, 44, NULL),
(109, 41, 41, 1, 3, 10, 20, NULL),
(110, 37, 41, 2, 3, NULL, NULL, 0.75),
(111, 91, 42, 1, 1, NULL, NULL, 20),
(112, 82, 43, 1, 1, NULL, NULL, 5),
(113, 57, 44, 1, 1, 10, NULL, NULL),
(114, 68, 44, 2, 1, 10, NULL, NULL),
(115, 69, 44, 3, 1, 10, NULL, NULL),
(116, 12, 45, 1, 3, 10, 56, NULL),
(117, 1, 45, 2, 3, 10, 56, NULL),
(118, 13, 45, 3, 3, 10, 60, NULL),
(119, 5, 45, 4, 3, 10, 20, NULL),
(120, 14, 46, 1, 3, 10, 40, NULL),
(121, 7, 46, 2, 3, 10, 12, NULL),
(122, 18, 47, 1, 3, 10, 24, NULL),
(123, 9, 47, 2, 3, 10, 24, NULL),
(124, 79, 48, 1, 1, NULL, NULL, 0.5),
(125, 78, 48, 2, 1, NULL, NULL, 0.5),
(126, 60, 49, 1, 1, 10, NULL, NULL),
(127, 61, 49, 2, 1, 10, NULL, NULL),
(128, 67, 49, 3, 1, 10, NULL, NULL),
(129, 19, 50, 1, 3, 10, 112, NULL),
(130, 29, 50, 2, 3, 10, 108, NULL),
(131, 28, 50, 3, 3, 10, 56, NULL),
(132, 26, 50, 4, 3, 10, 72, NULL),
(133, 35, 50, 5, 3, 10, 32, NULL),
(134, 38, 51, 1, 3, NULL, NULL, 0.75),
(135, 40, 51, 2, 3, 10, NULL, NULL),
(136, 75, 52, 1, 1, NULL, NULL, 0.5),
(137, 74, 52, 2, 1, NULL, NULL, 0.5),
(138, 72, 52, 3, 1, NULL, NULL, 0.5);

-- User 3 - Cardio / Agility / Bodyweight
-- Plans: Cardio Endurance, Agility, Sprint Training, Bodyweight Conditioning

-- User 3 - Cardio / Agility / Bodyweight: Workout Plans
INSERT INTO WorkoutPlan (Id, UserId, Title)
VALUES
(11, 3, 'Cardio Endurance'),
(12, 3, 'Agility'),
(13, 3, 'Sprint Training'),
(14, 3, 'Bodyweight Conditioning');

-- User 3 - Cardio / Agility / Bodyweight: Workout Plan Sections
INSERT INTO WorkoutPlanSection (Id, WorkoutPlanId, Name, OrderInWorkoutPlan)
VALUES
(53, 11, 'Dynamic Warm Up', 1),
(54, 11, 'Endurance', 2),
(55, 11, 'Finisher', 3),
(56, 11, 'Stretch', 4),
(57, 11, 'Cool Down', 5),
(58, 12, 'Dynamic Warm Up', 1),
(59, 12, 'Ladder Drills', 2),
(60, 12, 'Cone Drills', 3),
(61, 12, 'Plyometrics', 4),
(62, 12, 'Cool Down', 5),
(63, 13, 'Running Warm Up', 1),
(64, 13, 'Acceleration', 2),
(65, 13, 'Sprint Intervals', 3),
(66, 13, 'Stretch', 4),
(67, 13, 'Cool Down', 5),
(68, 14, 'Dynamic Warm Up', 1),
(69, 14, 'Lower Body', 2),
(70, 14, 'Core', 3),
(71, 14, 'Conditioning', 4),
(72, 14, 'Cool Down', 5);

-- User 3 - Cardio / Agility / Bodyweight: Workout Exercises
INSERT INTO WorkoutExercise (Id, ExerciseId, WorkoutPlanSectionId, OrderInSection, Sets, Reps, Weight, Duration)
VALUES
(139, 61, 53, 1, 1, 10, NULL, NULL),
(140, 62, 53, 2, 1, 10, NULL, NULL),
(141, 65, 53, 3, 1, 10, NULL, NULL),
(142, 66, 53, 4, 1, 10, NULL, NULL),
(143, 95, 54, 1, 1, NULL, NULL, 40),
(144, 97, 55, 1, 1, NULL, NULL, 20),
(145, 72, 56, 1, 1, NULL, NULL, 0.5),
(146, 73, 56, 2, 1, NULL, NULL, 0.5),
(147, 74, 56, 3, 1, NULL, NULL, 0.5),
(148, 77, 56, 4, 1, NULL, NULL, 0.5),
(149, 84, 57, 1, 1, NULL, NULL, 5),
(150, 65, 58, 1, 1, 10, NULL, NULL),
(151, 66, 58, 2, 1, 10, NULL, NULL),
(152, 60, 58, 3, 1, 10, NULL, NULL),
(153, 64, 58, 4, 1, 10, NULL, NULL),
(154, 45, 59, 1, 3, 4, NULL, NULL),
(155, 46, 59, 2, 3, 4, NULL, NULL),
(156, 47, 59, 3, 3, 4, NULL, NULL),
(157, 48, 59, 4, 3, 4, NULL, NULL),
(158, 49, 60, 1, 3, 4, NULL, NULL),
(159, 50, 60, 2, 3, 4, NULL, NULL),
(160, 51, 60, 3, 3, 4, NULL, NULL),
(161, 53, 60, 4, 3, 4, NULL, NULL),
(162, 54, 61, 1, 3, 8, NULL, NULL),
(163, 55, 61, 2, 3, 10, NULL, NULL),
(164, 84, 62, 1, 1, NULL, NULL, 5),
(165, 61, 63, 1, 1, 10, NULL, NULL),
(166, 62, 63, 2, 1, 10, NULL, NULL),
(167, 65, 63, 3, 1, 10, NULL, NULL),
(168, 66, 63, 4, 1, 10, NULL, NULL),
(169, 105, 64, 1, 6, NULL, NULL, 0.5),
(170, 104, 64, 2, 4, NULL, NULL, 0.5),
(171, 100, 65, 1, 6, NULL, NULL, 0.5),
(172, 102, 65, 2, 4, NULL, NULL, 0.5),
(173, 103, 65, 3, 4, NULL, NULL, 0.5),
(174, 72, 66, 1, 1, NULL, NULL, 0.5),
(175, 73, 66, 2, 1, NULL, NULL, 0.5),
(176, 74, 66, 3, 1, NULL, NULL, 0.5),
(177, 77, 66, 4, 1, NULL, NULL, 0.5),
(178, 84, 67, 1, 1, NULL, NULL, 5),
(179, 63, 68, 1, 1, 10, NULL, NULL),
(180, 56, 68, 2, 1, 10, NULL, NULL),
(181, 64, 68, 3, 1, 10, NULL, NULL),
(182, 22, 69, 1, 3, 15, NULL, NULL),
(183, 30, 69, 2, 3, 12, NULL, NULL),
(184, 35, 69, 3, 3, 12, NULL, NULL),
(185, 37, 70, 1, 3, NULL, NULL, 0.75),
(186, 38, 70, 2, 3, NULL, NULL, 0.75),
(187, 39, 70, 3, 3, 10, NULL, NULL),
(188, 40, 70, 4, 3, 10, NULL, NULL),
(189, 44, 70, 5, 3, 10, NULL, NULL),
(190, 65, 71, 1, 1, 10, NULL, NULL),
(191, 55, 71, 2, 3, 10, NULL, NULL),
(192, 84, 72, 1, 1, NULL, NULL, 5);

-- User 4 - Yoga-Like / Mobility Focus
-- Plans: Morning Flow, Full Body Mobility, Lower Body Flexibility, Recovery Flow

-- User 4 - Yoga-Like / Mobility Focus: Workout Plans
INSERT INTO WorkoutPlan (Id, UserId, Title)
VALUES
(15, 4, 'Morning Flow'),
(16, 4, 'Full Body Mobility'),
(17, 4, 'Lower Body Flexibility'),
(18, 4, 'Recovery Flow');

-- User 4 - Yoga-Like / Mobility Focus: Workout Plan Sections
INSERT INTO WorkoutPlanSection (Id, WorkoutPlanId, Name, OrderInWorkoutPlan)
VALUES
(73, 15, 'Gentle Warm Up', 1),
(74, 15, 'Mobility Flow', 2),
(75, 15, 'Stability', 3),
(76, 15, 'Stretch', 4),
(77, 16, 'Upper Body Mobility', 1),
(78, 16, 'Lower Body Mobility', 2),
(79, 16, 'Core Stability', 3),
(80, 16, 'Full Body Stretch', 4),
(81, 17, 'Warm Up', 1),
(82, 17, 'Activation', 2),
(83, 17, 'Flexibility', 3),
(84, 18, 'Gentle Movement', 1),
(85, 18, 'Core & Stability', 2),
(86, 18, 'Stretch', 3);

-- User 4 - Yoga-Like / Mobility Focus: Workout Exercises
INSERT INTO WorkoutExercise (Id, ExerciseId, WorkoutPlanSectionId, OrderInSection, Sets, Reps, Weight, Duration)
VALUES
(193, 57, 73, 1, 1, 10, NULL, NULL),
(194, 56, 73, 2, 1, 10, NULL, NULL),
(195, 59, 73, 3, 1, 10, NULL, NULL),
(196, 63, 74, 1, 1, 10, NULL, NULL),
(197, 61, 74, 2, 1, 10, NULL, NULL),
(198, 62, 74, 3, 1, 10, NULL, NULL),
(199, 71, 74, 4, 1, 10, NULL, NULL),
(200, 40, 75, 1, 3, 10, NULL, NULL),
(201, 39, 75, 2, 3, 10, NULL, NULL),
(202, 30, 75, 3, 3, 12, NULL, NULL),
(203, 72, 76, 1, 1, NULL, NULL, 0.5),
(204, 74, 76, 2, 1, NULL, NULL, 0.5),
(205, 75, 76, 3, 1, NULL, NULL, 0.5),
(206, 56, 77, 1, 1, 10, NULL, NULL),
(207, 57, 77, 2, 1, 10, NULL, NULL),
(208, 58, 77, 3, 1, 10, NULL, NULL),
(209, 59, 78, 1, 1, 10, NULL, NULL),
(210, 60, 78, 2, 1, 10, NULL, NULL),
(211, 63, 78, 3, 1, 10, NULL, NULL),
(212, 37, 79, 1, 3, NULL, NULL, 0.75),
(213, 38, 79, 2, 3, NULL, NULL, 0.75),
(214, 40, 79, 3, 3, 10, NULL, NULL),
(215, 76, 80, 1, 1, NULL, NULL, 0.5),
(216, 72, 80, 2, 1, NULL, NULL, 0.5),
(217, 73, 80, 3, 1, NULL, NULL, 0.5),
(218, 81, 80, 4, 1, NULL, NULL, 0.5),
(219, 79, 80, 5, 1, NULL, NULL, 0.5),
(220, 59, 81, 1, 1, 10, NULL, NULL),
(221, 60, 81, 2, 1, 10, NULL, NULL),
(222, 61, 81, 3, 1, 10, NULL, NULL),
(223, 67, 82, 1, 1, 10, NULL, NULL),
(224, 70, 82, 2, 1, 10, NULL, NULL),
(225, 71, 82, 3, 1, 10, NULL, NULL),
(226, 72, 83, 1, 1, NULL, NULL, 0.5),
(227, 73, 83, 2, 1, NULL, NULL, 0.5),
(228, 74, 83, 3, 1, NULL, NULL, 0.5),
(229, 75, 83, 4, 1, NULL, NULL, 0.5),
(230, 76, 83, 5, 1, NULL, NULL, 0.5),
(231, 77, 83, 6, 1, NULL, NULL, 0.5),
(232, 84, 84, 1, 1, NULL, NULL, 5),
(233, 39, 85, 1, 3, 10, NULL, NULL),
(234, 40, 85, 2, 3, 10, NULL, NULL),
(235, 30, 85, 3, 3, 12, NULL, NULL),
(236, 72, 86, 1, 1, NULL, NULL, 0.5),
(237, 74, 86, 2, 1, NULL, NULL, 0.5),
(238, 75, 86, 3, 1, NULL, NULL, 0.5),
(239, 78, 86, 4, 1, NULL, NULL, 0.5),
(240, 81, 86, 5, 1, NULL, NULL, 0.5);


-- User 5 - Bro Split (No Legs / No Cardio)
-- Plans: Chest Day, Back Day, Shoulder Day, Arm Day, Chest & Arms

-- User 5 - Bro Split (No Legs / No Cardio): Workout Plans
INSERT INTO WorkoutPlan (Id, UserId, Title)
VALUES
(19, 5, 'Chest Day'),
(20, 5, 'Back Day'),
(21, 5, 'Shoulder Day'),
(22, 5, 'Arm Day'),
(23, 5, 'Chest & Arms');

-- User 5 - Bro Split (No Legs / No Cardio): Workout Plan Sections
INSERT INTO WorkoutPlanSection (Id, WorkoutPlanId, Name, OrderInWorkoutPlan)
VALUES
(87, 19, 'Warm Up', 1),
(88, 19, 'Presses', 2),
(89, 19, 'Chest Isolation', 3),
(90, 19, 'Triceps', 4),
(91, 19, 'Stretch', 5),
(92, 20, 'Warm Up', 1),
(93, 20, 'Back', 2),
(94, 20, 'Rear Delts', 3),
(95, 20, 'Biceps', 4),
(96, 20, 'Stretch', 5),
(97, 21, 'Warm Up', 1),
(98, 21, 'Shoulder Press', 2),
(99, 21, 'Side Delts', 3),
(100, 21, 'Rear Delts', 4),
(101, 21, 'Stretch', 5),
(102, 22, 'Warm Up', 1),
(103, 22, 'Biceps', 2),
(104, 22, 'Triceps', 3),
(105, 22, 'Stretch', 4),
(106, 23, 'Warm Up', 1),
(107, 23, 'Chest', 2),
(108, 23, 'Biceps', 3),
(109, 23, 'Triceps', 4),
(110, 23, 'Stretch', 5);

-- User 5 - Bro Split (No Legs / No Cardio): Workout Exercises
INSERT INTO WorkoutExercise (Id, ExerciseId, WorkoutPlanSectionId, OrderInSection, Sets, Reps, Weight, Duration)
VALUES
(241, 56, 87, 1, 1, 10, NULL, NULL),
(242, 58, 87, 2, 1, 10, NULL, NULL),
(243, 69, 87, 3, 1, 10, NULL, NULL),
(244, 1, 88, 1, 3, 10, 80, NULL),
(245, 2, 88, 2, 3, 10, 90, NULL),
(246, 3, 88, 3, 3, 10, 90, NULL),
(247, 5, 89, 1, 3, 10, 35, NULL),
(248, 8, 90, 1, 3, 10, 45, NULL),
(249, 9, 90, 2, 3, 10, 40, NULL),
(250, 78, 91, 1, 1, NULL, NULL, 0.5),
(251, 80, 91, 2, 1, NULL, NULL, 0.5),
(252, 57, 92, 1, 1, 10, NULL, NULL),
(253, 68, 92, 2, 1, 10, NULL, NULL),
(254, 10, 93, 1, 3, 10, 95, NULL),
(255, 11, 93, 2, 3, 10, 85, NULL),
(256, 12, 93, 3, 3, 10, 80, NULL),
(257, 13, 93, 4, 3, 10, 85, NULL),
(258, 14, 94, 1, 3, 10, 60, NULL),
(259, 15, 94, 2, 3, 10, 45, NULL),
(260, 18, 95, 1, 3, 10, 40, NULL),
(261, 16, 95, 2, 3, 10, 40, NULL),
(262, 81, 96, 1, 1, NULL, NULL, 0.5),
(263, 56, 97, 1, 1, 10, NULL, NULL),
(264, 57, 97, 2, 1, 10, NULL, NULL),
(265, 69, 97, 3, 1, 10, NULL, NULL),
(266, 4, 98, 1, 3, 10, 65, NULL),
(267, 6, 99, 1, 3, 10, 25, NULL),
(268, 7, 99, 2, 3, 10, 25, NULL),
(269, 14, 100, 1, 3, 10, 60, NULL),
(270, 15, 100, 2, 3, 10, 45, NULL),
(271, 79, 101, 1, 1, NULL, NULL, 0.5),
(272, 56, 102, 1, 1, 10, NULL, NULL),
(273, 58, 102, 2, 1, 10, NULL, NULL),
(274, 16, 103, 1, 3, 10, 40, NULL),
(275, 17, 103, 2, 3, 10, 35, NULL),
(276, 18, 103, 3, 3, 10, 40, NULL),
(277, 8, 104, 1, 3, 10, 45, NULL),
(278, 9, 104, 2, 3, 10, 40, NULL),
(279, 80, 105, 1, 1, NULL, NULL, 0.5),
(280, 79, 105, 2, 1, NULL, NULL, 0.5),
(281, 56, 106, 1, 1, 10, NULL, NULL),
(282, 69, 106, 2, 1, 10, NULL, NULL),
(283, 1, 107, 1, 3, 10, 80, NULL),
(284, 3, 107, 2, 3, 10, 90, NULL),
(285, 5, 107, 3, 3, 10, 35, NULL),
(286, 17, 108, 1, 3, 10, 35, NULL),
(287, 18, 108, 2, 3, 10, 40, NULL),
(288, 8, 109, 1, 3, 10, 45, NULL),
(289, 9, 109, 2, 3, 10, 40, NULL),
(290, 78, 110, 1, 1, NULL, NULL, 0.5),
(291, 80, 110, 2, 1, NULL, NULL, 0.5);