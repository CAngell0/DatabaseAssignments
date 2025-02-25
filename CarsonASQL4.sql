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
   sectionID AS section_id,
   COUNT(*) AS student_number
FROM
   registration
WHERE
   TO_CHAR(registrationDate, 'DY') = 'WED'
GROUP BY
   sectionID
HAVING
   COUNT(*) > 3
ORDER BY
   student_number DESC
;

-- Query 6
SELECT
   sectionID AS section_id,
   studentID AS student_id,
   TO_CHAR(ROUND(AVG(score), 4), '99.0000') AS average_grade
FROM
   assignmentScore
WHERE
   sectionID = 30775
GROUP BY
   sectionID,
   studentID
ORDER BY
   average_grade DESC
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
