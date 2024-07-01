DECLARE
  p_activity_id Activity.Activity_id%TYPE := 1;  -- Replace with the appropriate activity ID
  participants_cursor SYS_REFCURSOR;
  v_student_id Student_.Student_id%TYPE;
  v_student_name Student_.Student_Name%TYPE;
  v_grade Student_.Grade%TYPE;
  v_address Student_.Adress%TYPE;
  v_activity_name Activity.Activity_name%TYPE;
  v_date_of_activity Activity.Date_of_activity%TYPE;
  v_transportation_id Transportation.Transportation_id%TYPE := 1; -- Replace with appropriate Transportation_id

BEGIN
  DBMS_OUTPUT.PUT_LINE('Starting the main program for get_activity_participants...');

  -- Call the get_activity_participants function
  participants_cursor := get_activity_participants(p_activity_id);
  
  DBMS_OUTPUT.PUT_LINE('Function get_activity_participants called.');

  -- Check if the cursor is not null
  IF participants_cursor IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Participants cursor is not null. Fetching data...');
    
    -- Fetch the participant details from the cursor
    LOOP
      FETCH participants_cursor INTO v_student_id, v_student_name, v_grade, v_address;
      EXIT WHEN participants_cursor%NOTFOUND;
      
      -- Display the participant details
      DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_student_id);
      DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_student_name);
      DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
      DBMS_OUTPUT.PUT_LINE('Address: ' || v_address);

      -- Call the procedure to update transportation departure time
      update_transportation_departure_time(v_transportation_id);
      DBMS_OUTPUT.PUT_LINE('Procedure update_transportation_departure_time called for Transportation ID ' || v_transportation_id);
    END LOOP;
    CLOSE participants_cursor;
  ELSE
    DBMS_OUTPUT.PUT_LINE('No participant details found.');
  END IF;

  DBMS_OUTPUT.PUT_LINE('Main program for get_activity_participants completed.');

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No data found for the given activity ID.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    IF participants_cursor IS NOT NULL THEN
      CLOSE participants_cursor;
    END IF;
END;
/
