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



-- Creates the Faculty table



-- Creates the Courses table



-- Creates the Extra_Curricular_Activities table



-- Creates the Student_Courses junction table



-- Creates the Student_Activities junction table



-- =====================================================================
-- INSERT DATA
-- =====================================================================

-- Inserts rows into Classroom


-- Inserts rows into Students



-- Inserts rows into Faculty



-- Inserts rows into Courses



-- Inserts rows into Extra_Curricular_Activities



-- Inserts rows into Student_Courses



-- Inserts rows into Student_Activities



-- ========= UPDATE, DELETE, SELECT =========

-- Update, delete, and select on Students



-- Update, delete, and select on Classroom



-- Update, delete, and select on Faculty



-- Update, delete, and select on Courses



-- Update, delete, and select on Extra_Curricular_Activities



-- ========= JOIN QUERIES =========

-- Join 1: student enrolled in course, taught by faculty, in classroom



-- Join 2: student participates in activity, advised by faculty



-- Join 3: team's own join



-- ========= AGGREGATE QUERY =========

-- Count of students in each course (COUNT / GROUP BY)
