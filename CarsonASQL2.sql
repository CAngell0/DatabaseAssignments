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

-- Query 6
-- SELECT
--    studentID AS student_id,
--    score,
--    CASE
--       WHEN score >= 70 THEN 'PASS'
--       ELSE 'FAIL'
--    END AS pass_or_fail
-- FROM
--    assignmentScore
-- WHERE
--    assignmentTypeID = 'FI' AND
--    sectionID = 10702
-- ORDER BY
--    score DESC;

-- Query 7
-- SELECT
--    CASE
--       WHEN state = 'NM' THEN  'New Mexico'
--       WHEN state = 'UT' THEN 'Utah'
--       WHEN state = 'ND' THEN 'North Dakota'
--       WHEN state = 'MT' THEN 'Montana'
--       WHEN state = 'SD' THEN 'South Dakota'
--       ELSE 'NO_NAME'
--    END AS full_state_name,
--    state,
--    city
-- FROM
--    professors
-- WHERE
--    (
--       firstName LIKE 'P%' OR 
--       lastName LIKE 'L%'
--    ) AND 
--    state IN ('NM', 'UT', 'ND', 'MT', 'SD')
-- ORDER BY
--    state ASC;

-- Query 8
-- SELECT
--    (
--       firstName || ' ' || 
--       lastName || ' ' || 
--       streetAddress || ' ' || 
--       city || ' ' || 
--       state || ' ' || 
--       ZIP
--    ) AS student_address,
--    ZIP
-- FROM
--    students
-- WHERE
--    state = 'UT' AND
--    ROUND(ZIP, -2) >= 84500
-- ORDER BY
--    student_address ASC;

-- Query 9
-- SELECT 
--    studentID AS student_id,
--    score,
--    sectionID AS section_id
-- FROM
--    assignmentScore
-- WHERE
--    assignmentTypeID = 'QZ' AND
--    assignmentNumber = 2 AND
--    sectionID BETWEEN 12000 AND 12100
-- ORDER BY
--    sectionID DESC;

-- -- Query 10
SELECT
   'Carson Angell' AS full_name,
   'Sushi' AS favorite_food,
   37 AS favorite_number,
   POWER(37, 2) AS squared,
   LENGTH('Carson Angell') AS length
FROM
   dual;
