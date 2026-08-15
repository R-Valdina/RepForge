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