DECLARE
  p_trip_manager_id Trips.Trip_maneger_id%TYPE := 219474001;  -- Replace with the appropriate trip manager ID
  trip_cursor SYS_REFCURSOR;
  v_trip_date Trips.Trip_date%TYPE;
  v_trip_topic Trips.Trip_topic%TYPE;
  v_locations Trips.Locations%TYPE;
  v_student_id Student_.Student_id%TYPE;
  v_student_name Student_.Student_Name%TYPE;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Starting the main program...');
  
  -- Call the get_trip_details function
  trip_cursor := get_trip_details(p_trip_manager_id);
  
  DBMS_OUTPUT.PUT_LINE('Function get_trip_details called.');

  -- Check if the cursor is not null
  IF trip_cursor IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Trip cursor is not null. Fetching data...');
    
    -- Fetch the trip details and associated student details from the cursor
    LOOP
      FETCH trip_cursor INTO v_trip_date, v_trip_topic, v_locations, v_student_id, v_student_name;
      EXIT WHEN trip_cursor%NOTFOUND;
      
      -- Display the trip details and associated student details
      DBMS_OUTPUT.PUT_LINE('Trip Date: ' || TO_CHAR(v_trip_date, 'DD-MON-YYYY'));
      DBMS_OUTPUT.PUT_LINE('Trip Topic: ' || v_trip_topic);
      DBMS_OUTPUT.PUT_LINE('Locations: ' || v_locations);
      DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_student_id);
      DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_student_name);
    END LOOP;
    CLOSE trip_cursor;

    -- Call the process_trip_updates procedure
    DBMS_OUTPUT.PUT_LINE('Calling process_trip_updates procedure...');
    process_trip_updates(p_trip_manager_id);
    DBMS_OUTPUT.PUT_LINE('Procedure process_trip_updates called.');

  ELSE
    DBMS_OUTPUT.PUT_LINE('No trip details found.');
  END IF;

  DBMS_OUTPUT.PUT_LINE('Main program completed.');

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No data found for the given manager ID.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    IF trip_cursor IS NOT NULL THEN
      CLOSE trip_cursor;
    END IF;
END;
/
