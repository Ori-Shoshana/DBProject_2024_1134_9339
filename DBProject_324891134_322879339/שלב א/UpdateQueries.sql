--Update the meal to pizza for students in grade 2 (B) כיתה ב
UPDATE Meals
SET Meal_name = 'pizza', Is_Dairy = 'Yes'
WHERE Meal_id IN 
(
    SELECT Meal_id
    FROM Eater
    WHERE Student_id IN 
    (
        SELECT Student_id
        FROM Student_
        WHERE Grade = 2
    )
);
----------------------------------------------------------------------
--This query updates the departure time for a transportation service for a specific student.

UPDATE Transportation
SET departure_time = TO_DATE('2024-07-15', 'YYYY-MM-DD')
WHERE Transportation_id = 
(
    SELECT Transportation_id 
    FROM Arrive 
    WHERE Student_id = 372925107
);
