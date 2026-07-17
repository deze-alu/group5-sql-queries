-- ========= CREATE DATABASE =========
CREATE DATABASE IF NOT EXISTS alu_database;
USE alu_database;

-- =====================================================================
-- CREATE TABLES
-- =====================================================================

-- Creates the Classroom table



-- Creates the Students table



-- Creates the Faculty table



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



-- Creates the Student_Courses junction table



-- Creates the Student_Activities junction table



-- =====================================================================
-- INSERT DATA
-- =====================================================================

-- Inserts rows into Classroom



-- Inserts rows into Students



-- Inserts rows into Faculty



-- Inserts rows into Courses (Member D)
INSERT INTO Courses (course_name, credits, faculty_id, classroom_id) VALUES
    ('Introduction to Programming', 4, 1, 3),
    ('Calculus I',                  3, 2, 1),
    ('Classical Mechanics',         4, 3, 2),
    ('Digital Art Foundations',     3, 4, 4),
    ('Cell Biology',                4, 5, 5),
    ('Organic Chemistry',           4, 1, 1);



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
