-- Query 1
SELECT
   firstName || ' ' || lastName AS full_name,
   phone AS phone_number,
   ZIP AS zip
FROM
   students
WHERE
   city = 'Medford'
ORDER BY
   full_name ASC;

-- -- Query 2
-- SELECT
--    phone
-- FROM
--    students;

-- -- Query 3
-- SELECT
--    firstName AS first_name
-- FROM 
--    students;

-- -- Query 4
-- SELECT
--    studentID AS student_id
-- FROM
--    students;

-- -- Query 5
-- SELECT
--    ZIP AS zip
-- FROM
--    students;

-- -- Query 6
-- SELECT
--    studentID AS student_id
-- FROM
--    students;

-- -- Query 7
-- SELECT
--    firstName AS first_name
-- FROM
--    professors;

-- -- Query 8
-- SELECT
--    firstName AS first_name
-- FROM
--    students;

-- -- Query 9
-- SELECT 
--    studentID AS student_id
-- FROM
--    students;

-- -- Query 10
-- SELECT
--    first_name
-- FROM
--    dual;
