CREATE OR REPLACE PROCEDURE update_transportation_departure_time (
    p_transportation_id IN INT
)
IS
    v_current_departure_time  Transportation.departure_time%TYPE;
    v_updated_departure_time  DATE;
    
    e_no_transportation  EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_no_transportation, -20001);
BEGIN
    -- Fetch current departure time for the given transportation ID
    SELECT departure_time
    INTO v_current_departure_time
    FROM Transportation
    WHERE Transportation_id = p_transportation_id;

    -- Example: Calculate updated departure time (e.g., add 1 hour to current time)
    v_updated_departure_time := v_current_departure_time + INTERVAL '1' HOUR;

    -- Update the departure time and set In_time to 'YES' in the Transportation table
    UPDATE Transportation
    SET departure_time = v_updated_departure_time,
        In_time = 'Yes'
    WHERE Transportation_id = p_transportation_id;

    -- Check if any rows were updated
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No rows were updated for Transportation ID ' || p_transportation_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Departure time updated successfully and In time set to YES for Transportation ID ' || p_transportation_id);
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'No transportation record found for ID ' || p_transportation_id);
        
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END update_transportation_departure_time;
/
