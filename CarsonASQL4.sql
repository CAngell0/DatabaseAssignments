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
   ROUND(AVG(score), 2) AS average_score,
   MAX(score) AS highest_score,
   MIN(score) AS lowest_score
FROM
   assignmentScore
WHERE
   assignmentTypeID = 'FI'
;

-- Query 4
SELECT
   city,
   state,
   COUNT(*) AS student_count
FROM
   students
GROUP BY
   city,
   state
HAVING
   COUNT(*) > 50 OR
   COUNT(*) < 5
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
