-- ========= CREATE DATABASE =========
CREATE DATABASE IF NOT EXISTS alu_database;
USE alu_database;

-- =====================================================================
-- CREATE TABLES
-- =====================================================================

-- Creates the Classroom table
CREATE TABLE Classroom(
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
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
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50) NOT NULL
);



-- Creates the Courses table (Member D)
CREATE TABLE Courses (
    course_id     INT          NOT NULL AUTO_INCREMENT,
    course_name   VARCHAR(100) NOT NULL,
    credits       INT,
    faculty_id    INT,
    classroom_id  INT          NOT NULL,
    PRIMARY KEY (course_id),
    CONSTRAINT fk_courses_faculty
        FOREIGN KEY (faculty_id)   REFERENCES Faculty (faculty_id) ON DELETE SET NULL,
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
INSERT INTO Classroom (classroom_id, room_number, building, capacity)
VALUES (1,'101', 'Main Block', 30);

INSERT INTO Classroom (classroom_id, room_number, building, capacity)
VALUES (2, '102', 'Main Block', 25);

INSERT INTO Classroom (room_number, building, capacity) VALUES
    ('201', 'Tech Hub',      30),
    ('301', 'Arts Wing',     50),
    ('205', 'Science Block', 45),
    ('110', 'Temp Annex',    25);

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

DELETE FROM Students
    WHERE student_id = 6;

SELECT student_id, name, email
    FROM Students
    WHERE classroom_id = 1;

-- Update, delete, and select on Classroom
UPDATE Classroom
SET capacity = 28
WHERE classroom_id = 2;

DELETE FROM Classroom
WHERE classroom_id = 2;

SELECT * FROM Classroom
WHERE building = 'Main Block';

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
SELECT CONCAT(
        s.name, ' is enrolled in ', c.course_name,
        ', taught by ', f.name,
        ', in room ', cl.room_number, '.'
    ) AS enrollment_sentence
FROM Student_Courses sc
JOIN Students  s  ON sc.student_id  = s.student_id
JOIN Courses   c  ON sc.course_id   = c.course_id
JOIN Faculty   f  ON c.faculty_id   = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id
ORDER BY s.name;


-- Join 2: student participates in activity, advised by faculty
SELECT CONCAT(
        s.name, ' participates in ', a.activity_name,
        ', advised by ', f.name, '.'
    ) AS activity_sentence
FROM Student_Activities sa
JOIN Students s ON sa.student_id = s.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
JOIN Faculty  f ON a.faculty_advisor_id = f.faculty_id
ORDER BY s.name;


-- Join 3: Student's grade in each course they take
SELECT CONCAT(
        s.name, ' is taking ', c.course_name,
        ' and currently has grade ', sc.grade, '.'
    ) AS grade_sentence
FROM Student_Courses sc
JOIN Students s ON sc.student_id = s.student_id
JOIN Courses  c ON sc.course_id  = c.course_id
ORDER BY s.name, c.course_name;


-- ========= AGGREGATE QUERY =========

-- Count of students in each course (COUNT / GROUP BY)
SELECT c.course_name,
       COUNT(sc.student_id) AS num_students
FROM Courses c
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY c.course_id, c.course_name
ORDER BY num_students DESC, c.course_name;


-- ========= NORMALIZATION PARAGRAPH ============
-- Each type of information lives in its own table, and nothing important is
-- written down twice. A student can join many courses, and a course can have many students (the
-- same is true for activities).
-- A teacher's name and a room's details are stored once (in the Faculty and Classroom tables), and the Courses table
-- simply points to them instead of repeating them. If a teacher's name ever
-- changes, we only fix it in one place.
