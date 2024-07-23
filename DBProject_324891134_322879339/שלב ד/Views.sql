-- Create a view that shows students, their activities, and trips
CREATE VIEW Studentdep1 AS
SELECT s.Student_id, 
       s.Student_Name, 
       a.Activity_name, 
       t.Trip_topic, 
       t.Trip_date
FROM Student s
JOIN registerd_to_activity act ON s.Student_id = act.Student_id
JOIN Activity a ON act.Activity_id = a.Activity_id
JOIN registerd_to_trip g ON s.Student_id = g.Student_id
JOIN Trips t ON g.Trip_maneger_id = t.Trip_maneger_id;

-- Query to retrieve Student_id, Student_Name, Activity_name
SELECT Student_id, Student_Name, Activity_name
FROM Studentdep1
WHERE Activity_name IS NOT NULL;
 

-- Query to retrieve Student_id, Student_Name, Trip_topic, and Trip_date from the Studentdep1 view 
SELECT Student_id, Student_Name, Trip_topic, Trip_date
FROM Studentdep1
WHERE Trip_topic IS NOT NULL;


-- Create a view that shows students, their classes, and associated teachers and subjects
CREATE VIEW Studentdep2 AS
SELECT s.Student_id, 
       s.Student_Name, 
       c.Class_ID, 
       c.PERIODD, 
       t.F_Name AS Teacher_First_Name,
       t.L_Name AS Teacher_Last_Name, 
       sub.Name AS Subject_Name
FROM Student s
JOIN StudentClass sc ON s.Student_id = sc.Student_ID
JOIN Class c ON sc.Class_ID = c.Class_ID
JOIN Teacher t ON c.Teacher_ID = t.Teacher_ID
JOIN Subject sub ON c.Subject_ID = sub.Subject_ID;

-- Query to retrieve Student_id, Student_Name, Class_ID, Teacher_First_Name, and Teacher_Last_Name from the Studentdep2 view where the name is daniel
SELECT Student_id, Student_Name, Class_ID, Teacher_First_Name, Teacher_Last_Name
FROM Studentdep2
WHERE Teacher_First_Name = 'Daniel';
-- Query to retrieve Student_id, Student_Name, and Subject_Name from the Studentdep2 view
SELECT Student_id, Student_Name, Subject_Name
FROM Studentdep2
WHERE Subject_Name is not null;
