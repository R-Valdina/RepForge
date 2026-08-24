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
    Title VARCHAR(128) NOT NULL,

    FOREIGN KEY(UserId)
        REFERENCES `User`(`Id`)
);

CREATE TABLE `WorkoutPlanSection` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    WorkoutPlanId INT NOT NULL,
    Name VARCHAR(64) NOT NULL,
    OrderInWorkoutPlan INT NOT NULL,

    FOREIGN KEY(WorkoutPlanId)
        REFERENCES `WorkoutPlan`(`Id`)
        ON DELETE CASCADE
);

CREATE TABLE `WorkoutExercise` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ExerciseId INT NOT NULL,
    WorkoutPlanSectionId INT NOT NULL,
    OrderInSection INT NOT NULL,
    Sets INT NULL,
    Reps INT NULL,
    Weight INT NULL,
    Duration FLOAT NULL,

    FOREIGN KEY(ExerciseId)
        REFERENCES `Exercise`(`Id`)
        ON DELETE CASCADE,
    FOREIGN KEY(WorkoutPlanSectionId)
        REFERENCES `WorkoutPlanSection`(`Id`)
        ON DELETE CASCADE
);

CREATE TABLE `ForumCategory` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Name VARCHAR(64) NOT NULL
);

CREATE TABLE `ForumPost` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    UserId INT NOT NULL,
    ForumCategoryId INT NOT NULL,
    ParentPostId INT NULL,
    Title VARCHAR(64) NULL,
    Body TEXT NOT NULL,
    CreatedAt DATETIME NOT NULL,

    CHECK ((Title IS NULL) XOR (ParentPostId IS NULL)),

    FOREIGN KEY(UserId)
        REFERENCES `User`(`Id`),
    FOREIGN KEY(ForumCategoryId)
        REFERENCES `ForumCategory`(`Id`),
    FOREIGN KEY(ParentPostId)
        REFERENCES `ForumPost`(`Id`)
);

CREATE TABLE `ForumPostReact` (
    UserId INT NOT NULL,
    ForumPostId INT NOT NULL,
    ReactionType ENUM('like', 'save') NOT NULL,

    PRIMARY KEY(UserId, ForumPostId, ReactionType),

    FOREIGN KEY(UserId)
        REFERENCES `User`(`Id`)
        ON DELETE CASCADE,
    FOREIGN KEY(ForumPostId)
        REFERENCES `ForumPost`(`Id`)
        ON DELETE CASCADE
);

CREATE TABLE `PrivateMessage` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    SenderUserId INT NOT NULL,
    RecipientUserId INT NOT NULL,
    Body TEXT NOT NULL,
    CreatedAt DATETIME NOT NULL,

    FOREIGN KEY(SenderUserId)
        REFERENCES `User`(`Id`),
    FOREIGN KEY(RecipientUserId)
        REFERENCES `User`(`Id`)
);

CREATE TABLE `Meal` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Name VARCHAR(64) NOT NULL,
    Calories FLOAT NULL,
    Protein FLOAT NULL,
    Carbohydrates FLOAT NULL,
    Fat FLOAT NULL,
    Sugar FLOAT NULL,
    Fiber FLOAT NULL,
    DemonstrationURL VARCHAR(128) NULL,
    SourceURL VARCHAR(128) NULL
);

CREATE TABLE `MealPlan` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    UserId INT NOT NULL,
    Title VARCHAR(128) NOT NULL,

    FOREIGN KEY(UserId)
        REFERENCES `User`(`Id`)
);

CREATE TABLE `MealPlanSection` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    MealPlanId INT NOT NULL,
    Name VARCHAR(64) NOT NULL,
    OrderInMealPlan INT NOT NULL,

    FOREIGN KEY(MealPlanId)
        REFERENCES `MealPlan`(`Id`)
        ON DELETE CASCADE
);

CREATE TABLE `MealPlanMeal` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    MealId INT NOT NULL,
    MealPlanSectionId INT NOT NULL,
    OrderInSection INT NOT NULL,

    FOREIGN KEY(MealId)
        REFERENCES `Meal`(`Id`)
        ON DELETE CASCADE,
    FOREIGN KEY(MealPlanSectionId)
        REFERENCES `MealPlanSection`(`Id`)
        ON DELETE CASCADE
);

CREATE TABLE `Bill` (
    Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    UserId INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaidAt DATETIME NULL
);
