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
   courseID AS course_id,
   sectionID AS section_id,
   professorID as professor_id,
   sectionStartDate AS start_date,
   capacity
FROM
   sections
WHERE
   TO_CHAR(sectionStartDate, 'MON') = 'AUG' AND
   TO_CHAR(sectionStartDate, 'YYYY') = '2020' AND
   MOD(TO_NUMBER(TO_CHAR(sectionStartDate, 'DD')), 2) = 1 AND
   MOD(courseID, 5) = 0 AND
   MOD(professorID, 2) = 0
ORDER BY
   courseID || sectionID DESC
;

-- Query 4
SELECT
   studentID AS student_id,
   sectionID AS section_id,
   finalClassGrade AS final_class_grade
FROM
   registration
WHERE 
   TO_CHAR(registrationDate, 'YYYY') = '2020' AND
   TO_CHAR(registrationDate, 'MON') = 'SEP' AND
   finalClassGrade < 'C-'
ORDER BY
   finalClassGrade ASC
;

-- Query 5
SELECT
   NEXT_DAY(SYSDATE, 'Friday') AS next_fri,
   TO_DATE('04-08-' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY') + 182.625 AS next_half_birthday,
   'Dog' AS chinese_zodiac
FROM
   dual
;

-- Query 6
SELECT
   courseID AS course_id,
   sectionID AS section_id,
   sectionStartDate AS section_start_date,
   TO_CHAR(sectionStartDate, 'HH:MI') AS start_time
   -- TO_CHAR(sectionStartDate, '')
FROM
   sections
WHERE
   TO_CHAR(sectionStartDate, 'YYYY') = '2019' AND
   TO_NUMBER(TO_CHAR(sectionStartDate, 'MM')) BETWEEN 7 AND 8 AND
   TO_CHAR(sectionStartDate, 'HH:MI') = '07:30'
ORDER BY
   capacity ASC,
   sectionID DESC,
   courseID DESC,
   sectionStartDate DESC
;

-- Query 7
SELECT
   firstName || ' ' || lastName AS full_name
FROM 
   students
WHERE
   TO_CHAR(admissionDate, 'YYYY') = '2022' AND
   (
      TO_CHAR(admissionDate, 'DD') = '13' OR
      TO_CHAR(admissionDate, 'DD') = '29'
   )
ORDER BY 
   firstName ASC,
   lastName ASC
;

-- Query 8
SELECT
   firstName || ' ' || lastName AS full_name,
   FLOOR(((SYSDATE - hireDate) / 365.25) * 12) AS months_employed
FROM
   professors
WHERE
   phone LIKE '701%'
ORDER BY
   months_employed DESC
;

SELECT DISTINCT
   TO_CHAR(sectionStartDate, 'HH:MI') AS start_time
FROM
   sections
ORDER BY
   start_time ASC
;

-- Query 10
SELECT
   studentID AS student_id,
   sectionID AS section_id,
   TO_CHAR(registrationDate, 'HH:MI') AS time_enrolled
FROM
   registration
WHERE
   TO_CHAR(registrationDate, 'HH:MI') = '01:35'
ORDER BY
   student_id DESC
;
