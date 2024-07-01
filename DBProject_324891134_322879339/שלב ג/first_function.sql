CREATE OR REPLACE FUNCTION get_trip_details(p_trip_manager_id IN Trips.Trip_maneger_id%TYPE)
RETURN SYS_REFCURSOR
IS
  trip_cursor SYS_REFCURSOR;  -- Ref cursor to return trip details and student details
  v_trip_date Trips.Trip_date%TYPE;  -- Variables to hold trip details
  v_trip_topic Trips.Trip_topic%TYPE;
  v_locations Trips.Locations%TYPE;
  v_updated_topic Trips.Trip_topic%TYPE := 'Diving';  -- New trip topic for update

  e_no_trip EXCEPTION;  -- Custom exception for no trip found
  PRAGMA EXCEPTION_INIT(e_no_trip, -20001);  -- Associate error code with exception

BEGIN
  -- Fetch trip details for the given manager ID
  BEGIN
    SELECT Trip_date, Trip_topic, Locations
    INTO v_trip_date, v_trip_topic, v_locations
    FROM Trips
    WHERE Trip_maneger_id = p_trip_manager_id;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE e_no_trip;  -- Raise exception if no trip found
  END;

  -- Perform an update on the trip topic
  UPDATE Trips
  SET Trip_topic = v_updated_topic
  WHERE Trip_maneger_id = p_trip_manager_id;

  -- Check if the update was successful
  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No rows were updated.');  -- Log message if no rows were updated
  END IF;

  -- Open the ref cursor for trip details and associated student details
  OPEN trip_cursor FOR
    SELECT 
      t.Trip_date AS Trip_Date, 
      t.Trip_topic AS Trip_Topic, 
      t.Locations AS Locations,
      s.Student_id AS Student_ID, 
      s.Student_Name AS Student_Name
    FROM 
      Trips t
    LEFT JOIN 
      Going g ON t.Trip_maneger_id = g.Trip_maneger_id
    LEFT JOIN 
      Student_ s ON g.Student_id = s.Student_id
    WHERE 
      t.Trip_maneger_id = p_trip_manager_id;

  RETURN trip_cursor;  -- Return the ref cursor containing trip details and associated student info

EXCEPTION
  WHEN e_no_trip THEN
    DBMS_OUTPUT.PUT_LINE('No trip found with the given manager ID');
    RETURN NULL;  -- Return NULL if no trip found
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    RETURN NULL;  -- Return NULL for any other exception
END get_trip_details;
/
