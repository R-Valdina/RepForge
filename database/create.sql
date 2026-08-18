/* Destroy all existing tables and data in the database */
DROP DATABASE repforge;
CREATE DATABASE repforge;

USE repforge;

CREATE TABLE `User` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    DisplayName VARCHAR(40) NOT NULL,
    PasswordHash VARCHAR(256) NOT NULL,
    ProfilePicture BINARY NULL
);

CREATE TABLE `Measurement` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    UserId INT NOT NULL,
    DateRecorded DATE NOT NULL,
    Weight FLOAT NULL,
    Neck FLOAT NULL,
    UpperArm FLOAT NULL,
    ForeArm FLOAT NULL,
    Wrist FLOAT NULL,
    AcrossBreast FLOAT NULL,
    UnderBreast FLOAT NULL,
    Stomach FLOAT NULL,
    Hips FLOAT NULL,
    Thigh FLOAT NULL,
    Calf FLOAT NULL,
    Ankle FLOAT NULL,
    BMI FLOAT NULL,
    BodyFatPercentage FLOAT NULL,

    FOREIGN KEY(UserId)
        REFERENCES `User`(`Id`)
);

CREATE TABLE `Macro` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    UserId INT NOT NULL,
    DateRecorded DATE NOT NULL,
    TotalCalories FLOAT NULL,
    Protein FLOAT NULL,
    Carbohydrates FLOAT NULL,
    Fat FLOAT NULL,
    Sugar FLOAT NULL,
    Fiber FLOAT NULL,

    FOREIGN KEY(UserId)
        REFERENCES `User`(`Id`)
);

CREATE TABLE `Performance` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    UserId INT NOT NULL,
    DateRecorded DATE NOT NULL,
    Result JSON NOT NULL,

    FOREIGN KEY(UserId)
        REFERENCES `User`(`Id`)
);

CREATE TABLE `Exercise` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Name VARCHAR(64) NOT NULL,
    PrimaryMuscle VARCHAR(64) NULL,
    SecondaryMuscle VARCHAR(64) NULL,
    MuscleGroup VARCHAR(64) NULL,
    Equipment VARCHAR(64) NULL,
    ExerciseType VARCHAR(64) NOT NULL,
    MovementType VARCHAR(64) NULL,
    DemonstrationURL VARCHAR(128) NULL,
    SourceURL VARCHAR(128) NULL
);

CREATE TABLE `WorkoutPlan` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    UserId INT NOT NULL,
    Title VARCHAR(128),

    FOREIGN KEY(UserId)
        REFERENCES `User`(`Id`)
);

CREATE TABLE `WorkoutExercise` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ExerciseId INT NOT NULL,
    WorkoutPlanId INT NOT NULL,
    Section VARCHAR(64) NOT NULL,
    OrderInSection INT NOT NULL,
    Sets INT NULL,
    Reps INT NULL,
    Weight INT NULL,
    Duration FLOAT NULL
);
