--Select Students by Meal Type and Meal Name
SELECT s.Student_Name,s.grade, m.Meal_name, m.Type_meal
FROM Student_ s
JOIN Eater e ON s.Student_id = e.Student_id
JOIN Meals m ON e.Meal_id = m.Meal_id
WHERE m.Type_meal = &<name="meal_type" type="string" list="Breakfast, Lunch, Dinner" hint="Pick the type of meal">
AND m.Meal_name = &<name="meal_name" type="string" list="Hamburger, Spaghetti, Pizza, Salad, Sushi, Tacos, Pasta, Steak, Soup, Sandwich" hint="Pick the name of the meal">;
----------------------------------------------------------------------------
--This query retrieves students who are going on a trip on a specific date
SELECT s.Student_Name, s.Grade, t.trip_topic, t.locations, t.trip_date
FROM Student_ s
JOIN Going g ON s.Student_id = g.Student_id
JOIN Trips t ON g.Trip_maneger_id = t.Trip_maneger_id
WHERE t.Trip_date = &<name="trip_date" type="date" hint="Enter the date of the trip (YYYY-MM-DD)">;
---------------------------------------------------------------------------
--This query retrieves information about activities between two dates
-- Select Activities by Grade and Date Range
-- Select Activities by Grade and Date Range
SELECT a.Activity_name, a.capacity
FROM Activity a
JOIN Active act ON a.Activity_id = act.Activity_id
JOIN Student_ s ON act.Student_id = s.Student_id
WHERE s.Grade = &<name="grade" type="integer" list= "1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12" hint="Enter the grade of the students">
AND a.Date_of_activity >= TO_DATE(&<name="start_activity_date" type="date" hint="Enter the first date (YYYY-MM-DD)">)
AND a.Date_of_activity <= TO_DATE(&<name="finish_activity_date" type="date" hint="Enter the last date (YYYY-MM-DD)">);

---------------------------------------------------------------------------------
-- Select Students Arriving with Specific Transportation ID
SELECT s.Student_Name, s.Grade, s.student_id
FROM Student_ s
JOIN Arrive a ON s.Student_id = a.Student_id
JOIN Transportation t ON a.Transportation_id = t.Transportation_id
WHERE t.Transportation_id = &<name="transportation_id" type="integer" hint="Enter the transportation ID (1-400)">
ORDER BY s.Student_Name;
