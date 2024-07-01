CREATE OR REPLACE FUNCTION get_activity_participants(p_activity_id IN Activity.Activity_id%TYPE)
RETURN SYS_REFCURSOR
IS
  participants_cursor SYS_REFCURSOR;  -- Ref cursor to return participant details
  v_activity_name Activity.Activity_name%TYPE;  -- Variables to hold activity details
  v_date_of_activity Activity.Date_of_activity%TYPE;
  v_capacity Activity.capacity%TYPE;
  v_updated_capacity Activity.capacity%TYPE;  -- Updated capacity

  e_no_activity EXCEPTION;  -- Custom exception for no activity found
  PRAGMA EXCEPTION_INIT(e_no_activity, -20001);  -- Associate error code with exception

  TYPE participant_record IS RECORD (  -- Define a record type for participant details
    Student_id Student_.Student_id%TYPE,
    Student_Name Student_.Student_Name%TYPE,
    Grade Student_.Grade%TYPE,
    Address Student_.Adress%TYPE
  );

  v_participant participant_record;  -- Declare a variable of the record type

BEGIN
  -- Fetch activity details for the given activity ID
  BEGIN
    SELECT Activity_name, Date_of_activity, capacity
    INTO v_activity_name, v_date_of_activity, v_capacity
    FROM Activity
    WHERE Activity_id = p_activity_id;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE e_no_activity;  -- Raise exception if no activity found
  END;

  -- Perform an update on the activity capacity
  v_updated_capacity := v_capacity - 1;
  UPDATE Activity
  SET capacity = v_updated_capacity
  WHERE Activity_id = p_activity_id;

  -- Check if the update was successful
  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No rows were updated.');  -- Log message if no rows were updated
  END IF;

  -- Open the ref cursor for participant details
  OPEN participants_cursor FOR
    SELECT 
      s.Student_id AS Student_ID, 
      s.Student_Name AS Student_Name,
      s.Grade AS Grade,
      s.Adress AS Address
    FROM 
      Active a
    JOIN 
      Student_ s ON a.Student_id = s.Student_id
    WHERE 
      a.Activity_id = p_activity_id;

  RETURN participants_cursor;  -- Return the ref cursor containing participant details

EXCEPTION
  WHEN e_no_activity THEN
    DBMS_OUTPUT.PUT_LINE('No activity found with the given ID');
    RETURN NULL;  -- Return NULL if no activity found
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    RETURN NULL;  -- Return NULL for any other exception
END get_activity_participants;
/
