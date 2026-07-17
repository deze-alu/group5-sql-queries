-- ========= CREATE DATABASE =========
CREATE DATABASE IF NOT EXISTS alu_database;
USE alu_database;

-- =====================================================================
-- CREATE TABLES
-- =====================================================================

-- Creates the Classroom table
CREATE TABLE Classroom(
    classroom_id INT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);


-- Creates the Students table
CREATE TABLE Students (
    student_id       INT          NOT NULL AUTO_INCREMENT,
    name             VARCHAR(100) NOT NULL,
    email            VARCHAR(100) UNIQUE,
    classroom_id     INT          NOT NULL,
    enrollment_date  DATE,
    PRIMARY KEY (student_id),
    CONSTRAINT fk_students_classroom
        FOREIGN KEY (classroom_id) REFERENCES Classroom (classroom_id)
);


-- Creates the Faculty table
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50) NOT NULL
);



-- Creates the Courses table (Member D)
CREATE TABLE Courses (
    course_id     INT          NOT NULL AUTO_INCREMENT,
    course_name   VARCHAR(100) NOT NULL,
    credits       INT,
    faculty_id    INT          NOT NULL,
    classroom_id  INT          NOT NULL,
    PRIMARY KEY (course_id),
    CONSTRAINT fk_courses_faculty
        FOREIGN KEY (faculty_id)   REFERENCES Faculty (faculty_id),
    CONSTRAINT fk_courses_classroom
        FOREIGN KEY (classroom_id) REFERENCES Classroom (classroom_id)
);



-- Creates the Extra_Curricular_Activities table
CREATE TABLE Extra_Curricular_Activities (
    activity_id         INT          NOT NULL AUTO_INCREMENT,
    activity_name        VARCHAR(100) NOT NULL,
    category              VARCHAR(50),
    faculty_advisor_id   INT          NOT NULL,
    PRIMARY KEY (activity_id),
    CONSTRAINT fk_activities_faculty
        FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty (faculty_id)
);



-- Creates the Student_Courses junction table
CREATE TABLE Student_Courses (
    student_id  INT,
    course_id   INT,
    grade       VARCHAR(2),
    date_enrolled DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id)  REFERENCES Courses(course_id)
);

-- Creates the Student_Activities junction table
CREATE TABLE Student_Activities (
    student_id   INT,
    activity_id  INT,
    join_date    DATE,
    PRIMARY KEY (student_id, activity_id),
    FOREIGN KEY (student_id)  REFERENCES Students(student_id),
    FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);



-- =====================================================================
-- INSERT DATA
-- =====================================================================

-- Inserts rows into Classroom


-- Inserts rows into Students
INSERT INTO Students (name, email, classroom_id, enrollment_date) VALUES
    ('Amara Okafor',    'amara.okafor@alu.edu',    1, '2024-09-01'),
    ('Kwame Mensah',    'kwame.mensah@alu.edu',    2, '2024-09-01'),
    ('Chiamaka Eze',    'chiamaka.eze@alu.edu',    1, '2024-09-03'),
    ('Thierry Uwase',   'thierry.uwase@alu.edu',   3, '2024-09-03'),
    ('Fatima Diallo',   'fatima.diallo@alu.edu',   2, '2024-09-05'),
    ('Daniel Bello',    'daniel.bello@alu.edu',    1, '2024-09-05'); 


-- Inserts rows into Faculty
INSERT INTO Faculty (faculty_id, name, email, department)
VALUES
(1, 'Dr. Emma Johnson', 'emma@alu.edu', 'Computer Science'),
(2, 'Mr. Joe Smith', 'joe@alu.edu', 'Business'),
(3, 'Dr. Catherine Summers', 'catherine@alu.edu', 'Engineering'),
(4, 'Ms. David Grey', 'david@alu.edu', 'Mathematics'),
(5, 'Prof. Nora Davis', 'nora@alu.edu', 'Information Systems');



-- Inserts rows into Courses (Member D)
INSERT INTO Courses (course_name, credits, faculty_id, classroom_id) VALUES
    ('Introduction to Programming', 4, 1, 3),
    ('Calculus I',                  3, 2, 1),
    ('Classical Mechanics',         4, 3, 2),
    ('Digital Art Foundations',     3, 4, 4),
    ('Cell Biology',                4, 5, 5),
    ('Organic Chemistry',           4, 1, 1);



-- Inserts rows into Extra_Curricular_Activities
INSERT INTO Extra_Curricular_Activities (activity_name, category, faculty_advisor_id) VALUES
    ('Debate Club',    'Academic',   1),
    ('Football Team',  'Sports',     2),
    ('Drama Society',  'Arts',       3),
    ('Coding Club',    'Technology', 1),
    ('Chess Club',     'Academic',   4);

-- Inserts rows into Student_Courses
INSERT INTO Student_Courses (student_id, course_id, grade, date_enrolled) VALUES
    (1, 1, 'A',  '2026-01-15'),
    (2, 1, 'B+', '2026-01-15'),
    (3, 2, 'A-', '2026-01-16'),
    (4, 3, 'C',  '2026-01-16'),
    (5, 2, 'B',  '2026-01-17');

UPDATE Student_Courses SET grade = 'A+' WHERE student_id = 1 AND course_id = 1;
DELETE FROM Student_Courses WHERE student_id = 5 AND course_id = 2;

-- Inserts rows into Student_Activities
INSERT INTO Student_Activities (student_id, activity_id, join_date) VALUES
    (1, 1, '2026-02-01'),
    (2, 2, '2026-02-01'),
    (3, 3, '2026-02-02'),
    (4, 4, '2026-02-02'),
    (5, 1, '2026-02-03');

UPDATE Student_Activities SET join_date = '2026-02-05' WHERE student_id = 5 AND activity_id = 1;
DELETE FROM Student_Activities WHERE student_id = 4 AND activity_id = 4;



-- ========= UPDATE, DELETE, SELECT =========

-- Update, delete, and select on Students
UPDATE Students
    SET email = 'amara.o@alu.edu'
    WHERE student_id = 1;


-- Update, delete, and select on Classroom



-- Update Faculty
UPDATE Faculty
SET department = 'Data Science'
WHERE faculty_id = 3;

-- Delete Faculty
DELETE FROM Faculty
WHERE faculty_id = 5;

-- Select Faculty
SELECT *
FROM Faculty
WHERE department = 'Computer Science';



-- Update, delete, and select on Courses (Member D)
UPDATE Courses
    SET credits = 5
    WHERE course_id = 1;

DELETE FROM Courses
    WHERE course_id = 6;

SELECT course_id, course_name, credits
    FROM Courses
    WHERE credits >= 4;

-- Update, delete, and select on Extra_Curricular_Activities
UPDATE Extra_Curricular_Activities
    SET category = 'STEM'
    WHERE activity_id = 4;

DELETE FROM Extra_Curricular_Activities
    WHERE activity_id = 5;

SELECT *
FROM Extra_Curricular_Activities
WHERE category = 'Academic';


-- ========= JOIN QUERIES =========

-- Join 1: student enrolled in course, taught by faculty, in classroom



-- Join 2: student participates in activity, advised by faculty



-- Join 3: team's own join



-- ========= AGGREGATE QUERY =========

-- Count of students in each course (COUNT / GROUP BY)
