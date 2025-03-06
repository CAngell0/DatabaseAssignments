-- Query 1
SELECT
   stu.firstName || ' ' || stu.lastName AS full_name,
   stu.tuitionBalance AS tuition_balance,
   reg.finalClassGrade AS final_class_grade
FROM
   students stu
JOIN
   registration reg
ON
   stu.studentID = reg.studentID
WHERE
   TO_CHAR(reg.registrationDate, 'MON DD') = 'NOV 18'
ORDER BY
   tuition_balance DESC,
   full_name ASC
;

-- Query 2
SELECT
   'CS ' || cour.courseNumber AS course,
   SUBSTR(cour.courseDescription, 0, 33) || '*******' AS course_description,
   COUNT(sect.sectionID) AS sections_per_course
FROM
   courses cour
JOIN
   sections sect
ON
   cour.courseID = sect.courseID
WHERE
   cour.courseNumber BETWEEN '3000' AND '3999' AND
   cour.subjectDescription = 'Computer Science'
GROUP BY
   cour.courseNumber,
   cour.courseDescription
ORDER BY
   course
;

-- Query 3
SELECT
   cour.subjectCode || ' ' || cour.courseNumber AS class,
   prof.firstName || ' ' || prof.lastName AS professor_name,
   COUNT(sect.sectionID) AS count
FROM
   courses cour
JOIN
   sections sect
ON
   cour.courseID = sect.courseID
JOIN
   professors prof
ON
   prof.professorID = sect.professorID
WHERE
   prof.firstName || ' ' || prof.lastName = 'Annabell Freedman'
GROUP BY
   cour.subjectCode || ' ' || cour.courseNumber,
   prof.firstName || ' ' || prof.lastName
ORDER BY
   class DESC
;

-- Query 4
SELECT
   assignScore.assignmentTypeID || ' ' || assignCode.description AS code_description,
   TO_CHAR(ROUND(AVG(assignScore.score), 3), '999.000') AS average_score,
   COUNT(assignScore.assignmentNumber) AS count
FROM
   assignmentScore assignScore
JOIN
   assignmentCode assignCode
ON
   assignScore.assignmentTypeID = assignCode.assignmentTypeID
JOIN
   sections sect
ON
   assignScore.sectionID = sect.sectionID
JOIN
   courses cour
ON
   cour.courseID = sect.courseID
WHERE
   cour.subjectCode || ' ' || cour.courseNumber = 'CS 2550'
GROUP BY
   assignScore.assignmentTypeID || ' ' || assignCode.description
ORDER BY
   code_description ASC
;

-- Query 5
SELECT
   stu.firstName || ' ' || stu.lastName AS full_name,
   reg.sectionID AS section_id
FROM
   students stu
JOIN
   registration reg
ON
   reg.studentID = stu.studentID
JOIN
   assignmentScore assign
ON
   assign.studentID = stu.studentID AND
   assign.sectionID = reg.sectionID
WHERE
   reg.finalClassGrade = 'B-'
GROUP BY
   stu.firstName || ' ' || stu.lastName,
   reg.sectionID
HAVING
   COUNT(assign.score) = 17
ORDER BY
   full_name ASC
;

-- Query 6
SELECT
   stu.firstName || ' ' || stu.lastName AS full_name,
   cour.subjectCode || ' ' || cour.courseNumber AS class,
   assign.assignmentTypeID AS type,
   assign.score AS score,
   COUNT(score) AS homework_count
FROM
   students stu
JOIN
   assignmentScore assign
ON
   assign.studentID = stu.studentID
JOIN
   sections sect
ON
   sect.sectionID = assign.sectionID
JOIN
   courses cour
ON
   cour.courseID = sect.courseID
WHERE
   lastName IN ('Brancaccio', 'Krassow', 'Skillington')
GROUP BY
   stu.firstName || ' ' || stu.lastName,
   cour.subjectCode || ' ' || cour.courseNumber,
   assign.assignmentTypeID,
   assign.score
HAVING
   COUNT(score) > 2
ORDER BY
   full_name
;

-- Query 7
SELECT
   bui.buildingName AS building_name,
   COUNT(loc.room) AS room_count
FROM
   buildings bui
JOIN
   locations loc
ON
   loc.building = bui.building
GROUP BY
   bui.buildingName
HAVING
   COUNT(loc.room) > 10
;

-- Query 8
SELECT
   firstName || ' ' || lastName AS full_name
FROM
   students
;

-- Query 9
SELECT
   courseTitle AS course_title
FROM
   courses
;

SELECT
   sectionID AS section_id
FROM
   assignmentScore
;
