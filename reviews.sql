-- Create the ReviewDB database
CREATE DATABASE ReviewDB;

-- Use the ReviewDB database
USE ReviewDB;

-- Create the Reviews table
CREATE TABLE Reviews (
    Course VARCHAR(255),
    Instructor_Communication INT,
    Communication_Ability INT,
    Online_Discussion_Effectiveness INT,
    Graded_Assignments_Effectiveness INT,
    Graded_Assignment_Feedback_Timeliness INT,
    Offline_Instructor_Availability INT,
    Course_Activity_Effectiveness INT,
    Course_Policies_Understandability INT,
    Course_Strengths TEXT,
    Course_Improvements TEXT
);

-- Load data from reviews.csv into Reviews table
LOAD DATA INFILE 'C:/Users/gavin/Desktop/USF Stuff/Databases/reviews.csv' INTO TABLE Reviews
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Query 1: All records where the instructor communication was disagree.
SELECT * FROM Reviews WHERE Instructor_Communication = 3;

-- Query 2: All records where the graded assignments and feedback was disagree or strong disagree.
SELECT * FROM Reviews WHERE Graded_Assignments_Effectiveness IN (3, 4) OR Graded_Assignment_Feedback_Timeliness IN (3, 4);

-- Query 3: All records from the cop3847 class where online discussions are strongly agree or agree.
SELECT * FROM Reviews WHERE Course = 'cop3847' AND Online_Discussion_Effectiveness IN (1, 2);

-- Query 4: Just the class column (field) for all records with a null in the "course activities required me to analyze" field.
SELECT Course FROM Reviews WHERE Course_Activity_Effectiveness IS NULL;

-- Query 5: The class column for records where the strengths include the word good.
SELECT Course FROM Reviews WHERE Course_Strengths LIKE '%good%';
