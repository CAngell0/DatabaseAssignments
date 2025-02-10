-- Query 1
-- SELECT
--    firstName || ' ' || lastName AS full_name,
--    phone AS phone_number,
--    ZIP AS zip
-- FROM
--    students
-- WHERE
--    city = 'Medford'
-- ORDER BY
--    full_name ASC;

-- Query 2
-- SELECT
--    firstName || ' ' || lastName AS full_name,
--    phone AS phone_number,
--    tuitionBalance AS tuition_balance
-- FROM
--    students
-- WHERE
--    phone LIKE '701%'
-- ORDER BY
--    full_name ASC;

-- -- Query 3
-- SELECT
--    UPPER(lastName) || ', ' || SUBSTR(firstName, 1, 1) AS formatted_name,
--    LPAD(phone, 27, '*') AS phone_number,
--    streetAddress AS address
-- FROM 
--    students
-- WHERE
--    phone LIKE '623%'
-- ORDER BY
--    formatted_name ASC;

-- Query 4
-- SELECT
--    studentID AS student_id,
--    tuitionBalance AS tuition_balance
-- FROM
--    students
-- WHERE
--    state = 'OR' AND
--    tuitionBalance > 9000 AND
--    MOD(tuitionBalance, 2) = 1;

-- Query 5
-- SELECT DISTINCT
--    ZIP AS zip
-- FROM
--    students
-- WHERE
--    city = 'Las Vegas' AND
--    state = 'NV'
-- ORDER BY
--    zip ASC;

-- -- Query 6
SELECT
   studentID AS student_id,
   score,
   CASE
      WHEN score >= 70 THEN 'PASS'
      ELSE 'FAIL'
   END AS pass_or_fail
FROM
   assignmentScore
WHERE
   assignmentTypeID = 'FI' AND
   sectionID = 10702
ORDER BY
   score DESC;

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
