-- * Complete
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


-- * Complete
-- Query 2 
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


-- * Complete
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


-- * Complete
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

-- * Complete
-- Query 5
SELECT
   MAX(coun.course_count) AS most_sections
FROM
   (
      SELECT
         COUNT(*) AS course_count,
         sect.courseID AS course_id
      FROM
         sections sect
      WHERE
         sect.semester LIKE 'FAL%'
      GROUP BY
         sect.courseID
   ) coun
;


-- * Complete
-- Query 6
SELECT
   prof.city,
   prof.state,
   prof.zip,
   COUNT(*) AS instructor_count
FROM
   professors prof
GROUP BY
   prof.city,
   prof.state,
   prof.zip
HAVING
   COUNT(*) > 10
ORDER BY
   instructor_count DESC
;


-- * Complete
-- Query 7
SELECT
   code.description,
   COUNT(*) AS number_of_grades
FROM
   assignmentScore score
JOIN
   assignmentCode code
ON
   code.assignmentTypeID = score.assignmentTypeID
GROUP BY
   code.description
ORDER BY
   number_of_grades ASC
;


-- * Complete
-- Query 8
SELECT DISTINCT
   prof.firstName AS first_name,
   prof.lastName AS last_name
FROM
   sections sect
JOIN
   professors prof
ON
   prof.professorID = sect.professorID
WHERE
   sect.courseID IN (
      SELECT
         cour.courseID
      FROM
         courses cour
      WHERE
         cour.subjectCode || ' ' || cour.courseNumber = 'CS 1410' OR
         cour.subjectCode || ' ' || cour.courseNumber = 'CS 1400'
   )
;


-- * Complete
-- Query 9
SELECT
   stu.firstName AS first_name,
   stu.lastName AS last_name,
   score.assignmentTypeID AS assignment_type,
   COUNT(*) AS count
FROM
   students stu
JOIN
   assignmentScore score
ON
   score.studentID = stu.studentID
WHERE
   score.assignmentTypeID != 'HM' AND
   score.assignmentTypeID != 'QZ'
GROUP BY
   stu.firstName,
   stu.lastName,
   score.assignmentTypeID
HAVING
   COUNT(*) > 40
ORDER BY
   first_name ASC,
   last_name ASC
;


-- * Completed
-- Query 10
SELECT
   stu.firstName AS first_name,
   stu.lastName AS last_name
FROM
   students stu
WHERE
   TO_CHAR(stu.admissionDate, 'MM/DD/YYYY') = (
      SELECT
         TO_CHAR(MIN(admissionDate), 'MM/DD/YYYY')
      FROM
         students
   )
ORDER BY
   last_name ASC
;
