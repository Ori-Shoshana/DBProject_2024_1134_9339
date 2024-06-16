-- Insert a row without specifying In_time
INSERT INTO Transportation (Transportation_id, departure_time, Driver_name)
VALUES (707, TO_DATE('2024-06-03', 'YYYY-MM-DD'), 'Alex Johnson');

-- Select the inserted row to verify the default value
SELECT * FROM Transportation WHERE Transportation_id = 707;
