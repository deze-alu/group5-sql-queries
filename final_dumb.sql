-- ========= CREATE DATABASE =========
CREATE DATABASE IF NOT EXISTS alu_database;
USE alu_database;

-- =====================================================================
-- CREATE TABLES
-- =====================================================================

-- Creates the Classroom table



-- Creates the Students table



-- Member C: Creates the Faculty table
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50) NOT NULL
);



-- Creates the Courses table



-- Creates the Extra_Curricular_Activities table



-- Creates the Student_Courses junction table



-- Creates the Student_Activities junction table



-- =====================================================================
-- INSERT DATA
-- =====================================================================

-- Inserts rows into Classroom



-- Inserts rows into Students



-- Inserts sample faculty records into Faculty
INSERT INTO Faculty (faculty_id, name, email, department)
VALUES
(1, 'Dr. Emma Johnson', 'emma@alu.edu', 'Computer Science'),
(2, 'Mr. Joe Smith', 'joe@alu.edu', 'Business'),
(3, 'Dr. Catherine Summers', 'catherine@alu.edu', 'Engineering'),
(4, 'Ms. David Grey', 'david@alu.edu', 'Mathematics'),
(5, 'Prof. Nora Davis', 'nora@alu.edu', 'Information Systems');



-- Inserts rows into Courses



-- Inserts rows into Extra_Curricular_Activities



-- Inserts rows into Student_Courses



-- Inserts rows into Student_Activities



-- ========= UPDATE, DELETE, SELECT =========

-- Update, delete, and select on Students



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



-- Update, delete, and select on Courses



-- Update, delete, and select on Extra_Curricular_Activities



-- ========= JOIN QUERIES =========

-- Join 1: student enrolled in course, taught by faculty, in classroom



-- Join 2: student participates in activity, advised by faculty



-- Join 3: team's own join



-- ========= AGGREGATE QUERY =========

-- Count of students in each course (COUNT / GROUP BY)
