--This constraint ensures that the Counselor_Name column cannot contain NULL values.
ALTER TABLE Meals
MODIFY (Is_dairy NOT NULL);

--This constraint ensures that the grade specified for a trip is one of the predefined values
ALTER TABLE Trips
ADD CONSTRAINT check_grade CHECK (Grade BETWEEN 1 AND 12);

--This constraint sets a default value of 'No' for the In_time column.
ALTER TABLE Transportation
MODIFY (In_time DEFAULT 'No');

--This constraint ensures that the is dairy specified for a meal is one of the predefined values
ALTER TABLE Meals
ADD CONSTRAINT check_is_dairy CHECK (Is_Dairy IN ('Yes', 'No'));

--This constraint ensures that the maximum capacity is 100
ALTER TABLE Activity
ADD CONSTRAINT maximum_capacity CHECK (capacity <= 100);

