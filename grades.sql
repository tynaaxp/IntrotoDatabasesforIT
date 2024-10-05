
-- Assuming the database and table have been created using import_grades.sql

-- Task 2: Standardize the assgn column
UPDATE grades
SET assgn = CONCAT('HW', SUBSTRING(assgn, -1))
WHERE assgn NOT REGEXP '^HW[0-9]+$';

-- Task 3: Modify the sname column to have the first letter capitalized and the rest in lower case
UPDATE grades
SET sname = CONCAT(UPPER(LEFT(sname, 1)), LOWER(SUBSTRING(sname, 2)));

-- Task 4: Add the id column as an auto-incremented non-null integer as the first column
ALTER TABLE grades
ADD id INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (id);

-- Task 5: Add the sid column as a non-null integer right after the id column
ALTER TABLE grades
ADD sid INT NOT NULL AFTER id;

-- Task 6: Set the sids of each student alphabetically
SET @sid := 0;
UPDATE grades
SET sid = (@sid := @sid + 1)
ORDER BY sname;

-- Task 7: Update missing grades to 0
UPDATE grades
SET grade = COALESCE(grade, 0);

-- Additional: Query for assignment stats
SELECT assgn AS 'Assignment',
       AVG(grade) AS 'Average',
       MIN(grade) AS 'Lowest',
       MAX(grade) AS 'Highest'
FROM grades
GROUP BY assgn
ORDER BY Highest DESC;

-- Additional: Query for student's name and letter grade
SELECT sname AS 'Student Name',
       CASE
           WHEN AVG(grade) >= 90 THEN 'A'
           WHEN AVG(grade) >= 80 THEN 'B'
           WHEN AVG(grade) >= 70 THEN 'C'
           WHEN AVG(grade) >= 60 THEN 'D'
           ELSE 'F'
       END AS 'Letter Grade'
FROM grades
GROUP BY sname
ORDER BY `Letter Grade`;
