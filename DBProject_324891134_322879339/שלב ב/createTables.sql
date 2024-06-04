CREATE TABLE Trips
(
  Locations VARCHAR2(100) NOT NULL,
  Grade VARCHAR2(10) NOT NULL,
  Trip_maneger_id INT NOT NULL,
  Trip_date DATE NOT NULL,
  Trip_topic VARCHAR2(100) NOT NULL,
  PRIMARY KEY (Trip_maneger_id)
);

CREATE TABLE Transportation
(
  Transportation_id INT NOT NULL,
  departure_time DATE NOT NULL,
  Driver_name VARCHAR2(100) NOT NULL,
  In_time VARCHAR2(3) NOT NULL,
  PRIMARY KEY (Transportation_id)
);

CREATE TABLE Meals
(
  Meal_id INT NOT NULL,
  Type_meal VARCHAR2(100) NOT NULL,
  Is_Dairy VARCHAR2(3) NOT NULL,
  Meal_name VARCHAR2(100) NOT NULL,
  PRIMARY KEY (Meal_id)
);

CREATE TABLE Activity
(
  Activity_id INT NOT NULL,
  Date_of_activity DATE NOT NULL,
  Activity_name VARCHAR2(100) NOT NULL,
  capacity INT NOT NULL,
  PRIMARY KEY (Activity_id)
);

CREATE TABLE Counselor
(
  Counselor_id INT NOT NULL,
  Counselor_name VARCHAR2(100) NOT NULL,
  Degree_level VARCHAR2(50) NOT NULL,
  Counselor_Age INT NOT NULL,
  Counselor_email VARCHAR2(100) NOT NULL,
  PRIMARY KEY (Counselor_id)
);

CREATE TABLE Student_
(
  Student_id INT NOT NULL,
  Student_Name VARCHAR2(100) NOT NULL,
  Birth DATE NOT NULL,
  Grade VARCHAR2(10) NOT NULL,
  Adress VARCHAR2(200) NOT NULL,
  Counselor_id INT NOT NULL,
  PRIMARY KEY (Student_id),
  FOREIGN KEY (Counselor_id) REFERENCES Counselor(Counselor_id)
);

CREATE TABLE Arrive
(
  Transportation_id INT NOT NULL,
  Student_id INT NOT NULL,
  PRIMARY KEY (Transportation_id, Student_id),
  FOREIGN KEY (Transportation_id) REFERENCES Transportation(Transportation_id),
  FOREIGN KEY (Student_id) REFERENCES Student_(Student_id)
);

CREATE TABLE Eater
(
  Meal_id INT NOT NULL,
  Student_id INT NOT NULL,
  PRIMARY KEY (Meal_id, Student_id),
  FOREIGN KEY (Meal_id) REFERENCES Meals(Meal_id),
  FOREIGN KEY (Student_id) REFERENCES Student_(Student_id)
);

CREATE TABLE Active
(
  Activity_id INT NOT NULL,
  Student_id INT NOT NULL,
  PRIMARY KEY (Activity_id, Student_id),
  FOREIGN KEY (Activity_id) REFERENCES Activity(Activity_id),
  FOREIGN KEY (Student_id) REFERENCES Student_(Student_id)
);

CREATE TABLE Going
(
  Student_id INT NOT NULL,
  Trip_maneger_id INT NOT NULL,
  PRIMARY KEY (Student_id, Trip_maneger_id),
  FOREIGN KEY (Student_id) REFERENCES Student_(Student_id),
  FOREIGN KEY (Trip_maneger_id) REFERENCES Trips(Trip_maneger_id)
);
