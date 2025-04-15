-- Carson Angell
-- SQL Assignment #8
-- 4/15/2025

--Query 1
SELECT
   firstName || ' ' || lastName AS full_name
FROM
   students
;

-- Query 2
SELECT
   lastName AS last_name
FROM
   students
;

-- Query 3
SELECT
   courseID AS course_id
FROM
   courses
;

-- Query 4
SELECT
   studentID AS student_id
FROM
   students
;

-- Query 5
SELECT
   subjectCode AS subject_code
FROM
   courses
;

-- Query 6
SELECT
   firstName || ' ' || lastName AS full_name
FROM
   students
;

-- Query 7
SELECT
   firstName || ' ' || lastName AS full_name
FROM
   students
;

-- Query 8
SELECT
   sectionID AS section_id
FROM
   sections
;

-- Query 9
SELECT
   subjectCode || ' ' || courseNumber AS course
FROM
   courses
;
