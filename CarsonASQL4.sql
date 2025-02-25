-- Query 1
SELECT
   ROUND(AVG(tuitionBalance), 2) AS tuition_average
FROM
   students
;

-- Query 2
SELECT
   COUNT(*) AS student_count
FROM
   students
WHERE
   TO_CHAR(admissionDate, 'YYYY') = '2015'
;

-- Query 3
SELECT
   score
FROM
   assignmentScore
;

-- Query 4
SELECT
   city
FROM
   students
;

-- Query 5
SELECT
   sectionID AS section_id
FROM
   registration
;

-- Query 6
SELECT
   sectionID AS section_id
FROM
   registration
;

-- Query 7
SELECT
   sectionID AS section_id
FROM
   registration
;

-- Query 8
SELECT
   score
FROM
   assignmentScore
;

-- Query 9
SELECT
   city
FROM
   students
;

-- Query 10
SELECT
   sectionID AS section_id
FROM
   assignmentScore
;
