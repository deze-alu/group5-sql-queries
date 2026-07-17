-- ========= CREATE DATABASE =========
CREATE DATABASE IF NOT EXISTS alu_database;
USE alu_database;

-- =====================================================================
-- CREATE TABLES
-- =====================================================================

-- Creates the Classroom table



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
