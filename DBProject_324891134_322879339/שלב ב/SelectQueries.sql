--Description: Retrieve student names, their grade, and the activities they are participating in during 
--the 10 month in 2023, including the activity date. This query uses subqueries and nested queries. 
SELECT 
    S.Student_Name,
    S.Grade,
    (SELECT A.Activity_name 
     FROM Activity A 
     WHERE A.Activity_id = AC.Activity_id) AS Activity_name,
    (SELECT A.Date_of_activity 
     FROM Activity A 
     WHERE A.Activity_id = AC.Activity_id) AS Date_of_activity
FROM 
    Student_ S
INNER JOIN 
    Active AC ON S.Student_id = AC.Student_id
WHERE 
    EXISTS (SELECT 1 
            FROM Activity A 
            WHERE A.Activity_id = AC.Activity_id 
              AND EXTRACT(YEAR FROM A.Date_of_activity) = 2023
              AND EXTRACT(MONTH FROM A.Date_of_activity) = 10)
ORDER BY 
    Date_of_activity;
------------------------------------------------------------------------
--Description: Find the counselors who has the most students assigned, including the counselor's name, 
--email,degree level, and the count of students. and organize them descending.
SELECT 
    C.Counselor_name,
    C.DEGREE_LEVEL,
    C.Counselor_email,
    (
        SELECT 
            COUNT(*) 
        FROM 
            Student_ 
        WHERE 
            Counselor_id = C.Counselor_id
    ) AS Student_Count
FROM 
    Counselor C
ORDER BY 
    Student_Count DESC;

------------------------------------------------------------------
--List students who participated in activities on their birthdays:
SELECT 
    s.Student_Name,
    a.Activity_name,
    a.Date_of_activity,
    s.grade
FROM 
    Student_ s
JOIN 
    Active act ON s.Student_id = act.Student_id
JOIN 
    Activity a ON act.Activity_id = a.Activity_id
WHERE 
    EXTRACT(MONTH FROM s.Birth) = EXTRACT(MONTH FROM a.Date_of_activity)
    AND EXTRACT(DAY FROM s.Birth) = EXTRACT(DAY FROM a.Date_of_activity)
ORDER BY 
      s.student_id;
-----------------------------------------------------------------------------
--This query finds the shuttle with the most registered students and returns the details of the students 
--registered for the shuttle, along with the name of the driver and the date:
SELECT tr.Transportation_id,
       tr.Driver_name,
       TO_CHAR(tr.departure_time, 'DD-MON-YYYY') AS Departure_Date,
       s.Student_id,
       s.Student_Name
FROM Transportation tr
JOIN (
    SELECT Transportation_id, COUNT(Student_id) AS Student_Count
    FROM Arrive
    GROUP BY Transportation_id
    ORDER BY COUNT(Student_id) DESC
    FETCH FIRST 1 ROWS ONLY -- Oracle 12c or later syntax for limiting results
) max_shuttle ON tr.Transportation_id = max_shuttle.Transportation_id
JOIN Arrive a ON tr.Transportation_id = a.Transportation_id
JOIN Student_ s ON a.Student_id = s.Student_id;
