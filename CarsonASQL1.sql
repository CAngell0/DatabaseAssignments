--Carson Angell
-- Feb 4 2025
-- SQL 1

-- 1 Commented out since I do not have the database
-- SELECT
--    prodName AS product,
--    prodMfg AS manufacturer,
--    prodPrice AS price
-- FROM
--    product
-- ORDER BY
--    manufacturer ASC;

-- 2 Commented out since I do not have the database
-- SELECT DISTINCT
--    ordCity AS order_city
-- FROM
--    ordertbl
-- ORDER BY
--    order_city DESC;

-- 3 Commented out since I do not have the database
-- SELECT
--    custFirstName AS first_name,
--    custLastName AS last_name
-- FROM
--    customer
-- WHERE
--    custLastName LIKE 'W%'
-- ORDER BY
--    custFirstName ASC;

-- 4 Commented out since I do not have the database
-- SELECT
--    ordno AS order_number,
--    ordName AS order_name,
--    ordState AS order_state
-- FROM
--    ordertbl
-- WHERE
--    empno = 'E8544399';

-- 5
SELECT
   firstname || ' ' || lastName AS full_name,
   city,
   phone AS phone_number
FROM
   Students
WHERE
   firstname = 'Kassandra'
ORDER BY
   city ASC;

--6
SELECT
   buildingName
FROM
   buildings
WHERE
   buildingName LIKE '_i%'
;

--7
SELECT
   courseID,
   sectionID,
   locationID
FROM
   sections
WHERE
   capacity IN (20,40) AND
   locationID >= 100 AND locationID <= 1000
ORDER BY
   locationID ASC,
   sectionID DESC
;

--8
SELECT
   professorID,
   lastName,
   phone
FROM
   professors
WHERE
   city IN ('Bend', 'Lake Oswego')
ORDER BY
   hireDate ASC
;

--9
SELECT
   score,
   studentID
FROM
   assignmentScore
WHERE
   sectionID = '20646' AND
   assignmentTypeID = 'MT'
ORDER BY
   studentID ASC,
   score ASC;

--10 Commented out since I do not have the database
-- SELECT
--    ordCity,
--    ordName
-- FROM
--    ordertbl
-- WHERE
--    empno IS NULL
-- ORDER BY
--    city ASC
-- ;
