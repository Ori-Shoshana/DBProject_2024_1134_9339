CREATE OR REPLACE PROCEDURE process_trip_updates(p_trip_manager_id IN Trips.Trip_maneger_id%TYPE)
IS
  -- Cursor declaration
  CURSOR trip_cursor IS
    SELECT Trip_date, Trip_topic, Locations
    FROM Trips
    WHERE Trip_maneger_id = p_trip_manager_id;

  -- Variables to hold trip details
  v_trip_date Trips.Trip_date%TYPE;
  v_trip_topic Trips.Trip_topic%TYPE;
  v_locations Trips.Locations%TYPE;
  v_updated_grade Trips.Grade%TYPE := 8;  -- Example: Set default grade to 8

  -- Exception declaration
  e_no_trip EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_no_trip, -20001);

BEGIN
  -- Loop through trips for the given manager ID
  FOR trip_rec IN trip_cursor LOOP
    v_trip_date := trip_rec.Trip_date;
    v_trip_topic := trip_rec.Trip_topic;
    v_locations := trip_rec.Locations;

    -- Perform an update on the grade of the trip
    UPDATE Trips
    SET Grade = LEAST(GREATEST(v_updated_grade, 1), 12)  -- Ensures grade is between 1 and 12
    WHERE Trip_maneger_id = p_trip_manager_id;

    -- Check if the update was successful
    IF SQL%ROWCOUNT = 0 THEN
      DBMS_OUTPUT.PUT_LINE('No rows were updated.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Grade updated successfully.');
    END IF;

    -- Example of using exception handling
    BEGIN
      -- Additional DML command (delete example)
      DELETE FROM Activity
      WHERE Activity_id = 500;

      -- Commit transaction
      COMMIT;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error in nested block: ' || SQLERRM);
    END;
  END LOOP;

EXCEPTION
  WHEN e_no_trip THEN
    DBMS_OUTPUT.PUT_LINE('No trip found for the given manager ID.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    ROLLBACK;  -- Rollback in case of any error
END process_trip_updates;
/
