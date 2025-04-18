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
   studentID AS student_id,
   COUNT(*) AS section_count
FROM
   registration
WHERE
   studentID IN (1398, 2847, 2735, 2959, 3200)
GROUP BY
   studentID
ORDER BY 
   section_count DESC
;

-- Query 8
SELECT
   sectionID AS section_id,
   MIN(score) AS lowest_score
FROM
   assignmentScore
WHERE
   assignmentTypeID = 'QZ'
GROUP BY
   sectionID
HAVING
   MIN(score) >= 80 AND
   COUNT(*) < 5
ORDER BY
   lowest_score ASC
;

-- Query 9
SELECT
   city,
   COUNT(*) AS student_count
FROM
   students
WHERE
   city < 'M'
GROUP BY
   city
HAVING
   COUNT(*) BETWEEN 20 AND 100
ORDER BY
   student_count ASC
;

-- Query 10
SELECT
   sectionID AS section_id,
   COUNT(*) AS participation_grade_count,
   MIN(score) AS lowest_grade
FROM
   assignmentScore
WHERE
   assignmentTypeID = 'PA'
GROUP BY
   sectionID
HAVING
   COUNT(*) > 35
ORDER BY
   participation_grade_count ASC
;
