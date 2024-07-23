-- Add Gradesheets column to Student1
ALTER TABLE Student1 ADD Gradesheets INT;

-- Update Student1 with random Gradesheets values where Gradesheets is NULL
UPDATE Student1
SET Gradesheets = ROUND(DBMS_RANDOM.VALUE(60, 100))
WHERE Gradesheets IS NULL;

-- Update Student1 with Gradesheets from Student
UPDATE Student1
SET Gradesheets = (
    SELECT s.Gradesheats
    FROM Student s
    WHERE s.Student_ID = Student1.Student_id
);


-- Drop the original Student table
DROP TABLE Student;

-- Rename Student1 to Student
ALTER TABLE Student1 RENAME TO Student;


