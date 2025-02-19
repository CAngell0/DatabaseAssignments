-- Query 1
SELECT
   firstName || ' ' || lastName AS full_name,
   phone AS phone_number,
   TO_CHAR(admissionDate, 'YYYY') AS admission_year
FROM
   students
WHERE
   TO_CHAR(admissionDate, 'DD') = '13' AND
   TO_CHAR(admissionDate, 'MON') = 'JUN'
ORDER BY
   admissionDate || lastName ASC
;

-- Query 2
SELECT
   courseID AS course_id,
   sectionID AS section_id,
   TO_CHAR(sectionStartDate, 'DD/MM/YYYY HH:MI') AS start_date
FROM
   sections
WHERE
   locationID = 8396
ORDER BY
   start_date ASC
;

-- Query 3
SELECT
   professorID
FROM
   sections
;

-- Query 4
SELECT
   studentID
FROM
   registration
;

-- Query 5
SELECT
   "Date" as date
FROM
   dual
;

-- Query 6
SELECT
   courseID
FROM
   sections
;

-- Query 7
SELECT
   admissionDate
FROM 
   students
;

-- Query 8
SELECT
   hireDate
FROM
   professors
;

-- Query 10
SELECT
   registrationDate
FROM
   registration
;
