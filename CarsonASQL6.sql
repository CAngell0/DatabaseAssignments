-- Query 1
SELECT
   firstName || ' ' || lastName AS full_name
FROM
   students
WHERE
   lastName LIKE 'Z%' AND
   tuitionBalance < (
      SELECT
         AVG(tuitionBalance) AS balance_average
      FROM
         students
   )
ORDER BY
   full_name ASC
;

-- Query 2 --todo
SELECT
   stu.firstName || ' ' || stu.lastName AS full_name,
   stu.studentID AS student_id,
   coun.registration_amount
FROM
   students stu
JOIN
   (
      SELECT
         reg.studentID AS student_id,
         COUNT(*) AS registration_amount
      FROM
         registration reg
      GROUP BY
         reg.studentID
      HAVING
         COUNT(*) BETWEEN 17 AND 19
   ) coun
ON
   coun.student_id = stu.studentID
ORDER BY
   registration_amount DESC
;

-- Query 3 --todo
SELECT
   SUBSTR(prof.lastName, 1, 1) AS letter,
   COUNT(*) AS professor_count
FROM
   professors prof
WHERE 
   NOT EXISTS (
      SELECT
         *
      FROM
         sections sect
      WHERE
         sect.professorID = prof.professorID
   )
GROUP BY
   SUBSTR(lastName, 1, 1)
ORDER BY
   letter ASC
;



-- Query 4
SELECT DISTINCT
   sect.sectionID AS section_id,
   asig.studentID,
   asig.score AS final_score
FROM
   (
      SELECT
         reg.sectionID,
         COUNT(*) AS count
      FROM
         registration reg
      GROUP BY
         reg.sectionID
      HAVING
         COUNT(*) > 25
   ) sect
JOIN
   assignmentScore asig
ON
   asig.sectionID = sect.sectionID
WHERE
   asig.assignmentTypeID = 'FI'
ORDER BY
   final_score ASC
;

-- Query 5
SELECT
   subjectCode
FROM
   courses
;

-- Query 6
SELECT
   city
FROM
   professors
;

-- Query 7
SELECT
   assignmentTypeID
FROM
   assignmentScore
;

-- Query 8
SELECT
   firstName AS first_name
FROM
   professors
;

-- Query 9
SELECT
   firstName AS first_name
FROM
   students
;

-- Query 10
SELECT
   admissionDate
FROM
   students
;
