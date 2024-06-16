-- Remove Meals That Have Not Been Consumed by Any Students

DELETE FROM Meals
WHERE Meal_id IN 
(
    SELECT Meal_id
    FROM Meals
    WHERE Meal_id NOT IN 
    (
        SELECT Meal_id
        FROM Eater
    )
);

--A query to delete counselors who have no associated students
DELETE FROM Counselor
WHERE Counselor_id NOT IN 
(
    SELECT DISTINCT Counselor_id
    FROM Student_
);


