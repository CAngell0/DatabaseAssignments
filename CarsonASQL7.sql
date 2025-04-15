WITH cs_courses AS (
   SELECT DISTINCT
      cour.courseID AS course_id,
      cour.subjectCode AS subject_code,
      cour.courseNumber AS course_number
   FROM
      courses cour
   WHERE
      cour.subjectCode = 'CS'
)
, stu_classes AS (
   SELECT
      stu.studentID AS student_id,
      stu.firstName AS first_name,
      stu.lastName AS last_name,
      sec.sectionID AS section_id,
      sec.courseID AS course_id
   FROM
      sections sec
   JOIN 
      registration reg
   ON
      reg.sectionID = sec.sectionID
   JOIN
      students stu
   ON
      stu.studentID = reg.studentID
)

--todo
-- Query 1
SELECT
   sec.sectionID AS section_id
FROM
   sections
;

-- Get section ids that have a group project attached to them. Use NOT IN to get the correct section ids

-- SELECT DISTINCT
--    prof.firstName,
--    prof.lastName
-- FROM
--    sections sec
-- JOIN
--    cs_courses cour
-- ON
--    cour.course_id = sec.courseID
-- JOIN
--    professors prof
-- ON
--    prof.professorID = sec.professorID
-- WHERE
--    -- sec.sectionID NOT IN (
--    --    SELECT DISTINCT
--    --       asig.sectionID AS section_id
--    --    FROM
--    --       assignmentScore asig
--    --    WHERE
--    --       asig.assignmentTypeID = 'GP'
--    -- )
--    NOT EXISTS (
--       SELECT
--          'X'
--       FROM
--          assignmentScore asig
--       WHERE
--          asig.sectionID = sec.sectionID AND
--          asig.assignmentTypeID = 'GP'
--    )
-- ;

--* Completed
-- Query 2
-- SELECT
--    COUNT(*) AS student_count,
--    asig.sectionID AS section_id
-- FROM
--    assignmentScore asig
-- WHERE
--    asig.sectionID IN (
--       SELECT
--          sec.sectionID
--       FROM
--          sections sec
--       JOIN
--          cs_courses cour
--       ON
--          cour.course_id = sec.courseID
--       WHERE
--          cour.course_number = '2550'
--    ) AND
--    asig.assignmentTypeID = 'FI' AND
--    asig.score < (
--       SELECT
--          AVG(score) AS average_score
--       FROM
--          assignmentScore
--       WHERE
--          assignmentTypeID = 'FI'
--    )
-- GROUP BY
--    asig.sectionID
-- ORDER BY
--    asig.sectionID ASC
-- ;

--* Complete
-- Query 3
-- SELECT
--    cour.subject_code || ' ' || cour.course_number AS course,
--    SUM(sec.capacity) AS total_capacity
-- FROM
--    sections sec
-- JOIN
--    cs_courses cour
-- ON
--    cour.course_id = sec.courseID
-- WHERE
--    cour.course_number BETWEEN 3000 AND 3999 AND
--    EXISTS (
--       SELECT
--          'X'
--       FROM
--          registration reg
--       WHERE
--          reg.sectionID = sec.sectionID
--    )
-- GROUP BY
--    cour.subject_code || ' ' || cour.course_number
-- ORDER BY
--    cour.subject_code || ' ' || cour.course_number
-- ;

--* Complete
-- Query 4
-- SELECT
--    cour.subjectCode || ' ' || cour.courseNumber AS course
-- FROM
--    courses cour
-- WHERE
--    cour.subjectCode IN ('CS', 'WEB') AND
--    cour.courseNumber >= 3000 AND
--    NOT EXISTS (
--       SELECT
--          'X'
--       FROM
--          sections sec
--       WHERE
--          sec.courseID = cour.courseID
--    )
-- ORDER BY
--    cour.subjectCode,
--    cour.courseNumber
-- ;

--* Complete
-- Query 5
-- SELECT
--    student_id,
--    first_name,
--    last_name
-- FROM
--    stu_classes
-- GROUP BY
--    student_id,
--    first_name,
--    last_name,
--    course_id
-- HAVING
--    COUNT(*) > 3
-- ORDER BY
--    last_name,
--    first_name
-- ;

--todo
-- Query 6
-- SELECT
--    student_id,
--    COUNT(*) AS class_count
-- FROM
--    stu_classes
-- WHERE
--    course_number >= 3000
-- GROUP BY
--    student_id
-- ;
-- SELECT
--    stu.section_id,
--    stu.course_id
-- FROM
--    stu_classes stu
-- JOIN
--    courses cour
-- ON
--    cour.courseID = stu.course_id
-- ;

-- SELECT
--    TO_NUMBER(courseNumber, '9999L')
-- FROM
--    courses
-- ;

-- SELECT
--    AVG(course_number) AS average
-- FROM
--    (
--       SELECT
--          courseNumber AS course_number
--       FROM
--          courses
--       WHERE
--          TO_CHAR(courseNumber, '9999') > 3000
--    )
-- ;

--* Complete
-- Query 7
-- SELECT 
--    cs.subject_code || ' ' || cs.course_number AS course
-- FROM
--    stu_classes stu
-- JOIN
--    cs_courses cs
-- ON
--    cs.course_id = stu.course_id
-- GROUP BY
--    cs.subject_code || ' ' || cs.course_number
-- HAVING
--    COUNT(*) > (
--       SELECT
--          AVG(student_count) AS average
--       FROM
--          (
--             SELECT
--                COUNT(*) AS student_count
--             FROM
--                stu_classes
--             GROUP BY
--                course_id
--          )
--    )
-- ;

--* Complete
-- Query 8
-- SELECT DISTINCT
--    stu.student_id,
--    stu.first_name,
--    stu.last_name
-- FROM
--    stu_classes stu
-- JOIN
--    (
--       SELECT
--          courseID AS course_id
--       FROM
--          sections
--       WHERE 
--          TO_CHAR(sectionStartDate, 'HH:MI') = '12:30'
--    ) cour
-- ON
--    cour.course_id = stu.course_id
-- WHERE
--    SUBSTR(stu.last_name, 1) >= 'T'
-- ;

--* Complete
-- Query 9
-- Get the classes in which the class is full. List the instructor, subject code + title and start date.
-- SELECT
--    prof.firstName || ' ' || prof.lastName AS instructor,
--    cour.subjectCode || ' ' || cour.courseNumber AS course,
--    TO_CHAR(sectionStartDate, 'MM/DD/YYYY HH:MI') AS start_date
-- FROM
--    (
--       SELECT
--          section_id,
--          COUNT(*) AS student_count
--       FROM
--          stu_classes
--       GROUP BY
--          section_id
--    ) coun
-- JOIN  
--    sections sec
-- ON
--    sec.sectionID = coun.section_id
-- JOIN
--    courses cour
-- ON
--    cour.courseID = sec.courseID
-- JOIN
--    professors prof
-- ON
--    prof.professorID = sec.professorID
-- WHERE
--    coun.student_count >= sec.capacity
-- ;

-- Query 10


