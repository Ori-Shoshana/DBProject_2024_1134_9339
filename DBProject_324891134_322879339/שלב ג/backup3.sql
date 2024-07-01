prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by 212or on Monday, 1 July 2024
set feedback off
set define off

prompt Dropping ACTIVITY...
drop table ACTIVITY cascade constraints;
prompt Dropping COUNSELOR...
drop table COUNSELOR cascade constraints;
prompt Dropping STUDENT_...
drop table STUDENT_ cascade constraints;
prompt Dropping ACTIVE...
drop table ACTIVE cascade constraints;
prompt Dropping TRANSPORTATION...
drop table TRANSPORTATION cascade constraints;
prompt Dropping ARRIVE...
drop table ARRIVE cascade constraints;
prompt Dropping MEALS...
drop table MEALS cascade constraints;
prompt Dropping EATER...
drop table EATER cascade constraints;
prompt Dropping TRIPS...
drop table TRIPS cascade constraints;
prompt Dropping GOING...
drop table GOING cascade constraints;
prompt Creating ACTIVITY...
create table ACTIVITY
(
  activity_id      INTEGER not null,
  date_of_activity DATE not null,
  activity_name    VARCHAR2(100) not null,
  capacity         INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVITY
  add primary key (ACTIVITY_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVITY
  add constraint CHECK_CAPACITY
  check (capacity <= 100);
alter table ACTIVITY
  add constraint MAXIMUM_CAPACITY
  check (capacity <= 100);
alter table ACTIVITY
  add constraint MAX_CAPACITY
  check (capacity <= 100);

prompt Creating COUNSELOR...
create table COUNSELOR
(
  counselor_id    INTEGER not null,
  counselor_name  VARCHAR2(100) not null,
  degree_level    VARCHAR2(50) not null,
  counselor_age   INTEGER not null,
  counselor_email VARCHAR2(100) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COUNSELOR
  add primary key (COUNSELOR_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating STUDENT_...
create table STUDENT_
(
  student_id   INTEGER not null,
  student_name VARCHAR2(100) not null,
  birth        DATE not null,
  grade        VARCHAR2(10) not null,
  adress       VARCHAR2(200) not null,
  counselor_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STUDENT_
  add primary key (STUDENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STUDENT_
  add foreign key (COUNSELOR_ID)
  references COUNSELOR (COUNSELOR_ID);

prompt Creating ACTIVE...
create table ACTIVE
(
  activity_id INTEGER not null,
  student_id  INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVE
  add primary key (ACTIVITY_ID, STUDENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVE
  add foreign key (ACTIVITY_ID)
  references ACTIVITY (ACTIVITY_ID);
alter table ACTIVE
  add foreign key (STUDENT_ID)
  references STUDENT_ (STUDENT_ID);

prompt Creating TRANSPORTATION...
create table TRANSPORTATION
(
  transportation_id INTEGER not null,
  departure_time    DATE not null,
  driver_name       VARCHAR2(100) not null,
  in_time           VARCHAR2(3) default 'No' not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRANSPORTATION
  add primary key (TRANSPORTATION_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ARRIVE...
create table ARRIVE
(
  transportation_id INTEGER not null,
  student_id        INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ARRIVE
  add primary key (TRANSPORTATION_ID, STUDENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ARRIVE
  add foreign key (TRANSPORTATION_ID)
  references TRANSPORTATION (TRANSPORTATION_ID);
alter table ARRIVE
  add foreign key (STUDENT_ID)
  references STUDENT_ (STUDENT_ID);

prompt Creating MEALS...
create table MEALS
(
  meal_id   INTEGER not null,
  type_meal VARCHAR2(100) not null,
  is_dairy  VARCHAR2(3) not null,
  meal_name VARCHAR2(100) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEALS
  add primary key (MEAL_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEALS
  add constraint CHECK_IS_DAIRY
  check (Is_Dairy IN ('Yes', 'No'));

prompt Creating EATER...
create table EATER
(
  meal_id    INTEGER not null,
  student_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EATER
  add primary key (MEAL_ID, STUDENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EATER
  add foreign key (MEAL_ID)
  references MEALS (MEAL_ID);
alter table EATER
  add foreign key (STUDENT_ID)
  references STUDENT_ (STUDENT_ID);

prompt Creating TRIPS...
create table TRIPS
(
  locations       VARCHAR2(100) not null,
  grade           VARCHAR2(10) not null,
  trip_maneger_id INTEGER not null,
  trip_date       DATE not null,
  trip_topic      VARCHAR2(100) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRIPS
  add primary key (TRIP_MANEGER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRIPS
  add constraint CHECK_GRADE
  check (Grade BETWEEN 1 AND 12);

prompt Creating GOING...
create table GOING
(
  student_id      INTEGER not null,
  trip_maneger_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GOING
  add primary key (STUDENT_ID, TRIP_MANEGER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GOING
  add foreign key (STUDENT_ID)
  references STUDENT_ (STUDENT_ID);
alter table GOING
  add foreign key (TRIP_MANEGER_ID)
  references TRIPS (TRIP_MANEGER_ID);

prompt Disabling triggers for ACTIVITY...
alter table ACTIVITY disable all triggers;
prompt Disabling triggers for COUNSELOR...
alter table COUNSELOR disable all triggers;
prompt Disabling triggers for STUDENT_...
alter table STUDENT_ disable all triggers;
prompt Disabling triggers for ACTIVE...
alter table ACTIVE disable all triggers;
prompt Disabling triggers for TRANSPORTATION...
alter table TRANSPORTATION disable all triggers;
prompt Disabling triggers for ARRIVE...
alter table ARRIVE disable all triggers;
prompt Disabling triggers for MEALS...
alter table MEALS disable all triggers;
prompt Disabling triggers for EATER...
alter table EATER disable all triggers;
prompt Disabling triggers for TRIPS...
alter table TRIPS disable all triggers;
prompt Disabling triggers for GOING...
alter table GOING disable all triggers;
prompt Disabling foreign key constraints for STUDENT_...
alter table STUDENT_ disable constraint SYS_C009113;
prompt Disabling foreign key constraints for ACTIVE...
alter table ACTIVE disable constraint SYS_C009127;
alter table ACTIVE disable constraint SYS_C009128;
prompt Disabling foreign key constraints for ARRIVE...
alter table ARRIVE disable constraint SYS_C009117;
alter table ARRIVE disable constraint SYS_C009118;
prompt Disabling foreign key constraints for EATER...
alter table EATER disable constraint SYS_C009122;
alter table EATER disable constraint SYS_C009123;
prompt Disabling foreign key constraints for GOING...
alter table GOING disable constraint SYS_C009132;
alter table GOING disable constraint SYS_C009133;
prompt Loading ACTIVITY...
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (1, to_date('24-09-2023', 'dd-mm-yyyy'), 'Dance', 68);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (2, to_date('05-11-2023', 'dd-mm-yyyy'), 'Dance', 74);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (3, to_date('26-04-2023', 'dd-mm-yyyy'), 'Football', 65);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (4, to_date('17-06-2023', 'dd-mm-yyyy'), 'Painting', 97);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (5, to_date('04-02-2023', 'dd-mm-yyyy'), 'Robotics', 92);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (6, to_date('15-06-2023', 'dd-mm-yyyy'), 'Drama', 59);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (7, to_date('07-07-2023', 'dd-mm-yyyy'), 'Yoga', 19);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (8, to_date('28-09-2023', 'dd-mm-yyyy'), 'Yoga', 20);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (9, to_date('01-02-2023', 'dd-mm-yyyy'), 'Painting', 22);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (10, to_date('14-10-2023', 'dd-mm-yyyy'), 'Football', 45);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (11, to_date('25-05-2023', 'dd-mm-yyyy'), 'Basketball', 94);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (12, to_date('25-09-2023', 'dd-mm-yyyy'), 'Swimming', 66);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (13, to_date('31-03-2023', 'dd-mm-yyyy'), 'Drama', 62);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (14, to_date('20-11-2023', 'dd-mm-yyyy'), 'Chess', 72);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (15, to_date('31-01-2023', 'dd-mm-yyyy'), 'Swimming', 81);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (16, to_date('04-02-2023', 'dd-mm-yyyy'), 'Chess', 84);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (17, to_date('16-11-2023', 'dd-mm-yyyy'), 'Dance', 14);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (18, to_date('25-09-2023', 'dd-mm-yyyy'), 'Swimming', 71);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (19, to_date('16-04-2023', 'dd-mm-yyyy'), 'Chess', 23);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (20, to_date('18-10-2023', 'dd-mm-yyyy'), 'Swimming', 31);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (21, to_date('15-09-2023', 'dd-mm-yyyy'), 'Chess', 67);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (22, to_date('03-02-2023', 'dd-mm-yyyy'), 'Dance', 84);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (23, to_date('18-06-2023', 'dd-mm-yyyy'), 'Basketball', 48);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (24, to_date('18-04-2023', 'dd-mm-yyyy'), 'Football', 65);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (25, to_date('06-05-2023', 'dd-mm-yyyy'), 'Yoga', 27);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (26, to_date('05-10-2023', 'dd-mm-yyyy'), 'Yoga', 84);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (27, to_date('09-02-2023', 'dd-mm-yyyy'), 'Music', 63);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (28, to_date('27-11-2023', 'dd-mm-yyyy'), 'Swimming', 60);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (29, to_date('10-02-2023', 'dd-mm-yyyy'), 'Basketball', 90);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (30, to_date('24-10-2023', 'dd-mm-yyyy'), 'Painting', 83);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (31, to_date('16-12-2023', 'dd-mm-yyyy'), 'Yoga', 70);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (32, to_date('23-10-2023', 'dd-mm-yyyy'), 'Basketball', 97);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (33, to_date('31-12-2023', 'dd-mm-yyyy'), 'Chess', 65);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (34, to_date('16-08-2023', 'dd-mm-yyyy'), 'Drama', 53);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (35, to_date('01-10-2023', 'dd-mm-yyyy'), 'Robotics', 51);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (36, to_date('15-09-2023', 'dd-mm-yyyy'), 'Football', 49);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (37, to_date('09-12-2023', 'dd-mm-yyyy'), 'Drama', 99);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (38, to_date('07-06-2023', 'dd-mm-yyyy'), 'Basketball', 78);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (39, to_date('03-10-2023', 'dd-mm-yyyy'), 'Football', 81);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (40, to_date('27-02-2023', 'dd-mm-yyyy'), 'Basketball', 62);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (41, to_date('18-10-2023', 'dd-mm-yyyy'), 'Basketball', 40);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (42, to_date('16-06-2023', 'dd-mm-yyyy'), 'Chess', 64);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (43, to_date('23-07-2023', 'dd-mm-yyyy'), 'Music', 50);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (44, to_date('25-11-2023', 'dd-mm-yyyy'), 'Robotics', 70);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (45, to_date('30-04-2023', 'dd-mm-yyyy'), 'Swimming', 75);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (46, to_date('13-01-2023', 'dd-mm-yyyy'), 'Football', 58);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (47, to_date('06-04-2023', 'dd-mm-yyyy'), 'Swimming', 60);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (48, to_date('09-09-2023', 'dd-mm-yyyy'), 'Music', 18);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (49, to_date('27-08-2023', 'dd-mm-yyyy'), 'Yoga', 47);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (50, to_date('29-01-2023', 'dd-mm-yyyy'), 'Painting', 48);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (51, to_date('17-02-2023', 'dd-mm-yyyy'), 'Swimming', 43);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (52, to_date('30-11-2023', 'dd-mm-yyyy'), 'Painting', 94);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (53, to_date('06-07-2023', 'dd-mm-yyyy'), 'Dance', 49);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (54, to_date('27-07-2023', 'dd-mm-yyyy'), 'Basketball', 38);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (55, to_date('12-12-2023', 'dd-mm-yyyy'), 'Swimming', 15);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (56, to_date('14-10-2023', 'dd-mm-yyyy'), 'Football', 73);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (57, to_date('21-07-2023', 'dd-mm-yyyy'), 'Robotics', 31);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (58, to_date('05-06-2023', 'dd-mm-yyyy'), 'Football', 89);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (59, to_date('03-01-2023', 'dd-mm-yyyy'), 'Dance', 11);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (60, to_date('02-12-2023', 'dd-mm-yyyy'), 'Drama', 31);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (61, to_date('28-01-2023', 'dd-mm-yyyy'), 'Swimming', 92);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (62, to_date('16-06-2023', 'dd-mm-yyyy'), 'Drama', 41);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (63, to_date('16-01-2023', 'dd-mm-yyyy'), 'Painting', 53);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (64, to_date('05-04-2023', 'dd-mm-yyyy'), 'Music', 29);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (65, to_date('13-04-2023', 'dd-mm-yyyy'), 'Chess', 40);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (66, to_date('06-09-2023', 'dd-mm-yyyy'), 'Swimming', 93);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (67, to_date('26-02-2023', 'dd-mm-yyyy'), 'Music', 72);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (68, to_date('30-03-2023', 'dd-mm-yyyy'), 'Chess', 47);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (69, to_date('05-09-2023', 'dd-mm-yyyy'), 'Basketball', 55);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (70, to_date('25-12-2023', 'dd-mm-yyyy'), 'Basketball', 51);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (71, to_date('15-04-2023', 'dd-mm-yyyy'), 'Chess', 90);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (72, to_date('23-01-2023', 'dd-mm-yyyy'), 'Dance', 34);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (73, to_date('13-11-2023', 'dd-mm-yyyy'), 'Football', 43);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (74, to_date('11-06-2023', 'dd-mm-yyyy'), 'Dance', 33);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (75, to_date('12-04-2023', 'dd-mm-yyyy'), 'Painting', 29);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (76, to_date('22-05-2023', 'dd-mm-yyyy'), 'Basketball', 25);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (77, to_date('19-12-2023', 'dd-mm-yyyy'), 'Robotics', 75);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (78, to_date('24-02-2023', 'dd-mm-yyyy'), 'Football', 11);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (79, to_date('12-08-2023', 'dd-mm-yyyy'), 'Music', 16);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (80, to_date('18-02-2023', 'dd-mm-yyyy'), 'Yoga', 69);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (81, to_date('20-10-2023', 'dd-mm-yyyy'), 'Painting', 94);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (82, to_date('21-10-2023', 'dd-mm-yyyy'), 'Football', 85);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (83, to_date('18-01-2023', 'dd-mm-yyyy'), 'Football', 35);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (84, to_date('14-03-2023', 'dd-mm-yyyy'), 'Football', 60);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (85, to_date('13-09-2023', 'dd-mm-yyyy'), 'Basketball', 29);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (86, to_date('23-01-2023', 'dd-mm-yyyy'), 'Yoga', 23);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (87, to_date('16-05-2023', 'dd-mm-yyyy'), 'Basketball', 20);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (88, to_date('27-11-2023', 'dd-mm-yyyy'), 'Dance', 36);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (89, to_date('16-04-2023', 'dd-mm-yyyy'), 'Football', 23);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (90, to_date('23-01-2023', 'dd-mm-yyyy'), 'Chess', 100);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (91, to_date('21-07-2023', 'dd-mm-yyyy'), 'Robotics', 64);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (92, to_date('23-04-2023', 'dd-mm-yyyy'), 'Dance', 44);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (93, to_date('02-09-2023', 'dd-mm-yyyy'), 'Drama', 67);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (94, to_date('18-07-2023', 'dd-mm-yyyy'), 'Football', 63);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (95, to_date('07-10-2023', 'dd-mm-yyyy'), 'Music', 34);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (96, to_date('10-02-2023', 'dd-mm-yyyy'), 'Dance', 12);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (97, to_date('06-01-2023', 'dd-mm-yyyy'), 'Basketball', 34);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (98, to_date('25-04-2023', 'dd-mm-yyyy'), 'Robotics', 76);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (99, to_date('28-11-2023', 'dd-mm-yyyy'), 'Basketball', 82);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (100, to_date('29-05-2023', 'dd-mm-yyyy'), 'Chess', 22);
commit;
prompt 100 records committed...
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (101, to_date('22-08-2023', 'dd-mm-yyyy'), 'Drama', 51);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (102, to_date('03-02-2023', 'dd-mm-yyyy'), 'Robotics', 22);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (103, to_date('13-10-2023', 'dd-mm-yyyy'), 'Music', 40);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (104, to_date('24-01-2023', 'dd-mm-yyyy'), 'Swimming', 28);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (105, to_date('13-01-2023', 'dd-mm-yyyy'), 'Chess', 49);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (106, to_date('20-03-2023', 'dd-mm-yyyy'), 'Swimming', 13);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (107, to_date('08-09-2023', 'dd-mm-yyyy'), 'Football', 75);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (108, to_date('23-03-2023', 'dd-mm-yyyy'), 'Robotics', 18);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (109, to_date('15-07-2023', 'dd-mm-yyyy'), 'Drama', 95);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (110, to_date('18-07-2023', 'dd-mm-yyyy'), 'Drama', 31);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (111, to_date('07-01-2023', 'dd-mm-yyyy'), 'Dance', 27);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (112, to_date('02-07-2023', 'dd-mm-yyyy'), 'Painting', 31);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (113, to_date('28-06-2023', 'dd-mm-yyyy'), 'Swimming', 91);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (114, to_date('06-11-2023', 'dd-mm-yyyy'), 'Robotics', 89);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (115, to_date('06-12-2023', 'dd-mm-yyyy'), 'Robotics', 42);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (116, to_date('21-05-2023', 'dd-mm-yyyy'), 'Football', 82);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (117, to_date('04-07-2023', 'dd-mm-yyyy'), 'Music', 100);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (118, to_date('25-07-2023', 'dd-mm-yyyy'), 'Basketball', 12);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (119, to_date('20-09-2023', 'dd-mm-yyyy'), 'Swimming', 92);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (120, to_date('13-02-2023', 'dd-mm-yyyy'), 'Dance', 77);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (121, to_date('13-04-2023', 'dd-mm-yyyy'), 'Music', 46);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (122, to_date('13-04-2023', 'dd-mm-yyyy'), 'Football', 59);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (123, to_date('01-05-2023', 'dd-mm-yyyy'), 'Painting', 81);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (124, to_date('14-06-2023', 'dd-mm-yyyy'), 'Football', 80);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (125, to_date('25-11-2023', 'dd-mm-yyyy'), 'Painting', 94);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (126, to_date('31-01-2023', 'dd-mm-yyyy'), 'Dance', 14);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (127, to_date('16-06-2023', 'dd-mm-yyyy'), 'Football', 60);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (128, to_date('27-07-2023', 'dd-mm-yyyy'), 'Basketball', 59);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (129, to_date('08-02-2023', 'dd-mm-yyyy'), 'Dance', 86);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (130, to_date('01-11-2023', 'dd-mm-yyyy'), 'Swimming', 98);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (131, to_date('21-10-2023', 'dd-mm-yyyy'), 'Chess', 87);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (132, to_date('10-05-2023', 'dd-mm-yyyy'), 'Football', 30);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (133, to_date('18-09-2023', 'dd-mm-yyyy'), 'Drama', 69);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (134, to_date('18-07-2023', 'dd-mm-yyyy'), 'Chess', 42);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (135, to_date('07-03-2023', 'dd-mm-yyyy'), 'Painting', 94);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (136, to_date('10-01-2023', 'dd-mm-yyyy'), 'Music', 41);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (137, to_date('06-09-2023', 'dd-mm-yyyy'), 'Drama', 69);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (138, to_date('31-10-2023', 'dd-mm-yyyy'), 'Yoga', 98);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (139, to_date('18-12-2023', 'dd-mm-yyyy'), 'Swimming', 42);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (140, to_date('05-01-2023', 'dd-mm-yyyy'), 'Football', 80);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (141, to_date('25-04-2023', 'dd-mm-yyyy'), 'Robotics', 84);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (142, to_date('08-09-2023', 'dd-mm-yyyy'), 'Music', 79);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (143, to_date('12-05-2023', 'dd-mm-yyyy'), 'Dance', 89);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (144, to_date('14-08-2023', 'dd-mm-yyyy'), 'Robotics', 97);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (145, to_date('13-12-2023', 'dd-mm-yyyy'), 'Drama', 51);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (146, to_date('22-02-2023', 'dd-mm-yyyy'), 'Music', 86);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (147, to_date('14-11-2023', 'dd-mm-yyyy'), 'Basketball', 80);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (148, to_date('01-02-2023', 'dd-mm-yyyy'), 'Basketball', 75);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (149, to_date('31-07-2023', 'dd-mm-yyyy'), 'Basketball', 59);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (150, to_date('16-12-2023', 'dd-mm-yyyy'), 'Yoga', 68);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (151, to_date('09-05-2023', 'dd-mm-yyyy'), 'Dance', 26);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (152, to_date('30-04-2023', 'dd-mm-yyyy'), 'Robotics', 18);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (153, to_date('26-02-2023', 'dd-mm-yyyy'), 'Basketball', 87);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (154, to_date('21-08-2023', 'dd-mm-yyyy'), 'Swimming', 99);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (155, to_date('02-10-2023', 'dd-mm-yyyy'), 'Football', 63);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (156, to_date('16-02-2023', 'dd-mm-yyyy'), 'Music', 70);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (157, to_date('21-09-2023', 'dd-mm-yyyy'), 'Basketball', 46);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (158, to_date('28-04-2023', 'dd-mm-yyyy'), 'Yoga', 16);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (159, to_date('26-09-2023', 'dd-mm-yyyy'), 'Dance', 40);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (160, to_date('09-07-2023', 'dd-mm-yyyy'), 'Music', 83);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (161, to_date('02-01-2023', 'dd-mm-yyyy'), 'Chess', 16);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (162, to_date('14-05-2023', 'dd-mm-yyyy'), 'Drama', 86);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (163, to_date('29-05-2023', 'dd-mm-yyyy'), 'Swimming', 19);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (164, to_date('02-06-2023', 'dd-mm-yyyy'), 'Yoga', 43);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (165, to_date('13-06-2023', 'dd-mm-yyyy'), 'Painting', 63);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (166, to_date('28-07-2023', 'dd-mm-yyyy'), 'Basketball', 15);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (167, to_date('07-11-2023', 'dd-mm-yyyy'), 'Dance', 14);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (168, to_date('25-10-2023', 'dd-mm-yyyy'), 'Swimming', 82);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (169, to_date('06-10-2023', 'dd-mm-yyyy'), 'Dance', 58);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (170, to_date('22-12-2023', 'dd-mm-yyyy'), 'Dance', 25);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (171, to_date('14-04-2023', 'dd-mm-yyyy'), 'Painting', 75);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (172, to_date('14-02-2023', 'dd-mm-yyyy'), 'Robotics', 62);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (173, to_date('01-08-2023', 'dd-mm-yyyy'), 'Swimming', 92);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (174, to_date('13-12-2023', 'dd-mm-yyyy'), 'Drama', 35);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (175, to_date('11-09-2023', 'dd-mm-yyyy'), 'Music', 80);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (176, to_date('08-11-2023', 'dd-mm-yyyy'), 'Chess', 12);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (177, to_date('27-04-2023', 'dd-mm-yyyy'), 'Football', 38);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (178, to_date('19-05-2023', 'dd-mm-yyyy'), 'Yoga', 91);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (179, to_date('29-01-2023', 'dd-mm-yyyy'), 'Robotics', 38);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (180, to_date('26-06-2023', 'dd-mm-yyyy'), 'Music', 81);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (181, to_date('13-12-2023', 'dd-mm-yyyy'), 'Robotics', 47);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (182, to_date('05-09-2023', 'dd-mm-yyyy'), 'Chess', 81);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (183, to_date('23-02-2023', 'dd-mm-yyyy'), 'Robotics', 51);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (184, to_date('23-05-2023', 'dd-mm-yyyy'), 'Robotics', 57);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (185, to_date('28-06-2023', 'dd-mm-yyyy'), 'Swimming', 39);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (186, to_date('29-01-2023', 'dd-mm-yyyy'), 'Basketball', 69);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (187, to_date('22-05-2023', 'dd-mm-yyyy'), 'Music', 32);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (188, to_date('03-01-2023', 'dd-mm-yyyy'), 'Yoga', 47);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (189, to_date('22-03-2023', 'dd-mm-yyyy'), 'Dance', 59);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (190, to_date('21-04-2023', 'dd-mm-yyyy'), 'Music', 60);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (191, to_date('10-06-2023', 'dd-mm-yyyy'), 'Basketball', 95);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (192, to_date('31-05-2023', 'dd-mm-yyyy'), 'Dance', 88);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (193, to_date('05-02-2023', 'dd-mm-yyyy'), 'Robotics', 34);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (194, to_date('24-10-2023', 'dd-mm-yyyy'), 'Painting', 80);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (195, to_date('25-11-2023', 'dd-mm-yyyy'), 'Yoga', 52);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (196, to_date('20-05-2023', 'dd-mm-yyyy'), 'Painting', 82);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (197, to_date('29-05-2023', 'dd-mm-yyyy'), 'Dance', 42);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (198, to_date('12-07-2023', 'dd-mm-yyyy'), 'Basketball', 18);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (199, to_date('03-07-2023', 'dd-mm-yyyy'), 'Dance', 96);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (200, to_date('17-05-2023', 'dd-mm-yyyy'), 'Football', 69);
commit;
prompt 200 records committed...
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (201, to_date('02-06-2023', 'dd-mm-yyyy'), 'Music', 29);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (202, to_date('15-07-2023', 'dd-mm-yyyy'), 'Basketball', 25);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (203, to_date('07-01-2023', 'dd-mm-yyyy'), 'Robotics', 94);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (204, to_date('29-04-2023', 'dd-mm-yyyy'), 'Dance', 45);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (205, to_date('03-11-2023', 'dd-mm-yyyy'), 'Chess', 11);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (206, to_date('02-08-2023', 'dd-mm-yyyy'), 'Yoga', 100);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (207, to_date('22-12-2023', 'dd-mm-yyyy'), 'Yoga', 53);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (208, to_date('14-10-2023', 'dd-mm-yyyy'), 'Basketball', 61);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (209, to_date('21-11-2023', 'dd-mm-yyyy'), 'Yoga', 79);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (210, to_date('05-02-2023', 'dd-mm-yyyy'), 'Drama', 15);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (211, to_date('13-08-2023', 'dd-mm-yyyy'), 'Robotics', 88);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (212, to_date('01-02-2023', 'dd-mm-yyyy'), 'Drama', 25);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (213, to_date('12-01-2023', 'dd-mm-yyyy'), 'Music', 91);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (214, to_date('19-12-2023', 'dd-mm-yyyy'), 'Yoga', 19);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (215, to_date('29-03-2023', 'dd-mm-yyyy'), 'Robotics', 85);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (216, to_date('21-02-2023', 'dd-mm-yyyy'), 'Robotics', 12);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (217, to_date('19-09-2023', 'dd-mm-yyyy'), 'Dance', 62);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (218, to_date('08-04-2023', 'dd-mm-yyyy'), 'Robotics', 62);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (219, to_date('14-10-2023', 'dd-mm-yyyy'), 'Swimming', 53);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (220, to_date('12-05-2023', 'dd-mm-yyyy'), 'Basketball', 72);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (221, to_date('24-06-2023', 'dd-mm-yyyy'), 'Painting', 84);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (222, to_date('22-02-2023', 'dd-mm-yyyy'), 'Swimming', 78);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (223, to_date('25-02-2023', 'dd-mm-yyyy'), 'Music', 61);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (224, to_date('21-02-2023', 'dd-mm-yyyy'), 'Music', 53);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (225, to_date('16-02-2023', 'dd-mm-yyyy'), 'Football', 47);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (226, to_date('28-04-2023', 'dd-mm-yyyy'), 'Yoga', 17);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (227, to_date('16-09-2023', 'dd-mm-yyyy'), 'Robotics', 70);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (228, to_date('19-04-2023', 'dd-mm-yyyy'), 'Dance', 95);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (229, to_date('03-06-2023', 'dd-mm-yyyy'), 'Yoga', 53);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (230, to_date('08-05-2023', 'dd-mm-yyyy'), 'Yoga', 15);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (231, to_date('04-03-2023', 'dd-mm-yyyy'), 'Swimming', 28);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (232, to_date('25-04-2023', 'dd-mm-yyyy'), 'Robotics', 70);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (233, to_date('27-11-2023', 'dd-mm-yyyy'), 'Basketball', 73);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (234, to_date('05-04-2023', 'dd-mm-yyyy'), 'Swimming', 33);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (235, to_date('10-10-2023', 'dd-mm-yyyy'), 'Football', 87);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (236, to_date('23-04-2023', 'dd-mm-yyyy'), 'Drama', 19);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (237, to_date('06-10-2023', 'dd-mm-yyyy'), 'Basketball', 51);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (238, to_date('13-03-2023', 'dd-mm-yyyy'), 'Football', 48);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (239, to_date('11-04-2023', 'dd-mm-yyyy'), 'Robotics', 12);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (240, to_date('21-07-2023', 'dd-mm-yyyy'), 'Yoga', 95);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (241, to_date('12-05-2023', 'dd-mm-yyyy'), 'Yoga', 64);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (242, to_date('12-02-2023', 'dd-mm-yyyy'), 'Drama', 31);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (243, to_date('19-05-2023', 'dd-mm-yyyy'), 'Drama', 43);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (244, to_date('01-12-2023', 'dd-mm-yyyy'), 'Painting', 56);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (245, to_date('05-01-2023', 'dd-mm-yyyy'), 'Basketball', 43);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (246, to_date('10-09-2023', 'dd-mm-yyyy'), 'Drama', 16);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (247, to_date('23-07-2023', 'dd-mm-yyyy'), 'Football', 27);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (248, to_date('11-02-2023', 'dd-mm-yyyy'), 'Swimming', 59);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (249, to_date('03-06-2023', 'dd-mm-yyyy'), 'Dance', 54);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (250, to_date('07-11-2023', 'dd-mm-yyyy'), 'Music', 62);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (251, to_date('03-07-2023', 'dd-mm-yyyy'), 'Drama', 94);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (252, to_date('15-03-2023', 'dd-mm-yyyy'), 'Painting', 77);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (253, to_date('23-09-2023', 'dd-mm-yyyy'), 'Drama', 70);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (254, to_date('18-05-2023', 'dd-mm-yyyy'), 'Robotics', 54);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (255, to_date('28-10-2023', 'dd-mm-yyyy'), 'Dance', 71);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (256, to_date('03-01-2023', 'dd-mm-yyyy'), 'Basketball', 39);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (257, to_date('22-11-2023', 'dd-mm-yyyy'), 'Dance', 77);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (258, to_date('23-05-2023', 'dd-mm-yyyy'), 'Swimming', 63);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (259, to_date('13-03-2023', 'dd-mm-yyyy'), 'Yoga', 91);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (260, to_date('21-04-2023', 'dd-mm-yyyy'), 'Chess', 98);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (261, to_date('27-03-2023', 'dd-mm-yyyy'), 'Robotics', 55);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (262, to_date('14-03-2023', 'dd-mm-yyyy'), 'Yoga', 65);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (263, to_date('12-07-2023', 'dd-mm-yyyy'), 'Drama', 35);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (264, to_date('28-07-2023', 'dd-mm-yyyy'), 'Yoga', 16);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (265, to_date('07-07-2023', 'dd-mm-yyyy'), 'Yoga', 97);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (266, to_date('27-05-2023', 'dd-mm-yyyy'), 'Drama', 73);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (267, to_date('15-12-2023', 'dd-mm-yyyy'), 'Drama', 32);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (268, to_date('22-12-2023', 'dd-mm-yyyy'), 'Dance', 63);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (269, to_date('14-03-2023', 'dd-mm-yyyy'), 'Music', 87);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (270, to_date('01-05-2023', 'dd-mm-yyyy'), 'Drama', 14);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (271, to_date('30-09-2023', 'dd-mm-yyyy'), 'Football', 84);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (272, to_date('21-01-2023', 'dd-mm-yyyy'), 'Yoga', 87);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (273, to_date('28-08-2023', 'dd-mm-yyyy'), 'Dance', 21);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (274, to_date('04-09-2023', 'dd-mm-yyyy'), 'Basketball', 39);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (275, to_date('04-07-2023', 'dd-mm-yyyy'), 'Swimming', 67);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (276, to_date('06-01-2023', 'dd-mm-yyyy'), 'Painting', 28);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (277, to_date('05-01-2023', 'dd-mm-yyyy'), 'Chess', 21);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (278, to_date('20-05-2023', 'dd-mm-yyyy'), 'Music', 72);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (279, to_date('27-05-2023', 'dd-mm-yyyy'), 'Robotics', 21);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (280, to_date('31-08-2023', 'dd-mm-yyyy'), 'Basketball', 24);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (281, to_date('27-11-2023', 'dd-mm-yyyy'), 'Yoga', 83);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (282, to_date('14-02-2023', 'dd-mm-yyyy'), 'Basketball', 19);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (283, to_date('27-10-2023', 'dd-mm-yyyy'), 'Football', 49);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (284, to_date('26-04-2023', 'dd-mm-yyyy'), 'Swimming', 83);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (285, to_date('08-04-2023', 'dd-mm-yyyy'), 'Chess', 65);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (286, to_date('09-09-2023', 'dd-mm-yyyy'), 'Chess', 80);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (287, to_date('17-12-2023', 'dd-mm-yyyy'), 'Dance', 97);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (288, to_date('22-01-2023', 'dd-mm-yyyy'), 'Swimming', 60);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (289, to_date('03-11-2023', 'dd-mm-yyyy'), 'Basketball', 64);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (290, to_date('23-03-2023', 'dd-mm-yyyy'), 'Basketball', 39);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (291, to_date('29-06-2023', 'dd-mm-yyyy'), 'Painting', 90);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (292, to_date('22-12-2023', 'dd-mm-yyyy'), 'Yoga', 55);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (293, to_date('13-06-2023', 'dd-mm-yyyy'), 'Swimming', 75);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (294, to_date('13-03-2023', 'dd-mm-yyyy'), 'Painting', 46);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (295, to_date('01-02-2023', 'dd-mm-yyyy'), 'Yoga', 72);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (296, to_date('28-10-2023', 'dd-mm-yyyy'), 'Dance', 17);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (297, to_date('17-09-2023', 'dd-mm-yyyy'), 'Drama', 34);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (298, to_date('02-11-2023', 'dd-mm-yyyy'), 'Painting', 19);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (299, to_date('11-06-2023', 'dd-mm-yyyy'), 'Dance', 92);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (300, to_date('07-03-2023', 'dd-mm-yyyy'), 'Robotics', 32);
commit;
prompt 300 records committed...
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (301, to_date('26-01-2023', 'dd-mm-yyyy'), 'Drama', 54);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (302, to_date('21-03-2023', 'dd-mm-yyyy'), 'Robotics', 73);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (303, to_date('26-03-2023', 'dd-mm-yyyy'), 'Robotics', 18);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (304, to_date('25-04-2023', 'dd-mm-yyyy'), 'Yoga', 92);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (305, to_date('06-11-2023', 'dd-mm-yyyy'), 'Chess', 33);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (306, to_date('17-03-2023', 'dd-mm-yyyy'), 'Music', 12);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (307, to_date('19-04-2023', 'dd-mm-yyyy'), 'Yoga', 52);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (308, to_date('17-04-2023', 'dd-mm-yyyy'), 'Robotics', 54);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (309, to_date('25-09-2023', 'dd-mm-yyyy'), 'Basketball', 59);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (310, to_date('21-11-2023', 'dd-mm-yyyy'), 'Music', 62);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (311, to_date('03-12-2023', 'dd-mm-yyyy'), 'Chess', 27);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (312, to_date('22-11-2023', 'dd-mm-yyyy'), 'Basketball', 76);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (313, to_date('25-10-2023', 'dd-mm-yyyy'), 'Swimming', 47);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (314, to_date('04-05-2023', 'dd-mm-yyyy'), 'Drama', 70);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (315, to_date('09-06-2023', 'dd-mm-yyyy'), 'Music', 97);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (316, to_date('14-01-2023', 'dd-mm-yyyy'), 'Chess', 47);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (317, to_date('25-07-2023', 'dd-mm-yyyy'), 'Yoga', 74);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (318, to_date('11-09-2023', 'dd-mm-yyyy'), 'Yoga', 98);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (319, to_date('04-02-2023', 'dd-mm-yyyy'), 'Yoga', 79);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (320, to_date('28-12-2023', 'dd-mm-yyyy'), 'Drama', 85);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (321, to_date('15-06-2023', 'dd-mm-yyyy'), 'Swimming', 28);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (322, to_date('08-02-2023', 'dd-mm-yyyy'), 'Dance', 45);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (323, to_date('19-07-2023', 'dd-mm-yyyy'), 'Swimming', 55);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (324, to_date('04-05-2023', 'dd-mm-yyyy'), 'Swimming', 32);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (325, to_date('01-04-2023', 'dd-mm-yyyy'), 'Swimming', 75);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (326, to_date('24-12-2023', 'dd-mm-yyyy'), 'Swimming', 42);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (327, to_date('06-04-2023', 'dd-mm-yyyy'), 'Football', 12);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (328, to_date('11-08-2023', 'dd-mm-yyyy'), 'Yoga', 37);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (329, to_date('30-05-2023', 'dd-mm-yyyy'), 'Swimming', 45);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (330, to_date('31-08-2023', 'dd-mm-yyyy'), 'Music', 94);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (331, to_date('07-04-2023', 'dd-mm-yyyy'), 'Basketball', 85);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (332, to_date('04-12-2023', 'dd-mm-yyyy'), 'Drama', 61);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (333, to_date('30-05-2023', 'dd-mm-yyyy'), 'Swimming', 87);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (334, to_date('10-05-2023', 'dd-mm-yyyy'), 'Painting', 36);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (335, to_date('23-08-2023', 'dd-mm-yyyy'), 'Drama', 63);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (336, to_date('12-04-2023', 'dd-mm-yyyy'), 'Drama', 86);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (337, to_date('05-09-2023', 'dd-mm-yyyy'), 'Robotics', 75);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (338, to_date('14-12-2023', 'dd-mm-yyyy'), 'Music', 57);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (339, to_date('02-11-2023', 'dd-mm-yyyy'), 'Drama', 67);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (340, to_date('14-07-2023', 'dd-mm-yyyy'), 'Swimming', 10);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (341, to_date('24-02-2023', 'dd-mm-yyyy'), 'Basketball', 18);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (342, to_date('18-03-2023', 'dd-mm-yyyy'), 'Drama', 35);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (343, to_date('28-05-2023', 'dd-mm-yyyy'), 'Football', 78);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (344, to_date('17-08-2023', 'dd-mm-yyyy'), 'Football', 55);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (345, to_date('27-04-2023', 'dd-mm-yyyy'), 'Swimming', 14);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (346, to_date('20-07-2023', 'dd-mm-yyyy'), 'Drama', 52);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (347, to_date('16-04-2023', 'dd-mm-yyyy'), 'Music', 94);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (348, to_date('09-11-2023', 'dd-mm-yyyy'), 'Swimming', 12);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (349, to_date('25-07-2023', 'dd-mm-yyyy'), 'Painting', 62);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (350, to_date('02-08-2023', 'dd-mm-yyyy'), 'Dance', 68);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (351, to_date('24-01-2023', 'dd-mm-yyyy'), 'Yoga', 58);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (352, to_date('13-12-2023', 'dd-mm-yyyy'), 'Basketball', 60);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (353, to_date('15-10-2023', 'dd-mm-yyyy'), 'Football', 72);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (354, to_date('10-03-2023', 'dd-mm-yyyy'), 'Dance', 50);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (355, to_date('11-03-2023', 'dd-mm-yyyy'), 'Basketball', 46);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (356, to_date('26-02-2023', 'dd-mm-yyyy'), 'Robotics', 55);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (357, to_date('20-08-2023', 'dd-mm-yyyy'), 'Robotics', 85);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (358, to_date('05-01-2023', 'dd-mm-yyyy'), 'Painting', 87);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (359, to_date('11-06-2023', 'dd-mm-yyyy'), 'Painting', 92);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (360, to_date('16-06-2023', 'dd-mm-yyyy'), 'Dance', 96);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (361, to_date('16-05-2023', 'dd-mm-yyyy'), 'Football', 97);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (362, to_date('09-07-2023', 'dd-mm-yyyy'), 'Painting', 75);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (363, to_date('17-11-2023', 'dd-mm-yyyy'), 'Football', 20);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (364, to_date('08-02-2023', 'dd-mm-yyyy'), 'Chess', 13);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (365, to_date('20-01-2023', 'dd-mm-yyyy'), 'Dance', 92);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (366, to_date('17-12-2023', 'dd-mm-yyyy'), 'Dance', 30);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (367, to_date('17-06-2023', 'dd-mm-yyyy'), 'Dance', 60);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (368, to_date('12-11-2023', 'dd-mm-yyyy'), 'Dance', 39);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (369, to_date('11-03-2023', 'dd-mm-yyyy'), 'Yoga', 54);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (370, to_date('16-02-2023', 'dd-mm-yyyy'), 'Basketball', 50);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (371, to_date('20-08-2023', 'dd-mm-yyyy'), 'Football', 22);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (372, to_date('17-08-2023', 'dd-mm-yyyy'), 'Robotics', 89);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (373, to_date('08-03-2023', 'dd-mm-yyyy'), 'Drama', 66);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (374, to_date('05-11-2023', 'dd-mm-yyyy'), 'Robotics', 88);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (375, to_date('05-10-2023', 'dd-mm-yyyy'), 'Dance', 62);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (376, to_date('26-04-2023', 'dd-mm-yyyy'), 'Dance', 98);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (377, to_date('03-11-2023', 'dd-mm-yyyy'), 'Drama', 30);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (378, to_date('08-11-2023', 'dd-mm-yyyy'), 'Drama', 72);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (379, to_date('25-01-2023', 'dd-mm-yyyy'), 'Football', 81);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (380, to_date('08-03-2023', 'dd-mm-yyyy'), 'Music', 18);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (381, to_date('02-08-2023', 'dd-mm-yyyy'), 'Chess', 68);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (382, to_date('13-02-2023', 'dd-mm-yyyy'), 'Robotics', 65);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (383, to_date('25-12-2023', 'dd-mm-yyyy'), 'Yoga', 63);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (384, to_date('10-02-2023', 'dd-mm-yyyy'), 'Painting', 92);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (385, to_date('19-06-2023', 'dd-mm-yyyy'), 'Robotics', 59);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (386, to_date('30-12-2023', 'dd-mm-yyyy'), 'Swimming', 15);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (387, to_date('16-12-2023', 'dd-mm-yyyy'), 'Music', 36);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (388, to_date('26-01-2023', 'dd-mm-yyyy'), 'Dance', 77);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (389, to_date('25-01-2023', 'dd-mm-yyyy'), 'Chess', 57);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (390, to_date('05-09-2023', 'dd-mm-yyyy'), 'Basketball', 19);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (391, to_date('08-02-2023', 'dd-mm-yyyy'), 'Basketball', 64);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (392, to_date('22-01-2023', 'dd-mm-yyyy'), 'Swimming', 28);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (393, to_date('19-06-2023', 'dd-mm-yyyy'), 'Basketball', 88);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (394, to_date('18-01-2023', 'dd-mm-yyyy'), 'Music', 12);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (395, to_date('26-09-2023', 'dd-mm-yyyy'), 'Basketball', 13);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (396, to_date('18-06-2023', 'dd-mm-yyyy'), 'Drama', 46);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (397, to_date('15-01-2023', 'dd-mm-yyyy'), 'Football', 93);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (398, to_date('16-02-2023', 'dd-mm-yyyy'), 'Swimming', 92);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (399, to_date('18-04-2023', 'dd-mm-yyyy'), 'Football', 97);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (400, to_date('24-05-2023', 'dd-mm-yyyy'), 'Dance', 25);
commit;
prompt 400 records committed...
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (523, to_date('31-08-2023', 'dd-mm-yyyy'), 'Football', 53);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (1134, to_date('08-09-2023', 'dd-mm-yyyy'), 'Basketball', 30);
insert into ACTIVITY (activity_id, date_of_activity, activity_name, capacity)
values (489, to_date('07-01-2023', 'dd-mm-yyyy'), 'Swimming', 15);
commit;
prompt 403 records loaded
prompt Loading COUNSELOR...
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (1, 'Sarah Edwards', 'Doctor', 58, 'sarahspence@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (3, 'Dr. Kathryn Carlson', 'MA', 54, 'kayleenorton@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (4, 'Jeffrey Mckinney', 'MA', 62, 'zsims@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (5, 'Katie Reese', 'MA', 38, 'zstone@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (8, 'Leslie Vega MD', 'Doctor', 28, 'andrew22@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (9, 'Rachel Robinson', 'BA', 62, 'sherijohnson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (11, 'Melinda Murphy', 'MA', 62, 'morganstanley@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (12, 'Cristian Murphy', 'BA', 58, 'kleinholly@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (13, 'Alyssa Dean', 'Doctor', 28, 'stephanie05@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (16, 'William Orozco', 'BA', 65, 'romancrystal@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (18, 'Eric Wilson', 'MA', 26, 'karen44@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (22, 'Samantha Jacobs', 'BA', 38, 'kaylalee@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (23, 'Matthew Flores', 'BA', 65, 'kjohnson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (25, 'Wendy Hayden', 'BA', 62, 'phillipssusan@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (26, 'Corey Evans', 'Doctor', 58, 'halenathan@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (27, 'Timothy Mejia', 'BA', 44, 'alexanderkaren@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (28, 'Christine Miller', 'BA', 60, 'edwinramsey@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (30, 'Jaime Reyes', 'MA', 25, 'lambjennifer@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (31, 'Gregory Moran', 'MA', 61, 'qwilliams@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (32, 'Dawn Thompson', 'Doctor', 25, 'melaniecrosby@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (33, 'Michelle Riley', 'MA', 50, 'james01@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (34, 'Thomas Harmon', 'MA', 46, 'pmiller@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (35, 'Edward Woodward', 'Doctor', 45, 'bankskristina@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (37, 'Jasmine Lewis', 'Doctor', 51, 'susan69@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (38, 'Tyler Hood', 'Doctor', 33, 'william68@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (39, 'Nicole Hamilton', 'BA', 45, 'darin02@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (40, 'Audrey Clark', 'BA', 61, 'shannon44@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (41, 'Tammy Gill', 'MA', 63, 'kanedarrell@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (43, 'Kaitlin Jones', 'Doctor', 30, 'wsaunders@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (44, 'Craig Solomon', 'MA', 27, 'mcbridejack@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (45, 'Gordon Mason', 'Doctor', 26, 'anthony70@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (47, 'Charles Barker', 'BA', 60, 'robertnewman@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (48, 'Tina Neal', 'MA', 63, 'nprice@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (49, 'Ronald Porter', 'Doctor', 54, 'hcarson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (50, 'Jasmine Valentine', 'BA', 32, 'johnsonpatrick@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (52, 'Darryl Schmitt', 'BA', 33, 'michaelmiddleton@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (53, 'Brooke Hardy', 'Doctor', 49, 'karen24@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (54, 'Ethan Marquez', 'Doctor', 30, 'fwalter@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (57, 'Dr. Matthew Smith', 'BA', 55, 'anthony32@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (58, 'Kayla Valentine', 'MA', 60, 'kristen97@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (59, 'Alexandra Downs', 'BA', 62, 'tylerrichardson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (60, 'Rebecca Brown', 'MA', 45, 'raymichele@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (61, 'William Weaver', 'MA', 57, 'matthew84@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (62, 'Brian Ingram', 'BA', 52, 'pcastillo@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (64, 'Karen Collins', 'MA', 38, 'gmartin@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (65, 'Barbara Stokes', 'Doctor', 46, 'maryrodriguez@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (68, 'Kristina Wilkins', 'BA', 59, 'daniellevargas@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (69, 'Donald Carter', 'MA', 59, 'kelsey92@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (70, 'Natalie Moore', 'BA', 46, 'wwood@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (71, 'Savannah Pruitt', 'Doctor', 62, 'hernandezcharles@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (73, 'Brian Lawrence', 'MA', 62, 'bryan58@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (75, 'Sarah Ayala', 'Doctor', 56, 'msmith@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (76, 'Jose Vincent', 'BA', 52, 'benglish@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (78, 'Kathy Griffin', 'BA', 49, 'juanwoods@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (79, 'Tamara Lopez', 'Doctor', 29, 'timothyburton@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (80, 'Elizabeth Espinoza', 'BA', 33, 'pjordan@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (81, 'Lisa Howard', 'MA', 54, 'fdean@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (82, 'Sarah Key', 'MA', 61, 'richardwebb@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (84, 'Connie Mckenzie', 'MA', 28, 'johnsonbrittney@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (85, 'Beverly Wilson', 'MA', 35, 'james75@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (87, 'Jason Brown', 'MA', 49, 'ygreen@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (90, 'Cindy Brennan', 'MA', 49, 'joanne83@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (92, 'Kim Hughes', 'MA', 63, 'craigmartin@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (94, 'Michael Clements', 'BA', 44, 'mcdonalddavid@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (100, 'Diana Bryant', 'BA', 57, 'julie03@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (101, 'Joseph Martin', 'MA', 40, 'xkennedy@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (103, 'Sharon Sutton', 'BA', 26, 'spowell@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (104, 'Dylan Smith', 'MA', 44, 'joshualeonard@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (105, 'Ann Reynolds', 'MA', 64, 'charlesrobinson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (107, 'Charles Holden', 'Doctor', 41, 'ortiztristan@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (109, 'Allen Taylor', 'BA', 63, 'april07@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (110, 'Amy Horne', 'MA', 54, 'fvincent@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (111, 'Larry Murphy', 'Doctor', 54, 'brendawallace@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (112, 'Randall Briggs', 'MA', 59, 'johncampbell@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (114, 'Autumn Ellis', 'MA', 43, 'courtneyjones@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (115, 'Maureen Riggs', 'MA', 50, 'robertreed@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (116, 'Carolyn Huynh', 'BA', 61, 'hallrobyn@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (117, 'Christopher Shaw', 'BA', 39, 'jessica00@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (118, 'Candace Sanders', 'BA', 29, 'gabrielcain@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (120, 'Eric Martin', 'Doctor', 62, 'olivia83@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (121, 'Valerie Campbell', 'BA', 36, 'selliott@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (122, 'Lisa Richard', 'MA', 34, 'fstewart@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (124, 'Sharon Wilson', 'BA', 45, 'solson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (126, 'Molly Smith', 'Doctor', 47, 'rachelgould@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (128, 'Ivan Ball', 'MA', 25, 'frich@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (129, 'Marcus Patterson', 'Doctor', 45, 'zachary76@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (130, 'Jasmine Mckenzie', 'MA', 48, 'erin37@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (132, 'George Barton', 'MA', 50, 'wilsonryan@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (135, 'Casey Johnson', 'Doctor', 29, 'anntorres@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (136, 'Thomas Moore', 'BA', 64, 'lutzlauren@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (137, 'David Kennedy', 'BA', 40, 'bkennedy@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (140, 'Erica Mejia', 'MA', 62, 'ismith@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (141, 'Joel Andrews', 'MA', 38, 'tracyrodgers@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (142, 'William Harrison', 'Doctor', 35, 'hannahrojas@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (143, 'Jennifer Carter DVM', 'MA', 31, 'valenzuelajoshua@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (144, 'Bobby Ramos', 'MA', 29, 'melissarosario@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (145, 'Geoffrey Conrad', 'MA', 28, 'sgray@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (146, 'Michael Heath', 'BA', 37, 'david94@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (149, 'Cody Powell', 'MA', 35, 'azimmerman@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (152, 'Michael Stevenson', 'BA', 33, 'brianalexander@example.net');
commit;
prompt 100 records committed...
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (153, 'Stephanie Romero', 'MA', 29, 'nortonjulie@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (157, 'Haley Hammond', 'Doctor', 33, 'ryan08@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (158, 'Edward Scott', 'MA', 32, 'ssmith@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (159, 'Nicole Smith', 'Doctor', 54, 'matthewstephens@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (161, 'Paige Mcmahon', 'BA', 55, 'jocelynstone@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (162, 'Mrs. Angela Stokes', 'Doctor', 34, 'walkermichael@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (163, 'Andrea Thompson', 'MA', 50, 'nicholsmatthew@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (164, 'Philip Rodgers', 'Doctor', 63, 'nataliewoods@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (167, 'Ricky Nicholson', 'BA', 28, 'ewolfe@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (168, 'Brandon Wilson', 'BA', 46, 'jamesleonard@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (170, 'Samuel Ortiz', 'BA', 36, 'andrea20@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (171, 'Matthew Peterson', 'Doctor', 30, 'taylorashley@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (174, 'David Fitzpatrick', 'Doctor', 34, 'ylambert@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (175, 'Stephen Hanson', 'Doctor', 58, 'sparkslori@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (176, 'Christopher Duncan', 'BA', 29, 'rmatthews@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (177, 'James Hernandez', 'BA', 32, 'tonyerickson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (178, 'Whitney Moreno', 'BA', 56, 'fmorgan@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (179, 'Brian Schmidt', 'Doctor', 47, 'patrick40@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (180, 'Claire Odonnell', 'Doctor', 36, 'fmitchell@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (181, 'Edward Lee', 'MA', 39, 'thomaskenneth@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (183, 'Kyle Diaz', 'BA', 52, 'heidi96@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (184, 'Eddie Wise', 'Doctor', 30, 'elizabeth26@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (185, 'Jasmine Cox', 'BA', 39, 'bhunter@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (186, 'Shawna Francis', 'MA', 58, 'efreeman@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (187, 'Tracy Perry', 'Doctor', 38, 'russellconnor@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (190, 'Michele Hardin', 'MA', 47, 'sharon44@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (191, 'Nicole Schultz', 'Doctor', 47, 'christensenanthony@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (192, 'Dennis Harper', 'Doctor', 44, 'priceivan@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (193, 'Michael Smith', 'BA', 34, 'tvargas@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (194, 'Cindy Little', 'BA', 30, 'cochranjacob@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (197, 'James Young', 'Doctor', 60, 'awashington@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (201, 'Brad Malone', 'Doctor', 46, 'myersjill@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (205, 'Renee Myers', 'BA', 45, 'michellebush@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (207, 'Andrew Hanna', 'Doctor', 60, 'vbarry@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (208, 'Jason Floyd', 'MA', 40, 'johnnavarro@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (209, 'Anthony Reynolds', 'BA', 54, 'morrowkevin@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (210, 'Patricia Velasquez', 'BA', 56, 'matthew18@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (211, 'Michael Henderson', 'Doctor', 63, 'jasonlawson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (215, 'Timothy Diaz', 'MA', 36, 'cosborne@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (216, 'Jon Mathis', 'Doctor', 50, 'kcrane@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (219, 'Michael Bowman', 'Doctor', 62, 'donnamerritt@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (223, 'Susan Sims', 'BA', 26, 'heather65@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (224, 'Matthew Perez', 'BA', 44, 'sharonsimpson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (226, 'Crystal Cortez', 'MA', 25, 'ujackson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (228, 'Frederick Sullivan', 'MA', 41, 'hilljeffrey@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (229, 'Emily Christensen', 'MA', 27, 'julie62@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (230, 'Mr. Alexander Flowers', 'MA', 37, 'carl25@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (231, 'Tamara Mercado', 'Doctor', 64, 'brian27@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (232, 'Dr. Jane Gilmore DVM', 'Doctor', 46, 'nicholasrosales@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (236, 'Amanda Munoz', 'Doctor', 55, 'williamramsey@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (237, 'Bill Conley', 'Doctor', 48, 'mary72@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (238, 'Haley Moore', 'MA', 43, 'nduran@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (239, 'Hayden Aguilar', 'MA', 57, 'richerik@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (240, 'Nicholas Thompson', 'MA', 48, 'martinezdaniel@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (241, 'Whitney Jones', 'BA', 45, 'michellegray@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (242, 'Kenneth Pollard', 'BA', 51, 'timothy59@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (245, 'Annette Moreno', 'Doctor', 48, 'stevenmathis@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (246, 'Kristen Hunt', 'Doctor', 31, 'aaron67@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (248, 'Matthew Wilson', 'MA', 64, 'deborah47@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (249, 'Scott Woodward', 'Doctor', 43, 'joelpowell@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (250, 'Lisa Hill', 'BA', 49, 'tpearson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (255, 'Jamie Mitchell', 'MA', 48, 'andersenchristopher@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (256, 'Martin Baker', 'BA', 46, 'dreyes@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (257, 'Edwin Willis', 'BA', 45, 'malloryperez@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (259, 'Bethany Chang', 'BA', 55, 'laura21@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (262, 'Tyler Allen', 'MA', 63, 'hamiltonkatherine@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (263, 'Jason Morales', 'MA', 54, 'uflores@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (269, 'Eric Robertson', 'MA', 59, 'aleccarey@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (270, 'William Gomez', 'BA', 32, 'walterselizabeth@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (271, 'Paul Santiago', 'BA', 31, 'allenbilly@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (273, 'Michael Hale', 'Doctor', 58, 'thomas99@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (275, 'Kelly Hawkins', 'BA', 26, 'michaelyoung@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (276, 'Angela Doyle', 'BA', 50, 'jonesrebecca@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (278, 'Travis Perkins', 'MA', 32, 'carrie21@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (279, 'Nancy Heath', 'MA', 35, 'rcantrell@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (280, 'Erin Ramirez', 'BA', 50, 'rodriguezrobert@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (281, 'Laura Thomas', 'MA', 43, 'wwoods@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (283, 'David Morris', 'Doctor', 59, 'elijah52@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (284, 'Michelle Walker', 'BA', 29, 'robert78@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (285, 'Jacob Mccall', 'MA', 48, 'jfitzpatrick@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (288, 'Katrina Raymond', 'MA', 27, 'emilyhammond@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (289, 'Tom Alvarado', 'MA', 28, 'nhorton@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (290, 'Elizabeth Noble', 'Doctor', 58, 'ysmith@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (291, 'Maria Mason', 'Doctor', 29, 'kyang@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (292, 'Andrea Ray', 'Doctor', 28, 'tina09@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (293, 'Amber Robinson', 'MA', 39, 'thompsonmarissa@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (294, 'Victor Werner', 'MA', 44, 'sierrachavez@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (296, 'Patricia Jones', 'MA', 41, 'wpatterson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (298, 'Gina Wu', 'BA', 63, 'guerreroedward@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (299, 'Jonathan Choi', 'Doctor', 40, 'erik11@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (301, 'Kevin Soto', 'Doctor', 61, 'kterry@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (302, 'Brandon Hatfield', 'BA', 29, 'gailschmidt@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (303, 'Donald Morrison', 'BA', 25, 'sparksandrew@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (304, 'Amber Goodman', 'BA', 63, 'barajaskerri@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (305, 'Caitlyn Lee', 'MA', 42, 'wrightamanda@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (307, 'Andrea Gonzalez', 'MA', 37, 'michelleburton@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (308, 'Amanda Vincent', 'MA', 54, 'urhodes@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (309, 'Joshua Deleon', 'Doctor', 26, 'rosekevin@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (310, 'Sarah Shepherd', 'MA', 41, 'ucuevas@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (311, 'Ashley Romero', 'BA', 62, 'yjohnston@example.org');
commit;
prompt 200 records committed...
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (312, 'Jason Price', 'MA', 27, 'owolfe@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (313, 'Audrey Rodriguez', 'Doctor', 54, 'oharris@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (314, 'Daniel Powers', 'MA', 36, 'francissamuel@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (315, 'Madeline Moreno', 'MA', 38, 'pbarton@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (317, 'James Rodriguez', 'MA', 48, 'courtneyoneill@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (319, 'Mr. Caleb Thomas DDS', 'BA', 36, 'frederick59@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (320, 'Jose Henry', 'MA', 46, 'ghamilton@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (322, 'Dalton Cameron', 'MA', 55, 'morozco@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (323, 'Kari Humphrey', 'MA', 26, 'lisa69@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (324, 'Brian White', 'BA', 32, 'zacharylee@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (329, 'Penny Mccoy', 'Doctor', 32, 'timothyhernandez@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (330, 'Courtney Higgins PhD', 'MA', 41, 'ataylor@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (332, 'Donald Mitchell', 'BA', 65, 'pagerachel@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (333, 'Judy Short', 'Doctor', 64, 'hudsondavid@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (334, 'Sheri Burke', 'BA', 52, 'suttonisaac@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (335, 'Jennifer Cowan', 'MA', 36, 'flemingjesus@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (336, 'Meghan Rodriguez', 'Doctor', 63, 'leonardjenny@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (342, 'Renee Kennedy', 'BA', 39, 'deborah88@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (343, 'Angela Barajas', 'BA', 48, 'randall15@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (344, 'Mike Jones', 'MA', 53, 'hendersontracie@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (345, 'Andre Wilson', 'BA', 25, 'cwilkins@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (346, 'Brittany Parker', 'BA', 65, 'dcarter@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (349, 'Nicole Baker', 'Doctor', 49, 'davisdenise@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (351, 'Frances Smith', 'BA', 34, 'qgonzalez@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (352, 'Heather Blake', 'Doctor', 65, 'qjacobs@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (353, 'Brenda Ho', 'Doctor', 48, 'kathleen13@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (355, 'Kara Fowler', 'MA', 30, 'brenda58@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (356, 'Dennis Johnston', 'Doctor', 62, 'edward92@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (358, 'Joseph Young', 'Doctor', 56, 'srogers@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (359, 'Laura Hughes', 'BA', 43, 'gvillarreal@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (360, 'Matthew Smith MD', 'BA', 36, 'elizabeth18@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (361, 'John Proctor', 'MA', 55, 'hannahhunt@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (364, 'Leslie Ramsey', 'BA', 48, 'latasha22@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (366, 'Justin Molina', 'MA', 58, 'megan89@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (367, 'Sara Sanchez', 'MA', 47, 'dmartinez@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (370, 'Anthony Sherman', 'MA', 47, 'jacquelinewilson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (371, 'Patricia Perez', 'Doctor', 33, 'ashley42@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (372, 'Sherry Evans', 'MA', 47, 'igordon@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (373, 'Tammie Hill', 'Doctor', 42, 'nmelton@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (375, 'Linda Rogers', 'Doctor', 29, 'shannon09@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (376, 'Patrick Delgado', 'MA', 53, 'matthew25@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (377, 'Ashley Blankenship', 'MA', 38, 'chelseayoung@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (379, 'Benjamin Collins', 'Doctor', 45, 'xavier47@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (380, 'Ariel Anderson', 'BA', 65, 'stephenpatrick@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (381, 'Rebecca Reynolds', 'Doctor', 54, 'mark95@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (384, 'Kelli Brewer', 'Doctor', 55, 'patrickbeard@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (385, 'Nathan Rodgers', 'Doctor', 42, 'hodgesgeorge@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (386, 'Cathy Carroll', 'BA', 30, 'williamsjennifer@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (387, 'Brian Alvarez', 'BA', 42, 'stephenaguirre@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (388, 'Trevor Williams', 'BA', 56, 'kellymichael@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (394, 'Bonnie Oliver', 'BA', 61, 'andrewwoods@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (397, 'Andrew Anderson', 'Doctor', 61, 'uwilson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (398, 'Daniel Navarro', 'MA', 60, 'randolphbenjamin@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (399, 'Herbert Murray', 'MA', 50, 'leejoshua@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839001, 'Abigail Curtis MD', 'Doctor', 64, 'rrobertson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839002, 'Michael Flynn', 'Doctor', 58, 'jeffrey08@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839003, 'Allen Wallace', 'BA', 43, 'qschroeder@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839004, 'Jennifer White', 'BA', 35, 'juanjones@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839005, 'Scott Santos', 'Doctor', 42, 'curtisbobby@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839006, 'Jason Sanders', 'BA', 44, 'cswanson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839007, 'James Jensen', 'MA', 35, 'nancy16@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839008, 'Randy Serrano', 'BA', 51, 'danielhunter@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839009, 'Brooke Jones', 'BA', 32, 'jacob13@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839010, 'Matthew Mcintosh', 'BA', 34, 'utaylor@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839011, 'James Williams DDS', 'MA', 39, 'melissakoch@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839012, 'Yvette Humphrey DVM', 'MA', 26, 'rachellyons@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839013, 'Paul Howard', 'Doctor', 47, 'jacobmacias@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839014, 'Larry Boone', 'BA', 52, 'aprilperez@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839015, 'Kaylee Weiss', 'Doctor', 36, 'amybailey@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839016, 'Shelly Macdonald', 'Doctor', 42, 'cody38@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839017, 'Rachel Miller', 'MA', 32, 'sheilahanson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839018, 'Eric Cabrera Jr.', 'MA', 39, 'dmiller@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839019, 'Debra Horne', 'MA', 40, 'jeremy27@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839020, 'Kenneth Ortiz', 'MA', 30, 'pamelacobb@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839021, 'Brianna Howard', 'Doctor', 41, 'ppeterson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839022, 'Matthew Vaughn', 'BA', 35, 'williamlamb@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839023, 'Jacqueline Cooper', 'Doctor', 63, 'mwilson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839024, 'Ryan Mcdowell', 'MA', 45, 'shawn95@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839025, 'Daniel Wright', 'BA', 48, 'jimmy53@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839026, 'Debra Nunez', 'BA', 43, 'tcardenas@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839027, 'Christopher Craig', 'BA', 33, 'zjohnson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839028, 'Rachel Williams', 'Doctor', 26, 'matthewsullivan@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839029, 'Mrs. Denise Simpson', 'BA', 55, 'ritadecker@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839030, 'Gavin Hicks', 'BA', 36, 'mcarrillo@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839031, 'Randy Lindsey', 'BA', 56, 'sarahfrazier@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839032, 'Shawn Owens', 'MA', 62, 'cruzsheila@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839033, 'Russell Reed', 'BA', 59, 'wdavila@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839034, 'Scott Marks', 'MA', 64, 'mcook@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839035, 'Robin Murphy', 'MA', 37, 'xdalton@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839036, 'Renee Williamson', 'MA', 30, 'danieltaylor@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839037, 'Timothy Roberts', 'BA', 41, 'deniselopez@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839038, 'Tanner Mann', 'Doctor', 58, 'fwilliams@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839039, 'Kyle Thomas', 'BA', 59, 'shermanjennifer@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839040, 'Stacy Walsh', 'MA', 44, 'davidmoore@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839041, 'Stuart Smith', 'Doctor', 53, 'cameronowen@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839042, 'David Price', 'BA', 47, 'katelynjacobs@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839043, 'Tony Williamson', 'BA', 52, 'pcollins@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839044, 'Rhonda Dunn', 'Doctor', 62, 'amybeasley@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839045, 'Antonio Romero', 'Doctor', 56, 'shannon37@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839046, 'Michael Neal', 'BA', 52, 'laura40@example.org');
commit;
prompt 300 records committed...
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839047, 'Mark Howe', 'Doctor', 36, 'patrick77@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839048, 'Kimberly Mejia', 'Doctor', 27, 'hallheather@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839049, 'Katrina Fuller', 'Doctor', 28, 'jjohnson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839050, 'Sheila Martin', 'BA', 48, 'torresalexandra@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839051, 'Nathan Wright', 'BA', 54, 'kevin72@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839052, 'Lisa Shepherd', 'Doctor', 43, 'lindsey04@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839053, 'Daniel Trevino', 'Doctor', 34, 'slopez@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839054, 'Scott Sloan', 'BA', 54, 'fbaker@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839055, 'Morgan Allen', 'Doctor', 59, 'cshannon@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839056, 'Alicia Hanna', 'BA', 47, 'pharris@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839057, 'Dylan Moore', 'Doctor', 43, 'raymondcalvin@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839058, 'Mr. William Hernandez DDS', 'BA', 49, 'rowelisa@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839059, 'Linda Calderon', 'BA', 36, 'murraymary@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839060, 'Thomas Myers', 'MA', 50, 'obennett@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839061, 'Cynthia Maddox', 'MA', 49, 'charlesarcher@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839062, 'Nathaniel Gibbs', 'MA', 45, 'qhall@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839063, 'Christopher Coleman', 'Doctor', 50, 'beverlysanders@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839064, 'James Thomas', 'MA', 40, 'kellywalsh@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839065, 'Michael Sawyer', 'BA', 44, 'zhernandez@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839066, 'Christina Richards', 'BA', 40, 'mindy92@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839067, 'Kenneth Sanford', 'Doctor', 26, 'rtucker@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839068, 'Diamond Chambers', 'BA', 47, 'rogersdennis@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839069, 'Julie Rogers', 'MA', 47, 'xalvarez@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839070, 'Vanessa Stewart', 'MA', 38, 'juliajohnson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839071, 'Rebecca Schultz', 'Doctor', 46, 'michaelsmith@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839072, 'Lisa Villegas', 'BA', 28, 'onelson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839073, 'Julie Warren', 'MA', 60, 'erik01@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839074, 'Cindy Rivera', 'Doctor', 45, 'mary04@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839075, 'Randy Schmidt', 'BA', 62, 'allennatasha@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839076, 'Kimberly Sanders', 'MA', 35, 'benjamin80@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839077, 'Michael Bradley', 'MA', 31, 'reyesraymond@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839078, 'Arthur Smith', 'MA', 46, 'grobinson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839079, 'Alexandra Hensley', 'MA', 48, 'edwinsmith@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839080, 'Sally Jackson', 'BA', 63, 'rbeard@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839081, 'Robert Hoffman', 'BA', 60, 'fosterjessica@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839082, 'Janet Snyder', 'MA', 63, 'cmendoza@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839083, 'Caroline Carlson', 'BA', 61, 'jaimebarnes@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839084, 'Tina Wheeler', 'BA', 50, 'kimberlylynch@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839085, 'Gabrielle Bell', 'BA', 32, 'dmccarthy@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839086, 'Robert Smith', 'MA', 26, 'rhonda49@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839087, 'Tina Johnson', 'Doctor', 59, 'michaelgallegos@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839088, 'Joanna Thompson', 'BA', 48, 'gutierrezcynthia@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839089, 'Gina Horn', 'Doctor', 57, 'rasmussenrachael@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839090, 'Sean Sanchez', 'MA', 58, 'cookshelly@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839091, 'David Palmer', 'Doctor', 46, 'victoriaoliver@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839092, 'Robert Valencia', 'Doctor', 35, 'george24@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839093, 'Michele James', 'Doctor', 46, 'valenzuelarichard@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839094, 'Kevin Bridges', 'BA', 37, 'jodiacosta@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839095, 'Richard Moore', 'BA', 27, 'andrewbutler@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839096, 'Sarah Nicholson', 'Doctor', 64, 'audreyharris@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839097, 'Melissa Castro', 'Doctor', 32, 'mackenzie82@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839098, 'Kevin Stephens', 'Doctor', 48, 'ryanweaver@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839099, 'Pam Pratt', 'Doctor', 37, 'tammy42@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839100, 'Jordan Norton', 'MA', 35, 'owensashley@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839101, 'Donald Williamson', 'BA', 56, 'mmullins@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839102, 'Rachael Russell', 'MA', 43, 'jacobcook@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839103, 'Micheal Thomas DDS', 'Doctor', 33, 'melissa87@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839104, 'Dylan Nguyen', 'MA', 56, 'crice@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839105, 'Brian Reyes', 'BA', 27, 'andreasnyder@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839106, 'Cassidy Maynard', 'BA', 46, 'williammccarty@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839107, 'Miranda Carroll', 'BA', 37, 'lisamorgan@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839108, 'Shawn Braun', 'Doctor', 40, 'savannahbowers@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839109, 'Philip Hensley', 'Doctor', 46, 'jenniferjackson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839110, 'Stephanie Hull', 'MA', 60, 'agarza@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839111, 'Traci Hunt', 'Doctor', 45, 'deannicholas@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839112, 'Luis Thomas', 'Doctor', 63, 'zkelly@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839113, 'William Williams', 'MA', 63, 'parkeralan@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839114, 'Judith Green', 'BA', 52, 'mjones@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839115, 'Craig Rose', 'Doctor', 58, 'philipward@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839116, 'Whitney Martin', 'BA', 48, 'karen92@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839117, 'Monica Scott', 'BA', 37, 'lorileonard@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839118, 'Jason Harrington', 'MA', 44, 'fpeters@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839119, 'Jeffrey Harmon', 'Doctor', 57, 'edward88@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839120, 'Joshua Martin', 'Doctor', 49, 'hschroeder@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839121, 'Kevin Le', 'MA', 32, 'perkinsgerald@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839122, 'Stephanie Lopez', 'MA', 56, 'thomasmorales@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839123, 'Erika Lopez', 'MA', 55, 'sandra36@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839124, 'Melanie Price', 'MA', 65, 'michaelingram@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839125, 'Robert Payne', 'BA', 35, 'dturner@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839126, 'Dr. Rachel Cannon', 'MA', 46, 'heatherrivera@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839127, 'Dawn Moody', 'BA', 39, 'huffmanveronica@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839128, 'Rita Grimes', 'BA', 28, 'lawsonnicholas@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839129, 'Brenda Case', 'MA', 27, 'shanebarnett@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839130, 'James Snyder', 'MA', 62, 'parsonsjames@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839131, 'Rebecca Manning', 'MA', 46, 'wferguson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839132, 'William Kramer', 'BA', 55, 'wellskyle@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839133, 'Kevin Blackburn', 'Doctor', 30, 'juliecooper@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839134, 'Natalie Villanueva', 'Doctor', 29, 'fadams@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839135, 'Heidi Randolph', 'BA', 46, 'obriencindy@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839136, 'Michelle Kelly', 'Doctor', 30, 'shelly27@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839137, 'Lisa Graham', 'Doctor', 60, 'cochranmichael@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839138, 'Katherine Frost', 'BA', 39, 'sherrynelson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839139, 'Craig Gardner', 'MA', 65, 'angela31@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839140, 'Robin Robinson', 'Doctor', 52, 'jfowler@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839141, 'Ashley Landry', 'BA', 49, 'gonzalezgregory@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839142, 'Caitlin Parrish', 'MA', 25, 'millerzoe@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839143, 'Patricia Mckay', 'Doctor', 42, 'scott04@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839144, 'Kathryn Harris', 'BA', 42, 'anna51@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839145, 'Jamie Cook', 'BA', 58, 'michaeljones@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839146, 'Steve Ochoa DDS', 'BA', 43, 'mejiaangela@example.com');
commit;
prompt 400 records committed...
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839147, 'Joseph Johnson', 'Doctor', 26, 'salasstephen@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839148, 'Adrienne Kaiser', 'Doctor', 35, 'wesley30@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839149, 'Melody Dunn', 'Doctor', 28, 'qenglish@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839150, 'Kyle Thomas', 'Doctor', 42, 'gclark@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839151, 'Brian Oliver DVM', 'MA', 42, 'hammonddouglas@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839152, 'Erin Baker', 'BA', 53, 'osbornescott@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839153, 'Clayton Barajas', 'Doctor', 25, 'karen82@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839154, 'Keith Perez', 'MA', 38, 'dchambers@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839155, 'Gloria Freeman', 'BA', 49, 'shahjessica@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839156, 'James Turner', 'BA', 51, 'unguyen@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839157, 'Christopher Conrad', 'BA', 38, 'eking@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839158, 'Gary Ruiz', 'Doctor', 52, 'danielbryant@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839159, 'Jordan Parks', 'MA', 61, 'andrewsmith@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839160, 'Kevin Adams', 'Doctor', 44, 'oliverjoseph@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839161, 'Ashley Rhodes', 'Doctor', 40, 'amberanderson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839162, 'Natalie Leon', 'BA', 43, 'williebolton@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839163, 'Brandon Sanchez', 'BA', 48, 'rmiller@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839164, 'Ashley Cannon', 'MA', 40, 'wilsonwilliam@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839165, 'Grant Mora', 'BA', 25, 'justincameron@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839166, 'Lindsey Lee', 'Doctor', 27, 'david56@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839167, 'Samantha Wang MD', 'Doctor', 47, 'jcollins@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839168, 'David Summers', 'MA', 29, 'millerjennifer@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839169, 'Peter Robinson', 'MA', 62, 'sarahzavala@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839170, 'Michelle Boyd', 'Doctor', 48, 'clintonstewart@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839171, 'Michael Harrison', 'BA', 41, 'duanefernandez@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839172, 'Robert Flores', 'Doctor', 44, 'mendozaandrew@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839173, 'Robert Carter', 'Doctor', 37, 'marie74@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839174, 'Kathryn Carter', 'Doctor', 41, 'mstevens@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839175, 'Mary Barber', 'MA', 56, 'gabrielle02@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839176, 'Lynn Rodriguez', 'BA', 34, 'sanchezjohn@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839177, 'Melissa Delgado', 'BA', 64, 'ejones@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839178, 'Stephanie Brown', 'MA', 37, 'mike76@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839179, 'Meghan Welch', 'BA', 39, 'loribennett@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839180, 'Lindsey Williams', 'Doctor', 45, 'olee@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839181, 'Renee Murray', 'BA', 49, 'vaughnamanda@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839182, 'Lisa Moore', 'BA', 48, 'amanda40@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839183, 'Carla Bryant', 'BA', 56, 'williamcharles@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839184, 'Jeffrey Moore', 'MA', 56, 'timothy87@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839185, 'Colleen Price', 'Doctor', 59, 'ashleywarren@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839186, 'Christopher Peterson', 'Doctor', 36, 'richalbert@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839187, 'Christopher Perry', 'BA', 26, 'ksellers@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839188, 'Guy Murillo', 'Doctor', 58, 'dustinriley@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839189, 'Tammy Summers', 'Doctor', 61, 'larry05@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839190, 'Michael Weaver', 'Doctor', 57, 'rhondajordan@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839191, 'James Martin', 'BA', 62, 'pblack@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839192, 'Richard Ellis', 'BA', 48, 'nicolemitchell@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839193, 'Maria Savage', 'BA', 50, 'casey62@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839194, 'Kayla Hebert', 'Doctor', 32, 'ggreene@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839195, 'Cynthia Cox', 'BA', 60, 'scottstephens@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839196, 'Joseph Gutierrez', 'BA', 42, 'macdonaldkyle@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839197, 'Shaun Gaines', 'Doctor', 25, 'wandajohnson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839198, 'Tammy Morris', 'Doctor', 49, 'rmarshall@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839199, 'Keith Jensen', 'BA', 63, 'shawn33@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839200, 'Melissa Franco', 'MA', 43, 'hbrown@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839201, 'Wendy Lee', 'BA', 65, 'billy52@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839202, 'Jason Lopez', 'MA', 55, 'coxfernando@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839203, 'Dennis Williams', 'BA', 37, 'carolinehinton@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839204, 'Alexis Taylor', 'Doctor', 50, 'zavalaanna@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839205, 'Gerald Watkins', 'Doctor', 62, 'huntjohn@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839206, 'Justin Ortega', 'MA', 56, 'gturner@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839207, 'Kevin Carpenter', 'BA', 55, 'richardscynthia@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839208, 'Rebecca Davies', 'Doctor', 64, 'nancymiller@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839209, 'Calvin Oliver', 'Doctor', 62, 'christina91@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839210, 'Monica Oliver', 'Doctor', 59, 'griffinmichelle@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839211, 'Mary Anderson', 'MA', 56, 'psanchez@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839212, 'Laura Hurley', 'Doctor', 28, 'farmerlaura@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839213, 'John Miller', 'BA', 46, 'ianramirez@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839214, 'Joshua Garcia', 'Doctor', 45, 'dillon34@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839215, 'Hector Torres', 'Doctor', 36, 'baileysarah@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839216, 'April Hendrix', 'MA', 42, 'avillegas@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839217, 'Kirk Melton', 'Doctor', 41, 'bassmichael@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839218, 'Karen Walker', 'MA', 56, 'fergusonleroy@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839219, 'Deborah Smith', 'BA', 48, 'sandragarner@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839220, 'Andrew Owen', 'MA', 40, 'irodriguez@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839221, 'Chad Romero', 'MA', 63, 'jsmith@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839222, 'Diana Young', 'MA', 26, 'williamsonalyssa@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839223, 'Michelle Garner', 'BA', 62, 'carlosrivers@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839224, 'Nancy Bishop', 'Doctor', 37, 'conwaydaniel@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839225, 'Brandon Stewart', 'MA', 26, 'jeffreyporter@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839226, 'Patrick Wise', 'BA', 61, 'jasmine02@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839227, 'Cheryl White', 'Doctor', 42, 'hyork@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839228, 'Jeffrey Rodriguez', 'BA', 57, 'andrewreese@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839229, 'Tammy Payne', 'Doctor', 39, 'mrobinson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839230, 'Miguel Gomez', 'BA', 52, 'kpoole@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839231, 'Ashley Jones', 'MA', 44, 'palmeraaron@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839232, 'Mrs. Elizabeth Parker', 'BA', 57, 'cduffy@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839233, 'Walter Hogan', 'Doctor', 63, 'rkrueger@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839234, 'Gabriel Morris', 'BA', 53, 'lawrencepatton@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839235, 'Clifford Blair', 'BA', 46, 'bakerjonathan@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839236, 'Joshua Lester', 'Doctor', 29, 'louis76@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839237, 'Alison Jackson', 'MA', 45, 'cherylevans@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839238, 'Timothy Weaver', 'MA', 26, 'sean09@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839239, 'Andrea Rhodes', 'BA', 53, 'ywarner@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839240, 'Michael Bowen', 'Doctor', 37, 'fitzgeraldjaime@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839241, 'Rhonda Graham', 'BA', 30, 'hthompson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839242, 'Traci Johnson', 'MA', 31, 'emily91@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839243, 'Troy Salazar', 'BA', 27, 'pattersondarrell@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839244, 'Courtney Gutierrez MD', 'Doctor', 65, 'juarezjesse@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839245, 'Brianna Bautista MD', 'Doctor', 52, 'jameshuffman@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839246, 'John Gibson', 'BA', 60, 'jenniferjohnson@example.com');
commit;
prompt 500 records committed...
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839247, 'Christopher Ward', 'MA', 49, 'ljohnson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839248, 'Lucas Gray', 'MA', 28, 'dtate@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839249, 'Christopher Stuart', 'Doctor', 47, 'michael55@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839250, 'Aaron Clark', 'MA', 58, 'qdunn@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839251, 'Danielle Bauer', 'MA', 37, 'rebeccagolden@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839252, 'Jillian Knapp', 'MA', 61, 'kking@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839253, 'Tyler Morrison', 'MA', 34, 'shelby76@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839254, 'Brian Robinson', 'MA', 30, 'veronicacoleman@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839255, 'Steven Warren', 'BA', 36, 'solomonchristina@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839256, 'Margaret Bennett', 'BA', 64, 'garciatiffany@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839257, 'Colleen Parks', 'BA', 62, 'dawnlee@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839258, 'Peter Anthony', 'MA', 32, 'walkerchristian@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839259, 'Andrew Perry', 'Doctor', 28, 'matthewreed@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839260, 'Jose Green', 'BA', 31, 'craig29@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839261, 'Jonathan Andrade', 'BA', 35, 'walkerelizabeth@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839262, 'Donald Mcdonald', 'MA', 43, 'joshua21@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839263, 'Donna Shields', 'MA', 56, 'troberts@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839264, 'Michael Munoz', 'BA', 64, 'kevin75@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839265, 'Casey Gutierrez', 'MA', 58, 'michael65@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839266, 'Lindsay Davies', 'BA', 56, 'mikemann@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839267, 'Andrew Farrell', 'BA', 56, 'davidmendez@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839268, 'Jordan Brown', 'MA', 49, 'herbert48@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839269, 'Robert Gross', 'BA', 26, 'michelle78@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839270, 'Brian Martinez', 'MA', 44, 'dmoore@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839271, 'Richard Mccann', 'Doctor', 37, 'mistyallen@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839272, 'Allison Jones', 'BA', 64, 'hallmelissa@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839273, 'Ryan Cunningham', 'Doctor', 38, 'lisastephens@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839274, 'Mrs. Nicole Pace', 'Doctor', 64, 'zrice@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839275, 'Shawn Gutierrez', 'MA', 38, 'kimberlysanchez@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839276, 'Terri Thompson', 'MA', 26, 'millerpamela@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839277, 'Andrew Garcia', 'MA', 61, 'kadams@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839278, 'Lori Jenkins', 'BA', 39, 'christineunderwood@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839279, 'Lisa Wang', 'Doctor', 46, 'akhan@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839280, 'Richard Lee', 'MA', 55, 'hallbarbara@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839281, 'Elaine Henderson', 'MA', 41, 'cjenkins@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839282, 'Daniel Hernandez', 'Doctor', 65, 'estesrenee@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839283, 'Cody Walker', 'Doctor', 45, 'rgallagher@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839284, 'Matthew Davis', 'MA', 51, 'eric01@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839285, 'Charlene Roberts', 'Doctor', 37, 'iandavidson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839286, 'John Serrano', 'MA', 59, 'rebecca15@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839287, 'Jack Jones', 'Doctor', 57, 'farrellbenjamin@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839288, 'Robert Malone', 'BA', 64, 'kevinbrown@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839289, 'Benjamin Ball', 'BA', 47, 'lanedonna@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839290, 'Bryan Burnett', 'MA', 38, 'crystal04@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839291, 'Lauren West', 'MA', 40, 'hsmith@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839292, 'Gregory Singh', 'Doctor', 52, 'rickypadilla@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839293, 'Christian Salazar', 'Doctor', 45, 'branchkurt@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839294, 'Keith Archer', 'MA', 54, 'lisa73@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839295, 'Colleen Meadows', 'BA', 56, 'dylanhess@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839296, 'Theresa Lee', 'Doctor', 41, 'jacobbennett@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839297, 'Megan Wilson', 'Doctor', 53, 'etaylor@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839298, 'Kathleen Morris', 'BA', 59, 'jasmine27@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839299, 'Brett Mccormick', 'Doctor', 51, 'qbean@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839300, 'Jennifer Griffin', 'Doctor', 55, 'nathan49@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839301, 'Nicholas Lopez', 'Doctor', 39, 'obrown@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839302, 'Robert Hall', 'MA', 58, 'stewartfelicia@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839303, 'Sydney Brown', 'BA', 53, 'richardspaul@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839304, 'Jennifer Ray', 'Doctor', 52, 'briggsanne@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839305, 'Shane Martin', 'BA', 36, 'cperez@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839306, 'James King', 'Doctor', 64, 'johnsonbrandon@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839307, 'Joshua Barker', 'MA', 48, 'christopherfrancis@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839308, 'Laura Sanchez', 'Doctor', 42, 'barnescaroline@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839309, 'Jason Hall', 'MA', 30, 'garciakatie@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839310, 'Joseph Hunter', 'BA', 63, 'robertsutton@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839311, 'Sonia Wood', 'MA', 48, 'harriseugene@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839312, 'Ashley Lowery', 'MA', 27, 'gallen@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839313, 'Wendy Smith', 'Doctor', 63, 'sarahross@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839314, 'John Bright', 'BA', 28, 'lawrence20@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839315, 'Amanda Mejia', 'BA', 55, 'christine71@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839316, 'Trevor Knight', 'Doctor', 62, 'jimenezjennifer@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839317, 'Jacob Moore', 'MA', 62, 'wilsonandrew@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839318, 'Sandra Burns', 'BA', 35, 'billyrivera@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839319, 'Sara Martin', 'MA', 42, 'fwalls@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839320, 'Jamie Walsh', 'BA', 37, 'yorkmichael@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839321, 'Cody Norris', 'BA', 58, 'bridgesjohn@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839322, 'Maurice Kim', 'BA', 51, 'reynoldslisa@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839323, 'Andrew Thomas', 'Doctor', 41, 'erinwade@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839324, 'Craig Vance', 'BA', 34, 'qgonzales@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839325, 'Patricia Butler', 'BA', 58, 'brian98@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839326, 'Sean Flynn', 'BA', 26, 'cynthia20@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839327, 'Leslie Choi', 'MA', 44, 'charles98@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839328, 'Alyssa Walker', 'Doctor', 52, 'josephedwards@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839329, 'Travis Mcdonald', 'BA', 59, 'greenlarry@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839330, 'Carla Norris', 'Doctor', 57, 'donald11@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839331, 'John Wright', 'Doctor', 30, 'wfoley@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839332, 'Sara Gibbs', 'Doctor', 43, 'rtaylor@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839333, 'Kristina Mccann', 'BA', 64, 'gwalker@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839334, 'Richard Braun', 'Doctor', 33, 'osolis@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839335, 'Cindy Miller', 'BA', 55, 'jacobsonjohnny@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839336, 'Victoria Mercer', 'MA', 26, 'darlene24@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839337, 'Brandon Hopkins', 'BA', 44, 'cbush@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839338, 'Theresa Snyder DDS', 'Doctor', 59, 'john61@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839339, 'John Wells', 'MA', 64, 'lopezbobby@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839340, 'Jennifer Baldwin', 'Doctor', 49, 'simmonsjoy@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839341, 'Billy Kane', 'Doctor', 61, 'williamstony@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839342, 'Mikayla Miller', 'MA', 56, 'annfrederick@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839343, 'Anna Bryant', 'MA', 52, 'ashleyburton@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839344, 'Linda Zuniga', 'MA', 59, 'jamesedwards@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839345, 'Amber Lewis', 'BA', 41, 'eestrada@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839346, 'Sharon Clark', 'BA', 60, 'fleminglindsay@example.com');
commit;
prompt 600 records committed...
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839347, 'Ryan Jimenez DVM', 'BA', 41, 'barbarahanson@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839348, 'George Gonzalez', 'BA', 60, 'michaelgates@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839349, 'Michelle Jones', 'BA', 37, 'matthewrichardson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839350, 'Eric Williams', 'Doctor', 37, 'veronicarivas@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839351, 'Austin Lynch', 'Doctor', 26, 'ltaylor@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839352, 'Erica Diaz', 'MA', 64, 'jonestimothy@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839353, 'Connor Bridges', 'MA', 53, 'garciaisabel@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839354, 'Rebecca Casey', 'BA', 37, 'harrisonmark@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839355, 'Cynthia Rivera', 'BA', 47, 'watsondavid@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839356, 'Peter Johnson', 'MA', 50, 'brian40@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839357, 'Ross Lam', 'Doctor', 48, 'susanallen@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839358, 'Cheryl Owen', 'BA', 64, 'avelez@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839359, 'Kristen Davis', 'BA', 40, 'heather61@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839360, 'Brittany Jones', 'BA', 59, 'oneilldavid@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839361, 'Megan Smith', 'MA', 34, 'piercekara@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839362, 'Lauren Lopez', 'Doctor', 65, 'ydrake@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839363, 'Jordan Adams', 'BA', 61, 'brianajohnson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839364, 'Mr. Jesse Lane', 'Doctor', 42, 'edwardssteven@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839365, 'Susan Gordon', 'BA', 51, 'alexgonzales@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839366, 'Jennifer Walker', 'BA', 43, 'ryan57@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839367, 'Ariel Hamilton', 'MA', 27, 'briangonzalez@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839368, 'Andrew Arias', 'BA', 65, 'ashleywilkerson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839369, 'Marcus Smith', 'Doctor', 56, 'carrietran@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839370, 'Jose Hammond', 'MA', 59, 'fullerdaniel@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839371, 'David Holt', 'BA', 63, 'jennifer03@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839372, 'Shaun Woodard', 'Doctor', 42, 'cheryl86@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839373, 'Jessica Rodriguez', 'Doctor', 28, 'dorseyjonathan@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839374, 'Lance Blair II', 'BA', 55, 'thompsonwilliam@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839375, 'Emily Long', 'BA', 36, 'orichardson@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839376, 'Joshua Leon', 'MA', 52, 'vincentemma@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839377, 'Michael Coleman', 'BA', 48, 'twheeler@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839378, 'Tina Wallace', 'BA', 56, 'uconway@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839379, 'Deborah Dean', 'MA', 41, 'shawn85@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839380, 'Rachel Choi', 'BA', 61, 'brianking@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839381, 'Luis Cole DDS', 'MA', 62, 'arowland@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839382, 'Terri Ross', 'Doctor', 47, 'cooperalicia@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839383, 'Jennifer Larsen', 'BA', 40, 'richard11@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839384, 'Elizabeth Stafford', 'MA', 36, 'stonemark@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839385, 'George Greer', 'Doctor', 54, 'torresmichael@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839386, 'Patrick Vincent', 'BA', 41, 'parkerlouis@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839387, 'Margaret Jones', 'Doctor', 45, 'hking@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839388, 'Mark Jones', 'MA', 54, 'ronnie37@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839389, 'David Robles', 'BA', 55, 'anthonyedwards@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839390, 'Amanda Griffin', 'Doctor', 46, 'paulacrawford@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839391, 'Michael Gomez', 'MA', 27, 'mnavarro@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839392, 'Jennifer Martinez', 'BA', 35, 'angela49@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839393, 'Kevin Smith', 'Doctor', 51, 'davidflynn@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839394, 'Keith Cooper', 'BA', 25, 'mdavis@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839395, 'Dawn Moran', 'MA', 43, 'bho@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839396, 'William Sims', 'Doctor', 34, 'mshepard@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839397, 'John Mann', 'BA', 38, 'marycollins@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839398, 'Matthew Cruz II', 'MA', 52, 'seth90@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839399, 'Brian King', 'MA', 62, 'davidgarrett@example.net');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839400, 'Eric Carter', 'Doctor', 58, 'jennifermorris@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839784, 'Katrina Fuller', 'Doctor', 28, 'jjohnson@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254838692, 'Rebecca Schultz', 'Doctor', 46, 'michaelsmith@example.org');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (254839583, 'Christopher Coleman', 'Doctor', 50, 'beverlysanders@example.com');
insert into COUNSELOR (counselor_id, counselor_name, degree_level, counselor_age, counselor_email)
values (286493554, 'Douglas Harris', 'MA', 57, 'bryan12@example.com');
commit;
prompt 658 records loaded
prompt Loading STUDENT_...
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (1, 'Brooke Pace', to_date('28-02-2009', 'dd-mm-yyyy'), '10', '12679 Andrew Street, South Amberton, OH 04629', 162);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (2, 'Spencer Rose', to_date('15-07-2013', 'dd-mm-yyyy'), '6', '2865 Robert Manor Apt. 011, West Thomas, FL 64222', 27);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (3, 'Charles Lewis', to_date('10-11-2010', 'dd-mm-yyyy'), '9', '555 Cindy Cliff, North James, SC 82263', 136);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (4, 'Ann Davis', to_date('28-01-2014', 'dd-mm-yyyy'), '5', '405 Miller Lodge, Lake Cynthia, PA 44228', 305);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (5, 'Mark Morgan', to_date('07-09-2015', 'dd-mm-yyyy'), '4', 'Unit 3235 Box 1583, DPO AA 29620', 146);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (7, 'Charlene Castro', to_date('23-08-2012', 'dd-mm-yyyy'), '7', '1812 Alyssa Drive, Port Theresatown, GU 96362', 301);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (8, 'Mark Barker', to_date('13-06-2012', 'dd-mm-yyyy'), '7', '7947 Williams Parkways Apt. 382, Aaronstad, MH 57819', 291);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (9, 'Mr. Douglas Stevenson', to_date('27-07-2014', 'dd-mm-yyyy'), '5', '73939 Megan Highway, Lake Maryfurt, PR 99379', 240);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (10, 'Kaitlyn Patel', to_date('03-03-2007', 'dd-mm-yyyy'), '12', 'Unit 1053 Box 0715, DPO AP 65621', 364);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (11, 'Peter Robertson', to_date('14-03-2017', 'dd-mm-yyyy'), '2', '9010 Scott Glens Suite 218, New Johnstad, CA 92039', 370);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (12, 'Wesley Estrada', to_date('19-09-2015', 'dd-mm-yyyy'), '4', '1062 Hill Forest Apt. 904, New Lacey, OK 71419', 372);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (13, 'Justin Hill', to_date('06-06-2017', 'dd-mm-yyyy'), '2', '8939 Mejia Run Suite 589, Hoffmanborough, UT 19218', 76);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (15, 'Amber Miller', to_date('30-01-2016', 'dd-mm-yyyy'), '3', '262 Brown Spurs Suite 871, Dawnburgh, NC 42198', 13);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (16, 'Terry Roberts', to_date('09-11-2017', 'dd-mm-yyyy'), '2', '8542 Brooks Springs, Lake Stephen, MP 41892', 342);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (17, 'Gabriel Green', to_date('23-02-2018', 'dd-mm-yyyy'), '1', '610 Thompson Courts, Singhport, KY 31705', 313);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (18, 'Thomas Anderson', to_date('12-09-2010', 'dd-mm-yyyy'), '9', '1791 Warren Forge Suite 419, New Aaron, SD 40115', 62);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (19, 'Renee Flores', to_date('03-10-2009', 'dd-mm-yyyy'), '10', '11456 Peterson Knoll Apt. 814, North Destiny, VT 50315', 323);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (20, 'Lauren White', to_date('19-10-2015', 'dd-mm-yyyy'), '4', '1062 Rivera Shore, West Michael, VA 64460', 110);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (21, 'Christopher Graham', to_date('08-09-2011', 'dd-mm-yyyy'), '8', '37345 White Avenue, Sylviatown, NH 13984', 118);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (22, 'Heather Chapman', to_date('02-10-2014', 'dd-mm-yyyy'), '5', '469 William Glens, Mcclainton, SC 52112', 230);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (23, 'Steven Ramos', to_date('31-05-2016', 'dd-mm-yyyy'), '3', '301 Garrett Fall Apt. 632, East David, PA 71948', 388);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (24, 'Dr. Matthew Moses', to_date('07-11-2016', 'dd-mm-yyyy'), '3', '0972 Blankenship Radial, Chelseaville, IN 82867', 159);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (25, 'Travis Morgan', to_date('21-12-2014', 'dd-mm-yyyy'), '5', 'USNV Martin, FPO AA 30404', 4);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (26, 'Robin Austin', to_date('03-01-2009', 'dd-mm-yyyy'), '10', 'Unit 2810 Box 4581, DPO AP 46842', 186);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (27, 'Devin Rose', to_date('28-03-2012', 'dd-mm-yyyy'), '7', '07445 Lauren Keys, Lake Rachel, CA 09512', 307);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (28, 'Christian Contreras', to_date('05-09-2007', 'dd-mm-yyyy'), '12', '0553 Jonathan Pike, North Luke, PA 52699', 191);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (29, 'Cassandra Griffin', to_date('16-09-2012', 'dd-mm-yyyy'), '7', '73518 Sean Dam Apt. 880, Lake Aaron, VA 40793', 132);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (30, 'Matthew Solis', to_date('04-09-2013', 'dd-mm-yyyy'), '6', '71120 Carlson Field, Teresaborough, KS 59526', 105);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (31, 'Kevin Murray', to_date('03-03-2011', 'dd-mm-yyyy'), '8', '06633 Alvarez Streets Suite 570, New Jenniferview, ND 67348', 319);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (32, 'Jason Huynh', to_date('09-12-2008', 'dd-mm-yyyy'), '11', '09727 Farrell Rapid Apt. 610, South Jacqueline, NH 53295', 141);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (33, 'Alexis Logan', to_date('23-11-2016', 'dd-mm-yyyy'), '3', '73664 Lynn Port, Lake Glennmouth, MI 23581', 146);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (34, 'Kimberly Smith', to_date('22-04-2012', 'dd-mm-yyyy'), '7', '653 Willis Manor, Sextonshire, MN 22357', 178);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (35, 'Robert Bennett', to_date('13-09-2014', 'dd-mm-yyyy'), '5', '7833 Logan Knoll, Rojasberg, NV 08185', 168);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (36, 'Brandon Stafford', to_date('05-05-2011', 'dd-mm-yyyy'), '8', '76104 Cabrera Square Apt. 574, South Albert, MI 51603', 107);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (37, 'Stacey Sanders', to_date('09-08-2013', 'dd-mm-yyyy'), '6', 'Unit 4338 Box 9064, DPO AA 61828', 349);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (38, 'Marcus Ballard', to_date('06-03-2009', 'dd-mm-yyyy'), '10', '5192 Wright Shoal, Garciamouth, AZ 10825', 167);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (39, 'Aaron Bruce', to_date('05-11-2016', 'dd-mm-yyyy'), '3', '059 Avery Skyway Suite 272, Pattersonshire, UT 79199', 38);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (40, 'Donald Gonzales', to_date('12-03-2007', 'dd-mm-yyyy'), '12', '950 Courtney Estates, Hornetown, GU 46207', 259);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (41, 'Julia Olson', to_date('30-06-2018', 'dd-mm-yyyy'), '1', '5245 Hodge Key Apt. 386, Walterfort, WY 92703', 61);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (42, 'Gary Morgan', to_date('18-01-2009', 'dd-mm-yyyy'), '10', '06538 Goodwin View, West Michael, GA 70670', 109);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (43, 'Mary Valentine', to_date('20-07-2010', 'dd-mm-yyyy'), '9', '651 Wiggins Knolls Apt. 474, Alisonport, WI 35780', 271);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (44, 'Tyler Miller', to_date('03-09-2010', 'dd-mm-yyyy'), '9', '71784 Carlos Ford, Mariatown, ID 83269', 33);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (45, 'Dr. Brandon Johnson', to_date('23-09-2013', 'dd-mm-yyyy'), '6', '22206 Jacob Forges Apt. 546, East Cathyfurt, MA 12190', 298);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (46, 'Susan Thomas', to_date('28-09-2009', 'dd-mm-yyyy'), '10', 'PSC 3695, Box 1367, APO AP 62778', 239);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (47, 'Melvin May', to_date('22-02-2017', 'dd-mm-yyyy'), '2', '60427 Jacqueline Branch, Lawrenceland, WY 98322', 180);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (48, 'Rhonda Stewart', to_date('28-03-2010', 'dd-mm-yyyy'), '9', '180 Donna Cliff Apt. 086, East Michaelfurt, ND 05435', 180);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (49, 'Donald Green', to_date('15-06-2009', 'dd-mm-yyyy'), '10', '152 Elizabeth Knolls, Tatetown, PR 17807', 384);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (50, 'Michelle Nelson', to_date('28-11-2007', 'dd-mm-yyyy'), '12', '7596 Alexa Rest, West Brandonfort, CO 14460', 207);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (51, 'Abigail Coleman', to_date('06-05-2009', 'dd-mm-yyyy'), '10', '904 Steven Brooks Apt. 659, Kristenton, NM 01077', 78);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (52, 'Robert Nelson', to_date('22-03-2007', 'dd-mm-yyyy'), '12', '798 Walters Circles Apt. 093, Sarahland, NC 36822', 152);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (53, 'Andrea Lawson DVM', to_date('22-05-2007', 'dd-mm-yyyy'), '12', '78980 Jerry Street Apt. 338, Rileyhaven, LA 49674', 168);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (54, 'Colleen Morris', to_date('11-02-2013', 'dd-mm-yyyy'), '6', '2264 Robin Turnpike, Bakerfurt, GA 34504', 68);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (55, 'Daniel White', to_date('20-11-2014', 'dd-mm-yyyy'), '5', '64625 Martin Pines Suite 882, Jacquelineview, WI 59974', 269);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (56, 'Angela Watkins', to_date('22-11-2010', 'dd-mm-yyyy'), '9', '3098 Fisher Corner Suite 926, Lopezland, VT 23364', 177);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (57, 'Matthew Collins', to_date('23-06-2016', 'dd-mm-yyyy'), '3', '01168 King Avenue, Port Nicole, WY 26997', 100);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (58, 'Robin Campbell', to_date('19-05-2007', 'dd-mm-yyyy'), '12', '88509 Adrian Ford Apt. 507, East Erinburgh, ND 59294', 65);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (59, 'Megan Jackson', to_date('03-01-2007', 'dd-mm-yyyy'), '12', '1421 Luis Ford Suite 661, New Tammyburgh, AK 49822', 16);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (60, 'Terry Marquez', to_date('07-08-2007', 'dd-mm-yyyy'), '12', '1228 Cody Creek Suite 370, New Nicole, IA 61813', 62);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (61, 'Karen Potts', to_date('23-04-2008', 'dd-mm-yyyy'), '11', '73533 Curry Parkways Suite 386, Perezside, MO 65266', 164);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (62, 'Carla Nelson', to_date('08-05-2017', 'dd-mm-yyyy'), '2', '97354 Chapman Ways, New Ross, NV 29476', 208);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (63, 'Cody Burns', to_date('22-12-2013', 'dd-mm-yyyy'), '6', '827 Smith Hill, Roseland, TX 81939', 342);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (64, 'Karen Lam', to_date('15-07-2012', 'dd-mm-yyyy'), '7', '110 Deborah Port Apt. 826, Debrastad, MT 37001', 215);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (65, 'Rebecca Alvarado', to_date('02-05-2013', 'dd-mm-yyyy'), '6', '0199 Moon Highway Suite 636, Bushland, MT 36941', 85);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (66, 'Emily Duncan', to_date('19-11-2017', 'dd-mm-yyyy'), '2', '61062 Reyes Green Apt. 436, Garretthaven, IL 98512', 187);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (67, 'Samuel Smith', to_date('28-11-2015', 'dd-mm-yyyy'), '4', '6354 Silva Pike Suite 291, Lake Jonathanview, CT 70618', 4);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (68, 'Heather West', to_date('21-06-2018', 'dd-mm-yyyy'), '1', '39045 Harold Lodge, Annafurt, TN 84103', 184);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (69, 'Antonio Hill', to_date('12-05-2013', 'dd-mm-yyyy'), '6', '5292 Ashley Brook Suite 396, Hawkinsmouth, AS 03888', 309);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (70, 'Adam Jones', to_date('26-01-2008', 'dd-mm-yyyy'), '11', '6504 John Center, East Anthony, MO 61420', 39);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (71, 'Anna Ellis', to_date('03-02-2017', 'dd-mm-yyyy'), '2', 'USNV Hamilton, FPO AE 32731', 366);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (72, 'James Hoffman', to_date('10-10-2015', 'dd-mm-yyyy'), '4', '070 Smith Well, Davidshire, VI 56639', 388);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (73, 'Kayla Nguyen', to_date('14-10-2012', 'dd-mm-yyyy'), '7', '31007 Michelle Green, Bryantshire, VA 78160', 130);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (74, 'Victor Cunningham', to_date('03-05-2008', 'dd-mm-yyyy'), '11', '824 Todd Road Suite 633, Clayfurt, VT 46838', 31);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (75, 'Derek Butler', to_date('20-12-2009', 'dd-mm-yyyy'), '10', 'Unit 7193 Box 4497, DPO AP 93946', 284);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (76, 'Paul Taylor', to_date('27-07-2013', 'dd-mm-yyyy'), '6', '727 Salazar Garden Apt. 002, New Dustin, TX 92217', 305);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (77, 'Stephen Cordova II', to_date('20-08-2016', 'dd-mm-yyyy'), '3', 'USS Lewis, FPO AE 91300', 192);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (78, 'Amanda Brown', to_date('15-02-2007', 'dd-mm-yyyy'), '12', '018 Bradley Cliffs Apt. 505, New Alexandertown, FM 04139', 137);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (79, 'Tammy Oconnor', to_date('16-07-2010', 'dd-mm-yyyy'), '9', '6448 Christian Dale, North Veronica, GU 25545', 31);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (80, 'Tamara Webster', to_date('29-10-2017', 'dd-mm-yyyy'), '2', '71307 Taylor Overpass, Port Billy, WA 49066', 31);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (81, 'Jennifer Reed', to_date('27-04-2008', 'dd-mm-yyyy'), '11', '81881 Lee Cliff, West Christopherborough, IL 37579', 373);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (82, 'Emily Ward', to_date('20-08-2008', 'dd-mm-yyyy'), '11', '99324 Lloyd Ford, Fritzhaven, FM 98283', 313);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (83, 'Barbara Carter', to_date('29-09-2010', 'dd-mm-yyyy'), '9', '007 Kevin Stream Apt. 469, Port Thomasfort, VT 52850', 181);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (84, 'Joseph Rodriguez', to_date('04-08-2017', 'dd-mm-yyyy'), '2', '430 Morgan Island, North Mark, NE 86031', 273);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (85, 'Anna Foster', to_date('09-01-2016', 'dd-mm-yyyy'), '3', '077 Mullen Way, Port Tammy, AK 00907', 116);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (86, 'Scott Beck', to_date('18-03-2010', 'dd-mm-yyyy'), '9', '9469 Chapman Run, New Todd, GU 42699', 305);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (87, 'Andrew Fields', to_date('25-08-2010', 'dd-mm-yyyy'), '9', '64142 John Ford, Edwardsmouth, VI 07455', 111);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (88, 'Amy Alvarez', to_date('07-01-2017', 'dd-mm-yyyy'), '2', '79560 Frazier Tunnel Suite 593, West Emily, FM 80561', 145);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (89, 'Patricia Valdez', to_date('23-04-2014', 'dd-mm-yyyy'), '5', 'USNS Campbell, FPO AP 62142', 12);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (90, 'Nicholas Mack', to_date('01-07-2016', 'dd-mm-yyyy'), '3', '28689 Haney Course, West Brianhaven, OR 90612', 181);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (91, 'Eugene Jones', to_date('11-01-2012', 'dd-mm-yyyy'), '7', '39720 Harrington Circles, Larsonstad, NC 10069', 28);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (92, 'Jennifer Johnson', to_date('05-05-2008', 'dd-mm-yyyy'), '11', '3935 Ellison Curve Suite 124, West Lindseymouth, ID 75395', 231);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (93, 'William Jones', to_date('28-10-2014', 'dd-mm-yyyy'), '5', '774 Megan Track Apt. 961, New Mercedesland, NM 35770', 352);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (94, 'Kayla Mendoza', to_date('25-10-2015', 'dd-mm-yyyy'), '4', 'USCGC Santos, FPO AA 99410', 129);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (95, 'Steven Brady', to_date('05-12-2010', 'dd-mm-yyyy'), '9', '192 Huber Circle Apt. 737, Lake James, NM 40924', 112);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (96, 'Amanda Rosales', to_date('07-06-2016', 'dd-mm-yyyy'), '3', '033 Christine Place Apt. 390, South Jessicashire, AK 19198', 322);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (97, 'Kelly Jimenez', to_date('07-03-2017', 'dd-mm-yyyy'), '2', '553 Heather Port, Natalieshire, WY 42444', 379);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (98, 'Sheila Carter', to_date('20-08-2010', 'dd-mm-yyyy'), '9', '1546 Edwards Walk Suite 912, Stevensonburgh, MI 41470', 223);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (99, 'Diana Robinson', to_date('24-02-2012', 'dd-mm-yyyy'), '7', '2832 Stephanie Wall Apt. 656, Craigport, ID 92351', 183);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (100, 'Dean Thomas', to_date('02-03-2015', 'dd-mm-yyyy'), '4', '5867 Alvarado Freeway, Micheleborough, NJ 58776', 48);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (101, 'Anna Palmer', to_date('18-05-2010', 'dd-mm-yyyy'), '9', '003 Aaron Bridge Suite 702, Rosetown, VI 11240', 92);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (102, 'Timothy Stone', to_date('22-10-2016', 'dd-mm-yyyy'), '3', '7718 Maurice Rest, Claudialand, VI 11297', 146);
commit;
prompt 100 records committed...
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (103, 'Jeremy Melton', to_date('20-02-2016', 'dd-mm-yyyy'), '3', '377 Potts Ridge Suite 848, Port Samanthaton, NH 58633', 193);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (104, 'Kurt Anderson', to_date('17-11-2015', 'dd-mm-yyyy'), '4', '281 Chen Trace, East Anthonystad, RI 01651', 256);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (105, 'David Lopez', to_date('28-08-2008', 'dd-mm-yyyy'), '11', '580 Tara Isle Apt. 417, West Alexander, AR 46108', 11);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (106, 'Jon West', to_date('22-07-2011', 'dd-mm-yyyy'), '8', '350 Jones Common, New Joshuahaven, KS 75366', 278);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (107, 'Mark Kline', to_date('29-09-2007', 'dd-mm-yyyy'), '12', '9172 Linda Turnpike, North Josephbury, ME 77909', 388);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (108, 'Marvin Smith', to_date('02-12-2012', 'dd-mm-yyyy'), '7', '3471 Goodwin Wells Apt. 276, Markfort, UT 59263', 310);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (109, 'Frank Burch', to_date('10-06-2007', 'dd-mm-yyyy'), '12', '6931 Fernandez Crossing, North Bryce, WY 76577', 322);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (110, 'James Hurst', to_date('26-03-2014', 'dd-mm-yyyy'), '5', '662 Munoz Locks Apt. 994, New Steventown, CT 55378', 152);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (111, 'Mrs. Robin Potter', to_date('11-10-2014', 'dd-mm-yyyy'), '5', '25656 Sheryl Mountain Suite 655, Holmesfort, TN 46614', 12);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (112, 'Jenna Mendoza', to_date('09-01-2015', 'dd-mm-yyyy'), '4', '4459 Adam Run, Lake Ashleyfurt, MH 45991', 302);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (113, 'David Mills', to_date('23-11-2008', 'dd-mm-yyyy'), '11', '2558 Angela Flats Suite 588, East Lance, MI 13911', 153);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (114, 'Stephanie Graves', to_date('10-12-2007', 'dd-mm-yyyy'), '12', '428 Matthew Light, Lake Logan, TX 66597', 367);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (115, 'Robert Edwards', to_date('12-01-2009', 'dd-mm-yyyy'), '10', '0881 Rodriguez Hills, Weissberg, TN 95923', 215);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (116, 'Renee Mitchell', to_date('02-02-2015', 'dd-mm-yyyy'), '4', '0578 Samantha Parkways, Port Keithview, PA 61224', 270);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (117, 'Mr. Albert Villarreal', to_date('28-08-2008', 'dd-mm-yyyy'), '11', '5848 Bailey Flat Apt. 414, Lake Alexisview, VT 77643', 285);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (118, 'Kathleen Morgan', to_date('18-10-2016', 'dd-mm-yyyy'), '3', '5009 Steven Station Suite 225, East Rachel, LA 96618', 59);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (119, 'Lauren Gonzalez', to_date('31-12-2014', 'dd-mm-yyyy'), '5', 'Unit 5024 Box 0060, DPO AE 16466', 398);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (120, 'Courtney Caldwell', to_date('28-02-2011', 'dd-mm-yyyy'), '8', '40363 Christopher Ports Apt. 772, West Rodney, WA 20874', 311);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (121, 'Lisa Bentley', to_date('02-03-2013', 'dd-mm-yyyy'), '6', '807 Tammy Oval, Port Rachaelbury, IN 05141', 192);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (122, 'Francisco Clark', to_date('12-04-2017', 'dd-mm-yyyy'), '2', '66700 Ramirez River, Lake Kathymouth, VT 59350', 290);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (123, 'Ashley Green', to_date('01-12-2017', 'dd-mm-yyyy'), '2', '13997 Castro Forest Suite 196, Meganhaven, TX 45414', 334);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (124, 'Margaret Miller', to_date('27-01-2010', 'dd-mm-yyyy'), '9', '1383 Scott Road, Christophertown, FM 41648', 360);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (125, 'Eduardo Bolton', to_date('01-09-2012', 'dd-mm-yyyy'), '7', '76895 Maldonado Ford, Port Marcusside, KY 61568', 122);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (126, 'Tracey Santos', to_date('10-04-2018', 'dd-mm-yyyy'), '1', '00563 Cobb Viaduct, Deniseport, RI 64265', 343);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (127, 'David Ryan', to_date('28-04-2015', 'dd-mm-yyyy'), '4', 'USCGC Davis, FPO AE 22604', 257);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (128, 'Jennifer Jacobs', to_date('14-01-2007', 'dd-mm-yyyy'), '12', '033 Adam Plains Apt. 539, South Jenniferbury, AS 32904', 82);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (129, 'Daniel Pennington', to_date('01-01-2007', 'dd-mm-yyyy'), '12', '8103 Kathryn Cliffs, East Debra, VT 13490', 193);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (130, 'Robert Ramirez', to_date('17-03-2007', 'dd-mm-yyyy'), '12', '7434 Fernandez Hollow, Baileymouth, MT 78422', 65);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (131, 'Kelly Holland', to_date('01-11-2014', 'dd-mm-yyyy'), '5', '69106 Perry Springs, Port Angela, SD 40014', 168);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (132, 'Rachel Maldonado', to_date('12-10-2012', 'dd-mm-yyyy'), '7', '2708 Carter Crest, Lake Michaelview, NE 68465', 310);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (133, 'Michelle Smith', to_date('11-06-2007', 'dd-mm-yyyy'), '12', '8038 Jimmy Throughway Suite 629, Brianburgh, HI 98170', 355);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (134, 'John Pham Jr.', to_date('18-06-2012', 'dd-mm-yyyy'), '7', '0623 Burnett Passage, West Robert, ME 46518', 39);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (135, 'Daniel Ellis', to_date('06-12-2015', 'dd-mm-yyyy'), '4', '3720 Spencer Valley, Hallport, AS 17132', 381);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (136, 'Hailey Smith', to_date('22-07-2008', 'dd-mm-yyyy'), '11', 'PSC 5663, Box 5900, APO AA 92491', 304);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (137, 'Lucas Sanders', to_date('17-07-2008', 'dd-mm-yyyy'), '11', '015 Brown Corners, Salazarmouth, FL 09756', 80);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (138, 'Wendy Berry', to_date('10-07-2015', 'dd-mm-yyyy'), '4', '30582 Reynolds Forks, Brendanburgh, OR 51279', 323);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (139, 'Joseph Young', to_date('15-06-2013', 'dd-mm-yyyy'), '6', '1945 David Mission Suite 680, Cooperfort, CT 84513', 370);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (140, 'Sharon Owens', to_date('26-07-2013', 'dd-mm-yyyy'), '6', '589 Adam Forest, Robertview, VA 37924', 320);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (141, 'Cheryl Fields', to_date('03-02-2011', 'dd-mm-yyyy'), '8', '128 Sara Gardens Suite 675, Ramosfurt, TN 28717', 111);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (142, 'Dale Bennett DDS', to_date('25-03-2013', 'dd-mm-yyyy'), '6', '15971 Johnson Land, Madisonfort, MA 34677', 384);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (143, 'Donna Kennedy', to_date('25-09-2013', 'dd-mm-yyyy'), '6', '90851 Kristen Villages Suite 338, Pennymouth, AL 47525', 175);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (144, 'Jason Miller', to_date('22-05-2014', 'dd-mm-yyyy'), '5', '59655 Bryan Overpass, Wrightville, GA 31124', 387);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (145, 'Karen Gordon', to_date('01-10-2015', 'dd-mm-yyyy'), '4', '70541 Peggy Passage Suite 424, East Eric, DC 58127', 302);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (146, 'Scott Smith', to_date('02-04-2016', 'dd-mm-yyyy'), '3', '08096 Dominguez Via, New Kevin, RI 51620', 358);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (147, 'Christopher Henry', to_date('01-11-2014', 'dd-mm-yyyy'), '5', '09740 Pamela Burg, Martinezmouth, NH 69157', 211);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (148, 'Christopher Thomas', to_date('26-12-2008', 'dd-mm-yyyy'), '11', '6526 Vanessa Corners, New Christinamouth, MD 22832', 361);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (149, 'Lisa Watkins', to_date('22-09-2018', 'dd-mm-yyyy'), '1', '5541 Shane Station Suite 371, Janetburgh, MA 42608', 104);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (150, 'Allison Schmidt', to_date('19-03-2008', 'dd-mm-yyyy'), '11', '394 Gabrielle Isle, Carolburgh, MS 20307', 111);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (151, 'Tina Green', to_date('19-06-2014', 'dd-mm-yyyy'), '5', '8970 Cynthia Fords, Amyfort, OR 64935', 128);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (152, 'Krista Ramirez', to_date('02-08-2015', 'dd-mm-yyyy'), '4', '2078 Megan Ville, Rodgersfurt, UT 58693', 275);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (153, 'James Garner', to_date('08-07-2011', 'dd-mm-yyyy'), '8', '779 Yoder Fort, Fernandezshire, MD 83717', 230);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (154, 'Joseph Coleman', to_date('10-10-2017', 'dd-mm-yyyy'), '2', '1469 Robin Island, Rodriguezhaven, MP 74540', 186);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (155, 'Connie Anderson', to_date('09-10-2011', 'dd-mm-yyyy'), '8', '24516 Hughes Fords Apt. 245, New Jeffrey, AZ 29728', 219);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (156, 'Robert Perez', to_date('26-12-2007', 'dd-mm-yyyy'), '12', '13466 Alexander Summit, Dudleytown, IL 05951', 143);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (157, 'Cameron Alvarez', to_date('14-07-2014', 'dd-mm-yyyy'), '5', '04353 Wallace Loop, North Clinton, LA 81621', 280);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (158, 'Christopher Ford', to_date('31-12-2011', 'dd-mm-yyyy'), '8', '285 Choi Square, New Valerieburgh, MT 90648', 248);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (159, 'Daniel Taylor', to_date('11-05-2011', 'dd-mm-yyyy'), '8', '27054 Kaitlin Island, East Russellton, ID 73276', 371);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (160, 'Bradley Vargas', to_date('25-11-2014', 'dd-mm-yyyy'), '5', '358 Corey Roads, South Sarachester, AK 15752', 242);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (161, 'Connie Blanchard', to_date('30-10-2016', 'dd-mm-yyyy'), '3', '345 Wilson Greens Suite 765, Port Russell, WV 28963', 9);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (162, 'Steven Carter', to_date('23-03-2012', 'dd-mm-yyyy'), '7', '0626 Brett Knoll, Marshshire, DC 93950', 114);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (163, 'Jamie Lowe', to_date('08-05-2010', 'dd-mm-yyyy'), '9', '22516 Ashley Ferry Suite 473, New Jeremy, NH 44744', 192);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (164, 'Laura Kennedy', to_date('04-09-2011', 'dd-mm-yyyy'), '8', '635 Nicholas Gateway Apt. 170, Port Amandaport, HI 12172', 26);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (165, 'Nathan Williams', to_date('14-11-2010', 'dd-mm-yyyy'), '9', 'USS Hoffman, FPO AP 71024', 246);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (166, 'Jeanette Smith', to_date('30-10-2017', 'dd-mm-yyyy'), '2', 'USNV Mclean, FPO AE 59611', 385);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (167, 'Crystal Powell', to_date('07-08-2017', 'dd-mm-yyyy'), '2', '80151 Dickson Well Apt. 635, North Megan, RI 21298', 176);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (168, 'Maxwell Mathis', to_date('09-02-2015', 'dd-mm-yyyy'), '4', '6456 Johnson Neck Suite 281, Sanchezmouth, SC 36605', 22);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (169, 'Veronica Wyatt', to_date('04-08-2008', 'dd-mm-yyyy'), '11', '44842 Lydia Locks Suite 946, Gracemouth, ME 93124', 54);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (170, 'Jessica Horne', to_date('26-03-2018', 'dd-mm-yyyy'), '1', '9329 Scott Mountain Apt. 369, Sandraton, IL 25370', 366);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (171, 'Christopher Carter', to_date('23-09-2009', 'dd-mm-yyyy'), '10', '117 William Walks Apt. 254, Jasonview, ID 19357', 4);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (172, 'Tony Coffey', to_date('11-07-2018', 'dd-mm-yyyy'), '1', '953 Hill Hill, Thomasfurt, NV 34418', 283);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (173, 'Courtney Salazar', to_date('22-08-2018', 'dd-mm-yyyy'), '1', '455 Martinez Hill Apt. 172, West Christina, TX 93334', 312);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (174, 'Steven Donaldson', to_date('12-12-2016', 'dd-mm-yyyy'), '3', '39815 Savannah Motorway Suite 506, Crystalborough, AR 43624', 237);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (175, 'Brandi Smith', to_date('21-06-2011', 'dd-mm-yyyy'), '8', '2263 Wise Row Apt. 954, Davidport, WY 99240', 238);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (176, 'Robert Gutierrez', to_date('19-06-2011', 'dd-mm-yyyy'), '8', 'Unit 0911 Box 0997, DPO AA 21416', 273);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (177, 'Jessica Scott', to_date('24-08-2007', 'dd-mm-yyyy'), '12', '0297 Nixon Cape, Lake Stacyburgh, AL 78108', 58);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (178, 'James Baker', to_date('25-03-2009', 'dd-mm-yyyy'), '10', '2103 Goodwin Lights Apt. 822, Robertsmouth, AL 61367', 380);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (179, 'James Mills', to_date('29-08-2013', 'dd-mm-yyyy'), '6', '72158 Barnett Glens, South Richardport, AK 44039', 228);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (180, 'Brian Brown', to_date('17-08-2018', 'dd-mm-yyyy'), '1', '7965 Sanchez Dale, Lake Paul, IN 78599', 259);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (181, 'Brandon Taylor', to_date('17-01-2009', 'dd-mm-yyyy'), '10', 'Unit 2755 Box 7674, DPO AP 09013', 303);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (182, 'Vanessa Thompson', to_date('11-12-2016', 'dd-mm-yyyy'), '3', '06283 Obrien Valleys, Vincentbury, RI 96911', 44);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (183, 'Eric Alvarado', to_date('05-12-2007', 'dd-mm-yyyy'), '12', '7788 Walker Way Apt. 699, New Troy, MN 25332', 53);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (184, 'Dominique Ruiz', to_date('29-12-2009', 'dd-mm-yyyy'), '10', '8249 Angelica Wall, Wilsonside, KY 80662', 334);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (185, 'Lauren Gillespie', to_date('15-11-2007', 'dd-mm-yyyy'), '12', '3063 Dennis Walk, Sweeneyport, NM 21041', 359);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (186, 'Jason Larson', to_date('20-12-2009', 'dd-mm-yyyy'), '10', '9753 Alexandra Extension, Stephanieborough, ND 46912', 358);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (187, 'Ralph Miller', to_date('04-10-2014', 'dd-mm-yyyy'), '5', '1413 Robertson Via Apt. 737, Port Emily, WV 30850', 323);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (188, 'Mary Clark', to_date('21-09-2009', 'dd-mm-yyyy'), '10', '43950 Higgins Estate Apt. 471, North Alan, RI 63311', 399);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (189, 'Andrea Powell', to_date('24-06-2009', 'dd-mm-yyyy'), '10', '2952 Maria Turnpike Apt. 557, Lake Susanfort, KS 96304', 240);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (190, 'Christine Aguilar', to_date('11-04-2015', 'dd-mm-yyyy'), '4', '473 George Bridge Apt. 585, South Wesley, PR 90327', 211);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (191, 'Tracey Gonzales', to_date('26-05-2011', 'dd-mm-yyyy'), '8', '1701 Price Road, Haleyfort, TX 37009', 229);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (192, 'Tammy Johnson', to_date('24-12-2018', 'dd-mm-yyyy'), '1', '376 Bray Knoll Apt. 141, Savageview, PR 67476', 75);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (193, 'Ashley Collins', to_date('13-03-2008', 'dd-mm-yyyy'), '11', '891 Stephanie Junction Suite 986, North Tina, IL 27864', 43);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (194, 'Jacob Stone', to_date('24-02-2012', 'dd-mm-yyyy'), '7', '0946 Evan Oval Apt. 193, Port Mindy, MA 76876', 132);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (195, 'Lori Chan', to_date('06-06-2008', 'dd-mm-yyyy'), '11', '9604 Edward Forest, Port Julia, MD 35802', 280);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (196, 'Richard Ford', to_date('21-02-2012', 'dd-mm-yyyy'), '7', '92912 Alyssa Bridge, North Maryhaven, DC 66183', 394);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (197, 'Kelly Green', to_date('12-04-2007', 'dd-mm-yyyy'), '12', '5933 Fitzpatrick Spring Suite 256, Port Danielberg, PR 40389', 293);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (198, 'Sue Griffith', to_date('02-01-2017', 'dd-mm-yyyy'), '2', '87033 Jesse Ranch Suite 391, Port Angelaport, LA 15718', 126);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (199, 'Molly Woods', to_date('26-10-2014', 'dd-mm-yyyy'), '5', '504 Karen Freeway Apt. 140, Brittneytown, NC 18188', 398);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (200, 'Michael Hill', to_date('03-12-2015', 'dd-mm-yyyy'), '4', '4557 Edward Port Apt. 991, West Robertborough, NC 33851', 245);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (201, 'Troy Brady', to_date('01-08-2010', 'dd-mm-yyyy'), '9', '387 Smith Way Suite 818, Port Linda, KS 33618', 25);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (202, 'Paul Lucas', to_date('24-06-2018', 'dd-mm-yyyy'), '1', '8374 Martinez Manor Apt. 749, Whitetown, MT 06699', 289);
commit;
prompt 200 records committed...
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (203, 'Scott Snyder', to_date('17-04-2016', 'dd-mm-yyyy'), '3', 'Unit 4958 Box 2430, DPO AE 52376', 111);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (204, 'Robert Wood', to_date('21-07-2013', 'dd-mm-yyyy'), '6', 'PSC 0680, Box 8279, APO AE 90608', 162);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (205, 'Tiffany Olson', to_date('03-02-2015', 'dd-mm-yyyy'), '4', '7633 Benson Manor Apt. 664, Danielmouth, OK 80265', 103);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (206, 'Joshua Wright', to_date('17-08-2007', 'dd-mm-yyyy'), '12', '50209 Schmidt Terrace, Aaronshire, ID 26953', 394);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (207, 'Justin Moss', to_date('10-08-2009', 'dd-mm-yyyy'), '10', '12506 Stout Extensions, Karenfurt, UT 22042', 43);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (208, 'Amanda Hardy', to_date('02-02-2015', 'dd-mm-yyyy'), '4', '5117 Taylor Expressway Apt. 066, Donnamouth, VT 94027', 271);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (209, 'Nathan Hammond', to_date('20-04-2009', 'dd-mm-yyyy'), '10', '39094 Wood Squares, South Philipview, SD 55012', 308);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (210, 'Sierra Fox', to_date('08-03-2010', 'dd-mm-yyyy'), '9', '9207 Sparks Causeway Suite 324, Wilsonville, TN 85320', 124);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (211, 'Keith Davies', to_date('19-04-2013', 'dd-mm-yyyy'), '6', '4769 Emily Station, Whitneyport, OR 63821', 64);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (212, 'Edward Jenkins Jr.', to_date('25-06-2017', 'dd-mm-yyyy'), '2', '175 Devon Lock Apt. 330, Sanchezville, WA 95523', 186);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (213, 'Pamela Avery', to_date('08-08-2015', 'dd-mm-yyyy'), '4', '81756 Griffin Forks, Thompsonmouth, IA 31824', 23);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (214, 'Todd Esparza', to_date('09-01-2015', 'dd-mm-yyyy'), '4', '8062 Guerra Bridge Suite 028, South Whitneyview, PR 75071', 216);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (215, 'Roberta Ball', to_date('29-03-2007', 'dd-mm-yyyy'), '12', '56237 Cheyenne Estate Suite 736, Lambertport, AZ 43387', 209);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (216, 'Christopher Barron', to_date('07-11-2012', 'dd-mm-yyyy'), '7', '9991 Morgan Dam Suite 888, Port Ericafurt, MH 75002', 157);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (217, 'Ashley Suarez', to_date('15-11-2011', 'dd-mm-yyyy'), '8', '688 Hill Brooks Apt. 145, Lake Kevinmouth, IL 55347', 45);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (218, 'Erin Wilcox', to_date('25-12-2018', 'dd-mm-yyyy'), '1', '06456 Edwards Circles Suite 050, Marksburgh, AS 10476', 70);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (219, 'Julie Smith', to_date('07-08-2014', 'dd-mm-yyyy'), '5', '49874 Macdonald Light, Brittanyland, VI 36034', 40);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (220, 'Michele Ramos', to_date('30-04-2017', 'dd-mm-yyyy'), '2', '121 Cathy Stravenue, North Jodi, WV 89975', 110);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (221, 'Jennifer Martinez', to_date('11-08-2013', 'dd-mm-yyyy'), '6', '597 Mcmillan Ramp Suite 691, Huffbury, PR 57044', 299);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (222, 'Morgan Hughes', to_date('17-09-2011', 'dd-mm-yyyy'), '8', '01011 Mary Common, East Nicoleview, MT 92358', 380);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (223, 'Dale Pearson', to_date('06-12-2010', 'dd-mm-yyyy'), '9', '846 James Valleys, New Christianview, PW 45483', 263);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (224, 'Diana Williams', to_date('23-01-2015', 'dd-mm-yyyy'), '4', '6462 April Alley, Norrisborough, TX 04998', 73);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (225, 'Zachary Gilbert', to_date('21-07-2012', 'dd-mm-yyyy'), '7', '2084 Anderson Knoll Apt. 315, North Courtney, IN 83917', 315);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (226, 'Dr. Alexandra Hernandez', to_date('14-02-2010', 'dd-mm-yyyy'), '9', '786 Emily Grove, Port Richard, AL 14338', 82);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (227, 'Christopher Stanley', to_date('25-08-2009', 'dd-mm-yyyy'), '10', '1890 Kevin Club Suite 336, Lake Theresaborough, SD 50866', 49);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (228, 'Traci Garza', to_date('24-04-2011', 'dd-mm-yyyy'), '8', '575 Taylor Drive Suite 580, Richardsburgh, CT 21175', 92);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (229, 'Nancy Khan', to_date('01-05-2013', 'dd-mm-yyyy'), '6', '8393 Wong Radial, West Joshuamouth, KY 80979', 117);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (230, 'Jennifer Baldwin', to_date('16-09-2007', 'dd-mm-yyyy'), '12', '52294 Jennings Unions Suite 386, East Danielleshire, RI 16881', 238);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (231, 'Heather Martinez', to_date('03-12-2008', 'dd-mm-yyyy'), '11', '97499 John Stream Suite 025, Lake Zachary, WY 10454', 342);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (232, 'Tammy West', to_date('05-08-2013', 'dd-mm-yyyy'), '6', '0596 Tara Camp Apt. 233, East Aaronburgh, PW 89990', 35);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (233, 'Johnny Walters', to_date('02-02-2018', 'dd-mm-yyyy'), '1', '43094 Norman Union Apt. 991, West Suzanneport, SD 96969', 377);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (234, 'Joshua Fitzgerald', to_date('16-01-2010', 'dd-mm-yyyy'), '9', '66688 Wang Village Suite 966, Lake Laurie, WA 55701', 39);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (235, 'Devon Simpson', to_date('08-06-2018', 'dd-mm-yyyy'), '1', '95899 Holmes Forge Suite 999, West Juanmouth, OK 69880', 330);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (236, 'Paul Ryan', to_date('23-03-2018', 'dd-mm-yyyy'), '1', '656 Brittany Point Apt. 180, New Sandra, WI 82175', 298);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (237, 'Jennifer Patrick', to_date('14-02-2018', 'dd-mm-yyyy'), '1', '068 Sara Ford Apt. 844, Jacquelinestad, WV 55807', 330);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (238, 'Kendra Campbell', to_date('05-02-2013', 'dd-mm-yyyy'), '6', '3917 Zachary Burg, Julieshire, OR 73346', 185);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (239, 'Marie Bartlett', to_date('02-02-2017', 'dd-mm-yyyy'), '2', '48515 Linda Knoll, South Laura, VI 04314', 329);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (240, 'Jessica Martinez', to_date('13-07-2014', 'dd-mm-yyyy'), '5', '54528 Wilson Brooks Apt. 643, Juanbury, MO 11401', 197);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (241, 'Tiffany Morse', to_date('03-06-2015', 'dd-mm-yyyy'), '4', '216 Velasquez Inlet, East Dominicburgh, WA 40106', 157);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (242, 'Scott Thompson', to_date('08-12-2015', 'dd-mm-yyyy'), '4', '145 Emily Forest Suite 045, West James, TN 98740', 9);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (243, 'Joy Green', to_date('16-04-2018', 'dd-mm-yyyy'), '1', '51222 Brooke Vista Suite 824, Port William, TN 16634', 332);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (244, 'Theresa Miller', to_date('24-12-2016', 'dd-mm-yyyy'), '3', '0627 Lozano Lodge, Lake Brian, NY 08028', 313);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (245, 'Mr. Russell Collier', to_date('01-07-2010', 'dd-mm-yyyy'), '9', '393 Anna Glen, North Aaronhaven, MI 53125', 50);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (246, 'Christopher Lewis', to_date('09-12-2007', 'dd-mm-yyyy'), '12', '831 Suarez Greens, Chadport, CT 29193', 5);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (247, 'Frank Holmes', to_date('10-08-2012', 'dd-mm-yyyy'), '7', '13977 Victor Lake, Derrickbury, OH 45471', 54);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (248, 'Deborah Lambert', to_date('07-01-2016', 'dd-mm-yyyy'), '3', '6392 Henderson Wells, East Courtneyborough, IL 62763', 80);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (249, 'Peter Meza', to_date('29-11-2018', 'dd-mm-yyyy'), '1', '82514 Mccoy Brook Suite 533, Nelsonmouth, NE 41038', 149);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (250, 'Kenneth Long', to_date('09-11-2017', 'dd-mm-yyyy'), '2', '7757 Elizabeth Parks, Daughertyborough, FL 65130', 50);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (251, 'Traci Coffey', to_date('03-02-2011', 'dd-mm-yyyy'), '8', '29393 Smith Spurs, North Richard, RI 89077', 273);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (252, 'Anthony Andersen', to_date('19-04-2010', 'dd-mm-yyyy'), '9', '14167 Wilson Plaza Suite 774, New Matthewtown, CT 81306', 205);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (253, 'Nicole Montes DDS', to_date('06-10-2016', 'dd-mm-yyyy'), '3', '1771 Tracy View Apt. 735, Reedtown, PW 09162', 94);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (254, 'Matthew Lee', to_date('14-02-2009', 'dd-mm-yyyy'), '10', '1231 Carter Keys, Sethbury, MS 63742', 292);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (255, 'Tanya Cruz', to_date('15-04-2016', 'dd-mm-yyyy'), '3', '84680 Christopher Springs Suite 472, Estradaport, FL 72784', 289);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (256, 'Jennifer Bell', to_date('12-03-2016', 'dd-mm-yyyy'), '3', 'Unit 4636 Box 1408, DPO AP 64041', 8);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (257, 'Andrew Moss', to_date('01-06-2018', 'dd-mm-yyyy'), '1', '304 Sophia Stream, New Debra, VA 95130', 12);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (258, 'Adam Rodgers', to_date('17-08-2012', 'dd-mm-yyyy'), '7', '764 Young Junction Apt. 693, Joshuaport, IN 67690', 351);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (259, 'Steven Perry', to_date('19-07-2018', 'dd-mm-yyyy'), '1', '738 Horton Meadow, Port Toddfurt, MP 93188', 61);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (260, 'Christopher English', to_date('05-04-2016', 'dd-mm-yyyy'), '3', '212 Webster Ferry, Thomasside, MA 03070', 345);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (261, 'Denise Buchanan', to_date('11-07-2017', 'dd-mm-yyyy'), '2', '78099 Mack Wells Apt. 401, Donnaview, KY 93571', 87);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (262, 'Monica Taylor', to_date('25-03-2007', 'dd-mm-yyyy'), '12', '74496 Barbara Alley, Powellstad, LA 85680', 22);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (263, 'Shelley Dillon', to_date('25-04-2010', 'dd-mm-yyyy'), '9', '482 Felicia Drive Apt. 091, New Thomas, ID 25252', 232);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (264, 'Ashley Woods', to_date('16-08-2015', 'dd-mm-yyyy'), '4', '737 Jerry Harbors, Griffinfort, NY 87849', 38);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (265, 'Joyce Clark', to_date('28-06-2012', 'dd-mm-yyyy'), '7', '28053 Rowe Corners, South Melissa, WI 00845', 177);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (266, 'Marc Solis', to_date('15-07-2011', 'dd-mm-yyyy'), '8', '77906 Watts Fort Apt. 058, Port Samuel, SD 11156', 129);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (267, 'Natasha Curry', to_date('01-08-2010', 'dd-mm-yyyy'), '9', '6457 Glass Ford Suite 983, Michaelhaven, FL 01687', 384);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (268, 'Hayley Le', to_date('02-02-2016', 'dd-mm-yyyy'), '3', '839 Justin Course, Hicksburgh, UT 74248', 324);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (269, 'Louis Harper', to_date('26-02-2009', 'dd-mm-yyyy'), '10', '38872 Haley Pine Apt. 656, Kennethmouth, NV 56828', 335);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (270, 'Alexis Madden', to_date('15-04-2008', 'dd-mm-yyyy'), '11', '07845 Bray Trafficway Suite 314, Millermouth, NY 35216', 299);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (271, 'Justin Hunt', to_date('26-08-2010', 'dd-mm-yyyy'), '9', '022 Lang Bypass, Hendersonton, IL 95931', 250);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (272, 'Sharon Lane', to_date('25-12-2012', 'dd-mm-yyyy'), '7', '39483 William Station Apt. 556, Angelatown, CA 43373', 288);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (273, 'Michelle Richardson', to_date('12-07-2009', 'dd-mm-yyyy'), '10', '3768 Isabella Roads Suite 854, Gallegosmouth, IL 28446', 191);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (274, 'Patrick Warren', to_date('20-12-2009', 'dd-mm-yyyy'), '10', '60463 Smith Roads, Johnton, CA 77117', 284);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (275, 'Heather Rivera', to_date('13-05-2016', 'dd-mm-yyyy'), '3', '8560 Santana Lakes, Lake Leonard, VT 22486', 79);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (276, 'Leslie Hernandez', to_date('18-11-2012', 'dd-mm-yyyy'), '7', '81369 Medina Flat Apt. 044, West Derrick, ND 89364', 356);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (277, 'Angela Peterson', to_date('16-02-2008', 'dd-mm-yyyy'), '11', '255 Benjamin Meadow Suite 461, Lake Kelseyland, MS 92234', 176);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (278, 'Lori Mcguire', to_date('15-02-2018', 'dd-mm-yyyy'), '1', 'USS Oneill, FPO AP 84823', 121);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (279, 'Cynthia Sexton', to_date('17-04-2016', 'dd-mm-yyyy'), '3', '6133 Charles Meadows Suite 000, Jillberg, MN 06712', 37);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (280, 'Gary Ramos', to_date('11-11-2010', 'dd-mm-yyyy'), '9', '213 Alice Views, Dianeborough, LA 20937', 210);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (281, 'John Gonzales', to_date('05-08-2014', 'dd-mm-yyyy'), '5', 'USNV Sanders, FPO AE 81859', 69);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (282, 'Patricia Garcia', to_date('02-06-2010', 'dd-mm-yyyy'), '9', '2410 Thomas Centers, Monicaside, PW 83876', 322);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (283, 'Daniel Sullivan', to_date('22-12-2018', 'dd-mm-yyyy'), '1', '046 Linda Lakes Suite 628, Port Victoria, NV 35355', 90);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (284, 'Bryan Berg', to_date('18-04-2010', 'dd-mm-yyyy'), '9', '33048 Anna Manors, Danielville, NJ 15631', 353);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (285, 'Jennifer Foster', to_date('18-09-2010', 'dd-mm-yyyy'), '9', '1675 Theresa Lane, Rachaelbury, NM 20973', 285);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (286, 'Tina Lee', to_date('08-07-2008', 'dd-mm-yyyy'), '11', '101 Cody Divide Suite 889, Hansonton, AK 89131', 107);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (287, 'Andres Jefferson', to_date('09-10-2015', 'dd-mm-yyyy'), '4', '57205 Andrew Path, New Gregoryton, NM 69789', 279);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (288, 'Brenda Scott', to_date('06-12-2014', 'dd-mm-yyyy'), '5', '81097 Douglas Streets, East Ronald, IL 03670', 57);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (289, 'Jorge Mercado', to_date('17-11-2010', 'dd-mm-yyyy'), '9', '638 Gary Wall Suite 558, Brandthaven, ID 46336', 376);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (290, 'Christopher Andersen', to_date('20-02-2016', 'dd-mm-yyyy'), '3', '17882 Curtis Plains Suite 222, Lake George, VI 79184', 259);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (291, 'Brittany Woods', to_date('14-10-2012', 'dd-mm-yyyy'), '7', '67217 Zimmerman Gateway, Jeffreychester, AZ 18252', 128);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (292, 'Christopher Byrd', to_date('15-02-2016', 'dd-mm-yyyy'), '3', '866 Page Ville, New Ryanton, TN 62569', 241);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (293, 'Melissa Ramirez', to_date('21-08-2014', 'dd-mm-yyyy'), '5', '767 Gabrielle Landing, West Ivan, TN 54814', 34);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (294, 'Travis Allen', to_date('26-04-2008', 'dd-mm-yyyy'), '11', '74829 Willie Ports Apt. 031, South Rebecca, CO 48756', 208);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (295, 'Carl Gonzalez', to_date('11-11-2011', 'dd-mm-yyyy'), '8', '01349 Rivers Heights Apt. 081, Kennedyside, GU 32364', 144);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (296, 'Jordan Miller MD', to_date('22-11-2013', 'dd-mm-yyyy'), '6', '4668 Brown Walk, South Richard, NE 39283', 194);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (297, 'Christopher Brown', to_date('10-03-2013', 'dd-mm-yyyy'), '6', '46645 Walton Place, Amyport, VA 72979', 307);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (298, 'Leah Mercer', to_date('26-01-2008', 'dd-mm-yyyy'), '11', '7793 Anderson Cape, Lake Matthew, VI 91685', 141);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (299, 'Melissa Anderson', to_date('15-08-2009', 'dd-mm-yyyy'), '10', '9819 Katherine Square, South Maria, SD 16827', 158);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (300, 'Paul Mcmahon', to_date('03-01-2008', 'dd-mm-yyyy'), '11', '69767 Bell Island, Petersonchester, IA 23906', 57);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (301, 'Carrie Craig', to_date('14-06-2009', 'dd-mm-yyyy'), '10', '2892 Sanders Island, Michellehaven, AS 88009', 361);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (302, 'Emily Flores', to_date('09-09-2016', 'dd-mm-yyyy'), '3', '7654 Ashley Stream Suite 436, Lake Matthewmouth, NH 09477', 8);
commit;
prompt 300 records committed...
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (303, 'Andrew Shannon', to_date('30-04-2014', 'dd-mm-yyyy'), '5', 'Unit 5032 Box 2462, DPO AA 47276', 115);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (304, 'Clayton Kelly', to_date('15-07-2010', 'dd-mm-yyyy'), '9', '3842 Thornton Meadow, New Ashleyside, MN 27333', 136);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (305, 'Rebecca Taylor', to_date('29-10-2011', 'dd-mm-yyyy'), '8', '91926 Donald Motorway Suite 398, Fowlerside, MI 16089', 40);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (306, 'Jacqueline Marshall', to_date('23-12-2009', 'dd-mm-yyyy'), '10', '06242 Collier Pass Apt. 528, South Ashley, AL 15533', 397);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (307, 'Anita Mullen', to_date('07-03-2007', 'dd-mm-yyyy'), '12', '8877 Graham Court Suite 600, New Deborahfurt, NJ 63157', 271);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (308, 'Jeffrey Butler', to_date('17-01-2017', 'dd-mm-yyyy'), '2', '6460 Mcmahon Shore Apt. 127, Maddenport, IN 65972', 336);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (309, 'Laurie Anderson', to_date('16-01-2017', 'dd-mm-yyyy'), '2', '351 Johnson Islands Suite 784, Madisonmouth, FL 46153', 180);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (310, 'Madison Robertson', to_date('18-03-2013', 'dd-mm-yyyy'), '6', '66842 Hansen Drive Apt. 388, Wilsonmouth, SD 85357', 305);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (311, 'Kendra Williams', to_date('10-10-2007', 'dd-mm-yyyy'), '12', '78392 Jennifer Springs Apt. 073, Suttonborough, AR 45451', 281);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (312, 'Christopher Richardson', to_date('31-10-2009', 'dd-mm-yyyy'), '10', '039 Brown Summit Apt. 948, New Brianchester, WV 49114', 3);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (313, 'Johnny Fritz', to_date('29-12-2011', 'dd-mm-yyyy'), '8', '18258 Hawkins Stream, Shafferview, HI 14089', 262);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (314, 'Jessica Douglas', to_date('07-02-2011', 'dd-mm-yyyy'), '8', '408 Samantha Mall, Port Angelamouth, FL 94334', 245);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (315, 'Sarah Novak', to_date('02-12-2009', 'dd-mm-yyyy'), '10', '25263 Wallace Crest Suite 793, West Paulport, IL 04997', 37);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (316, 'Loretta Torres', to_date('05-03-2009', 'dd-mm-yyyy'), '10', '642 Kelly Forest, Lake Aaron, AS 02462', 333);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (317, 'Timothy Wilson', to_date('03-06-2014', 'dd-mm-yyyy'), '5', 'Unit 0839 Box 0954, DPO AE 58062', 190);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (318, 'Tanya Owens', to_date('01-03-2018', 'dd-mm-yyyy'), '1', '68555 John Fields Apt. 271, Hallfurt, MI 55684', 101);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (319, 'Frank Welch', to_date('08-07-2015', 'dd-mm-yyyy'), '4', 'PSC 5490, Box 9605, APO AP 50240', 185);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (320, 'Kristy Mills', to_date('03-01-2012', 'dd-mm-yyyy'), '7', '77610 Roberts Road, West Joshuamouth, NY 74594', 171);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (321, 'Dakota Simpson', to_date('17-12-2010', 'dd-mm-yyyy'), '9', '9570 Larsen Path Suite 667, New Amandamouth, HI 05851', 296);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (322, 'Cynthia King', to_date('19-02-2018', 'dd-mm-yyyy'), '1', '8192 Amber Mission Apt. 653, Tylerside, LA 20078', 257);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (323, 'Anthony Rich', to_date('15-04-2016', 'dd-mm-yyyy'), '3', 'Unit 6905 Box 2595, DPO AE 19639', 94);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (324, 'Tammie Carter', to_date('29-03-2010', 'dd-mm-yyyy'), '9', '2760 Hayes Ways Apt. 512, Kentview, MO 96663', 370);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (325, 'Megan Walker', to_date('09-05-2015', 'dd-mm-yyyy'), '4', '694 Lutz Circles Suite 062, Robertside, CT 75623', 360);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (326, 'Natasha Robinson', to_date('04-12-2016', 'dd-mm-yyyy'), '3', '39851 Jeremy Alley Apt. 119, Chelseafort, TX 69808', 76);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327, 'Jennifer Willis', to_date('17-11-2007', 'dd-mm-yyyy'), '12', '0693 Rachel Landing, Hunthaven, NC 42205', 179);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (328, 'Adam Lowery', to_date('22-04-2013', 'dd-mm-yyyy'), '6', '1603 Ramos Way, Lake Sarahview, WV 04843', 117);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (329, 'Katherine Cole', to_date('29-06-2013', 'dd-mm-yyyy'), '6', '66787 Benjamin Islands, South Anne, FM 61932', 81);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (330, 'David Edwards', to_date('01-04-2011', 'dd-mm-yyyy'), '8', '018 Rodriguez Ways, Thompsonfort, MA 67051', 344);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (331, 'Kenneth Chavez', to_date('30-05-2007', 'dd-mm-yyyy'), '12', '1719 Bowers Station, Webbborough, NH 60463', 271);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (332, 'Philip Thompson', to_date('17-07-2010', 'dd-mm-yyyy'), '9', '412 Christian Overpass, Jennifertown, LA 44046', 288);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (333, 'Christopher Gonzales', to_date('10-12-2016', 'dd-mm-yyyy'), '3', '1696 Kerr Fort, Samanthachester, OR 15671', 111);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (334, 'Dwayne Williams', to_date('21-02-2015', 'dd-mm-yyyy'), '4', '0580 Murray Stream Apt. 621, Mosesville, PR 50225', 30);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (335, 'Robert Owens', to_date('06-06-2012', 'dd-mm-yyyy'), '7', '744 Perry Prairie Suite 925, Crystalhaven, HI 09890', 71);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (336, 'Mary Reynolds', to_date('16-11-2013', 'dd-mm-yyyy'), '6', '3798 Soto Neck, Danielshire, ME 13993', 120);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (337, 'Jasmine Mcclain', to_date('29-03-2015', 'dd-mm-yyyy'), '4', '04341 Warren Track Suite 507, North Jamesstad, PA 45716', 174);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (338, 'Kimberly Coleman', to_date('15-10-2013', 'dd-mm-yyyy'), '6', '4698 Brittany Lights, Lauraburgh, LA 90669', 60);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (339, 'Marissa Kirby', to_date('22-07-2010', 'dd-mm-yyyy'), '9', '4240 Tiffany Avenue, Munozmouth, CO 13970', 61);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (340, 'Jerry Lowery', to_date('13-09-2013', 'dd-mm-yyyy'), '6', '99877 Hobbs Tunnel Suite 894, New Ryan, IA 17561', 294);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (341, 'Jennifer Scott', to_date('23-11-2012', 'dd-mm-yyyy'), '7', 'PSC 9803, Box 9728, APO AE 35960', 181);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (342, 'William Mcdonald', to_date('18-07-2007', 'dd-mm-yyyy'), '12', '0252 Dawn Passage, Laurachester, PA 83829', 1);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (343, 'Ashley Scott', to_date('13-07-2018', 'dd-mm-yyyy'), '1', '009 Jason Estates, Byrdport, MT 69616', 399);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (344, 'Marie Turner', to_date('27-09-2008', 'dd-mm-yyyy'), '11', '8577 Rhonda Plains Suite 641, Port William, MO 21481', 170);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (345, 'Dustin Ford', to_date('30-08-2008', 'dd-mm-yyyy'), '11', '4659 Davis Street Apt. 215, Patrickfort, NC 72897', 135);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (346, 'Jeffrey Johnson', to_date('26-01-2010', 'dd-mm-yyyy'), '9', '828 Gross Shoals, Lake Tylerchester, SC 00610', 372);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (347, 'Jeanette Wallace', to_date('19-11-2011', 'dd-mm-yyyy'), '8', '3646 Chang Plaza, Kimmouth, PW 95340', 223);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (348, 'Christine Davis', to_date('27-02-2011', 'dd-mm-yyyy'), '8', '89332 Paul Locks Apt. 135, East Scott, NM 10887', 8);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (349, 'Rebekah Salinas', to_date('07-11-2011', 'dd-mm-yyyy'), '8', '5392 Lee Fall Apt. 003, West Sherrytown, TX 77953', 240);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (350, 'Joanna Weaver', to_date('17-11-2014', 'dd-mm-yyyy'), '5', '703 Thomas Manors Apt. 373, New Williamville, DE 14565', 57);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (351, 'Michael Kerr', to_date('20-03-2018', 'dd-mm-yyyy'), '1', '098 Tonya Meadows, Parksbury, FM 21472', 375);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (352, 'John Parsons', to_date('15-02-2012', 'dd-mm-yyyy'), '7', '84380 Gonzalez Roads Apt. 291, South Timothy, IL 21520', 238);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (353, 'Christopher Nash', to_date('03-07-2012', 'dd-mm-yyyy'), '7', '93171 Anthony Junctions, Port Daniel, FM 21449', 314);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (354, 'Nancy Fuller', to_date('05-10-2018', 'dd-mm-yyyy'), '1', '759 Pham Passage, Gomezshire, NJ 47860', 32);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (355, 'Cody Spencer', to_date('11-12-2009', 'dd-mm-yyyy'), '10', '188 Stevens Village Suite 990, Cliffordburgh, LA 36501', 183);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (356, 'Brooke Deleon', to_date('02-08-2017', 'dd-mm-yyyy'), '2', '627 Laura Inlet Suite 805, Dayhaven, DC 21791', 224);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (357, 'Chelsea Guerra', to_date('23-01-2007', 'dd-mm-yyyy'), '12', '242 Davis Drive Apt. 555, Smithshire, MO 90050', 226);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (358, 'Lawrence Harvey', to_date('21-08-2016', 'dd-mm-yyyy'), '3', '015 Foster Heights Apt. 491, Jimenezton, TX 80570', 31);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (359, 'Rachel Thomas', to_date('19-10-2013', 'dd-mm-yyyy'), '6', '76412 Nathaniel Trafficway, West Ericside, IA 36612', 52);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (360, 'Michelle Clark', to_date('12-08-2008', 'dd-mm-yyyy'), '11', '10658 Sandra Corner Apt. 193, Lake Tonyaborough, IL 75493', 249);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (361, 'Aaron James', to_date('17-04-2007', 'dd-mm-yyyy'), '12', '7586 Melissa Summit Suite 179, Mooreville, RI 07137', 335);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (362, 'Julia Garcia', to_date('25-10-2007', 'dd-mm-yyyy'), '12', '8499 William Knoll Apt. 889, Lake Heatherport, AR 61485', 375);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (363, 'Michael Richmond', to_date('02-07-2017', 'dd-mm-yyyy'), '2', '6000 Zavala Port, Philliptown, NE 48875', 163);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (364, 'Paul Atkinson', to_date('06-08-2013', 'dd-mm-yyyy'), '6', '8920 Medina Streets Apt. 188, Silvaborough, AR 53752', 187);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (365, 'Matthew Anderson', to_date('29-11-2014', 'dd-mm-yyyy'), '5', '6785 Holloway Plaza, Jameston, ME 86390', 65);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (366, 'Thomas Warren', to_date('19-09-2011', 'dd-mm-yyyy'), '8', '2581 Dean Ferry Apt. 383, Port Andreaside, NH 98846', 161);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (367, 'Julie Williams', to_date('18-07-2014', 'dd-mm-yyyy'), '5', 'USNS Davis, FPO AA 29790', 18);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (368, 'Richard Wood', to_date('07-04-2018', 'dd-mm-yyyy'), '1', '10190 Ryan Trail Suite 992, East Eileenshire, TX 64561', 245);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (369, 'Caitlin Vazquez', to_date('08-05-2017', 'dd-mm-yyyy'), '2', '01700 Adkins Mount Suite 162, Coffeyborough, NV 18550', 367);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (370, 'Sandra Gonzalez', to_date('09-09-2012', 'dd-mm-yyyy'), '7', '967 Philip Terrace Suite 026, North Bradley, CO 42065', 240);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (371, 'Jeffrey Stewart', to_date('23-05-2010', 'dd-mm-yyyy'), '9', '66323 David Ports Suite 330, Stevenland, AS 69674', 41);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372, 'Tyler Cobb', to_date('22-03-2010', 'dd-mm-yyyy'), '9', 'USS Jimenez, FPO AP 13856', 385);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (373, 'Jasmine Clark', to_date('30-08-2018', 'dd-mm-yyyy'), '1', '9861 Williams Lock Suite 450, Smithland, CO 18240', 330);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (374, 'Mr. Ryan Moreno', to_date('24-03-2014', 'dd-mm-yyyy'), '5', '7515 Gray Forest Suite 399, Lake Tracyfort, PA 63344', 255);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (375, 'Eric Scott', to_date('04-08-2011', 'dd-mm-yyyy'), '8', '7874 Timothy Mill Suite 772, New Alexandra, TX 37183', 209);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (376, 'David Rogers', to_date('12-11-2016', 'dd-mm-yyyy'), '3', '63242 Rush Flats, South Jotown, HI 49766', 130);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (377, 'Lee Kennedy', to_date('24-04-2011', 'dd-mm-yyyy'), '8', '3881 Wade Ville Suite 350, Port Kevinport, FL 82777', 322);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (378, 'Omar Nguyen', to_date('11-04-2010', 'dd-mm-yyyy'), '9', '8292 Michelle Lodge, New Shelleytown, KY 87187', 305);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (379, 'David Carpenter', to_date('12-07-2013', 'dd-mm-yyyy'), '6', 'PSC 0158, Box 6834, APO AE 88460', 32);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (380, 'Christopher Leach', to_date('14-06-2014', 'dd-mm-yyyy'), '5', '11083 Shaw Union, Jerryfurt, DC 87720', 94);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (381, 'Alicia Wilson', to_date('09-02-2009', 'dd-mm-yyyy'), '10', '7097 Bradley Crossroad Suite 264, New Kyleville, ID 98678', 61);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (382, 'Jeremy Graham', to_date('03-03-2011', 'dd-mm-yyyy'), '8', 'USNV Harmon, FPO AE 13474', 281);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (383, 'Michael Thomas', to_date('22-02-2013', 'dd-mm-yyyy'), '6', '7786 Nicole Summit, West Justinville, FM 70559', 386);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (384, 'Tina Marshall', to_date('20-05-2012', 'dd-mm-yyyy'), '7', '421 Gomez Street Suite 007, West Richard, WI 52797', 30);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (385, 'Brittany Garcia', to_date('27-03-2018', 'dd-mm-yyyy'), '1', '6065 Ramirez Villages, Avilatown, NC 62576', 57);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (386, 'James Vasquez', to_date('29-10-2015', 'dd-mm-yyyy'), '4', '742 Brandon Mountain Suite 863, Markville, AZ 09246', 140);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (387, 'Patrick Kane', to_date('31-01-2014', 'dd-mm-yyyy'), '5', '8381 Dennis Pine Suite 893, South Amanda, TX 60413', 285);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (388, 'Christine Luna', to_date('28-01-2007', 'dd-mm-yyyy'), '12', '32895 Brooke Street Apt. 330, Lake Jamesville, AK 97278', 334);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (389, 'Megan Wells', to_date('30-04-2008', 'dd-mm-yyyy'), '11', 'Unit 1098 Box 4543, DPO AA 03022', 317);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (390, 'Steven Ross', to_date('28-07-2008', 'dd-mm-yyyy'), '11', 'USNS Walter, FPO AE 38262', 276);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (391, 'Christopher Oneal', to_date('01-01-2014', 'dd-mm-yyyy'), '5', '110 Kemp Forges Suite 874, West Christopherbury, ID 64088', 142);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (392, 'Johnny Andrews', to_date('21-12-2007', 'dd-mm-yyyy'), '12', '265 Jennifer Turnpike, Tiffanyshire, NJ 10220', 236);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (393, 'David Carroll', to_date('26-10-2016', 'dd-mm-yyyy'), '3', '07755 Herrera Ways, Port Lonnie, PW 47373', 47);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (394, 'John Mitchell', to_date('04-10-2010', 'dd-mm-yyyy'), '9', '7205 Julie Mill Suite 851, South Stephanie, IA 86430', 201);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (395, 'Zachary Simpson', to_date('09-11-2007', 'dd-mm-yyyy'), '12', '92489 Hall Circles, North Faith, RI 43073', 346);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (396, 'Matthew Riley', to_date('17-03-2017', 'dd-mm-yyyy'), '2', '4772 Bradley Circle, Port Lisa, WY 32385', 153);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (397, 'Tina Mckee', to_date('27-07-2015', 'dd-mm-yyyy'), '4', '1443 Scott Turnpike Apt. 598, Port Alexis, NV 40156', 84);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (398, 'David Foster', to_date('13-10-2018', 'dd-mm-yyyy'), '1', '555 Monica Place Suite 619, North Morganland, OR 16472', 310);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (399, 'Anthony Hall', to_date('28-02-2010', 'dd-mm-yyyy'), '9', '36290 Smith Lodge, Hawkinsburgh, MS 10345', 309);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (400, 'Ronald Buck', to_date('28-06-2008', 'dd-mm-yyyy'), '11', '15166 Walsh Ports, New Richardview, WI 33619', 224);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925001, 'Andrea Herrera', to_date('05-02-2008', 'dd-mm-yyyy'), '11', '720 Joseph Landing Suite 605, Debbieview, WI 51229', 254839001);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925002, 'David Johnson', to_date('02-01-2017', 'dd-mm-yyyy'), '2', 'PSC 2794, Box 0491, APO AE 72880', 254839002);
commit;
prompt 400 records committed...
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925003, 'Michelle Blake', to_date('03-09-2010', 'dd-mm-yyyy'), '9', 'USNS Lawrence, FPO AP 14435', 254839003);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925004, 'Chelsea Cain', to_date('20-10-2017', 'dd-mm-yyyy'), '2', 'PSC 0753, Box 3698, APO AA 76482', 254839004);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925005, 'Jonathan Jackson', to_date('16-11-2016', 'dd-mm-yyyy'), '3', '289 Samantha Vista, Tylerburgh, PW 06359', 254839005);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925006, 'Jesse Lewis', to_date('09-07-2015', 'dd-mm-yyyy'), '4', '8523 Cook Course Suite 111, South Chris, NM 35059', 254839006);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925007, 'Danielle Clark', to_date('28-06-2017', 'dd-mm-yyyy'), '2', '13890 Stacy Crescent, East Mariehaven, OH 95595', 254839007);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925008, 'Kimberly Osborne', to_date('04-07-2016', 'dd-mm-yyyy'), '3', '82066 Poole Club Suite 963, Dixonport, NY 14199', 254839008);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925009, 'Meghan Baldwin', to_date('03-04-2013', 'dd-mm-yyyy'), '6', '2342 Camacho Shoal, Jameston, FM 05066', 254839009);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925010, 'Lisa Kane', to_date('24-11-2015', 'dd-mm-yyyy'), '4', '41170 Gonzalez Dam, Wardshire, LA 40703', 254839010);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925011, 'Kimberly White', to_date('18-05-2014', 'dd-mm-yyyy'), '5', '11010 Jacqueline Street Apt. 681, Amandaport, NV 73712', 254839011);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925012, 'Brianna Scott', to_date('11-09-2015', 'dd-mm-yyyy'), '4', '775 Williams Port Suite 724, Nelsonshire, NM 18202', 254839012);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925013, 'Douglas Fischer', to_date('06-01-2011', 'dd-mm-yyyy'), '8', '4803 Sheryl Locks, Moonton, ND 89972', 254839013);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925014, 'Amanda Weiss', to_date('04-04-2011', 'dd-mm-yyyy'), '8', '83490 Jennifer Cove, Hernandezfort, AK 12154', 254839014);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925015, 'Nicole Hayes', to_date('20-01-2011', 'dd-mm-yyyy'), '8', '25489 Harris Burgs Suite 308, West Bryan, IN 42194', 254839015);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925016, 'John Graham', to_date('22-05-2015', 'dd-mm-yyyy'), '4', '77145 Kyle Field, North Bryan, DC 98850', 254839016);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925017, 'Jordan Porter', to_date('29-03-2010', 'dd-mm-yyyy'), '9', '50108 Anderson Trail Suite 529, New Melissa, AR 91739', 254839017);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925018, 'Joshua Taylor', to_date('25-01-2009', 'dd-mm-yyyy'), '10', '5986 Richard Key Suite 478, Jamieshire, DC 60300', 254839018);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925019, 'Erica Blackwell', to_date('22-03-2010', 'dd-mm-yyyy'), '9', '9665 Baker Island Apt. 049, Timothyberg, OR 18732', 254839019);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925020, 'Susan Ware', to_date('27-09-2016', 'dd-mm-yyyy'), '3', '0240 Katherine Bridge, Curtishaven, OK 55912', 254839020);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925021, 'Shelly Patel MD', to_date('05-01-2011', 'dd-mm-yyyy'), '8', '679 Jeff Rapids Suite 522, Port Matthew, ND 40518', 254839021);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925022, 'Keith Thompson', to_date('14-07-2014', 'dd-mm-yyyy'), '5', '27321 Suzanne Passage Suite 720, Alexanderland, UT 49419', 254839022);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925023, 'Keith Washington', to_date('17-11-2017', 'dd-mm-yyyy'), '2', '0865 Gregory Cliff Apt. 257, Gonzalezmouth, NY 41634', 254839023);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925024, 'Mr. Cody Riley', to_date('16-11-2013', 'dd-mm-yyyy'), '6', '004 Gary Turnpike Suite 937, Lopezburgh, AK 42597', 254839024);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925025, 'Joseph Orr', to_date('12-09-2017', 'dd-mm-yyyy'), '2', '776 Sherry Roads Apt. 349, Aliciatown, AK 03334', 254839025);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925026, 'Shannon Pugh', to_date('30-06-2017', 'dd-mm-yyyy'), '2', 'PSC 1740, Box 9380, APO AP 64306', 254839026);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925027, 'Anthony Barrera', to_date('28-01-2008', 'dd-mm-yyyy'), '11', '947 Smith Harbor, East Rachelhaven, MO 25861', 254839027);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925028, 'Elizabeth Tucker', to_date('05-01-2011', 'dd-mm-yyyy'), '8', '96135 Wade Crescent Suite 757, Harperstad, MD 32709', 254839028);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925029, 'Michelle Sullivan', to_date('26-02-2015', 'dd-mm-yyyy'), '4', '937 Tanner Key, Kimberlyberg, IN 78680', 254839029);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925030, 'Ruth Shepherd', to_date('13-07-2010', 'dd-mm-yyyy'), '9', '8637 Cory Glen, Roberthaven, OR 95699', 254839030);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925031, 'Rebecca Ferguson', to_date('12-04-2011', 'dd-mm-yyyy'), '8', 'PSC 6142, Box 1047, APO AA 18919', 254839031);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925032, 'Mary Martin', to_date('08-08-2018', 'dd-mm-yyyy'), '1', '76404 Sarah Fall, Lake Eugeneburgh, NE 74567', 254839032);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925033, 'David Burns', to_date('24-11-2011', 'dd-mm-yyyy'), '8', '1234 Eric Fork, Fordmouth, DE 99689', 254839033);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925034, 'Jennifer Ford', to_date('29-03-2010', 'dd-mm-yyyy'), '9', '36115 Colin Union Apt. 153, Lake Jay, MO 30516', 254839034);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925035, 'Taylor Knight', to_date('22-03-2015', 'dd-mm-yyyy'), '4', '507 Sarah Shore, Johnsonville, AS 29328', 254839035);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925036, 'Mary Davis', to_date('15-01-2012', 'dd-mm-yyyy'), '7', 'PSC 2722, Box 9434, APO AE 57846', 254839036);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925037, 'Donna Smith', to_date('26-06-2010', 'dd-mm-yyyy'), '9', '999 Reyes Course, East Christopherton, AK 01926', 254839037);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925038, 'Amber Terry', to_date('13-08-2007', 'dd-mm-yyyy'), '12', '514 Gonzalez Flats Apt. 669, Annaside, PW 51632', 254839038);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925039, 'Thomas Fischer', to_date('22-05-2012', 'dd-mm-yyyy'), '7', '3191 Angela Shore, Port Kimberly, GA 44242', 254839039);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925040, 'Jason Khan', to_date('16-11-2017', 'dd-mm-yyyy'), '2', '9885 Brown Springs Apt. 653, New Jasonland, AK 53072', 254839040);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925041, 'William Martinez', to_date('25-02-2009', 'dd-mm-yyyy'), '10', 'Unit 8183 Box 3344, DPO AE 76863', 254839041);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925042, 'Laura Whitney', to_date('30-04-2008', 'dd-mm-yyyy'), '11', '9054 Payne Lodge, Port Christopherview, WI 56650', 254839042);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925043, 'Riley Hayes', to_date('09-02-2015', 'dd-mm-yyyy'), '4', 'PSC 6506, Box 2921, APO AE 65296', 254839043);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925044, 'William Mason', to_date('06-08-2014', 'dd-mm-yyyy'), '5', '46258 Jacqueline Burg, East Christopher, GU 83097', 254839044);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925045, 'Jared Clark', to_date('14-10-2008', 'dd-mm-yyyy'), '11', 'Unit 6928 Box 2372, DPO AE 23794', 254839045);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925046, 'Kyle Noble', to_date('31-07-2015', 'dd-mm-yyyy'), '4', '31024 Megan Spurs, Justinside, FM 50575', 254839046);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925047, 'Cassandra Schaefer', to_date('23-04-2013', 'dd-mm-yyyy'), '6', '26691 Wilson Circles Suite 395, East Jonathanton, OR 86406', 254839047);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925048, 'Travis Powell', to_date('09-03-2007', 'dd-mm-yyyy'), '12', '73059 Mckinney Shores Apt. 074, Lake Steven, NC 88262', 254839048);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925049, 'Lindsey Rodriguez', to_date('26-10-2009', 'dd-mm-yyyy'), '10', '67888 Monroe Brook Apt. 942, Lindseyton, NJ 94419', 254839049);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925050, 'Jennifer Barber', to_date('02-11-2017', 'dd-mm-yyyy'), '2', '577 Peck Ways Apt. 923, New Melanietown, GU 34723', 254839050);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925051, 'Arthur Nelson', to_date('22-06-2011', 'dd-mm-yyyy'), '8', '7221 Noble Glen Apt. 416, Andrewborough, HI 41783', 254839051);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925052, 'Amanda Bauer', to_date('25-03-2011', 'dd-mm-yyyy'), '8', '04948 Howe Loop Suite 013, New Lauren, VA 93552', 254839052);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925053, 'Brandon Austin', to_date('27-11-2011', 'dd-mm-yyyy'), '8', '60351 Johnson Parkways Suite 459, Robertstad, FM 53497', 254839053);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925054, 'Christopher Warner', to_date('16-04-2016', 'dd-mm-yyyy'), '3', '3314 Jennifer Terrace, Barberburgh, NE 35079', 254839054);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925055, 'Mark Wilson', to_date('06-11-2015', 'dd-mm-yyyy'), '4', '53888 Poole Estates Apt. 448, East Tiffanyside, WA 74899', 254839055);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925056, 'Richard Gonzales', to_date('28-09-2010', 'dd-mm-yyyy'), '9', '5235 Richard Fall Suite 483, New Lisa, VI 84095', 254839056);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925057, 'Stanley Cooper', to_date('16-09-2007', 'dd-mm-yyyy'), '12', '23475 Kari Field, North Shelly, PR 81743', 254839057);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925058, 'Tyler Baker', to_date('20-09-2016', 'dd-mm-yyyy'), '3', '6263 Jacob Hollow Apt. 887, Santanamouth, HI 62225', 254839058);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925059, 'Carmen Hall', to_date('17-10-2012', 'dd-mm-yyyy'), '7', '77623 Patrick Pine, Jamesport, ID 35421', 254839059);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925060, 'Daniel Baker', to_date('05-05-2009', 'dd-mm-yyyy'), '10', '101 Allison Wall Suite 384, Port Brittanyland, PW 56781', 254839060);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925061, 'David Bowers', to_date('25-07-2012', 'dd-mm-yyyy'), '7', '430 Allen Springs, West Erintown, GA 12847', 254839061);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925062, 'Amber Smith', to_date('10-06-2010', 'dd-mm-yyyy'), '9', '97809 Mcclure Path, Jenningstown, MA 25390', 254839062);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925063, 'Jacob Lamb', to_date('03-09-2010', 'dd-mm-yyyy'), '9', '342 Burns Fall Suite 216, Tinastad, VT 71165', 254839063);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925064, 'Dr. Tabitha Smith MD', to_date('21-02-2010', 'dd-mm-yyyy'), '9', '13496 Chase Mountain, Lake Joshua, IN 53957', 254839064);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925065, 'Ms. Christina Rodriguez', to_date('14-01-2011', 'dd-mm-yyyy'), '8', '192 Andrew Drives, East Jessicaton, TN 41368', 254839065);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925066, 'Randall Young', to_date('24-01-2015', 'dd-mm-yyyy'), '4', '16051 Hannah Streets, East Dennismouth, AS 01315', 254839066);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925067, 'Kenneth Vaughan', to_date('15-03-2009', 'dd-mm-yyyy'), '10', '9270 Sarah Loop Suite 463, South Sharonview, WY 67431', 254839067);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925068, 'Lisa Ashley', to_date('29-12-2016', 'dd-mm-yyyy'), '3', 'PSC 1340, Box 0850, APO AP 49042', 254839068);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925069, 'Angela Black', to_date('30-11-2009', 'dd-mm-yyyy'), '10', '7720 Laurie Corners, Kristinburgh, AK 45425', 254839069);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925070, 'Aaron Morgan', to_date('23-04-2009', 'dd-mm-yyyy'), '10', '423 Christopher Plains Apt. 730, South Timothy, IA 61419', 254839070);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925071, 'Jennifer Combs', to_date('18-09-2014', 'dd-mm-yyyy'), '5', '768 Roy Keys, North Nicole, DC 72208', 254839071);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925072, 'Kirk Wright', to_date('10-10-2014', 'dd-mm-yyyy'), '5', '62623 Wagner Garden, Leahton, TN 06816', 254839072);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925073, 'Luke Newton', to_date('16-02-2013', 'dd-mm-yyyy'), '6', '2395 Raymond Forest, Blakeport, OK 16420', 254839073);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925074, 'Kenneth Nelson', to_date('13-04-2010', 'dd-mm-yyyy'), '9', '2541 Sarah Prairie Apt. 134, Robertborough, HI 87146', 254839074);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925075, 'Mr. John Yoder', to_date('26-08-2016', 'dd-mm-yyyy'), '3', 'USS Simmons, FPO AA 88445', 254839075);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925076, 'Jenna Keith', to_date('01-12-2007', 'dd-mm-yyyy'), '12', 'PSC 6312, Box 0854, APO AA 59631', 254839076);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925077, 'Christopher Franklin', to_date('21-09-2011', 'dd-mm-yyyy'), '8', '00264 Zimmerman Branch Suite 111, Batesview, WY 25997', 254839077);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925078, 'Gloria Johnson', to_date('23-05-2009', 'dd-mm-yyyy'), '10', '06642 Adam Shore Apt. 862, New Connorfort, PR 64045', 254839078);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925079, 'Tracy Edwards', to_date('28-09-2007', 'dd-mm-yyyy'), '12', '39456 Levine Lake, Port Karenborough, CO 06860', 254839079);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925080, 'Adam Erickson', to_date('11-10-2017', 'dd-mm-yyyy'), '2', '394 Kenneth Road Apt. 556, Lopezfurt, RI 09119', 254839080);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925081, 'Kara Jones', to_date('16-10-2009', 'dd-mm-yyyy'), '10', '35944 Bill Manor Suite 673, Port Anthony, WA 94080', 254839081);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925082, 'Krista Arroyo', to_date('07-12-2014', 'dd-mm-yyyy'), '5', '50287 Estrada Union Suite 935, Flynnborough, ID 45282', 254839082);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925083, 'Virginia Turner', to_date('26-09-2011', 'dd-mm-yyyy'), '8', '42559 Christopher Village Suite 371, Lake Christine, NV 06725', 254839083);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925084, 'Andrea Ferguson', to_date('13-03-2015', 'dd-mm-yyyy'), '4', '572 Alan Spur, Briannatown, NM 31815', 254839084);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925085, 'Tracy Powell', to_date('09-06-2018', 'dd-mm-yyyy'), '1', '083 Shelby Canyon Suite 542, Kimberlyside, IL 03555', 254839085);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925086, 'Justin Allen', to_date('05-10-2017', 'dd-mm-yyyy'), '2', '4501 Alvarado Overpass, Lake James, TN 26641', 254839086);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925087, 'Ms. Misty Miller DVM', to_date('31-10-2009', 'dd-mm-yyyy'), '10', '90800 Barajas Road Suite 394, Andrewport, FL 02314', 254839087);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925088, 'Michael Morgan', to_date('26-05-2013', 'dd-mm-yyyy'), '6', '0884 Mendoza Loaf, North Scottmouth, AR 87324', 254839088);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925089, 'Curtis Reed', to_date('22-05-2016', 'dd-mm-yyyy'), '3', '86961 Anderson Wall, Kelseyborough, AS 19184', 254839089);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925090, 'Misty Jackson', to_date('31-07-2015', 'dd-mm-yyyy'), '4', '2493 Smith Manors, East Kevinmouth, MH 25922', 254839090);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925091, 'Greg Young', to_date('06-01-2017', 'dd-mm-yyyy'), '2', '5825 Rivas Knoll, East Shirley, MI 16831', 254839091);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925092, 'Jordan Lee DDS', to_date('30-04-2012', 'dd-mm-yyyy'), '7', '02649 Crystal Island, Sydneytown, CA 43077', 254839092);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925093, 'William Bryant', to_date('10-07-2017', 'dd-mm-yyyy'), '2', '71404 Charles Path, Gonzalesport, HI 53514', 254839093);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925094, 'Jeffrey Lee', to_date('19-12-2007', 'dd-mm-yyyy'), '12', '9621 Stevens Lane, North Kellifort, NV 82561', 254839094);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925095, 'Nicole Doyle', to_date('25-08-2008', 'dd-mm-yyyy'), '11', '2605 Parks Oval Apt. 984, Davidmouth, FM 91726', 254839095);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925096, 'Anita Crane', to_date('08-01-2013', 'dd-mm-yyyy'), '6', '0064 Samuel Crossing Apt. 644, North Kristinechester, NH 87457', 254839096);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925097, 'Jill Martin', to_date('03-05-2015', 'dd-mm-yyyy'), '4', '17884 Jessica Terrace Suite 398, Bowmanside, MI 16488', 254839097);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925098, 'Misty Guerra', to_date('10-02-2012', 'dd-mm-yyyy'), '7', '899 Linda Via, Williamton, WY 11842', 254839098);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925099, 'Steven Bishop', to_date('15-06-2016', 'dd-mm-yyyy'), '3', 'PSC 2180, Box 2164, APO AA 34784', 254839099);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925100, 'Edward Cruz', to_date('13-09-2018', 'dd-mm-yyyy'), '1', '52809 Victoria Bypass, Nguyenville, NJ 34975', 254839100);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925101, 'Julie Shepard', to_date('11-06-2008', 'dd-mm-yyyy'), '11', '6867 Mcpherson Canyon Apt. 645, Stephenborough, CO 39672', 254839101);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925102, 'Morgan Wilson', to_date('14-11-2016', 'dd-mm-yyyy'), '3', '17635 Hudson Overpass Suite 754, West Jonathanmouth, OR 28850', 254839102);
commit;
prompt 500 records committed...
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925103, 'Tina Miller', to_date('07-10-2009', 'dd-mm-yyyy'), '10', '1475 Carter Mills Suite 120, Reneeside, NJ 69854', 254839103);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925104, 'Diana Black', to_date('13-09-2012', 'dd-mm-yyyy'), '7', '22660 Darlene Coves Suite 126, South Lindseyhaven, OH 95393', 254839104);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925105, 'Suzanne Coleman', to_date('10-11-2009', 'dd-mm-yyyy'), '10', '27128 Carrie Plaza Suite 601, Lake Anthony, MT 16810', 254839105);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925106, 'Andrea Soto', to_date('19-01-2012', 'dd-mm-yyyy'), '7', '46399 Long Course, New Traceyton, PR 78628', 254839106);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925107, 'Lee Warren', to_date('01-02-2012', 'dd-mm-yyyy'), '7', '9233 Michael Cape Apt. 099, Sextonville, WI 50709', 254839107);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925108, 'Bryan Mcfarland', to_date('17-08-2010', 'dd-mm-yyyy'), '9', '54530 Pamela Extension Suite 661, Lake Ianburgh, OH 30320', 254839108);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925109, 'Nicole Cain', to_date('05-02-2011', 'dd-mm-yyyy'), '8', '85945 Fowler Fort, Fletchermouth, NY 08592', 254839109);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925110, 'Alexandra Johnson', to_date('15-11-2009', 'dd-mm-yyyy'), '10', '2431 Rich Square, North Stevenfurt, AS 77282', 254839110);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925111, 'Lisa Reyes', to_date('27-02-2008', 'dd-mm-yyyy'), '11', 'USS Pitts, FPO AP 91394', 254839111);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925112, 'Mary Patrick', to_date('22-01-2018', 'dd-mm-yyyy'), '1', '843 Smith Bypass, South Bradley, ME 62482', 254839112);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925113, 'William Cain', to_date('08-10-2018', 'dd-mm-yyyy'), '1', 'PSC 9917, Box 9256, APO AE 78071', 254839113);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925114, 'Timothy Woods', to_date('05-02-2008', 'dd-mm-yyyy'), '11', '603 Lauren Lodge, New Tiffanyport, IA 01295', 254839114);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925115, 'John Rangel', to_date('19-08-2007', 'dd-mm-yyyy'), '12', '762 Sandoval Prairie, Frenchchester, VA 68541', 254839115);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925116, 'Jacob Rodriguez', to_date('23-11-2012', 'dd-mm-yyyy'), '7', '5778 Wilkinson Pass Apt. 955, North Lindaberg, MN 82964', 254839116);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925117, 'Christopher Lane', to_date('15-11-2016', 'dd-mm-yyyy'), '3', '014 Brooks Passage, Barkermouth, AZ 68717', 254839117);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925118, 'Sarah Wallace', to_date('30-11-2007', 'dd-mm-yyyy'), '12', '54895 White River, Mercedesmouth, AZ 04858', 254839118);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925119, 'Andrew Armstrong', to_date('11-05-2011', 'dd-mm-yyyy'), '8', '1772 Mitchell Route Suite 511, North James, AR 82759', 254839119);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925120, 'John Weaver', to_date('21-08-2010', 'dd-mm-yyyy'), '9', '71469 Grant Hills, Williamfurt, IA 32126', 254839120);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925121, 'Jacob Schmitt', to_date('24-08-2014', 'dd-mm-yyyy'), '5', '48275 Ortiz Island Apt. 031, Leslieland, MI 51828', 254839121);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925122, 'Kelly Elliott', to_date('22-03-2008', 'dd-mm-yyyy'), '11', '3941 Ryan Brooks, Ortegamouth, MH 93430', 254839122);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925123, 'Amy Allen', to_date('02-04-2011', 'dd-mm-yyyy'), '8', '16057 Jeremy Plains Apt. 228, Kellyport, WI 95273', 254839123);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925124, 'Dominique Perez', to_date('01-11-2012', 'dd-mm-yyyy'), '7', '916 Brandy Corners Suite 772, Millstown, MI 21519', 254839124);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925125, 'Kathy Gonzalez', to_date('21-03-2012', 'dd-mm-yyyy'), '7', '41281 Moreno Summit Apt. 125, Port Kelly, NH 77466', 254839125);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925126, 'Natalie Avery', to_date('02-02-2016', 'dd-mm-yyyy'), '3', '008 Amanda Station, Davidshire, WI 88431', 254839126);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925127, 'Harold Ramirez', to_date('04-07-2008', 'dd-mm-yyyy'), '11', '803 Adam Tunnel Apt. 224, Millerland, VA 48435', 254839127);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925128, 'Crystal Gross', to_date('15-07-2012', 'dd-mm-yyyy'), '7', '98116 Knight Bridge Suite 257, Ryanville, KY 71427', 254839128);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925129, 'Rachel Nelson', to_date('26-09-2014', 'dd-mm-yyyy'), '5', '8502 Edwards Spurs Apt. 018, Courtneyfurt, AL 04473', 254839129);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925130, 'Pamela Hudson', to_date('25-10-2016', 'dd-mm-yyyy'), '3', '463 Sarah Passage Apt. 432, West Cheryl, OR 99782', 254839130);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925131, 'Stephen Johnson', to_date('26-03-2007', 'dd-mm-yyyy'), '12', '4869 Daryl Valley, New Raymondmouth, NM 63989', 254839131);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925132, 'Lisa Palmer', to_date('20-04-2012', 'dd-mm-yyyy'), '7', '821 Avery Mission Apt. 495, Kaylaview, GA 58745', 254839132);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925133, 'Alice White', to_date('30-03-2014', 'dd-mm-yyyy'), '5', '83615 Knight Plains, Barnettbury, CO 39950', 254839133);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925134, 'Jessica Sullivan', to_date('01-07-2014', 'dd-mm-yyyy'), '5', '20868 Tony Fords Apt. 779, Patriciatown, PW 81207', 254839134);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925135, 'Madison Johnson', to_date('11-12-2007', 'dd-mm-yyyy'), '12', '8947 Nichole Spring, South Cynthialand, CA 66461', 254839135);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925136, 'Paula Daugherty', to_date('14-10-2016', 'dd-mm-yyyy'), '3', '52640 Mark Drives, Melissachester, FL 91068', 254839136);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925137, 'Sarah Brock', to_date('02-01-2015', 'dd-mm-yyyy'), '4', '54695 Gerald Pass Apt. 292, Port Christinetown, FM 28102', 254839137);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925138, 'Rebecca Garner', to_date('13-03-2011', 'dd-mm-yyyy'), '8', '4696 Pamela Lock Suite 003, South Madisonmouth, LA 76549', 254839138);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925139, 'Jeffrey Scott', to_date('14-02-2013', 'dd-mm-yyyy'), '6', '0918 Roach Vista, Piercemouth, DC 86572', 254839139);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925140, 'John Gutierrez', to_date('07-05-2018', 'dd-mm-yyyy'), '1', '974 Mark Way Suite 624, Port Danielle, CO 07061', 254839140);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925141, 'Amy Reed', to_date('10-08-2016', 'dd-mm-yyyy'), '3', '520 Garrett Plaza, Robinsonview, KY 99654', 254839141);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925142, 'Jessica Montgomery', to_date('31-01-2013', 'dd-mm-yyyy'), '6', '11726 Brennan Knoll Apt. 528, Stevenville, HI 36440', 254839142);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925143, 'Lauren Brown', to_date('16-11-2012', 'dd-mm-yyyy'), '7', 'PSC 0067, Box 0936, APO AA 90777', 254839143);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925144, 'Beverly Rojas', to_date('25-11-2010', 'dd-mm-yyyy'), '9', '3572 Hahn Mount, Peterville, DE 92621', 254839144);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925145, 'Jessica Daniel', to_date('18-11-2009', 'dd-mm-yyyy'), '10', '032 Adrian Burgs, Doughertyfurt, NE 63333', 254839145);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925146, 'Christopher Montgomery', to_date('18-08-2018', 'dd-mm-yyyy'), '1', '65537 Latoya Field Apt. 825, West Andrew, AS 17048', 254839146);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925147, 'Sara Taylor', to_date('01-07-2012', 'dd-mm-yyyy'), '7', '10116 Laura Spurs, Burnsville, CO 42426', 254839147);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925148, 'Robert Briggs', to_date('06-08-2010', 'dd-mm-yyyy'), '9', '9031 Gonzalez Ridge Apt. 027, Chaseview, GA 94033', 254839148);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925149, 'Thomas Le', to_date('17-12-2017', 'dd-mm-yyyy'), '2', '5243 Freeman Forks, North Ashleyview, CT 32377', 254839149);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925150, 'Mr. Ryan Harvey', to_date('05-04-2013', 'dd-mm-yyyy'), '6', 'USCGC Greene, FPO AP 49708', 254839150);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925151, 'Kathryn Thomas', to_date('20-09-2007', 'dd-mm-yyyy'), '12', '011 Todd Ports Suite 028, Margaretberg, LA 42467', 254839151);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925152, 'Crystal Garcia', to_date('29-09-2016', 'dd-mm-yyyy'), '3', '20881 Austin Park Suite 295, Annetteton, PW 92431', 254839152);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925153, 'Christopher Yates', to_date('04-06-2013', 'dd-mm-yyyy'), '6', '82167 Smith Rest Suite 205, North Holly, IN 01752', 254839153);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925154, 'Jessica Walsh', to_date('09-03-2007', 'dd-mm-yyyy'), '12', 'PSC 8806, Box 3692, APO AE 60863', 254839154);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925155, 'Kara West', to_date('20-01-2008', 'dd-mm-yyyy'), '11', '6690 Xavier Mountain, North Kimberlyburgh, MN 94074', 254839155);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925156, 'Brett Bean', to_date('17-06-2008', 'dd-mm-yyyy'), '11', '5972 Isabel Shores, Lake Jose, ID 53979', 254839156);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925157, 'Kaitlyn King', to_date('25-12-2014', 'dd-mm-yyyy'), '5', '69049 Randall Row Apt. 211, Diazmouth, IA 63431', 254839157);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925158, 'Ryan Padilla', to_date('15-04-2007', 'dd-mm-yyyy'), '12', '46156 Shirley Pike Suite 724, Lake Suzanneburgh, MP 26894', 254839158);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925159, 'Ernest Harper', to_date('03-02-2015', 'dd-mm-yyyy'), '4', 'USNV Mclean, FPO AE 20155', 254839159);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925160, 'Marcus Matthews', to_date('09-12-2013', 'dd-mm-yyyy'), '6', '1457 Brent Prairie, New Matthewmouth, KS 69793', 254839160);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925161, 'Michelle Gray', to_date('13-03-2017', 'dd-mm-yyyy'), '2', '32020 William Gardens, Michaelmouth, AR 74618', 254839161);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925162, 'Steve Diaz', to_date('28-03-2014', 'dd-mm-yyyy'), '5', '55410 Todd Isle, Richardside, WA 18625', 254839162);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925163, 'Matthew Johnson', to_date('12-08-2014', 'dd-mm-yyyy'), '5', '11817 Terry Parkways Suite 326, Lake Micheal, VI 74505', 254839163);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925164, 'Ashlee Myers', to_date('10-01-2013', 'dd-mm-yyyy'), '6', '54403 Gonzalez Trail, Briannaborough, ME 61833', 254839164);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925165, 'Ralph Martin', to_date('11-10-2017', 'dd-mm-yyyy'), '2', '91733 William Valleys Suite 276, South Madisonchester, CO 80756', 254839165);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925166, 'Daniel Levy', to_date('20-07-2010', 'dd-mm-yyyy'), '9', 'USNS Cobb, FPO AE 55240', 254839166);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925167, 'Daniel Powell', to_date('03-02-2012', 'dd-mm-yyyy'), '7', '4727 Alexander Mews, South Phillip, AL 08616', 254839167);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925168, 'Gerald Sosa', to_date('23-01-2010', 'dd-mm-yyyy'), '9', '8592 Anthony Curve, New Brian, FL 27870', 254839168);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925169, 'Mark Hill', to_date('15-06-2014', 'dd-mm-yyyy'), '5', '68304 Johnston Underpass Suite 061, North Janetbury, KY 89438', 254839169);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925170, 'Drew Rowland', to_date('04-07-2017', 'dd-mm-yyyy'), '2', 'Unit 3086 Box 2632, DPO AP 99019', 254839170);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925171, 'Caleb Ballard', to_date('24-06-2013', 'dd-mm-yyyy'), '6', '4581 Prince Common Suite 870, Port Kimberly, HI 24611', 254839171);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925172, 'Emily Willis', to_date('13-05-2012', 'dd-mm-yyyy'), '7', 'Unit 4520 Box 8535, DPO AA 13685', 254839172);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925173, 'Emily Daniels', to_date('30-01-2018', 'dd-mm-yyyy'), '1', '271 Rasmussen Ridges Apt. 452, Fitzgeraldfort, PA 57870', 254839173);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925174, 'Jeffery Lambert', to_date('31-08-2017', 'dd-mm-yyyy'), '2', '2539 Cole Points Suite 331, New Leslie, AR 00566', 254839174);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925175, 'Henry Flores', to_date('11-08-2013', 'dd-mm-yyyy'), '6', '72629 Harris Junction, New Raymond, KY 97720', 254839175);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925176, 'Aaron Cunningham', to_date('14-07-2008', 'dd-mm-yyyy'), '11', '5254 Shannon Cliffs, West Logan, ME 35801', 254839176);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925177, 'Whitney Lin', to_date('23-11-2012', 'dd-mm-yyyy'), '7', '66053 Joshua Ridges, West Jeffreytown, NV 73325', 254839177);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925178, 'Phillip Lopez', to_date('12-07-2008', 'dd-mm-yyyy'), '11', '199 Walters Loaf Apt. 717, Codyton, TN 71845', 254839178);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925179, 'Raymond Allen', to_date('26-09-2008', 'dd-mm-yyyy'), '11', '5668 Heather Springs, East Theresaville, RI 55646', 254839179);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925180, 'Hannah Martin', to_date('20-11-2016', 'dd-mm-yyyy'), '3', '57788 Koch Fords, East Vincentstad, MN 62412', 254839180);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925181, 'Richard Carrillo', to_date('10-12-2014', 'dd-mm-yyyy'), '5', '7108 Oneill Plains Apt. 002, South Phillipbury, DE 48819', 254839181);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925182, 'Mary Giles', to_date('04-05-2014', 'dd-mm-yyyy'), '5', '43342 Craig Neck, North Brittany, NH 83713', 254839182);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925183, 'Ricky Grant', to_date('07-02-2016', 'dd-mm-yyyy'), '3', '009 John Prairie, Rebeccashire, AL 34209', 254839183);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925184, 'Christopher Harrison', to_date('19-10-2015', 'dd-mm-yyyy'), '4', '3634 Mclaughlin Fall, Port Ginamouth, DE 15031', 254839184);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925185, 'Brandon Adams', to_date('18-02-2013', 'dd-mm-yyyy'), '6', '3198 Boyd Springs, South Emily, KY 37180', 254839185);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925186, 'Kevin Hernandez', to_date('31-12-2012', 'dd-mm-yyyy'), '7', '48363 Banks Lodge, Angelaside, PR 92028', 254839186);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925187, 'Kristin Huynh', to_date('23-11-2009', 'dd-mm-yyyy'), '10', '9675 Christina Loop Suite 618, Lake Christophermouth, LA 10494', 254839187);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925188, 'Michael Wallace', to_date('31-01-2012', 'dd-mm-yyyy'), '7', '7568 Eric Glens Apt. 015, Kennethbury, MT 36843', 254839188);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925189, 'Rebecca Wheeler', to_date('12-04-2016', 'dd-mm-yyyy'), '3', '35664 Campbell Mills Suite 797, South Ryan, VA 94908', 254839189);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925190, 'Tony Diaz', to_date('02-02-2017', 'dd-mm-yyyy'), '2', '07071 Brennan Fields, New Howardtown, NY 65425', 254839190);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925191, 'Alejandro Duke', to_date('25-05-2016', 'dd-mm-yyyy'), '3', '647 Christina Cape, South Justinmouth, LA 51303', 254839191);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925192, 'Jessica Dominguez', to_date('01-05-2007', 'dd-mm-yyyy'), '12', '8560 Allen Viaduct, New Paige, AR 31567', 254839192);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925193, 'Mark Rice', to_date('24-05-2010', 'dd-mm-yyyy'), '9', 'PSC 5039, Box 3003, APO AE 57149', 254839193);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925194, 'Janice Brandt', to_date('05-12-2017', 'dd-mm-yyyy'), '2', '222 Wilson Locks Apt. 511, North Antoniofurt, AZ 10601', 254839194);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925195, 'Andrea Coffey', to_date('23-03-2014', 'dd-mm-yyyy'), '5', '35304 Michele Way, East Stacy, MA 06422', 254839195);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925196, 'Jaime Carrillo', to_date('14-03-2018', 'dd-mm-yyyy'), '1', '1424 Lucas Gateway, West Heathershire, FM 97060', 254839196);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925197, 'Melissa Green', to_date('17-02-2013', 'dd-mm-yyyy'), '6', '0159 Bryan Fork, South Antonio, AL 77902', 254839197);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925198, 'Samantha Vargas', to_date('09-07-2009', 'dd-mm-yyyy'), '10', '986 Julie Place Suite 713, Lake Carrie, DC 92677', 254839198);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925199, 'Michael Smith', to_date('05-09-2018', 'dd-mm-yyyy'), '1', '12072 Tara Meadow, South Vickiberg, NC 88724', 254839199);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925200, 'Todd Combs', to_date('22-11-2013', 'dd-mm-yyyy'), '6', '4000 Ford Stream, North Anthonyshire, FL 52473', 254839200);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925201, 'Cody Forbes', to_date('24-02-2007', 'dd-mm-yyyy'), '12', '58012 Susan Green Suite 209, Annchester, AK 80728', 254839201);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925202, 'Dana Cruz', to_date('19-05-2014', 'dd-mm-yyyy'), '5', '5223 White Trail, Cassandraville, PA 65126', 254839202);
commit;
prompt 600 records committed...
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925203, 'Hannah Irwin', to_date('12-10-2018', 'dd-mm-yyyy'), '1', '517 Kristin Keys, New Karen, PA 99625', 254839203);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925204, 'Shannon Bishop', to_date('25-01-2016', 'dd-mm-yyyy'), '3', 'PSC 3912, Box 3908, APO AE 06331', 254839204);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925205, 'Ronald Payne', to_date('09-01-2017', 'dd-mm-yyyy'), '2', '7412 Bass Junctions, New Lindaborough, PA 01299', 254839205);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925206, 'Joanna Weeks', to_date('24-06-2012', 'dd-mm-yyyy'), '7', '146 Pam Extension Suite 970, Walkerport, NE 58404', 254839206);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925207, 'Christina Sanchez', to_date('17-08-2008', 'dd-mm-yyyy'), '11', '1605 Terry Manors Apt. 996, South Lisaborough, AL 69197', 254839207);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925208, 'Aaron Sullivan', to_date('05-07-2007', 'dd-mm-yyyy'), '12', '3067 Baker Summit, Hallview, NE 78449', 254839208);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925209, 'Robert Chase', to_date('19-05-2017', 'dd-mm-yyyy'), '2', '42167 Moore Forest Apt. 551, North Lauren, MN 83277', 254839209);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925210, 'Kristen Gordon', to_date('09-01-2013', 'dd-mm-yyyy'), '6', '746 Denise Points, Lake Ryanview, FL 40920', 254839210);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925211, 'Sandy Burton', to_date('05-05-2007', 'dd-mm-yyyy'), '12', '15883 Douglas Common, Rojasfurt, TN 39014', 254839211);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925212, 'Julie Hudson', to_date('23-08-2013', 'dd-mm-yyyy'), '6', '887 Lauren Isle Suite 173, North Thomasborough, LA 30285', 254839212);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925213, 'Mark Ellison', to_date('03-01-2009', 'dd-mm-yyyy'), '10', '1433 Dawn Burg Suite 176, West Victoriastad, CA 42461', 254839213);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925214, 'Jesus Bradley', to_date('01-12-2016', 'dd-mm-yyyy'), '3', '5321 Barbara Shores Suite 109, Port Josemouth, GA 03365', 254839214);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925215, 'Nicole Robinson', to_date('01-01-2008', 'dd-mm-yyyy'), '11', '4519 Gregg Union, Davidsonshire, IL 83403', 254839215);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925216, 'Matthew Collier', to_date('16-11-2016', 'dd-mm-yyyy'), '3', '912 Kayla Village Apt. 910, Campbellshire, CT 32778', 254839216);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925217, 'Caitlyn Shea', to_date('26-04-2017', 'dd-mm-yyyy'), '2', '80072 Mark Green, Port Veronica, GA 29400', 254839217);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925218, 'Kevin Wagner', to_date('30-03-2015', 'dd-mm-yyyy'), '4', 'PSC 0860, Box 0817, APO AP 51693', 254839218);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925219, 'Zachary Goodwin', to_date('18-06-2011', 'dd-mm-yyyy'), '8', '9712 Linda Unions, Catherinemouth, PR 48016', 254839219);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925220, 'Deborah Gross', to_date('17-04-2008', 'dd-mm-yyyy'), '11', 'Unit 4591 Box 6882, DPO AA 95735', 254839220);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925221, 'Paige Huang', to_date('31-03-2013', 'dd-mm-yyyy'), '6', 'USCGC Bailey, FPO AP 54517', 254839221);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925222, 'Lisa Johnson', to_date('06-04-2016', 'dd-mm-yyyy'), '3', '6384 Fernandez Burg Suite 981, West John, TX 94920', 254839222);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925223, 'Jeffrey Murphy', to_date('28-06-2008', 'dd-mm-yyyy'), '11', '9875 Ayala Villages Apt. 329, East Thomasmouth, AL 03342', 254839223);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925224, 'Sandra Harmon', to_date('31-08-2008', 'dd-mm-yyyy'), '11', '793 Kelly Cove, Nicholashaven, VA 11084', 254839224);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925225, 'Richard Mccarthy', to_date('05-06-2010', 'dd-mm-yyyy'), '9', '500 Ralph Row, South Pamelabury, WY 02187', 254839225);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925226, 'John Brown', to_date('14-07-2007', 'dd-mm-yyyy'), '12', '186 Christine Via, Davidport, IA 80562', 254839226);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925227, 'Kimberly Mora', to_date('19-05-2015', 'dd-mm-yyyy'), '4', '677 Johnson Divide, Alejandrobury, GU 37422', 254839227);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925228, 'Shelley Obrien', to_date('25-01-2007', 'dd-mm-yyyy'), '12', '3915 Johnston Ville Suite 921, Russellburgh, CT 92772', 254839228);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925229, 'Karina Luna', to_date('02-09-2009', 'dd-mm-yyyy'), '10', '530 Diane Lock Apt. 463, South Adamburgh, NV 98973', 254839229);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925230, 'William Branch', to_date('25-06-2014', 'dd-mm-yyyy'), '5', '7976 Ryan Walk Suite 916, Julianside, NV 15905', 254839230);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925231, 'Maria Bailey', to_date('02-08-2015', 'dd-mm-yyyy'), '4', '8784 Mason Port Apt. 040, Brettborough, OK 65865', 254839231);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925232, 'Ashley Brown', to_date('14-05-2015', 'dd-mm-yyyy'), '4', '0922 Anthony Oval, Geraldview, PR 57026', 254839232);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925233, 'Justin Thomas', to_date('23-02-2013', 'dd-mm-yyyy'), '6', 'USNV Jones, FPO AE 08599', 254839233);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925234, 'Christopher Allen', to_date('20-10-2017', 'dd-mm-yyyy'), '2', '100 Mcintyre Courts, New Stephen, SC 23166', 254839234);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925235, 'Wayne Williams', to_date('10-02-2008', 'dd-mm-yyyy'), '11', '744 Taylor Parkway Suite 866, South Margaretchester, FL 38791', 254839235);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925236, 'Brittney Potts', to_date('08-01-2016', 'dd-mm-yyyy'), '3', '32285 Blackburn Pass Suite 158, Lake Christopher, NV 43666', 254839236);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925237, 'Anna Ayala', to_date('06-07-2007', 'dd-mm-yyyy'), '12', '3923 Hall Tunnel Apt. 952, New Breanna, VA 19676', 254839237);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925238, 'Jonathan Reyes', to_date('20-12-2011', 'dd-mm-yyyy'), '8', '4002 Turner Springs Apt. 418, South Mary, HI 88712', 254839238);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925239, 'Alicia Hall', to_date('20-08-2007', 'dd-mm-yyyy'), '12', '51343 Burke Lake, Johnhaven, IN 62532', 254839239);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925240, 'Stephen Zimmerman', to_date('07-01-2011', 'dd-mm-yyyy'), '8', '4588 Cook Spurs Apt. 576, South Ryan, ND 46342', 254839240);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925241, 'Erik Robinson', to_date('17-02-2008', 'dd-mm-yyyy'), '11', '2308 Estrada Crescent Apt. 677, West Mark, LA 22986', 254839241);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925242, 'Victor Lloyd', to_date('18-01-2008', 'dd-mm-yyyy'), '11', 'USNV Graham, FPO AE 97451', 254839242);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925243, 'Jacqueline Walton', to_date('29-03-2007', 'dd-mm-yyyy'), '12', '578 Chase Stravenue, Chanmouth, DE 35694', 254839243);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925244, 'David Mejia', to_date('05-05-2016', 'dd-mm-yyyy'), '3', '47894 Richard Stream Suite 107, Amandabury, ME 49650', 254839244);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925245, 'Thomas Carr', to_date('02-04-2014', 'dd-mm-yyyy'), '5', '0044 Herman Cove, Loweview, DC 80962', 254839245);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925246, 'Erik Jacobs', to_date('08-03-2013', 'dd-mm-yyyy'), '6', 'Unit 1730 Box 0754, DPO AE 93868', 254839246);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925247, 'Tonya Martinez', to_date('21-12-2018', 'dd-mm-yyyy'), '1', '628 Gonzalez Loop, Crawfordville, AS 06582', 254839247);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925248, 'Ronald Juarez', to_date('27-07-2017', 'dd-mm-yyyy'), '2', '75495 Nielsen Estates Apt. 293, Taylorstad, IA 88164', 254839248);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925249, 'Laura Bell', to_date('26-04-2013', 'dd-mm-yyyy'), '6', '8370 Gerald Roads, Wrighttown, UT 97936', 254839249);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925250, 'Luke Pierce', to_date('21-08-2007', 'dd-mm-yyyy'), '12', '062 Perez Parkways, Watsonside, IN 24578', 254839250);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925251, 'Preston Hall', to_date('25-08-2013', 'dd-mm-yyyy'), '6', '5748 Janice Viaduct Suite 202, East Allisontown, MD 04940', 254839251);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925252, 'Thomas Kaiser', to_date('29-01-2012', 'dd-mm-yyyy'), '7', 'USS Mccormick, FPO AE 68824', 254839252);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925253, 'Mark Boyle', to_date('26-12-2009', 'dd-mm-yyyy'), '10', '4334 Michael Courts, West Marychester, NH 35389', 254839253);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925254, 'Jamie Burns', to_date('17-05-2015', 'dd-mm-yyyy'), '4', '57824 Jennifer Turnpike Apt. 424, New James, PW 83194', 254839254);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925255, 'Gina Ramirez', to_date('09-10-2009', 'dd-mm-yyyy'), '10', '6894 Alvarado Trafficway Apt. 249, Petersville, CO 92805', 254839255);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925256, 'Jasmine Gross', to_date('27-08-2008', 'dd-mm-yyyy'), '11', '502 Deleon Vista Apt. 302, North Michellefurt, DC 37597', 254839256);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925257, 'Jennifer Hernandez', to_date('27-11-2007', 'dd-mm-yyyy'), '12', '21908 Randall Forges Suite 167, Patriciachester, AK 98164', 254839257);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925258, 'Kristin King', to_date('15-08-2013', 'dd-mm-yyyy'), '6', '9912 Myers Port Suite 663, Travisview, NJ 10023', 254839258);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925259, 'Catherine Wolfe', to_date('18-01-2007', 'dd-mm-yyyy'), '12', '80092 Elliott Radial, Donaldsonville, RI 40145', 254839259);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925260, 'David Conley', to_date('25-03-2016', 'dd-mm-yyyy'), '3', 'PSC 1559, Box 0774, APO AE 23244', 254839260);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925261, 'Michele Jones', to_date('03-11-2013', 'dd-mm-yyyy'), '6', '10619 Anna Ways, Anthonyville, MH 30463', 254839261);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925262, 'Amanda Mcmahon', to_date('22-05-2017', 'dd-mm-yyyy'), '2', '39347 Bishop Centers, West Norma, DC 47026', 254839262);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925263, 'Katie Sanders', to_date('08-07-2010', 'dd-mm-yyyy'), '9', '947 Finley Forges, Davenportburgh, NH 76420', 254839263);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925264, 'Brandon Carroll', to_date('26-01-2011', 'dd-mm-yyyy'), '8', '37378 Amber Centers Apt. 268, Gonzalezborough, OR 48343', 254839264);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925265, 'Emma Robbins', to_date('05-02-2007', 'dd-mm-yyyy'), '12', '890 Tami Roads Suite 477, Josephberg, WA 62813', 254839265);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925266, 'Daniel Martinez', to_date('31-08-2008', 'dd-mm-yyyy'), '11', 'USNS Patton, FPO AE 34857', 254839266);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925267, 'Julian Peterson', to_date('11-02-2007', 'dd-mm-yyyy'), '12', '81454 Devin Squares, Jesseville, MA 46332', 254839267);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925268, 'Dylan Willis', to_date('14-10-2014', 'dd-mm-yyyy'), '5', '8276 Brenda Stravenue, Emilychester, NY 08914', 254839268);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925269, 'Aaron Baker', to_date('27-04-2010', 'dd-mm-yyyy'), '9', '1637 Gamble Manor, West Alicechester, MT 92551', 254839269);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925270, 'Valerie Liu', to_date('30-05-2015', 'dd-mm-yyyy'), '4', '041 Stark Mountain, South Gina, MI 57052', 254839270);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925271, 'Anna Little', to_date('22-11-2018', 'dd-mm-yyyy'), '1', '774 Kathleen Trace, North Hannah, AS 15566', 254839271);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925272, 'Amy Waller', to_date('24-06-2015', 'dd-mm-yyyy'), '4', '446 Michael Prairie, West Matthew, NJ 71280', 254839272);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925273, 'Dalton Porter', to_date('31-12-2007', 'dd-mm-yyyy'), '12', '8461 Jennifer Village Apt. 405, Lake Carolynmouth, VA 43855', 254839273);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925274, 'Miss Alison Morales', to_date('10-11-2017', 'dd-mm-yyyy'), '2', '1976 Lambert Club Apt. 747, East Zachary, IL 12157', 254839274);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925275, 'Tyler Watts', to_date('20-03-2017', 'dd-mm-yyyy'), '2', '255 Hoover Neck Suite 461, South Andrea, OK 30797', 254839275);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925276, 'Nathaniel Wheeler', to_date('08-10-2018', 'dd-mm-yyyy'), '1', '7539 Andrews Mission Suite 039, Heatherhaven, SD 05635', 254839276);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925277, 'Jack Gibson', to_date('13-11-2017', 'dd-mm-yyyy'), '2', '27816 Shelly Passage Suite 100, East Devon, CT 44305', 254839277);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925278, 'Kristen Foster', to_date('27-11-2015', 'dd-mm-yyyy'), '4', '17872 Jacqueline Oval, West Brandonchester, NY 58984', 254839278);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925279, 'Amber Lowe', to_date('17-05-2011', 'dd-mm-yyyy'), '8', '54799 Kimberly Locks Apt. 071, West Valerie, AK 55775', 254839279);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925280, 'Elizabeth Peterson', to_date('09-01-2013', 'dd-mm-yyyy'), '6', '5435 Zamora Prairie, South Kyle, NV 65732', 254839280);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925281, 'Jason Bell', to_date('23-12-2016', 'dd-mm-yyyy'), '3', '99048 Padilla Bridge, Jackbury, GU 69286', 254839281);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925282, 'Jennifer Anderson', to_date('01-01-2013', 'dd-mm-yyyy'), '6', 'Unit 9146 Box 2368, DPO AP 25413', 254839282);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925283, 'Susan Williams', to_date('22-06-2010', 'dd-mm-yyyy'), '9', '4781 Zachary Harbors Suite 647, East Carol, NH 03678', 254839283);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925284, 'Robert Reyes', to_date('27-03-2014', 'dd-mm-yyyy'), '5', '50877 Wendy Viaduct Suite 085, East Kristenburgh, WA 53865', 254839284);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925285, 'Dustin Harrison', to_date('16-09-2011', 'dd-mm-yyyy'), '8', '032 Rogers Parkways, South Amychester, WV 11256', 254839285);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925286, 'Carl James', to_date('04-08-2015', 'dd-mm-yyyy'), '4', '7702 Jennifer Drive, East Summerfurt, LA 30949', 254839286);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925287, 'Andre Caldwell', to_date('06-09-2014', 'dd-mm-yyyy'), '5', '93304 Smith Haven, Brandonport, UT 23724', 254839287);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925288, 'Catherine Smith', to_date('21-07-2009', 'dd-mm-yyyy'), '10', '782 Jack Glen Suite 198, Jasonland, IA 83943', 254839288);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925289, 'Stacey Miller', to_date('12-06-2018', 'dd-mm-yyyy'), '1', '136 Lang Ramp Apt. 698, Shermanland, FM 01935', 254839289);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925290, 'Douglas Thomas', to_date('17-06-2011', 'dd-mm-yyyy'), '8', '5895 Wagner Turnpike Apt. 000, West Tabithaland, DC 75051', 254839290);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925291, 'Rachel Alvarez', to_date('10-02-2011', 'dd-mm-yyyy'), '8', '112 Micheal Locks, Riveramouth, MH 87104', 254839291);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925292, 'Jeffrey Clark', to_date('07-05-2012', 'dd-mm-yyyy'), '7', '12758 Castillo Summit Suite 877, Smithbury, SD 96045', 254839292);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925293, 'Amanda Owens', to_date('18-09-2018', 'dd-mm-yyyy'), '1', '04824 Jennifer Skyway, East Tony, AR 15918', 254839293);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925294, 'Don Miller', to_date('31-08-2018', 'dd-mm-yyyy'), '1', '066 Eric Locks, New Timothystad, PA 15260', 254839294);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925295, 'Mary Smith', to_date('18-05-2016', 'dd-mm-yyyy'), '3', '8334 Eric Plains Suite 989, West Benjamin, KS 07708', 254839295);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925296, 'Frank Mills', to_date('09-10-2008', 'dd-mm-yyyy'), '11', 'USNV Oliver, FPO AP 53424', 254839296);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925297, 'Kathryn Brown', to_date('25-09-2013', 'dd-mm-yyyy'), '6', 'PSC 6197, Box 0220, APO AA 19055', 254839297);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925298, 'Chelsea Fleming', to_date('02-01-2014', 'dd-mm-yyyy'), '5', '2280 Kenneth Circles, West Tyler, PW 46997', 254839298);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925299, 'Diane Garcia', to_date('07-05-2017', 'dd-mm-yyyy'), '2', '994 Richard Islands Suite 084, Martinchester, AL 38274', 254839299);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925300, 'Sierra Smith', to_date('17-09-2016', 'dd-mm-yyyy'), '3', '3046 Robert Heights Apt. 558, New Nichole, MT 97709', 254839300);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925301, 'Regina Cardenas', to_date('08-01-2015', 'dd-mm-yyyy'), '4', 'USNS Chen, FPO AP 07764', 254839301);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925302, 'Kevin Moore', to_date('27-08-2016', 'dd-mm-yyyy'), '3', 'USNV Howard, FPO AP 00783', 254839302);
commit;
prompt 700 records committed...
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925303, 'Benjamin Gomez', to_date('21-02-2007', 'dd-mm-yyyy'), '12', 'USNV Cox, FPO AA 94268', 254839303);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925304, 'Angela Jones', to_date('05-10-2012', 'dd-mm-yyyy'), '7', '990 Nicholas Terrace, Clarkfurt, MD 81882', 254839304);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925305, 'Steven Walker', to_date('03-08-2016', 'dd-mm-yyyy'), '3', '3451 Jacob Harbors, Rothside, NC 33659', 254839305);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925306, 'Michael Brennan', to_date('12-06-2014', 'dd-mm-yyyy'), '5', 'USNV Anderson, FPO AE 85600', 254839306);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925307, 'Angela Fox DDS', to_date('23-10-2017', 'dd-mm-yyyy'), '2', '010 Crawford Street, Jasmineville, MH 29882', 254839307);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925308, 'Anthony Martinez', to_date('24-03-2018', 'dd-mm-yyyy'), '1', '73040 Roberto Brook, Emilyfort, CT 86333', 254839308);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925309, 'Ricky Ellis', to_date('19-10-2007', 'dd-mm-yyyy'), '12', '03954 Justin Mall, Scottshire, AS 72751', 254839309);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925310, 'Sara Hanson', to_date('05-01-2010', 'dd-mm-yyyy'), '9', '142 Beard Branch, Stonechester, DE 13220', 254839310);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925311, 'Cody Sullivan', to_date('30-11-2014', 'dd-mm-yyyy'), '5', '951 Brown Island Apt. 006, West Ricardo, ME 28207', 254839311);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925312, 'Whitney Pace', to_date('13-11-2008', 'dd-mm-yyyy'), '11', '7565 John Vista, Huntchester, MI 32238', 254839312);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925313, 'Dennis Wood', to_date('03-02-2016', 'dd-mm-yyyy'), '3', '9901 Jones Flat Apt. 739, Maryshire, ND 40408', 254839313);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925314, 'Colin Martinez MD', to_date('16-12-2013', 'dd-mm-yyyy'), '6', '7122 Atkinson Ways Apt. 562, North Williamville, AL 70068', 254839314);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925315, 'Matthew Walker', to_date('11-07-2018', 'dd-mm-yyyy'), '1', 'PSC 6404, Box 4641, APO AE 80474', 254839315);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925316, 'Dennis Monroe', to_date('12-07-2009', 'dd-mm-yyyy'), '10', 'USNV Taylor, FPO AA 33142', 254839316);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925317, 'John Chang', to_date('09-04-2010', 'dd-mm-yyyy'), '9', '69760 Amber Grove Apt. 628, Donaldstad, OR 95457', 254839317);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925318, 'Kimberly Williams', to_date('31-05-2018', 'dd-mm-yyyy'), '1', '76429 Daniel Course Apt. 592, Doughertyville, IN 89708', 254839318);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925319, 'Sherry Harris', to_date('25-11-2015', 'dd-mm-yyyy'), '4', '279 Vasquez Mount, Fitzgeraldfurt, AK 16557', 254839319);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925320, 'Kevin Sloan', to_date('16-04-2009', 'dd-mm-yyyy'), '10', '0796 Larson Dale Suite 694, Dominguezstad, MD 46065', 254839320);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925321, 'Lauren Barnes', to_date('06-09-2013', 'dd-mm-yyyy'), '6', 'PSC 4108, Box 6286, APO AP 91797', 254839321);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925322, 'Julia Smith', to_date('24-11-2014', 'dd-mm-yyyy'), '5', '41772 Benjamin Cape Suite 925, Barrborough, CT 81351', 254839322);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925323, 'Taylor Cook', to_date('08-03-2016', 'dd-mm-yyyy'), '3', '51096 Jennifer Mountains, New Samuelburgh, NM 15786', 254839323);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925324, 'Jason Barnes', to_date('25-09-2018', 'dd-mm-yyyy'), '1', '9242 Williams Grove Suite 813, Hessbury, NJ 49586', 254839324);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925325, 'Gregory Rodriguez', to_date('18-12-2017', 'dd-mm-yyyy'), '2', '9668 Huff Ville, Rhondafurt, HI 80149', 254839325);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925326, 'Jerry James', to_date('27-07-2015', 'dd-mm-yyyy'), '4', '58483 Melissa Turnpike Apt. 933, Adamberg, CO 77426', 254839326);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925327, 'Amanda Carlson', to_date('29-07-2015', 'dd-mm-yyyy'), '4', '999 Shawn Way, Port John, ME 61279', 254839327);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925328, 'Kevin Perkins', to_date('20-09-2011', 'dd-mm-yyyy'), '8', '8853 Timothy Glen, Moralesville, ID 45488', 254839328);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925329, 'Thomas Diaz', to_date('11-03-2012', 'dd-mm-yyyy'), '7', '93714 Kenneth Plaza Apt. 521, Thomasside, KY 88546', 254839329);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925330, 'Joan Singh', to_date('16-01-2007', 'dd-mm-yyyy'), '12', 'USS Robinson, FPO AP 60651', 254839330);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925331, 'Amy Peterson', to_date('13-07-2016', 'dd-mm-yyyy'), '3', '0465 Williams Pine, West Rachel, OR 76170', 254839331);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925332, 'Miguel Mcdonald', to_date('18-05-2012', 'dd-mm-yyyy'), '7', '787 Watson River Suite 982, Diazside, WI 08456', 254839332);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925333, 'Michele Fuentes', to_date('03-02-2013', 'dd-mm-yyyy'), '6', '99069 Teresa Courts Suite 661, Morganside, MI 99621', 254839333);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925334, 'Ethan Ortiz', to_date('28-12-2008', 'dd-mm-yyyy'), '11', '78127 Charles Islands Apt. 092, South Oliviaburgh, OR 25818', 254839334);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925335, 'James Todd', to_date('03-07-2012', 'dd-mm-yyyy'), '7', '63442 Bridget Island Suite 013, Hamiltonberg, NV 98005', 254839335);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925336, 'Wendy Dickson', to_date('16-05-2012', 'dd-mm-yyyy'), '7', '643 Taylor Pike, New Christina, MT 56237', 254839336);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925337, 'Joseph Delgado', to_date('26-04-2011', 'dd-mm-yyyy'), '8', '078 Brandy Road Suite 786, Smallhaven, IN 45463', 254839337);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925338, 'Nathaniel Reed', to_date('19-06-2007', 'dd-mm-yyyy'), '12', '0934 John Hollow, Johnathanfurt, MO 20594', 254839338);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925339, 'Rodney Collins', to_date('31-12-2011', 'dd-mm-yyyy'), '8', 'USCGC Allen, FPO AA 10036', 254839339);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925340, 'Jackson Santos', to_date('20-11-2014', 'dd-mm-yyyy'), '5', '445 Smith Rest, North Tammy, GU 10770', 254839340);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925341, 'Susan Knight', to_date('14-03-2009', 'dd-mm-yyyy'), '10', '2184 Perry Dam, South Karen, MH 49359', 254839341);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925342, 'John Williams', to_date('31-07-2016', 'dd-mm-yyyy'), '3', '398 Megan Shoal Suite 136, Stevenmouth, NJ 91082', 254839342);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925343, 'Robert Ramirez', to_date('28-01-2010', 'dd-mm-yyyy'), '9', '6431 Burke Extensions, Johnside, WV 52744', 254839343);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925344, 'Katelyn Cobb', to_date('22-07-2008', 'dd-mm-yyyy'), '11', '698 Jane Crossroad, South Heather, AS 88829', 254839344);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925345, 'Daniel Guerrero', to_date('30-05-2018', 'dd-mm-yyyy'), '1', '99913 Johnson Ford, North Charlene, OK 23546', 254839345);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925346, 'Mr. Jeffrey Nguyen', to_date('18-07-2013', 'dd-mm-yyyy'), '6', '191 Anderson Plains Apt. 294, Yeseniaville, AS 62160', 254839346);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925347, 'Evelyn Mcbride', to_date('03-07-2008', 'dd-mm-yyyy'), '11', '296 Jessica Way Apt. 866, Harrischester, FL 58999', 254839347);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925348, 'Dennis Smith', to_date('26-11-2008', 'dd-mm-yyyy'), '11', '390 Tran Neck Apt. 977, Garrettshire, VA 92505', 254839348);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925349, 'Jill Hill', to_date('06-05-2010', 'dd-mm-yyyy'), '9', '319 Michael Roads Suite 541, North Karen, OK 83478', 254839349);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925350, 'Christian Bolton', to_date('20-04-2012', 'dd-mm-yyyy'), '7', '52530 Christopher Ford Apt. 597, West Mikeport, PA 87970', 254839350);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925351, 'Lauren Brown', to_date('09-08-2010', 'dd-mm-yyyy'), '9', '16374 Chelsea Fords Apt. 931, West Belindaville, MI 72752', 254839351);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925352, 'Jennifer Reynolds', to_date('30-11-2013', 'dd-mm-yyyy'), '6', '934 Holmes Pass, New Tiffanyshire, SD 60455', 254839352);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925353, 'Barry Adams', to_date('02-12-2017', 'dd-mm-yyyy'), '2', '8767 James Rue, Lawsonview, AS 07156', 254839353);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925354, 'Emily Davis', to_date('27-11-2017', 'dd-mm-yyyy'), '2', '520 Ryan Walk, South Shelbyport, NC 23213', 254839354);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925355, 'Jason Marshall', to_date('15-11-2012', 'dd-mm-yyyy'), '7', '276 Cooper Creek Suite 271, Maryton, ND 91599', 254839355);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925356, 'Anthony Jensen', to_date('11-12-2018', 'dd-mm-yyyy'), '1', '59831 Robert Trail Suite 896, Port Samuel, GU 95129', 254839356);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925357, 'Becky Walker', to_date('14-03-2008', 'dd-mm-yyyy'), '11', '0672 Lauren Pines Suite 106, Ericmouth, WI 66699', 254839357);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925358, 'John Martin', to_date('10-11-2018', 'dd-mm-yyyy'), '1', '92801 Warren Green Suite 580, Port Rodneyville, AL 52822', 254839358);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925359, 'Dawn Macias', to_date('11-07-2011', 'dd-mm-yyyy'), '8', '2960 Beasley Loaf, North Richardbury, NJ 08123', 254839359);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925360, 'Luis Phillips', to_date('20-03-2014', 'dd-mm-yyyy'), '5', '59362 Tony Inlet Apt. 666, New Jeffreyhaven, CO 13941', 254839360);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925361, 'Logan Brown', to_date('22-02-2010', 'dd-mm-yyyy'), '9', '37785 Mann Park Apt. 064, Tannerstad, VI 39407', 254839361);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925362, 'Brian Gould', to_date('06-05-2016', 'dd-mm-yyyy'), '3', '5278 Brenda Port Suite 436, East Amber, OR 94823', 254839362);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925363, 'Joseph Combs', to_date('06-04-2015', 'dd-mm-yyyy'), '4', '763 Matthew Village, Robinton, VA 84431', 254839363);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925364, 'Jasmine Kelley', to_date('23-05-2012', 'dd-mm-yyyy'), '7', '45956 Mitchell Track, Lake Amyton, MS 14876', 254839364);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925365, 'Michael Williams', to_date('02-08-2013', 'dd-mm-yyyy'), '6', 'Unit 2483 Box 2582, DPO AA 69602', 254839365);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925366, 'Elizabeth Thompson MD', to_date('29-07-2010', 'dd-mm-yyyy'), '9', 'USNS Shelton, FPO AA 40686', 254839366);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925367, 'Toni Wilson', to_date('21-04-2012', 'dd-mm-yyyy'), '7', '012 Samantha Hollow, West Michaelton, MN 51676', 254839367);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925368, 'Denise Walsh', to_date('24-04-2017', 'dd-mm-yyyy'), '2', '099 Matthew Summit, Aaronburgh, PA 17519', 254839368);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925369, 'Cassie Hoffman', to_date('18-09-2008', 'dd-mm-yyyy'), '11', '1079 Terrell Squares Suite 199, East Anthonyville, MA 74074', 254839369);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925370, 'Mary Castro MD', to_date('29-09-2008', 'dd-mm-yyyy'), '11', '5197 Angela Wells, Andreaton, CA 17818', 254839370);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925371, 'Alexander Hernandez', to_date('19-04-2007', 'dd-mm-yyyy'), '12', '67339 Samantha Mills Suite 696, Lake Dale, AR 72142', 254839371);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925372, 'Hannah Kirk', to_date('01-04-2013', 'dd-mm-yyyy'), '6', '038 Trevor Freeway Apt. 597, Adamsland, GU 57528', 254839372);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925373, 'Lucas Johnson', to_date('10-04-2007', 'dd-mm-yyyy'), '12', '83760 Knight Springs Suite 786, Lake Tonyafurt, WA 39859', 254839373);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925374, 'Travis Henderson', to_date('18-07-2018', 'dd-mm-yyyy'), '1', '770 Cooper Cliffs, West Dustinstad, WI 75284', 254839374);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925375, 'Christopher Spencer', to_date('04-10-2018', 'dd-mm-yyyy'), '1', '375 Griffith Parks Apt. 835, Chavezville, VI 24066', 254839375);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925376, 'William Cruz', to_date('07-05-2010', 'dd-mm-yyyy'), '9', 'USS Rodriguez, FPO AA 96090', 254839376);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925377, 'Mrs. Diane Vaughn', to_date('29-12-2018', 'dd-mm-yyyy'), '1', '10974 Kelly Unions Apt. 177, West Jasmine, DE 31335', 254839377);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925378, 'Julian Bell', to_date('16-12-2018', 'dd-mm-yyyy'), '1', '172 Hayes Locks, New Beverlystad, NC 46878', 254839378);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925379, 'Stacy Russell', to_date('29-01-2014', 'dd-mm-yyyy'), '5', '8935 Anthony Route Suite 867, Seanchester, NY 98791', 254839379);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925380, 'Paul Bennett', to_date('17-02-2011', 'dd-mm-yyyy'), '8', '29854 Lewis Shores, Gibbsbury, PW 63359', 254839380);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925381, 'Amber Delgado', to_date('01-04-2014', 'dd-mm-yyyy'), '5', '7763 Victoria Light Suite 881, Port Lisastad, RI 67399', 254839381);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925382, 'Michael Dominguez', to_date('27-03-2009', 'dd-mm-yyyy'), '10', '479 Brianna Street, New Sara, SC 95991', 254839382);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925383, 'Chelsea Branch', to_date('19-10-2016', 'dd-mm-yyyy'), '3', '06796 Holly Mountains Suite 531, Randolphfurt, MP 72947', 254839383);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925384, 'Joyce Brown', to_date('11-12-2013', 'dd-mm-yyyy'), '6', '32019 Shannon Forge Suite 727, Lake Maurice, SD 99824', 254839384);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925385, 'Rebecca Cardenas', to_date('22-12-2013', 'dd-mm-yyyy'), '6', '2020 Adam Motorway, South Jeremyland, VT 77783', 254839385);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925386, 'Rachel Mack', to_date('02-04-2007', 'dd-mm-yyyy'), '12', 'USS Yang, FPO AE 59535', 254839386);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925387, 'Kathy Robertson', to_date('23-06-2012', 'dd-mm-yyyy'), '7', '2334 Robinson Meadow, West Donna, ID 11484', 254839387);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925388, 'Michael Grant', to_date('29-09-2010', 'dd-mm-yyyy'), '9', '16461 Steven Meadow Suite 167, South Davidshire, AZ 56461', 254839388);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925389, 'Christina Chavez', to_date('01-04-2014', 'dd-mm-yyyy'), '5', '5291 Cole Spring, Nicholasberg, MO 52476', 254839389);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925390, 'Jason Manning', to_date('22-02-2010', 'dd-mm-yyyy'), '9', '36365 Ramirez Orchard Apt. 984, Diazbury, CA 65414', 254839390);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925391, 'Erika Wilson', to_date('07-08-2009', 'dd-mm-yyyy'), '10', '9194 Bridges Cape Apt. 487, Petersonton, MH 93762', 254839391);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925392, 'John Bartlett', to_date('06-04-2012', 'dd-mm-yyyy'), '7', '62261 Tiffany Hollow, East Kylie, WY 21860', 254839392);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925393, 'Samuel Henry', to_date('20-05-2009', 'dd-mm-yyyy'), '10', '0510 Franklin Isle, New Alyssaside, MO 94367', 254839393);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925394, 'Morgan Williams', to_date('15-02-2007', 'dd-mm-yyyy'), '12', '7276 Klein Ranch, New Jennifer, LA 86555', 254839394);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925395, 'Christopher Coleman', to_date('22-06-2017', 'dd-mm-yyyy'), '2', '562 Barnett Street Suite 002, Port Barbaraside, WA 83329', 254839395);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925396, 'Kimberly Johnson', to_date('24-03-2010', 'dd-mm-yyyy'), '9', '99900 Robert Stravenue Suite 899, Martinezhaven, FM 30699', 254839396);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925397, 'James Smith', to_date('09-01-2007', 'dd-mm-yyyy'), '12', '64641 Jeffrey Shoal Apt. 216, Lake Martinchester, LA 16474', 254839397);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925398, 'Ashley Shea', to_date('06-08-2015', 'dd-mm-yyyy'), '4', '3557 Hartman Club, Hughesmouth, CT 95490', 254839398);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925399, 'Joshua Hill', to_date('07-12-2018', 'dd-mm-yyyy'), '1', '81496 Ronald Villages Suite 261, Hernandezport, TN 69304', 254839399);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925400, 'Matthew Mcdowell', to_date('10-08-2018', 'dd-mm-yyyy'), '1', '7391 Maxwell Coves, East Saraview, CT 55383', 254839400);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372925537, 'Andrea Herrera', to_date('31-08-2008', 'dd-mm-yyyy'), '11', '720 Joseph Landing Suite 605, Debbieview, WI 51229', 254839784);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372986377, 'Jordan Porter', to_date('08-09-2010', 'dd-mm-yyyy'), '9', '50108 Anderson Trail Suite 529, New Melissa, AR 91739', 254838692);
commit;
prompt 800 records committed...
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (372345395, 'Donna Smith', to_date('07-01-2010', 'dd-mm-yyyy'), '7', '999 Reyes Course, East Christopherton, AK 01926', 254839583);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547723, 'Brandon Moore', to_date('03-06-2011', 'dd-mm-yyyy'), '8', '53226 Michael Divide Apt. 579, Cookville, TX 92380', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547724, 'Jamie Wiggins', to_date('20-12-2016', 'dd-mm-yyyy'), '3', '6606 Hamilton Flats, Larsonview, MO 53508', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547725, 'Rodney Bailey', to_date('11-11-2017', 'dd-mm-yyyy'), '2', '0606 Salas Glen, Port Amandafurt, NC 98372', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547726, 'Erica Mitchell', to_date('01-04-2016', 'dd-mm-yyyy'), '3', '9890 Laura Causeway Suite 120, South Jameston, NE 77048', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547727, 'Kevin Olson', to_date('26-08-2014', 'dd-mm-yyyy'), '5', '29549 White Underpass Suite 319, Robertview, DC 74499', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547728, 'Daniel Morris', to_date('22-10-2011', 'dd-mm-yyyy'), '8', '30228 Richard Valley, Glennberg, MS 61350', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547729, 'Sarah Pena', to_date('27-02-2013', 'dd-mm-yyyy'), '6', '354 Fischer Roads, Robertville, MN 32577', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547730, 'Jon Lane', to_date('25-05-2011', 'dd-mm-yyyy'), '8', '736 Perez Shore Suite 434, West Scottfort, WY 14248', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547731, 'Phillip Sanders', to_date('20-11-2015', 'dd-mm-yyyy'), '4', '2191 Samantha Gardens, Vasquezshire, TX 86382', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547732, 'Jason Davis', to_date('17-10-2010', 'dd-mm-yyyy'), '9', '66812 Mark Avenue Suite 810, Taylorbury, PW 41184', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547733, 'Angela Young', to_date('10-06-2008', 'dd-mm-yyyy'), '11', '3444 Gomez Brooks Apt. 074, Davidville, PW 43955', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547734, 'Miss Amanda Carroll MD', to_date('27-07-2016', 'dd-mm-yyyy'), '3', '299 Banks Fork Apt. 307, East Seanshire, MI 66284', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547735, 'Mark Nielsen', to_date('11-09-2015', 'dd-mm-yyyy'), '4', '309 Jacob Locks Apt. 265, Aguilarborough, HI 82036', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547736, 'Michael Waters', to_date('19-03-2011', 'dd-mm-yyyy'), '8', '249 Elizabeth Fork Suite 092, Port Kariton, DE 64013', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547737, 'Lisa Miller', to_date('11-10-2013', 'dd-mm-yyyy'), '6', '61846 Terri Shoals, Hallburgh, SD 07013', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547738, 'Kayla Wilson', to_date('03-12-2011', 'dd-mm-yyyy'), '8', '4757 Daniel Groves Suite 932, Shirleyborough, CT 58540', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547739, 'Chelsey Clark', to_date('29-09-2010', 'dd-mm-yyyy'), '9', '7288 Jason Wall Apt. 581, West Erichaven, CA 98619', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547740, 'Mark Johnston', to_date('31-03-2008', 'dd-mm-yyyy'), '11', '737 Scott Square, New Sarah, PA 83763', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547741, 'Garrett Hernandez', to_date('20-11-2011', 'dd-mm-yyyy'), '8', 'Unit 0919 Box 6578, DPO AA 67585', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547742, 'Mrs. Latoya Thomas', to_date('29-08-2007', 'dd-mm-yyyy'), '12', '9441 Mckinney Coves, New Christopherbury, MI 15012', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547743, 'Joshua Huff', to_date('18-04-2014', 'dd-mm-yyyy'), '5', '40981 Hill Burg Apt. 830, North Mariachester, WV 48059', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547744, 'Dr. Eric Sullivan', to_date('10-07-2012', 'dd-mm-yyyy'), '7', '8105 Anthony Centers Suite 436, West Aaron, UT 85876', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547745, 'Robert White', to_date('09-08-2008', 'dd-mm-yyyy'), '11', '8742 Williams Row, Lauraville, NC 64691', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547746, 'Michael Hernandez', to_date('23-06-2014', 'dd-mm-yyyy'), '5', '441 Angelica Ridge Suite 293, Robertsberg, LA 03813', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547747, 'Mrs. Angela Carter', to_date('24-02-2010', 'dd-mm-yyyy'), '9', '56717 Caldwell Freeway, Ginafort, NM 09497', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547748, 'Tiffany Brown', to_date('24-09-2017', 'dd-mm-yyyy'), '2', '98056 Aaron Port, Port Kathrynfurt, TN 73907', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547749, 'Marie Donaldson', to_date('17-10-2018', 'dd-mm-yyyy'), '1', 'USCGC Brooks, FPO AP 27698', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547750, 'Shelley Bowen', to_date('30-01-2018', 'dd-mm-yyyy'), '1', 'USNS Burgess, FPO AA 68614', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547751, 'Jasmine Martinez', to_date('28-07-2009', 'dd-mm-yyyy'), '10', '83662 Lang Road, Matthewborough, KY 71927', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547752, 'Anthony Kelly', to_date('20-11-2013', 'dd-mm-yyyy'), '6', '902 Nunez Forest Suite 108, Gailstad, AL 62090', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547753, 'Jasmine Oliver', to_date('12-04-2014', 'dd-mm-yyyy'), '5', 'USCGC Krause, FPO AA 66703', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547754, 'James Smith', to_date('04-08-2011', 'dd-mm-yyyy'), '8', '91601 Sharon Squares Apt. 547, Lake Erin, OR 29511', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547755, 'Marcia Ward', to_date('19-02-2017', 'dd-mm-yyyy'), '2', '29470 Martin Meadow Suite 861, Port Reginamouth, CO 72513', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547756, 'Gary Cline', to_date('21-10-2017', 'dd-mm-yyyy'), '2', '22855 Wilson Loop, Noblemouth, CA 55154', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547757, 'Holly Mullins', to_date('20-07-2011', 'dd-mm-yyyy'), '8', 'USCGC Ross, FPO AA 46175', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547758, 'Linda Lopez', to_date('27-08-2011', 'dd-mm-yyyy'), '8', '094 Jasmine Spurs, Stevefurt, VI 63089', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547759, 'Justin Barker', to_date('11-10-2008', 'dd-mm-yyyy'), '11', '903 Latoya Hills Suite 718, Lake David, OK 63905', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547760, 'Matthew Price', to_date('04-11-2012', 'dd-mm-yyyy'), '7', '31907 Matthew Cove, Grantfurt, NH 46168', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547761, 'Nicole Wagner', to_date('08-09-2017', 'dd-mm-yyyy'), '2', '957 Roy Fork, Torreshaven, IN 10676', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547762, 'Jose Green', to_date('02-11-2007', 'dd-mm-yyyy'), '12', '09218 White Estate, Aprilmouth, OH 62976', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547763, 'Dana Larson', to_date('21-05-2014', 'dd-mm-yyyy'), '5', '71800 William Falls, East Amanda, ID 67993', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547764, 'Timothy Bartlett', to_date('05-11-2007', 'dd-mm-yyyy'), '12', '46899 Hardin Springs, New William, GU 86275', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547765, 'Timothy Jones', to_date('08-05-2008', 'dd-mm-yyyy'), '11', '5811 Edward Mill Suite 721, Smithhaven, MD 86052', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547766, 'Ryan Thomas', to_date('14-05-2017', 'dd-mm-yyyy'), '2', '605 Reynolds Turnpike, East Ashley, CT 03509', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547767, 'Joseph Flores', to_date('22-06-2014', 'dd-mm-yyyy'), '5', '4803 Thomas Mission Suite 092, Deborahland, HI 55864', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547768, 'Amber Hodge', to_date('24-06-2011', 'dd-mm-yyyy'), '8', '1077 Candice Mountains Suite 348, South Jeffrey, GA 88162', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547769, 'Wendy Carey', to_date('09-04-2010', 'dd-mm-yyyy'), '9', '7353 Kyle Knoll, East Aprilfort, AK 77478', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547770, 'Thomas Medina', to_date('19-08-2008', 'dd-mm-yyyy'), '11', '797 Booker Greens, New Sandra, GA 50381', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547771, 'Katherine Sullivan', to_date('08-11-2014', 'dd-mm-yyyy'), '5', '404 Douglas Path Apt. 699, Darrylville, CA 45426', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547772, 'Jose Moon', to_date('24-10-2014', 'dd-mm-yyyy'), '5', '9620 Bass Club, Coxview, CO 98608', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547773, 'Catherine Powell', to_date('21-03-2009', 'dd-mm-yyyy'), '10', '729 Lisa Roads, Porterstad, MT 65405', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547774, 'Elizabeth Robinson', to_date('21-07-2018', 'dd-mm-yyyy'), '1', '81660 Thomas Forge, Riverastad, FL 12523', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547775, 'Samuel Navarro', to_date('15-07-2008', 'dd-mm-yyyy'), '11', '8372 Reeves Brook Suite 736, East Jamieside, PR 88767', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547776, 'Jennifer Ritter', to_date('09-05-2013', 'dd-mm-yyyy'), '6', '02840 Espinoza Station, Wilsonport, AS 14183', 286493554);
insert into STUDENT_ (student_id, student_name, birth, grade, adress, counselor_id)
values (327547777, 'Amber Francis', to_date('30-04-2011', 'dd-mm-yyyy'), '8', '8248 Rachel Walks, New Ryan, RI 07352', 286493554);
commit;
prompt 856 records loaded
prompt Loading ACTIVE...
insert into ACTIVE (activity_id, student_id)
values (1, 1);
insert into ACTIVE (activity_id, student_id)
values (2, 2);
insert into ACTIVE (activity_id, student_id)
values (3, 3);
insert into ACTIVE (activity_id, student_id)
values (4, 4);
insert into ACTIVE (activity_id, student_id)
values (5, 5);
insert into ACTIVE (activity_id, student_id)
values (7, 7);
insert into ACTIVE (activity_id, student_id)
values (8, 8);
insert into ACTIVE (activity_id, student_id)
values (9, 9);
insert into ACTIVE (activity_id, student_id)
values (10, 10);
insert into ACTIVE (activity_id, student_id)
values (11, 11);
insert into ACTIVE (activity_id, student_id)
values (12, 12);
insert into ACTIVE (activity_id, student_id)
values (13, 13);
insert into ACTIVE (activity_id, student_id)
values (15, 15);
insert into ACTIVE (activity_id, student_id)
values (16, 16);
insert into ACTIVE (activity_id, student_id)
values (17, 17);
insert into ACTIVE (activity_id, student_id)
values (18, 18);
insert into ACTIVE (activity_id, student_id)
values (19, 19);
insert into ACTIVE (activity_id, student_id)
values (20, 20);
insert into ACTIVE (activity_id, student_id)
values (21, 21);
insert into ACTIVE (activity_id, student_id)
values (22, 22);
insert into ACTIVE (activity_id, student_id)
values (23, 23);
insert into ACTIVE (activity_id, student_id)
values (24, 24);
insert into ACTIVE (activity_id, student_id)
values (25, 25);
insert into ACTIVE (activity_id, student_id)
values (26, 26);
insert into ACTIVE (activity_id, student_id)
values (27, 27);
insert into ACTIVE (activity_id, student_id)
values (28, 28);
insert into ACTIVE (activity_id, student_id)
values (29, 29);
insert into ACTIVE (activity_id, student_id)
values (30, 30);
insert into ACTIVE (activity_id, student_id)
values (31, 31);
insert into ACTIVE (activity_id, student_id)
values (32, 32);
insert into ACTIVE (activity_id, student_id)
values (33, 33);
insert into ACTIVE (activity_id, student_id)
values (34, 34);
insert into ACTIVE (activity_id, student_id)
values (35, 35);
insert into ACTIVE (activity_id, student_id)
values (36, 36);
insert into ACTIVE (activity_id, student_id)
values (37, 37);
insert into ACTIVE (activity_id, student_id)
values (38, 38);
insert into ACTIVE (activity_id, student_id)
values (39, 39);
insert into ACTIVE (activity_id, student_id)
values (40, 40);
insert into ACTIVE (activity_id, student_id)
values (41, 41);
insert into ACTIVE (activity_id, student_id)
values (42, 42);
insert into ACTIVE (activity_id, student_id)
values (43, 43);
insert into ACTIVE (activity_id, student_id)
values (44, 44);
insert into ACTIVE (activity_id, student_id)
values (45, 45);
insert into ACTIVE (activity_id, student_id)
values (46, 46);
insert into ACTIVE (activity_id, student_id)
values (47, 47);
insert into ACTIVE (activity_id, student_id)
values (48, 48);
insert into ACTIVE (activity_id, student_id)
values (49, 49);
insert into ACTIVE (activity_id, student_id)
values (50, 50);
insert into ACTIVE (activity_id, student_id)
values (51, 51);
insert into ACTIVE (activity_id, student_id)
values (52, 52);
insert into ACTIVE (activity_id, student_id)
values (53, 53);
insert into ACTIVE (activity_id, student_id)
values (54, 54);
insert into ACTIVE (activity_id, student_id)
values (55, 55);
insert into ACTIVE (activity_id, student_id)
values (56, 56);
insert into ACTIVE (activity_id, student_id)
values (57, 57);
insert into ACTIVE (activity_id, student_id)
values (58, 58);
insert into ACTIVE (activity_id, student_id)
values (59, 59);
insert into ACTIVE (activity_id, student_id)
values (60, 60);
insert into ACTIVE (activity_id, student_id)
values (61, 61);
insert into ACTIVE (activity_id, student_id)
values (62, 62);
insert into ACTIVE (activity_id, student_id)
values (63, 63);
insert into ACTIVE (activity_id, student_id)
values (64, 64);
insert into ACTIVE (activity_id, student_id)
values (65, 65);
insert into ACTIVE (activity_id, student_id)
values (66, 66);
insert into ACTIVE (activity_id, student_id)
values (67, 67);
insert into ACTIVE (activity_id, student_id)
values (68, 68);
insert into ACTIVE (activity_id, student_id)
values (69, 69);
insert into ACTIVE (activity_id, student_id)
values (70, 70);
insert into ACTIVE (activity_id, student_id)
values (71, 71);
insert into ACTIVE (activity_id, student_id)
values (72, 72);
insert into ACTIVE (activity_id, student_id)
values (73, 73);
insert into ACTIVE (activity_id, student_id)
values (74, 74);
insert into ACTIVE (activity_id, student_id)
values (75, 75);
insert into ACTIVE (activity_id, student_id)
values (76, 76);
insert into ACTIVE (activity_id, student_id)
values (77, 77);
insert into ACTIVE (activity_id, student_id)
values (78, 78);
insert into ACTIVE (activity_id, student_id)
values (79, 79);
insert into ACTIVE (activity_id, student_id)
values (80, 80);
insert into ACTIVE (activity_id, student_id)
values (81, 81);
insert into ACTIVE (activity_id, student_id)
values (82, 82);
insert into ACTIVE (activity_id, student_id)
values (83, 83);
insert into ACTIVE (activity_id, student_id)
values (84, 84);
insert into ACTIVE (activity_id, student_id)
values (85, 85);
insert into ACTIVE (activity_id, student_id)
values (86, 86);
insert into ACTIVE (activity_id, student_id)
values (87, 87);
insert into ACTIVE (activity_id, student_id)
values (88, 88);
insert into ACTIVE (activity_id, student_id)
values (89, 89);
insert into ACTIVE (activity_id, student_id)
values (90, 90);
insert into ACTIVE (activity_id, student_id)
values (91, 91);
insert into ACTIVE (activity_id, student_id)
values (92, 92);
insert into ACTIVE (activity_id, student_id)
values (93, 93);
insert into ACTIVE (activity_id, student_id)
values (94, 94);
insert into ACTIVE (activity_id, student_id)
values (95, 95);
insert into ACTIVE (activity_id, student_id)
values (96, 96);
insert into ACTIVE (activity_id, student_id)
values (97, 97);
insert into ACTIVE (activity_id, student_id)
values (98, 98);
insert into ACTIVE (activity_id, student_id)
values (99, 99);
insert into ACTIVE (activity_id, student_id)
values (100, 100);
insert into ACTIVE (activity_id, student_id)
values (101, 101);
insert into ACTIVE (activity_id, student_id)
values (102, 102);
commit;
prompt 100 records committed...
insert into ACTIVE (activity_id, student_id)
values (103, 103);
insert into ACTIVE (activity_id, student_id)
values (104, 104);
insert into ACTIVE (activity_id, student_id)
values (105, 105);
insert into ACTIVE (activity_id, student_id)
values (106, 106);
insert into ACTIVE (activity_id, student_id)
values (107, 107);
insert into ACTIVE (activity_id, student_id)
values (108, 108);
insert into ACTIVE (activity_id, student_id)
values (109, 109);
insert into ACTIVE (activity_id, student_id)
values (110, 110);
insert into ACTIVE (activity_id, student_id)
values (111, 111);
insert into ACTIVE (activity_id, student_id)
values (112, 112);
insert into ACTIVE (activity_id, student_id)
values (113, 113);
insert into ACTIVE (activity_id, student_id)
values (114, 114);
insert into ACTIVE (activity_id, student_id)
values (115, 115);
insert into ACTIVE (activity_id, student_id)
values (116, 116);
insert into ACTIVE (activity_id, student_id)
values (117, 117);
insert into ACTIVE (activity_id, student_id)
values (118, 118);
insert into ACTIVE (activity_id, student_id)
values (119, 119);
insert into ACTIVE (activity_id, student_id)
values (120, 120);
insert into ACTIVE (activity_id, student_id)
values (121, 121);
insert into ACTIVE (activity_id, student_id)
values (122, 122);
insert into ACTIVE (activity_id, student_id)
values (123, 123);
insert into ACTIVE (activity_id, student_id)
values (124, 124);
insert into ACTIVE (activity_id, student_id)
values (125, 125);
insert into ACTIVE (activity_id, student_id)
values (126, 126);
insert into ACTIVE (activity_id, student_id)
values (127, 127);
insert into ACTIVE (activity_id, student_id)
values (128, 128);
insert into ACTIVE (activity_id, student_id)
values (129, 129);
insert into ACTIVE (activity_id, student_id)
values (130, 130);
insert into ACTIVE (activity_id, student_id)
values (131, 131);
insert into ACTIVE (activity_id, student_id)
values (132, 132);
insert into ACTIVE (activity_id, student_id)
values (133, 133);
insert into ACTIVE (activity_id, student_id)
values (134, 134);
insert into ACTIVE (activity_id, student_id)
values (135, 135);
insert into ACTIVE (activity_id, student_id)
values (136, 136);
insert into ACTIVE (activity_id, student_id)
values (137, 137);
insert into ACTIVE (activity_id, student_id)
values (138, 138);
insert into ACTIVE (activity_id, student_id)
values (139, 139);
insert into ACTIVE (activity_id, student_id)
values (140, 140);
insert into ACTIVE (activity_id, student_id)
values (141, 141);
insert into ACTIVE (activity_id, student_id)
values (142, 142);
insert into ACTIVE (activity_id, student_id)
values (143, 143);
insert into ACTIVE (activity_id, student_id)
values (144, 144);
insert into ACTIVE (activity_id, student_id)
values (145, 145);
insert into ACTIVE (activity_id, student_id)
values (146, 146);
insert into ACTIVE (activity_id, student_id)
values (147, 147);
insert into ACTIVE (activity_id, student_id)
values (148, 148);
insert into ACTIVE (activity_id, student_id)
values (149, 149);
insert into ACTIVE (activity_id, student_id)
values (150, 150);
insert into ACTIVE (activity_id, student_id)
values (151, 151);
insert into ACTIVE (activity_id, student_id)
values (152, 152);
insert into ACTIVE (activity_id, student_id)
values (153, 153);
insert into ACTIVE (activity_id, student_id)
values (154, 154);
insert into ACTIVE (activity_id, student_id)
values (155, 155);
insert into ACTIVE (activity_id, student_id)
values (156, 156);
insert into ACTIVE (activity_id, student_id)
values (157, 157);
insert into ACTIVE (activity_id, student_id)
values (158, 158);
insert into ACTIVE (activity_id, student_id)
values (159, 159);
insert into ACTIVE (activity_id, student_id)
values (160, 160);
insert into ACTIVE (activity_id, student_id)
values (161, 161);
insert into ACTIVE (activity_id, student_id)
values (162, 162);
insert into ACTIVE (activity_id, student_id)
values (163, 163);
insert into ACTIVE (activity_id, student_id)
values (164, 164);
insert into ACTIVE (activity_id, student_id)
values (165, 165);
insert into ACTIVE (activity_id, student_id)
values (166, 166);
insert into ACTIVE (activity_id, student_id)
values (167, 167);
insert into ACTIVE (activity_id, student_id)
values (168, 168);
insert into ACTIVE (activity_id, student_id)
values (169, 169);
insert into ACTIVE (activity_id, student_id)
values (170, 170);
insert into ACTIVE (activity_id, student_id)
values (171, 171);
insert into ACTIVE (activity_id, student_id)
values (172, 172);
insert into ACTIVE (activity_id, student_id)
values (173, 173);
insert into ACTIVE (activity_id, student_id)
values (174, 174);
insert into ACTIVE (activity_id, student_id)
values (175, 175);
insert into ACTIVE (activity_id, student_id)
values (176, 176);
insert into ACTIVE (activity_id, student_id)
values (177, 177);
insert into ACTIVE (activity_id, student_id)
values (178, 178);
insert into ACTIVE (activity_id, student_id)
values (179, 179);
insert into ACTIVE (activity_id, student_id)
values (180, 180);
insert into ACTIVE (activity_id, student_id)
values (181, 181);
insert into ACTIVE (activity_id, student_id)
values (182, 182);
insert into ACTIVE (activity_id, student_id)
values (183, 183);
insert into ACTIVE (activity_id, student_id)
values (184, 184);
insert into ACTIVE (activity_id, student_id)
values (185, 185);
insert into ACTIVE (activity_id, student_id)
values (186, 186);
insert into ACTIVE (activity_id, student_id)
values (187, 187);
insert into ACTIVE (activity_id, student_id)
values (188, 188);
insert into ACTIVE (activity_id, student_id)
values (189, 189);
insert into ACTIVE (activity_id, student_id)
values (190, 190);
insert into ACTIVE (activity_id, student_id)
values (191, 191);
insert into ACTIVE (activity_id, student_id)
values (192, 192);
insert into ACTIVE (activity_id, student_id)
values (193, 193);
insert into ACTIVE (activity_id, student_id)
values (194, 194);
insert into ACTIVE (activity_id, student_id)
values (195, 195);
insert into ACTIVE (activity_id, student_id)
values (196, 196);
insert into ACTIVE (activity_id, student_id)
values (197, 197);
insert into ACTIVE (activity_id, student_id)
values (198, 198);
insert into ACTIVE (activity_id, student_id)
values (199, 199);
insert into ACTIVE (activity_id, student_id)
values (200, 200);
insert into ACTIVE (activity_id, student_id)
values (201, 201);
insert into ACTIVE (activity_id, student_id)
values (202, 202);
commit;
prompt 200 records committed...
insert into ACTIVE (activity_id, student_id)
values (203, 203);
insert into ACTIVE (activity_id, student_id)
values (204, 204);
insert into ACTIVE (activity_id, student_id)
values (205, 205);
insert into ACTIVE (activity_id, student_id)
values (206, 206);
insert into ACTIVE (activity_id, student_id)
values (207, 207);
insert into ACTIVE (activity_id, student_id)
values (208, 208);
insert into ACTIVE (activity_id, student_id)
values (209, 209);
insert into ACTIVE (activity_id, student_id)
values (210, 210);
insert into ACTIVE (activity_id, student_id)
values (211, 211);
insert into ACTIVE (activity_id, student_id)
values (212, 212);
insert into ACTIVE (activity_id, student_id)
values (213, 213);
insert into ACTIVE (activity_id, student_id)
values (214, 214);
insert into ACTIVE (activity_id, student_id)
values (215, 215);
insert into ACTIVE (activity_id, student_id)
values (216, 216);
insert into ACTIVE (activity_id, student_id)
values (217, 217);
insert into ACTIVE (activity_id, student_id)
values (218, 218);
insert into ACTIVE (activity_id, student_id)
values (219, 219);
insert into ACTIVE (activity_id, student_id)
values (220, 220);
insert into ACTIVE (activity_id, student_id)
values (221, 221);
insert into ACTIVE (activity_id, student_id)
values (222, 222);
insert into ACTIVE (activity_id, student_id)
values (223, 223);
insert into ACTIVE (activity_id, student_id)
values (224, 224);
insert into ACTIVE (activity_id, student_id)
values (225, 225);
insert into ACTIVE (activity_id, student_id)
values (226, 226);
insert into ACTIVE (activity_id, student_id)
values (227, 227);
insert into ACTIVE (activity_id, student_id)
values (228, 228);
insert into ACTIVE (activity_id, student_id)
values (229, 229);
insert into ACTIVE (activity_id, student_id)
values (230, 230);
insert into ACTIVE (activity_id, student_id)
values (231, 231);
insert into ACTIVE (activity_id, student_id)
values (232, 232);
insert into ACTIVE (activity_id, student_id)
values (233, 233);
insert into ACTIVE (activity_id, student_id)
values (234, 234);
insert into ACTIVE (activity_id, student_id)
values (235, 235);
insert into ACTIVE (activity_id, student_id)
values (236, 236);
insert into ACTIVE (activity_id, student_id)
values (237, 237);
insert into ACTIVE (activity_id, student_id)
values (238, 238);
insert into ACTIVE (activity_id, student_id)
values (239, 239);
insert into ACTIVE (activity_id, student_id)
values (240, 240);
insert into ACTIVE (activity_id, student_id)
values (241, 241);
insert into ACTIVE (activity_id, student_id)
values (242, 242);
insert into ACTIVE (activity_id, student_id)
values (243, 243);
insert into ACTIVE (activity_id, student_id)
values (244, 244);
insert into ACTIVE (activity_id, student_id)
values (245, 245);
insert into ACTIVE (activity_id, student_id)
values (246, 246);
insert into ACTIVE (activity_id, student_id)
values (247, 247);
insert into ACTIVE (activity_id, student_id)
values (248, 248);
insert into ACTIVE (activity_id, student_id)
values (249, 249);
insert into ACTIVE (activity_id, student_id)
values (250, 250);
insert into ACTIVE (activity_id, student_id)
values (251, 251);
insert into ACTIVE (activity_id, student_id)
values (252, 252);
insert into ACTIVE (activity_id, student_id)
values (253, 253);
insert into ACTIVE (activity_id, student_id)
values (254, 254);
insert into ACTIVE (activity_id, student_id)
values (255, 255);
insert into ACTIVE (activity_id, student_id)
values (256, 256);
insert into ACTIVE (activity_id, student_id)
values (257, 257);
insert into ACTIVE (activity_id, student_id)
values (258, 258);
insert into ACTIVE (activity_id, student_id)
values (259, 259);
insert into ACTIVE (activity_id, student_id)
values (260, 260);
insert into ACTIVE (activity_id, student_id)
values (261, 261);
insert into ACTIVE (activity_id, student_id)
values (262, 262);
insert into ACTIVE (activity_id, student_id)
values (263, 263);
insert into ACTIVE (activity_id, student_id)
values (264, 264);
insert into ACTIVE (activity_id, student_id)
values (265, 265);
insert into ACTIVE (activity_id, student_id)
values (266, 266);
insert into ACTIVE (activity_id, student_id)
values (267, 267);
insert into ACTIVE (activity_id, student_id)
values (268, 268);
insert into ACTIVE (activity_id, student_id)
values (269, 269);
insert into ACTIVE (activity_id, student_id)
values (270, 270);
insert into ACTIVE (activity_id, student_id)
values (271, 271);
insert into ACTIVE (activity_id, student_id)
values (272, 272);
insert into ACTIVE (activity_id, student_id)
values (273, 273);
insert into ACTIVE (activity_id, student_id)
values (274, 274);
insert into ACTIVE (activity_id, student_id)
values (275, 275);
insert into ACTIVE (activity_id, student_id)
values (276, 276);
insert into ACTIVE (activity_id, student_id)
values (277, 277);
insert into ACTIVE (activity_id, student_id)
values (278, 278);
insert into ACTIVE (activity_id, student_id)
values (279, 279);
insert into ACTIVE (activity_id, student_id)
values (280, 280);
insert into ACTIVE (activity_id, student_id)
values (281, 281);
insert into ACTIVE (activity_id, student_id)
values (282, 282);
insert into ACTIVE (activity_id, student_id)
values (283, 283);
insert into ACTIVE (activity_id, student_id)
values (284, 284);
insert into ACTIVE (activity_id, student_id)
values (285, 285);
insert into ACTIVE (activity_id, student_id)
values (286, 286);
insert into ACTIVE (activity_id, student_id)
values (287, 287);
insert into ACTIVE (activity_id, student_id)
values (288, 288);
insert into ACTIVE (activity_id, student_id)
values (289, 289);
insert into ACTIVE (activity_id, student_id)
values (290, 290);
insert into ACTIVE (activity_id, student_id)
values (291, 291);
insert into ACTIVE (activity_id, student_id)
values (292, 292);
insert into ACTIVE (activity_id, student_id)
values (293, 293);
insert into ACTIVE (activity_id, student_id)
values (294, 294);
insert into ACTIVE (activity_id, student_id)
values (295, 295);
insert into ACTIVE (activity_id, student_id)
values (296, 296);
insert into ACTIVE (activity_id, student_id)
values (297, 297);
insert into ACTIVE (activity_id, student_id)
values (298, 298);
insert into ACTIVE (activity_id, student_id)
values (299, 299);
insert into ACTIVE (activity_id, student_id)
values (300, 300);
insert into ACTIVE (activity_id, student_id)
values (301, 301);
insert into ACTIVE (activity_id, student_id)
values (302, 302);
commit;
prompt 300 records committed...
insert into ACTIVE (activity_id, student_id)
values (303, 303);
insert into ACTIVE (activity_id, student_id)
values (304, 304);
insert into ACTIVE (activity_id, student_id)
values (305, 305);
insert into ACTIVE (activity_id, student_id)
values (306, 306);
insert into ACTIVE (activity_id, student_id)
values (307, 307);
insert into ACTIVE (activity_id, student_id)
values (308, 308);
insert into ACTIVE (activity_id, student_id)
values (309, 309);
insert into ACTIVE (activity_id, student_id)
values (310, 310);
insert into ACTIVE (activity_id, student_id)
values (311, 311);
insert into ACTIVE (activity_id, student_id)
values (312, 312);
insert into ACTIVE (activity_id, student_id)
values (313, 313);
insert into ACTIVE (activity_id, student_id)
values (314, 314);
insert into ACTIVE (activity_id, student_id)
values (315, 315);
insert into ACTIVE (activity_id, student_id)
values (316, 316);
insert into ACTIVE (activity_id, student_id)
values (317, 317);
insert into ACTIVE (activity_id, student_id)
values (318, 318);
insert into ACTIVE (activity_id, student_id)
values (319, 319);
insert into ACTIVE (activity_id, student_id)
values (320, 320);
insert into ACTIVE (activity_id, student_id)
values (321, 321);
insert into ACTIVE (activity_id, student_id)
values (322, 322);
insert into ACTIVE (activity_id, student_id)
values (323, 323);
insert into ACTIVE (activity_id, student_id)
values (324, 324);
insert into ACTIVE (activity_id, student_id)
values (325, 325);
insert into ACTIVE (activity_id, student_id)
values (326, 326);
insert into ACTIVE (activity_id, student_id)
values (327, 327);
insert into ACTIVE (activity_id, student_id)
values (328, 328);
insert into ACTIVE (activity_id, student_id)
values (329, 329);
insert into ACTIVE (activity_id, student_id)
values (330, 330);
insert into ACTIVE (activity_id, student_id)
values (331, 331);
insert into ACTIVE (activity_id, student_id)
values (332, 332);
insert into ACTIVE (activity_id, student_id)
values (333, 333);
insert into ACTIVE (activity_id, student_id)
values (334, 334);
insert into ACTIVE (activity_id, student_id)
values (335, 335);
insert into ACTIVE (activity_id, student_id)
values (336, 336);
insert into ACTIVE (activity_id, student_id)
values (337, 337);
insert into ACTIVE (activity_id, student_id)
values (338, 338);
insert into ACTIVE (activity_id, student_id)
values (339, 339);
insert into ACTIVE (activity_id, student_id)
values (340, 340);
insert into ACTIVE (activity_id, student_id)
values (341, 341);
insert into ACTIVE (activity_id, student_id)
values (342, 342);
insert into ACTIVE (activity_id, student_id)
values (343, 343);
insert into ACTIVE (activity_id, student_id)
values (344, 344);
insert into ACTIVE (activity_id, student_id)
values (345, 345);
insert into ACTIVE (activity_id, student_id)
values (346, 346);
insert into ACTIVE (activity_id, student_id)
values (347, 347);
insert into ACTIVE (activity_id, student_id)
values (348, 348);
insert into ACTIVE (activity_id, student_id)
values (349, 349);
insert into ACTIVE (activity_id, student_id)
values (350, 350);
insert into ACTIVE (activity_id, student_id)
values (351, 351);
insert into ACTIVE (activity_id, student_id)
values (352, 352);
insert into ACTIVE (activity_id, student_id)
values (353, 353);
insert into ACTIVE (activity_id, student_id)
values (354, 354);
insert into ACTIVE (activity_id, student_id)
values (355, 355);
insert into ACTIVE (activity_id, student_id)
values (356, 356);
insert into ACTIVE (activity_id, student_id)
values (357, 357);
insert into ACTIVE (activity_id, student_id)
values (358, 358);
insert into ACTIVE (activity_id, student_id)
values (359, 359);
insert into ACTIVE (activity_id, student_id)
values (360, 360);
insert into ACTIVE (activity_id, student_id)
values (361, 361);
insert into ACTIVE (activity_id, student_id)
values (362, 362);
insert into ACTIVE (activity_id, student_id)
values (363, 363);
insert into ACTIVE (activity_id, student_id)
values (364, 364);
insert into ACTIVE (activity_id, student_id)
values (365, 365);
insert into ACTIVE (activity_id, student_id)
values (366, 366);
insert into ACTIVE (activity_id, student_id)
values (367, 367);
insert into ACTIVE (activity_id, student_id)
values (368, 368);
insert into ACTIVE (activity_id, student_id)
values (369, 369);
insert into ACTIVE (activity_id, student_id)
values (370, 370);
insert into ACTIVE (activity_id, student_id)
values (371, 371);
insert into ACTIVE (activity_id, student_id)
values (372, 372);
insert into ACTIVE (activity_id, student_id)
values (373, 373);
insert into ACTIVE (activity_id, student_id)
values (374, 374);
insert into ACTIVE (activity_id, student_id)
values (375, 375);
insert into ACTIVE (activity_id, student_id)
values (376, 376);
insert into ACTIVE (activity_id, student_id)
values (377, 377);
insert into ACTIVE (activity_id, student_id)
values (378, 378);
insert into ACTIVE (activity_id, student_id)
values (379, 379);
insert into ACTIVE (activity_id, student_id)
values (380, 380);
insert into ACTIVE (activity_id, student_id)
values (381, 381);
insert into ACTIVE (activity_id, student_id)
values (382, 382);
insert into ACTIVE (activity_id, student_id)
values (383, 383);
insert into ACTIVE (activity_id, student_id)
values (384, 384);
insert into ACTIVE (activity_id, student_id)
values (385, 385);
insert into ACTIVE (activity_id, student_id)
values (386, 386);
insert into ACTIVE (activity_id, student_id)
values (387, 387);
insert into ACTIVE (activity_id, student_id)
values (388, 388);
insert into ACTIVE (activity_id, student_id)
values (389, 389);
insert into ACTIVE (activity_id, student_id)
values (390, 390);
insert into ACTIVE (activity_id, student_id)
values (391, 391);
insert into ACTIVE (activity_id, student_id)
values (392, 392);
insert into ACTIVE (activity_id, student_id)
values (393, 393);
insert into ACTIVE (activity_id, student_id)
values (394, 394);
insert into ACTIVE (activity_id, student_id)
values (395, 395);
insert into ACTIVE (activity_id, student_id)
values (396, 396);
insert into ACTIVE (activity_id, student_id)
values (397, 397);
insert into ACTIVE (activity_id, student_id)
values (398, 398);
insert into ACTIVE (activity_id, student_id)
values (399, 399);
insert into ACTIVE (activity_id, student_id)
values (400, 400);
insert into ACTIVE (activity_id, student_id)
values (1, 372925001);
insert into ACTIVE (activity_id, student_id)
values (2, 372925002);
commit;
prompt 400 records committed...
insert into ACTIVE (activity_id, student_id)
values (3, 372925003);
insert into ACTIVE (activity_id, student_id)
values (4, 372925004);
insert into ACTIVE (activity_id, student_id)
values (5, 372925005);
insert into ACTIVE (activity_id, student_id)
values (6, 372925006);
insert into ACTIVE (activity_id, student_id)
values (7, 372925007);
insert into ACTIVE (activity_id, student_id)
values (8, 372925008);
insert into ACTIVE (activity_id, student_id)
values (9, 372925009);
insert into ACTIVE (activity_id, student_id)
values (10, 372925010);
insert into ACTIVE (activity_id, student_id)
values (11, 372925011);
insert into ACTIVE (activity_id, student_id)
values (12, 372925012);
insert into ACTIVE (activity_id, student_id)
values (13, 372925013);
insert into ACTIVE (activity_id, student_id)
values (14, 372925014);
insert into ACTIVE (activity_id, student_id)
values (15, 372925015);
insert into ACTIVE (activity_id, student_id)
values (16, 372925016);
insert into ACTIVE (activity_id, student_id)
values (17, 372925017);
insert into ACTIVE (activity_id, student_id)
values (18, 372925018);
insert into ACTIVE (activity_id, student_id)
values (19, 372925019);
insert into ACTIVE (activity_id, student_id)
values (20, 372925020);
insert into ACTIVE (activity_id, student_id)
values (21, 372925021);
insert into ACTIVE (activity_id, student_id)
values (22, 372925022);
insert into ACTIVE (activity_id, student_id)
values (23, 372925023);
insert into ACTIVE (activity_id, student_id)
values (24, 372925024);
insert into ACTIVE (activity_id, student_id)
values (25, 372925025);
insert into ACTIVE (activity_id, student_id)
values (26, 372925026);
insert into ACTIVE (activity_id, student_id)
values (27, 372925027);
insert into ACTIVE (activity_id, student_id)
values (28, 372925028);
insert into ACTIVE (activity_id, student_id)
values (29, 372925029);
insert into ACTIVE (activity_id, student_id)
values (30, 372925030);
insert into ACTIVE (activity_id, student_id)
values (31, 372925031);
insert into ACTIVE (activity_id, student_id)
values (32, 372925032);
insert into ACTIVE (activity_id, student_id)
values (33, 372925033);
insert into ACTIVE (activity_id, student_id)
values (34, 372925034);
insert into ACTIVE (activity_id, student_id)
values (35, 372925035);
insert into ACTIVE (activity_id, student_id)
values (36, 372925036);
insert into ACTIVE (activity_id, student_id)
values (37, 372925037);
insert into ACTIVE (activity_id, student_id)
values (38, 372925038);
insert into ACTIVE (activity_id, student_id)
values (39, 372925039);
insert into ACTIVE (activity_id, student_id)
values (40, 372925040);
insert into ACTIVE (activity_id, student_id)
values (41, 372925041);
insert into ACTIVE (activity_id, student_id)
values (42, 372925042);
insert into ACTIVE (activity_id, student_id)
values (43, 372925043);
insert into ACTIVE (activity_id, student_id)
values (44, 372925044);
insert into ACTIVE (activity_id, student_id)
values (45, 372925045);
insert into ACTIVE (activity_id, student_id)
values (46, 372925046);
insert into ACTIVE (activity_id, student_id)
values (47, 372925047);
insert into ACTIVE (activity_id, student_id)
values (48, 372925048);
insert into ACTIVE (activity_id, student_id)
values (49, 372925049);
insert into ACTIVE (activity_id, student_id)
values (50, 372925050);
insert into ACTIVE (activity_id, student_id)
values (51, 372925051);
insert into ACTIVE (activity_id, student_id)
values (52, 372925052);
insert into ACTIVE (activity_id, student_id)
values (53, 372925053);
insert into ACTIVE (activity_id, student_id)
values (54, 372925054);
insert into ACTIVE (activity_id, student_id)
values (55, 372925055);
insert into ACTIVE (activity_id, student_id)
values (56, 372925056);
insert into ACTIVE (activity_id, student_id)
values (57, 372925057);
insert into ACTIVE (activity_id, student_id)
values (58, 372925058);
insert into ACTIVE (activity_id, student_id)
values (59, 372925059);
insert into ACTIVE (activity_id, student_id)
values (60, 372925060);
insert into ACTIVE (activity_id, student_id)
values (61, 372925061);
insert into ACTIVE (activity_id, student_id)
values (62, 372925062);
insert into ACTIVE (activity_id, student_id)
values (63, 372925063);
insert into ACTIVE (activity_id, student_id)
values (64, 372925064);
insert into ACTIVE (activity_id, student_id)
values (65, 372925065);
insert into ACTIVE (activity_id, student_id)
values (66, 372925066);
insert into ACTIVE (activity_id, student_id)
values (67, 372925067);
insert into ACTIVE (activity_id, student_id)
values (68, 372925068);
insert into ACTIVE (activity_id, student_id)
values (69, 372925069);
insert into ACTIVE (activity_id, student_id)
values (70, 372925070);
insert into ACTIVE (activity_id, student_id)
values (71, 372925071);
insert into ACTIVE (activity_id, student_id)
values (72, 372925072);
insert into ACTIVE (activity_id, student_id)
values (73, 372925073);
insert into ACTIVE (activity_id, student_id)
values (74, 372925074);
insert into ACTIVE (activity_id, student_id)
values (75, 372925075);
insert into ACTIVE (activity_id, student_id)
values (76, 372925076);
insert into ACTIVE (activity_id, student_id)
values (77, 372925077);
insert into ACTIVE (activity_id, student_id)
values (78, 372925078);
insert into ACTIVE (activity_id, student_id)
values (79, 372925079);
insert into ACTIVE (activity_id, student_id)
values (80, 372925080);
insert into ACTIVE (activity_id, student_id)
values (81, 372925081);
insert into ACTIVE (activity_id, student_id)
values (82, 372925082);
insert into ACTIVE (activity_id, student_id)
values (83, 372925083);
insert into ACTIVE (activity_id, student_id)
values (84, 372925084);
insert into ACTIVE (activity_id, student_id)
values (85, 372925085);
insert into ACTIVE (activity_id, student_id)
values (86, 372925086);
insert into ACTIVE (activity_id, student_id)
values (87, 372925087);
insert into ACTIVE (activity_id, student_id)
values (88, 372925088);
insert into ACTIVE (activity_id, student_id)
values (89, 372925089);
insert into ACTIVE (activity_id, student_id)
values (90, 372925090);
insert into ACTIVE (activity_id, student_id)
values (91, 372925091);
insert into ACTIVE (activity_id, student_id)
values (92, 372925092);
insert into ACTIVE (activity_id, student_id)
values (93, 372925093);
insert into ACTIVE (activity_id, student_id)
values (94, 372925094);
insert into ACTIVE (activity_id, student_id)
values (95, 372925095);
insert into ACTIVE (activity_id, student_id)
values (96, 372925096);
insert into ACTIVE (activity_id, student_id)
values (97, 372925097);
insert into ACTIVE (activity_id, student_id)
values (98, 372925098);
insert into ACTIVE (activity_id, student_id)
values (99, 372925099);
insert into ACTIVE (activity_id, student_id)
values (100, 372925100);
insert into ACTIVE (activity_id, student_id)
values (101, 372925101);
insert into ACTIVE (activity_id, student_id)
values (102, 372925102);
commit;
prompt 500 records committed...
insert into ACTIVE (activity_id, student_id)
values (103, 372925103);
insert into ACTIVE (activity_id, student_id)
values (104, 372925104);
insert into ACTIVE (activity_id, student_id)
values (105, 372925105);
insert into ACTIVE (activity_id, student_id)
values (106, 372925106);
insert into ACTIVE (activity_id, student_id)
values (107, 372925107);
insert into ACTIVE (activity_id, student_id)
values (108, 372925108);
insert into ACTIVE (activity_id, student_id)
values (109, 372925109);
insert into ACTIVE (activity_id, student_id)
values (110, 372925110);
insert into ACTIVE (activity_id, student_id)
values (111, 372925111);
insert into ACTIVE (activity_id, student_id)
values (112, 372925112);
insert into ACTIVE (activity_id, student_id)
values (113, 372925113);
insert into ACTIVE (activity_id, student_id)
values (114, 372925114);
insert into ACTIVE (activity_id, student_id)
values (115, 372925115);
insert into ACTIVE (activity_id, student_id)
values (116, 372925116);
insert into ACTIVE (activity_id, student_id)
values (117, 372925117);
insert into ACTIVE (activity_id, student_id)
values (118, 372925118);
insert into ACTIVE (activity_id, student_id)
values (119, 372925119);
insert into ACTIVE (activity_id, student_id)
values (120, 372925120);
insert into ACTIVE (activity_id, student_id)
values (121, 372925121);
insert into ACTIVE (activity_id, student_id)
values (122, 372925122);
insert into ACTIVE (activity_id, student_id)
values (123, 372925123);
insert into ACTIVE (activity_id, student_id)
values (124, 372925124);
insert into ACTIVE (activity_id, student_id)
values (125, 372925125);
insert into ACTIVE (activity_id, student_id)
values (126, 372925126);
insert into ACTIVE (activity_id, student_id)
values (127, 372925127);
insert into ACTIVE (activity_id, student_id)
values (128, 372925128);
insert into ACTIVE (activity_id, student_id)
values (129, 372925129);
insert into ACTIVE (activity_id, student_id)
values (130, 372925130);
insert into ACTIVE (activity_id, student_id)
values (131, 372925131);
insert into ACTIVE (activity_id, student_id)
values (132, 372925132);
insert into ACTIVE (activity_id, student_id)
values (133, 372925133);
insert into ACTIVE (activity_id, student_id)
values (134, 372925134);
insert into ACTIVE (activity_id, student_id)
values (135, 372925135);
insert into ACTIVE (activity_id, student_id)
values (136, 372925136);
insert into ACTIVE (activity_id, student_id)
values (137, 372925137);
insert into ACTIVE (activity_id, student_id)
values (138, 372925138);
insert into ACTIVE (activity_id, student_id)
values (139, 372925139);
insert into ACTIVE (activity_id, student_id)
values (140, 372925140);
insert into ACTIVE (activity_id, student_id)
values (141, 372925141);
insert into ACTIVE (activity_id, student_id)
values (142, 372925142);
insert into ACTIVE (activity_id, student_id)
values (143, 372925143);
insert into ACTIVE (activity_id, student_id)
values (144, 372925144);
insert into ACTIVE (activity_id, student_id)
values (145, 372925145);
insert into ACTIVE (activity_id, student_id)
values (146, 372925146);
insert into ACTIVE (activity_id, student_id)
values (147, 372925147);
insert into ACTIVE (activity_id, student_id)
values (148, 372925148);
insert into ACTIVE (activity_id, student_id)
values (149, 372925149);
insert into ACTIVE (activity_id, student_id)
values (150, 372925150);
insert into ACTIVE (activity_id, student_id)
values (151, 372925151);
insert into ACTIVE (activity_id, student_id)
values (152, 372925152);
insert into ACTIVE (activity_id, student_id)
values (153, 372925153);
insert into ACTIVE (activity_id, student_id)
values (154, 372925154);
insert into ACTIVE (activity_id, student_id)
values (155, 372925155);
insert into ACTIVE (activity_id, student_id)
values (156, 372925156);
insert into ACTIVE (activity_id, student_id)
values (157, 372925157);
insert into ACTIVE (activity_id, student_id)
values (158, 372925158);
insert into ACTIVE (activity_id, student_id)
values (159, 372925159);
insert into ACTIVE (activity_id, student_id)
values (160, 372925160);
insert into ACTIVE (activity_id, student_id)
values (161, 372925161);
insert into ACTIVE (activity_id, student_id)
values (162, 372925162);
insert into ACTIVE (activity_id, student_id)
values (163, 372925163);
insert into ACTIVE (activity_id, student_id)
values (164, 372925164);
insert into ACTIVE (activity_id, student_id)
values (165, 372925165);
insert into ACTIVE (activity_id, student_id)
values (166, 372925166);
insert into ACTIVE (activity_id, student_id)
values (167, 372925167);
insert into ACTIVE (activity_id, student_id)
values (168, 372925168);
insert into ACTIVE (activity_id, student_id)
values (169, 372925169);
insert into ACTIVE (activity_id, student_id)
values (170, 372925170);
insert into ACTIVE (activity_id, student_id)
values (171, 372925171);
insert into ACTIVE (activity_id, student_id)
values (172, 372925172);
insert into ACTIVE (activity_id, student_id)
values (173, 372925173);
insert into ACTIVE (activity_id, student_id)
values (174, 372925174);
insert into ACTIVE (activity_id, student_id)
values (175, 372925175);
insert into ACTIVE (activity_id, student_id)
values (176, 372925176);
insert into ACTIVE (activity_id, student_id)
values (177, 372925177);
insert into ACTIVE (activity_id, student_id)
values (178, 372925178);
insert into ACTIVE (activity_id, student_id)
values (179, 372925179);
insert into ACTIVE (activity_id, student_id)
values (180, 372925180);
insert into ACTIVE (activity_id, student_id)
values (181, 372925181);
insert into ACTIVE (activity_id, student_id)
values (182, 372925182);
insert into ACTIVE (activity_id, student_id)
values (183, 372925183);
insert into ACTIVE (activity_id, student_id)
values (184, 372925184);
insert into ACTIVE (activity_id, student_id)
values (185, 372925185);
insert into ACTIVE (activity_id, student_id)
values (186, 372925186);
insert into ACTIVE (activity_id, student_id)
values (187, 372925187);
insert into ACTIVE (activity_id, student_id)
values (188, 372925188);
insert into ACTIVE (activity_id, student_id)
values (189, 372925189);
insert into ACTIVE (activity_id, student_id)
values (190, 372925190);
insert into ACTIVE (activity_id, student_id)
values (191, 372925191);
insert into ACTIVE (activity_id, student_id)
values (192, 372925192);
insert into ACTIVE (activity_id, student_id)
values (193, 372925193);
insert into ACTIVE (activity_id, student_id)
values (194, 372925194);
insert into ACTIVE (activity_id, student_id)
values (195, 372925195);
insert into ACTIVE (activity_id, student_id)
values (196, 372925196);
insert into ACTIVE (activity_id, student_id)
values (197, 372925197);
insert into ACTIVE (activity_id, student_id)
values (198, 372925198);
insert into ACTIVE (activity_id, student_id)
values (199, 372925199);
insert into ACTIVE (activity_id, student_id)
values (200, 372925200);
insert into ACTIVE (activity_id, student_id)
values (201, 372925201);
insert into ACTIVE (activity_id, student_id)
values (202, 372925202);
commit;
prompt 600 records committed...
insert into ACTIVE (activity_id, student_id)
values (203, 372925203);
insert into ACTIVE (activity_id, student_id)
values (204, 372925204);
insert into ACTIVE (activity_id, student_id)
values (205, 372925205);
insert into ACTIVE (activity_id, student_id)
values (206, 372925206);
insert into ACTIVE (activity_id, student_id)
values (207, 372925207);
insert into ACTIVE (activity_id, student_id)
values (208, 372925208);
insert into ACTIVE (activity_id, student_id)
values (209, 372925209);
insert into ACTIVE (activity_id, student_id)
values (210, 372925210);
insert into ACTIVE (activity_id, student_id)
values (211, 372925211);
insert into ACTIVE (activity_id, student_id)
values (212, 372925212);
insert into ACTIVE (activity_id, student_id)
values (213, 372925213);
insert into ACTIVE (activity_id, student_id)
values (214, 372925214);
insert into ACTIVE (activity_id, student_id)
values (215, 372925215);
insert into ACTIVE (activity_id, student_id)
values (216, 372925216);
insert into ACTIVE (activity_id, student_id)
values (217, 372925217);
insert into ACTIVE (activity_id, student_id)
values (218, 372925218);
insert into ACTIVE (activity_id, student_id)
values (219, 372925219);
insert into ACTIVE (activity_id, student_id)
values (220, 372925220);
insert into ACTIVE (activity_id, student_id)
values (221, 372925221);
insert into ACTIVE (activity_id, student_id)
values (222, 372925222);
insert into ACTIVE (activity_id, student_id)
values (223, 372925223);
insert into ACTIVE (activity_id, student_id)
values (224, 372925224);
insert into ACTIVE (activity_id, student_id)
values (225, 372925225);
insert into ACTIVE (activity_id, student_id)
values (226, 372925226);
insert into ACTIVE (activity_id, student_id)
values (227, 372925227);
insert into ACTIVE (activity_id, student_id)
values (228, 372925228);
insert into ACTIVE (activity_id, student_id)
values (229, 372925229);
insert into ACTIVE (activity_id, student_id)
values (230, 372925230);
insert into ACTIVE (activity_id, student_id)
values (231, 372925231);
insert into ACTIVE (activity_id, student_id)
values (232, 372925232);
insert into ACTIVE (activity_id, student_id)
values (233, 372925233);
insert into ACTIVE (activity_id, student_id)
values (234, 372925234);
insert into ACTIVE (activity_id, student_id)
values (235, 372925235);
insert into ACTIVE (activity_id, student_id)
values (236, 372925236);
insert into ACTIVE (activity_id, student_id)
values (237, 372925237);
insert into ACTIVE (activity_id, student_id)
values (238, 372925238);
insert into ACTIVE (activity_id, student_id)
values (239, 372925239);
insert into ACTIVE (activity_id, student_id)
values (240, 372925240);
insert into ACTIVE (activity_id, student_id)
values (241, 372925241);
insert into ACTIVE (activity_id, student_id)
values (242, 372925242);
insert into ACTIVE (activity_id, student_id)
values (243, 372925243);
insert into ACTIVE (activity_id, student_id)
values (244, 372925244);
insert into ACTIVE (activity_id, student_id)
values (245, 372925245);
insert into ACTIVE (activity_id, student_id)
values (246, 372925246);
insert into ACTIVE (activity_id, student_id)
values (247, 372925247);
insert into ACTIVE (activity_id, student_id)
values (248, 372925248);
insert into ACTIVE (activity_id, student_id)
values (249, 372925249);
insert into ACTIVE (activity_id, student_id)
values (250, 372925250);
insert into ACTIVE (activity_id, student_id)
values (251, 372925251);
insert into ACTIVE (activity_id, student_id)
values (252, 372925252);
insert into ACTIVE (activity_id, student_id)
values (253, 372925253);
insert into ACTIVE (activity_id, student_id)
values (254, 372925254);
insert into ACTIVE (activity_id, student_id)
values (255, 372925255);
insert into ACTIVE (activity_id, student_id)
values (256, 372925256);
insert into ACTIVE (activity_id, student_id)
values (257, 372925257);
insert into ACTIVE (activity_id, student_id)
values (258, 372925258);
insert into ACTIVE (activity_id, student_id)
values (259, 372925259);
insert into ACTIVE (activity_id, student_id)
values (260, 372925260);
insert into ACTIVE (activity_id, student_id)
values (261, 372925261);
insert into ACTIVE (activity_id, student_id)
values (262, 372925262);
insert into ACTIVE (activity_id, student_id)
values (263, 372925263);
insert into ACTIVE (activity_id, student_id)
values (264, 372925264);
insert into ACTIVE (activity_id, student_id)
values (265, 372925265);
insert into ACTIVE (activity_id, student_id)
values (266, 372925266);
insert into ACTIVE (activity_id, student_id)
values (267, 372925267);
insert into ACTIVE (activity_id, student_id)
values (268, 372925268);
insert into ACTIVE (activity_id, student_id)
values (269, 372925269);
insert into ACTIVE (activity_id, student_id)
values (270, 372925270);
insert into ACTIVE (activity_id, student_id)
values (271, 372925271);
insert into ACTIVE (activity_id, student_id)
values (272, 372925272);
insert into ACTIVE (activity_id, student_id)
values (273, 372925273);
insert into ACTIVE (activity_id, student_id)
values (274, 372925274);
insert into ACTIVE (activity_id, student_id)
values (275, 372925275);
insert into ACTIVE (activity_id, student_id)
values (276, 372925276);
insert into ACTIVE (activity_id, student_id)
values (277, 372925277);
insert into ACTIVE (activity_id, student_id)
values (278, 372925278);
insert into ACTIVE (activity_id, student_id)
values (279, 372925279);
insert into ACTIVE (activity_id, student_id)
values (280, 372925280);
insert into ACTIVE (activity_id, student_id)
values (281, 372925281);
insert into ACTIVE (activity_id, student_id)
values (282, 372925282);
insert into ACTIVE (activity_id, student_id)
values (283, 372925283);
insert into ACTIVE (activity_id, student_id)
values (284, 372925284);
insert into ACTIVE (activity_id, student_id)
values (285, 372925285);
insert into ACTIVE (activity_id, student_id)
values (286, 372925286);
insert into ACTIVE (activity_id, student_id)
values (287, 372925287);
insert into ACTIVE (activity_id, student_id)
values (288, 372925288);
insert into ACTIVE (activity_id, student_id)
values (289, 372925289);
insert into ACTIVE (activity_id, student_id)
values (290, 372925290);
insert into ACTIVE (activity_id, student_id)
values (291, 372925291);
insert into ACTIVE (activity_id, student_id)
values (292, 372925292);
insert into ACTIVE (activity_id, student_id)
values (293, 372925293);
insert into ACTIVE (activity_id, student_id)
values (294, 372925294);
insert into ACTIVE (activity_id, student_id)
values (295, 372925295);
insert into ACTIVE (activity_id, student_id)
values (296, 372925296);
insert into ACTIVE (activity_id, student_id)
values (297, 372925297);
insert into ACTIVE (activity_id, student_id)
values (298, 372925298);
insert into ACTIVE (activity_id, student_id)
values (299, 372925299);
insert into ACTIVE (activity_id, student_id)
values (300, 372925300);
insert into ACTIVE (activity_id, student_id)
values (301, 372925301);
insert into ACTIVE (activity_id, student_id)
values (302, 372925302);
commit;
prompt 700 records committed...
insert into ACTIVE (activity_id, student_id)
values (303, 372925303);
insert into ACTIVE (activity_id, student_id)
values (304, 372925304);
insert into ACTIVE (activity_id, student_id)
values (305, 372925305);
insert into ACTIVE (activity_id, student_id)
values (306, 372925306);
insert into ACTIVE (activity_id, student_id)
values (307, 372925307);
insert into ACTIVE (activity_id, student_id)
values (308, 372925308);
insert into ACTIVE (activity_id, student_id)
values (309, 372925309);
insert into ACTIVE (activity_id, student_id)
values (310, 372925310);
insert into ACTIVE (activity_id, student_id)
values (311, 372925311);
insert into ACTIVE (activity_id, student_id)
values (312, 372925312);
insert into ACTIVE (activity_id, student_id)
values (313, 372925313);
insert into ACTIVE (activity_id, student_id)
values (314, 372925314);
insert into ACTIVE (activity_id, student_id)
values (315, 372925315);
insert into ACTIVE (activity_id, student_id)
values (316, 372925316);
insert into ACTIVE (activity_id, student_id)
values (317, 372925317);
insert into ACTIVE (activity_id, student_id)
values (318, 372925318);
insert into ACTIVE (activity_id, student_id)
values (319, 372925319);
insert into ACTIVE (activity_id, student_id)
values (320, 372925320);
insert into ACTIVE (activity_id, student_id)
values (321, 372925321);
insert into ACTIVE (activity_id, student_id)
values (322, 372925322);
insert into ACTIVE (activity_id, student_id)
values (323, 372925323);
insert into ACTIVE (activity_id, student_id)
values (324, 372925324);
insert into ACTIVE (activity_id, student_id)
values (325, 372925325);
insert into ACTIVE (activity_id, student_id)
values (326, 372925326);
insert into ACTIVE (activity_id, student_id)
values (327, 372925327);
insert into ACTIVE (activity_id, student_id)
values (328, 372925328);
insert into ACTIVE (activity_id, student_id)
values (329, 372925329);
insert into ACTIVE (activity_id, student_id)
values (330, 372925330);
insert into ACTIVE (activity_id, student_id)
values (331, 372925331);
insert into ACTIVE (activity_id, student_id)
values (332, 372925332);
insert into ACTIVE (activity_id, student_id)
values (333, 372925333);
insert into ACTIVE (activity_id, student_id)
values (334, 372925334);
insert into ACTIVE (activity_id, student_id)
values (335, 372925335);
insert into ACTIVE (activity_id, student_id)
values (336, 372925336);
insert into ACTIVE (activity_id, student_id)
values (337, 372925337);
insert into ACTIVE (activity_id, student_id)
values (338, 372925338);
insert into ACTIVE (activity_id, student_id)
values (339, 372925339);
insert into ACTIVE (activity_id, student_id)
values (340, 372925340);
insert into ACTIVE (activity_id, student_id)
values (341, 372925341);
insert into ACTIVE (activity_id, student_id)
values (342, 372925342);
insert into ACTIVE (activity_id, student_id)
values (343, 372925343);
insert into ACTIVE (activity_id, student_id)
values (344, 372925344);
insert into ACTIVE (activity_id, student_id)
values (345, 372925345);
insert into ACTIVE (activity_id, student_id)
values (346, 372925346);
insert into ACTIVE (activity_id, student_id)
values (347, 372925347);
insert into ACTIVE (activity_id, student_id)
values (348, 372925348);
insert into ACTIVE (activity_id, student_id)
values (349, 372925349);
insert into ACTIVE (activity_id, student_id)
values (350, 372925350);
insert into ACTIVE (activity_id, student_id)
values (351, 372925351);
insert into ACTIVE (activity_id, student_id)
values (352, 372925352);
insert into ACTIVE (activity_id, student_id)
values (353, 372925353);
insert into ACTIVE (activity_id, student_id)
values (354, 372925354);
insert into ACTIVE (activity_id, student_id)
values (355, 372925355);
insert into ACTIVE (activity_id, student_id)
values (356, 372925356);
insert into ACTIVE (activity_id, student_id)
values (357, 372925357);
insert into ACTIVE (activity_id, student_id)
values (358, 372925358);
insert into ACTIVE (activity_id, student_id)
values (359, 372925359);
insert into ACTIVE (activity_id, student_id)
values (360, 372925360);
insert into ACTIVE (activity_id, student_id)
values (361, 372925361);
insert into ACTIVE (activity_id, student_id)
values (362, 372925362);
insert into ACTIVE (activity_id, student_id)
values (363, 372925363);
insert into ACTIVE (activity_id, student_id)
values (364, 372925364);
insert into ACTIVE (activity_id, student_id)
values (365, 372925365);
insert into ACTIVE (activity_id, student_id)
values (366, 372925366);
insert into ACTIVE (activity_id, student_id)
values (367, 372925367);
insert into ACTIVE (activity_id, student_id)
values (368, 372925368);
insert into ACTIVE (activity_id, student_id)
values (369, 372925369);
insert into ACTIVE (activity_id, student_id)
values (370, 372925370);
insert into ACTIVE (activity_id, student_id)
values (371, 372925371);
insert into ACTIVE (activity_id, student_id)
values (372, 372925372);
insert into ACTIVE (activity_id, student_id)
values (373, 372925373);
insert into ACTIVE (activity_id, student_id)
values (374, 372925374);
insert into ACTIVE (activity_id, student_id)
values (375, 372925375);
insert into ACTIVE (activity_id, student_id)
values (376, 372925376);
insert into ACTIVE (activity_id, student_id)
values (377, 372925377);
insert into ACTIVE (activity_id, student_id)
values (378, 372925378);
insert into ACTIVE (activity_id, student_id)
values (379, 372925379);
insert into ACTIVE (activity_id, student_id)
values (380, 372925380);
insert into ACTIVE (activity_id, student_id)
values (381, 372925381);
insert into ACTIVE (activity_id, student_id)
values (382, 372925382);
insert into ACTIVE (activity_id, student_id)
values (383, 372925383);
insert into ACTIVE (activity_id, student_id)
values (384, 372925384);
insert into ACTIVE (activity_id, student_id)
values (385, 372925385);
insert into ACTIVE (activity_id, student_id)
values (386, 372925386);
insert into ACTIVE (activity_id, student_id)
values (387, 372925387);
insert into ACTIVE (activity_id, student_id)
values (388, 372925388);
insert into ACTIVE (activity_id, student_id)
values (389, 372925389);
insert into ACTIVE (activity_id, student_id)
values (390, 372925390);
insert into ACTIVE (activity_id, student_id)
values (391, 372925391);
insert into ACTIVE (activity_id, student_id)
values (392, 372925392);
insert into ACTIVE (activity_id, student_id)
values (393, 372925393);
insert into ACTIVE (activity_id, student_id)
values (394, 372925394);
insert into ACTIVE (activity_id, student_id)
values (395, 372925395);
insert into ACTIVE (activity_id, student_id)
values (396, 372925396);
insert into ACTIVE (activity_id, student_id)
values (397, 372925397);
insert into ACTIVE (activity_id, student_id)
values (398, 372925398);
insert into ACTIVE (activity_id, student_id)
values (399, 372925399);
insert into ACTIVE (activity_id, student_id)
values (400, 372925400);
insert into ACTIVE (activity_id, student_id)
values (1, 372925003);
insert into ACTIVE (activity_id, student_id)
values (1, 372925005);
commit;
prompt 800 records committed...
insert into ACTIVE (activity_id, student_id)
values (1, 372925004);
insert into ACTIVE (activity_id, student_id)
values (523, 372925537);
insert into ACTIVE (activity_id, student_id)
values (1134, 372986377);
insert into ACTIVE (activity_id, student_id)
values (489, 372345395);
commit;
prompt 804 records loaded
prompt Loading TRANSPORTATION...
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (1, to_date('07-05-2023 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), 'Rebecca Valencia', 'Yes');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (2, to_date('13-11-2023', 'dd-mm-yyyy'), 'Aaron Cummings', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (3, to_date('14-03-2023', 'dd-mm-yyyy'), 'Pamela Gregory', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (4, to_date('08-11-2023', 'dd-mm-yyyy'), 'Olivia Villanueva', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (5, to_date('06-12-2023', 'dd-mm-yyyy'), 'Anthony Watson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (6, to_date('26-10-2023', 'dd-mm-yyyy'), 'Gary Baker', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (7, to_date('17-02-2023', 'dd-mm-yyyy'), 'Mr. Paul Wilson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (8, to_date('14-09-2023', 'dd-mm-yyyy'), 'Jessica Payne', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (9, to_date('19-10-2023', 'dd-mm-yyyy'), 'Maria Valencia', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (10, to_date('18-04-2023', 'dd-mm-yyyy'), 'Mary Perez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (11, to_date('20-10-2023', 'dd-mm-yyyy'), 'Jenna Johnson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (12, to_date('24-08-2023', 'dd-mm-yyyy'), 'Brian Johnson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (13, to_date('27-04-2023', 'dd-mm-yyyy'), 'Ann Warner', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (14, to_date('20-07-2023', 'dd-mm-yyyy'), 'Martin Patton', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (15, to_date('20-05-2023', 'dd-mm-yyyy'), 'Michael Brown', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (16, to_date('17-01-2023', 'dd-mm-yyyy'), 'Daniel Jensen DDS', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (17, to_date('05-05-2023', 'dd-mm-yyyy'), 'Erika Johnson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (18, to_date('10-06-2023', 'dd-mm-yyyy'), 'Amy Shannon', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (19, to_date('02-12-2023', 'dd-mm-yyyy'), 'Dr. Brandi Baker', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (20, to_date('11-12-2023', 'dd-mm-yyyy'), 'Becky Gonzalez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (21, to_date('13-01-2023', 'dd-mm-yyyy'), 'Angel Barrett', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (22, to_date('03-12-2023', 'dd-mm-yyyy'), 'Christopher Harris', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (23, to_date('26-04-2023', 'dd-mm-yyyy'), 'Nina Johnson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (24, to_date('08-08-2023', 'dd-mm-yyyy'), 'Andrea Hodge', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (25, to_date('27-03-2023', 'dd-mm-yyyy'), 'David Graham', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (26, to_date('17-08-2023', 'dd-mm-yyyy'), 'Mrs. Rachel Walker', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (27, to_date('29-05-2023', 'dd-mm-yyyy'), 'Lisa Coleman', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (28, to_date('20-06-2023', 'dd-mm-yyyy'), 'Jennifer Sullivan', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (29, to_date('19-04-2023', 'dd-mm-yyyy'), 'Kathleen Parker', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (30, to_date('28-03-2023', 'dd-mm-yyyy'), 'Kelly Thompson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (31, to_date('02-02-2023', 'dd-mm-yyyy'), 'Raymond Rios', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (32, to_date('24-09-2023', 'dd-mm-yyyy'), 'Jacob Reed', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (33, to_date('03-08-2023', 'dd-mm-yyyy'), 'Robert Jones', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (34, to_date('15-07-2023', 'dd-mm-yyyy'), 'David Savage', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (35, to_date('09-04-2023', 'dd-mm-yyyy'), 'Julia Gutierrez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (36, to_date('21-07-2023', 'dd-mm-yyyy'), 'Justin Short', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (37, to_date('08-11-2023', 'dd-mm-yyyy'), 'Christopher Hanna', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (38, to_date('28-08-2023', 'dd-mm-yyyy'), 'Thomas Dennis', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (39, to_date('02-05-2023', 'dd-mm-yyyy'), 'Joe Smith', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (40, to_date('15-03-2023', 'dd-mm-yyyy'), 'Dr. James Martinez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (41, to_date('19-12-2023', 'dd-mm-yyyy'), 'Mr. Luis Stout', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (42, to_date('14-07-2023', 'dd-mm-yyyy'), 'Christian Watson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (43, to_date('20-08-2023', 'dd-mm-yyyy'), 'Randy Rosales', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (44, to_date('19-10-2023', 'dd-mm-yyyy'), 'George Roberts', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (45, to_date('03-08-2023', 'dd-mm-yyyy'), 'Curtis Hamilton', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (46, to_date('03-11-2023', 'dd-mm-yyyy'), 'Joshua Chavez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (47, to_date('06-04-2023', 'dd-mm-yyyy'), 'George Wells', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (48, to_date('03-11-2023', 'dd-mm-yyyy'), 'Jose Lang', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (49, to_date('03-05-2023', 'dd-mm-yyyy'), 'Brian Martin', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (50, to_date('01-07-2023', 'dd-mm-yyyy'), 'Tonya Griffin', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (51, to_date('20-02-2023', 'dd-mm-yyyy'), 'Michael Patel', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (52, to_date('08-04-2023', 'dd-mm-yyyy'), 'Jacob Powers', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (53, to_date('17-10-2023', 'dd-mm-yyyy'), 'Joshua Buchanan', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (54, to_date('06-07-2023', 'dd-mm-yyyy'), 'Matthew Ho', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (55, to_date('25-05-2023', 'dd-mm-yyyy'), 'Paul Gomez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (56, to_date('02-07-2023', 'dd-mm-yyyy'), 'Douglas Friedman', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (57, to_date('23-05-2023', 'dd-mm-yyyy'), 'Amber Myers', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (58, to_date('24-06-2023', 'dd-mm-yyyy'), 'Michelle Carrillo', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (59, to_date('16-02-2023', 'dd-mm-yyyy'), 'Michael Leblanc', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (60, to_date('01-05-2023', 'dd-mm-yyyy'), 'Stephanie Dixon', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (61, to_date('07-11-2023', 'dd-mm-yyyy'), 'Debbie Glass', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (62, to_date('05-12-2023', 'dd-mm-yyyy'), 'Daniel Wood', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (63, to_date('25-11-2023', 'dd-mm-yyyy'), 'Katherine Garcia', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (64, to_date('15-02-2023', 'dd-mm-yyyy'), 'Derek Anderson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (65, to_date('07-04-2023', 'dd-mm-yyyy'), 'Mrs. Heather Frey MD', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (66, to_date('30-09-2023', 'dd-mm-yyyy'), 'Lucas Hernandez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (67, to_date('03-06-2023', 'dd-mm-yyyy'), 'Eric Schmidt', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (68, to_date('24-02-2023', 'dd-mm-yyyy'), 'John Bailey', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (69, to_date('17-11-2023', 'dd-mm-yyyy'), 'Jesus Elliott', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (70, to_date('29-11-2023', 'dd-mm-yyyy'), 'Diana Cabrera', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (71, to_date('01-12-2023', 'dd-mm-yyyy'), 'Kevin Andrews', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (72, to_date('12-11-2023', 'dd-mm-yyyy'), 'Mr. Scott Huffman', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (73, to_date('15-10-2023', 'dd-mm-yyyy'), 'Kim Snyder', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (74, to_date('06-05-2023', 'dd-mm-yyyy'), 'Ashley Smith', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (75, to_date('18-08-2023', 'dd-mm-yyyy'), 'Timothy Davis', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (76, to_date('17-02-2023', 'dd-mm-yyyy'), 'Seth Thomas', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (77, to_date('07-06-2023', 'dd-mm-yyyy'), 'William Chang', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (78, to_date('18-10-2023', 'dd-mm-yyyy'), 'Amanda Sanchez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (79, to_date('14-11-2023', 'dd-mm-yyyy'), 'James Thompson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (80, to_date('22-01-2023', 'dd-mm-yyyy'), 'Mariah Mitchell', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (81, to_date('07-07-2023', 'dd-mm-yyyy'), 'Kari Collins', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (82, to_date('08-11-2023', 'dd-mm-yyyy'), 'Michelle Cortez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (83, to_date('05-01-2023', 'dd-mm-yyyy'), 'Timothy Williams', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (84, to_date('04-04-2023', 'dd-mm-yyyy'), 'Alan Cunningham', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (85, to_date('08-04-2023', 'dd-mm-yyyy'), 'Dawn Reese', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (86, to_date('17-09-2023', 'dd-mm-yyyy'), 'Wendy Buckley', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (87, to_date('31-12-2023', 'dd-mm-yyyy'), 'Robert Thomas', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (88, to_date('24-01-2023', 'dd-mm-yyyy'), 'Brittany Ibarra', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (89, to_date('05-02-2023', 'dd-mm-yyyy'), 'Carrie Reeves', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (90, to_date('07-06-2023', 'dd-mm-yyyy'), 'Abigail Walker', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (91, to_date('02-02-2023', 'dd-mm-yyyy'), 'Daniel Harrington', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (92, to_date('23-12-2023', 'dd-mm-yyyy'), 'Gregory Buchanan', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (93, to_date('03-10-2023', 'dd-mm-yyyy'), 'Elizabeth Lee', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (94, to_date('06-09-2023', 'dd-mm-yyyy'), 'Ronald Hall', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (95, to_date('02-11-2023', 'dd-mm-yyyy'), 'Thomas Gonzalez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (96, to_date('26-08-2023', 'dd-mm-yyyy'), 'Michelle Woodward', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (97, to_date('18-07-2023', 'dd-mm-yyyy'), 'Maria Henry', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (98, to_date('06-06-2023', 'dd-mm-yyyy'), 'Bridget Anderson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (99, to_date('21-12-2023', 'dd-mm-yyyy'), 'Linda Johnson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (100, to_date('18-02-2023', 'dd-mm-yyyy'), 'Kristen Ford', 'YES');
commit;
prompt 100 records committed...
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (101, to_date('13-01-2023', 'dd-mm-yyyy'), 'Christian Henderson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (102, to_date('12-02-2023', 'dd-mm-yyyy'), 'Shelby Hutchinson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (103, to_date('11-11-2023', 'dd-mm-yyyy'), 'Kimberly Rogers', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (104, to_date('07-08-2023', 'dd-mm-yyyy'), 'Ashley Mann', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (105, to_date('06-11-2023', 'dd-mm-yyyy'), 'Bryan Mayer', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (106, to_date('04-02-2023', 'dd-mm-yyyy'), 'Danny Moon', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (107, to_date('15-07-2024', 'dd-mm-yyyy'), 'Ashley Swanson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (108, to_date('06-06-2023', 'dd-mm-yyyy'), 'Christopher Combs', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (109, to_date('09-10-2023', 'dd-mm-yyyy'), 'Gabrielle King', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (110, to_date('08-06-2023', 'dd-mm-yyyy'), 'Robert Ortiz', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (111, to_date('11-12-2023', 'dd-mm-yyyy'), 'Larry Robertson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (112, to_date('23-01-2023', 'dd-mm-yyyy'), 'Tami Holt', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (113, to_date('03-05-2023', 'dd-mm-yyyy'), 'Frances Myers', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (114, to_date('19-12-2023', 'dd-mm-yyyy'), 'Shawn Wilson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (115, to_date('26-08-2023', 'dd-mm-yyyy'), 'Jeffery Peterson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (116, to_date('17-08-2023', 'dd-mm-yyyy'), 'Hunter Lewis', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (117, to_date('24-03-2023', 'dd-mm-yyyy'), 'Kristopher Malone', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (118, to_date('22-03-2023', 'dd-mm-yyyy'), 'Michelle Sullivan', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (119, to_date('04-05-2023', 'dd-mm-yyyy'), 'Julie Little', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (120, to_date('31-05-2023', 'dd-mm-yyyy'), 'Tyler Barnett', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (121, to_date('13-09-2023', 'dd-mm-yyyy'), 'Raymond Reyes', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (122, to_date('18-08-2023', 'dd-mm-yyyy'), 'Ashley Barrett', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (123, to_date('12-12-2023', 'dd-mm-yyyy'), 'Vanessa Cordova', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (124, to_date('11-06-2023', 'dd-mm-yyyy'), 'Julie Shea', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (125, to_date('19-04-2023', 'dd-mm-yyyy'), 'Frank Roberts', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (126, to_date('17-12-2023', 'dd-mm-yyyy'), 'Erica Edwards', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (127, to_date('20-09-2023', 'dd-mm-yyyy'), 'Brent Waters', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (128, to_date('03-01-2023', 'dd-mm-yyyy'), 'Nicholas Morris', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (129, to_date('29-10-2023', 'dd-mm-yyyy'), 'Eugene Long', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (130, to_date('23-10-2023', 'dd-mm-yyyy'), 'Cheyenne Walters', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (131, to_date('02-07-2023', 'dd-mm-yyyy'), 'Jessica Jackson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (132, to_date('04-08-2023', 'dd-mm-yyyy'), 'Brian Clark Jr.', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (133, to_date('01-12-2023', 'dd-mm-yyyy'), 'Dr. Gary Chapman', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (134, to_date('27-07-2023', 'dd-mm-yyyy'), 'David Young', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (135, to_date('26-10-2023', 'dd-mm-yyyy'), 'Holly Barnes', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (136, to_date('20-11-2023', 'dd-mm-yyyy'), 'Steven Collier', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (137, to_date('12-03-2023', 'dd-mm-yyyy'), 'Darrell Kemp', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (138, to_date('21-04-2023', 'dd-mm-yyyy'), 'Ricky Mills', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (139, to_date('11-05-2023', 'dd-mm-yyyy'), 'Antonio Gilbert', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (140, to_date('13-10-2023', 'dd-mm-yyyy'), 'Shannon Drake', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (141, to_date('27-10-2023', 'dd-mm-yyyy'), 'Adam Smith', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (142, to_date('01-07-2023', 'dd-mm-yyyy'), 'Kimberly Garcia', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (143, to_date('01-02-2023', 'dd-mm-yyyy'), 'Thomas Jarvis', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (144, to_date('13-02-2023', 'dd-mm-yyyy'), 'Amy Melton', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (145, to_date('06-12-2023', 'dd-mm-yyyy'), 'Patrick Hall', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (146, to_date('20-11-2023', 'dd-mm-yyyy'), 'Angela Baker', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (147, to_date('30-03-2023', 'dd-mm-yyyy'), 'Hannah Ramos', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (148, to_date('13-10-2023', 'dd-mm-yyyy'), 'Amanda Miller', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (149, to_date('18-01-2023', 'dd-mm-yyyy'), 'Jose Pugh', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (150, to_date('31-01-2023', 'dd-mm-yyyy'), 'Jane Mccann', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (151, to_date('05-02-2023', 'dd-mm-yyyy'), 'Kristin Perez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (152, to_date('06-04-2023', 'dd-mm-yyyy'), 'Richard Bradley', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (153, to_date('16-03-2023', 'dd-mm-yyyy'), 'Dustin Alvarez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (154, to_date('22-01-2023', 'dd-mm-yyyy'), 'William Liu', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (155, to_date('15-10-2023', 'dd-mm-yyyy'), 'Jeremy Smith', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (156, to_date('09-01-2023', 'dd-mm-yyyy'), 'David Smith', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (157, to_date('25-09-2023', 'dd-mm-yyyy'), 'Sandra Vega', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (158, to_date('22-11-2023', 'dd-mm-yyyy'), 'Michael Davis', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (159, to_date('14-02-2023', 'dd-mm-yyyy'), 'Michael Holland', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (160, to_date('17-02-2023', 'dd-mm-yyyy'), 'David Barrett', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (161, to_date('23-06-2023', 'dd-mm-yyyy'), 'Heather Thompson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (162, to_date('26-06-2023', 'dd-mm-yyyy'), 'Christopher Hill', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (163, to_date('18-01-2023', 'dd-mm-yyyy'), 'Miss Susan Johnson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (164, to_date('17-09-2023', 'dd-mm-yyyy'), 'Mandy Griffin', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (165, to_date('13-06-2023', 'dd-mm-yyyy'), 'Andre Heath', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (166, to_date('01-06-2023', 'dd-mm-yyyy'), 'Maurice Anderson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (167, to_date('15-01-2023', 'dd-mm-yyyy'), 'James Calhoun', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (168, to_date('08-04-2023', 'dd-mm-yyyy'), 'Kathleen Jarvis', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (169, to_date('04-08-2023', 'dd-mm-yyyy'), 'Joel Beck', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (170, to_date('04-11-2023', 'dd-mm-yyyy'), 'Heather Ward', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (171, to_date('10-06-2023', 'dd-mm-yyyy'), 'Heather Davis', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (172, to_date('02-06-2023', 'dd-mm-yyyy'), 'Sean Silva', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (173, to_date('24-02-2023', 'dd-mm-yyyy'), 'Keith Jones', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (174, to_date('12-09-2023', 'dd-mm-yyyy'), 'Dennis Martinez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (175, to_date('04-04-2023', 'dd-mm-yyyy'), 'Edwin Krause', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (176, to_date('28-11-2023', 'dd-mm-yyyy'), 'Amanda Ramirez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (177, to_date('18-07-2023', 'dd-mm-yyyy'), 'Grace Brown', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (178, to_date('06-12-2023', 'dd-mm-yyyy'), 'Kevin Collins', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (179, to_date('10-12-2023', 'dd-mm-yyyy'), 'Jill Caldwell', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (180, to_date('21-08-2023', 'dd-mm-yyyy'), 'Rebecca Reed MD', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (181, to_date('31-01-2023', 'dd-mm-yyyy'), 'Heather Fox', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (182, to_date('06-08-2023', 'dd-mm-yyyy'), 'Michael Fuller', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (183, to_date('26-09-2023', 'dd-mm-yyyy'), 'Michelle Craig', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (184, to_date('07-12-2023', 'dd-mm-yyyy'), 'Roger Gallegos', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (185, to_date('15-04-2023', 'dd-mm-yyyy'), 'Kayla Smith', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (186, to_date('01-11-2023', 'dd-mm-yyyy'), 'Shawn Erickson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (187, to_date('23-01-2023', 'dd-mm-yyyy'), 'Elizabeth Diaz', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (188, to_date('14-10-2023', 'dd-mm-yyyy'), 'Anne Collins', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (189, to_date('12-11-2023', 'dd-mm-yyyy'), 'Eric Robinson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (190, to_date('10-08-2023', 'dd-mm-yyyy'), 'Shane Evans', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (191, to_date('12-09-2023', 'dd-mm-yyyy'), 'Jordan Bartlett', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (192, to_date('27-01-2023', 'dd-mm-yyyy'), 'Bruce Jones', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (193, to_date('24-01-2023', 'dd-mm-yyyy'), 'Jessica Hensley', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (194, to_date('14-05-2023', 'dd-mm-yyyy'), 'Pamela Ford', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (195, to_date('28-01-2023', 'dd-mm-yyyy'), 'Christopher Gomez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (196, to_date('26-11-2023', 'dd-mm-yyyy'), 'James Ross', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (197, to_date('08-10-2023', 'dd-mm-yyyy'), 'David Snow', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (198, to_date('30-08-2023', 'dd-mm-yyyy'), 'Megan Marshall', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (199, to_date('21-01-2023', 'dd-mm-yyyy'), 'Nathan Holt', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (200, to_date('28-12-2023', 'dd-mm-yyyy'), 'Holly Brennan', 'NO');
commit;
prompt 200 records committed...
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (201, to_date('02-06-2023', 'dd-mm-yyyy'), 'Sandy Conway', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (202, to_date('07-09-2023', 'dd-mm-yyyy'), 'David Oliver', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (203, to_date('20-12-2023', 'dd-mm-yyyy'), 'Mrs. Kathleen Mccoy', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (204, to_date('23-10-2023', 'dd-mm-yyyy'), 'Christopher Nguyen', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (205, to_date('31-03-2023', 'dd-mm-yyyy'), 'Raymond Porter', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (206, to_date('04-09-2023', 'dd-mm-yyyy'), 'Tyler Green', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (207, to_date('16-01-2023', 'dd-mm-yyyy'), 'Nicole Castillo', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (208, to_date('12-08-2023', 'dd-mm-yyyy'), 'Oscar Jacobs', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (209, to_date('19-09-2023', 'dd-mm-yyyy'), 'Timothy Whitehead', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (210, to_date('03-08-2023', 'dd-mm-yyyy'), 'Roger Ruiz', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (211, to_date('27-01-2023', 'dd-mm-yyyy'), 'Gabrielle Huber', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (212, to_date('08-04-2023', 'dd-mm-yyyy'), 'Holly Humphrey', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (213, to_date('21-11-2023', 'dd-mm-yyyy'), 'David Tran', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (214, to_date('05-09-2023', 'dd-mm-yyyy'), 'Robin Berg', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (215, to_date('23-06-2023', 'dd-mm-yyyy'), 'Savannah Shaffer', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (216, to_date('16-05-2023', 'dd-mm-yyyy'), 'William Warren', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (217, to_date('20-11-2023', 'dd-mm-yyyy'), 'Mary Miller', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (218, to_date('04-06-2023', 'dd-mm-yyyy'), 'Rachael Torres', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (219, to_date('18-09-2023', 'dd-mm-yyyy'), 'Darren Young', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (220, to_date('25-03-2023', 'dd-mm-yyyy'), 'Carl Griffin', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (221, to_date('30-12-2023', 'dd-mm-yyyy'), 'Amanda Wagner', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (222, to_date('10-01-2023', 'dd-mm-yyyy'), 'Margaret Christensen', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (223, to_date('08-02-2023', 'dd-mm-yyyy'), 'Christopher Thompson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (224, to_date('13-07-2023', 'dd-mm-yyyy'), 'Sarah Mcguire', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (225, to_date('29-03-2023', 'dd-mm-yyyy'), 'David Preston', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (226, to_date('12-06-2023', 'dd-mm-yyyy'), 'Crystal Dunn', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (227, to_date('27-04-2023', 'dd-mm-yyyy'), 'Heather Collins', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (228, to_date('29-09-2023', 'dd-mm-yyyy'), 'Randall Jones', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (229, to_date('15-09-2023', 'dd-mm-yyyy'), 'Donna Medina', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (230, to_date('07-10-2023', 'dd-mm-yyyy'), 'Juan Gonzalez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (231, to_date('17-11-2023', 'dd-mm-yyyy'), 'Sara Rivas', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (232, to_date('29-09-2023', 'dd-mm-yyyy'), 'Patricia Martin', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (233, to_date('27-01-2023', 'dd-mm-yyyy'), 'Javier Smith', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (234, to_date('06-06-2023', 'dd-mm-yyyy'), 'Anthony Chavez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (235, to_date('19-09-2023', 'dd-mm-yyyy'), 'Timothy Johns', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (236, to_date('29-08-2023', 'dd-mm-yyyy'), 'Joel Figueroa', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (237, to_date('20-07-2023', 'dd-mm-yyyy'), 'Kevin Reynolds', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (238, to_date('10-03-2023', 'dd-mm-yyyy'), 'Sabrina Lee', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (239, to_date('16-12-2023', 'dd-mm-yyyy'), 'Stephanie Jimenez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (240, to_date('02-12-2023', 'dd-mm-yyyy'), 'Caleb Stephens', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (241, to_date('05-02-2023', 'dd-mm-yyyy'), 'Brandon Winters MD', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (242, to_date('16-10-2023', 'dd-mm-yyyy'), 'Michele Bowman', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (243, to_date('20-03-2023', 'dd-mm-yyyy'), 'Melissa Sanchez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (244, to_date('18-11-2023', 'dd-mm-yyyy'), 'Douglas Williams', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (245, to_date('26-08-2023', 'dd-mm-yyyy'), 'Tiffany Bright', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (246, to_date('06-06-2023', 'dd-mm-yyyy'), 'Daniel Pearson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (247, to_date('21-02-2023', 'dd-mm-yyyy'), 'Melissa Cortez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (248, to_date('17-03-2023', 'dd-mm-yyyy'), 'Gary Vasquez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (249, to_date('21-01-2023', 'dd-mm-yyyy'), 'Tabitha Glass', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (250, to_date('03-10-2023', 'dd-mm-yyyy'), 'Steven Goodwin', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (251, to_date('01-05-2023', 'dd-mm-yyyy'), 'Robert Morse', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (252, to_date('07-04-2023', 'dd-mm-yyyy'), 'Michael Roberts', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (253, to_date('16-10-2023', 'dd-mm-yyyy'), 'Brianna Russo', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (254, to_date('21-01-2023', 'dd-mm-yyyy'), 'William Lewis', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (255, to_date('04-12-2023', 'dd-mm-yyyy'), 'Christopher Dunn', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (256, to_date('18-01-2023', 'dd-mm-yyyy'), 'Mrs. Jennifer Travis', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (257, to_date('09-07-2023', 'dd-mm-yyyy'), 'Heather Buck', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (258, to_date('07-02-2023', 'dd-mm-yyyy'), 'Courtney Thompson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (259, to_date('28-07-2023', 'dd-mm-yyyy'), 'Mrs. Megan Lambert', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (260, to_date('16-02-2023', 'dd-mm-yyyy'), 'Janice Mccoy', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (261, to_date('01-11-2023', 'dd-mm-yyyy'), 'Cody Lee', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (262, to_date('11-08-2023', 'dd-mm-yyyy'), 'Donna Graham DVM', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (263, to_date('25-04-2023', 'dd-mm-yyyy'), 'Robert Smith', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (264, to_date('10-08-2023', 'dd-mm-yyyy'), 'Alexander Olson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (265, to_date('11-09-2023', 'dd-mm-yyyy'), 'Megan Dunn', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (266, to_date('06-04-2023', 'dd-mm-yyyy'), 'Raymond Rios', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (267, to_date('21-02-2023', 'dd-mm-yyyy'), 'Marie Warren', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (268, to_date('14-01-2023', 'dd-mm-yyyy'), 'Barbara Parsons', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (269, to_date('26-07-2023', 'dd-mm-yyyy'), 'Meagan Rich', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (270, to_date('24-06-2023', 'dd-mm-yyyy'), 'Elaine Hill', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (271, to_date('10-02-2023', 'dd-mm-yyyy'), 'Mark Dillon', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (272, to_date('19-04-2023', 'dd-mm-yyyy'), 'Michael Lloyd', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (273, to_date('16-09-2023', 'dd-mm-yyyy'), 'Javier Mills', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (274, to_date('20-10-2023', 'dd-mm-yyyy'), 'Kyle Chang', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (275, to_date('27-04-2023', 'dd-mm-yyyy'), 'Carrie Thomas', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (276, to_date('19-07-2023', 'dd-mm-yyyy'), 'Amy Blackburn', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (277, to_date('27-06-2023', 'dd-mm-yyyy'), 'Veronica Cole', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (278, to_date('13-12-2023', 'dd-mm-yyyy'), 'Carlos Anderson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (279, to_date('28-02-2023', 'dd-mm-yyyy'), 'Dana Sanchez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (280, to_date('19-04-2023', 'dd-mm-yyyy'), 'Nicole Webb', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (281, to_date('24-12-2023', 'dd-mm-yyyy'), 'Laura Lewis', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (282, to_date('16-05-2023', 'dd-mm-yyyy'), 'Anthony Flores', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (283, to_date('02-02-2023', 'dd-mm-yyyy'), 'Todd Patterson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (284, to_date('28-06-2023', 'dd-mm-yyyy'), 'Courtney Haney', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (285, to_date('11-08-2023', 'dd-mm-yyyy'), 'Jill Martin', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (286, to_date('01-03-2023', 'dd-mm-yyyy'), 'Brandon Walters', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (287, to_date('02-05-2023', 'dd-mm-yyyy'), 'Rebecca Parks', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (288, to_date('21-02-2023', 'dd-mm-yyyy'), 'Karen Martin MD', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (289, to_date('18-07-2023', 'dd-mm-yyyy'), 'Tyler Snyder', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (290, to_date('29-06-2023', 'dd-mm-yyyy'), 'Michael Frazier', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (291, to_date('26-02-2023', 'dd-mm-yyyy'), 'Lisa King', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (292, to_date('21-03-2023', 'dd-mm-yyyy'), 'Christopher Huerta', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (293, to_date('11-12-2023', 'dd-mm-yyyy'), 'Heather Robinson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (294, to_date('04-01-2023', 'dd-mm-yyyy'), 'Mr. Joseph Callahan', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (295, to_date('20-08-2023', 'dd-mm-yyyy'), 'Michael Perkins', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (296, to_date('10-04-2023', 'dd-mm-yyyy'), 'Charles Aguilar', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (297, to_date('09-12-2023', 'dd-mm-yyyy'), 'Kelly Brown', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (298, to_date('26-06-2023', 'dd-mm-yyyy'), 'Danny Curtis', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (299, to_date('16-02-2023', 'dd-mm-yyyy'), 'Robin Moore', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (300, to_date('11-01-2023', 'dd-mm-yyyy'), 'Lisa Williams', 'NO');
commit;
prompt 300 records committed...
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (301, to_date('03-01-2023', 'dd-mm-yyyy'), 'Cheryl Gilbert', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (302, to_date('02-07-2023', 'dd-mm-yyyy'), 'Sabrina Hughes', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (303, to_date('05-07-2023', 'dd-mm-yyyy'), 'Colton Foster', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (304, to_date('23-11-2023', 'dd-mm-yyyy'), 'Stephanie Rose', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (305, to_date('15-10-2023', 'dd-mm-yyyy'), 'Christopher Ramirez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (306, to_date('12-07-2023', 'dd-mm-yyyy'), 'Lisa Livingston', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (307, to_date('06-08-2023', 'dd-mm-yyyy'), 'James Martin', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (308, to_date('30-10-2023', 'dd-mm-yyyy'), 'Jeffrey Carpenter', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (309, to_date('30-03-2023', 'dd-mm-yyyy'), 'Kim Smith', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (310, to_date('11-03-2023', 'dd-mm-yyyy'), 'Michael Smith', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (311, to_date('20-05-2023', 'dd-mm-yyyy'), 'Debra Anderson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (312, to_date('09-01-2023', 'dd-mm-yyyy'), 'Matthew Garcia', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (313, to_date('02-08-2023', 'dd-mm-yyyy'), 'Rose Douglas', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (314, to_date('28-07-2023', 'dd-mm-yyyy'), 'Tiffany Cook', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (315, to_date('08-01-2023', 'dd-mm-yyyy'), 'Kimberly Scott', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (316, to_date('02-10-2023', 'dd-mm-yyyy'), 'Mr. Eric Cole', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (317, to_date('08-10-2023', 'dd-mm-yyyy'), 'Robert Bolton', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (318, to_date('01-05-2023', 'dd-mm-yyyy'), 'Anna Simmons', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (319, to_date('30-12-2023', 'dd-mm-yyyy'), 'Brian Jones', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (320, to_date('12-11-2023', 'dd-mm-yyyy'), 'Isaiah Medina', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (321, to_date('10-10-2023', 'dd-mm-yyyy'), 'Mason Ford', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (322, to_date('29-04-2023', 'dd-mm-yyyy'), 'Angela Abbott', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (323, to_date('18-11-2023', 'dd-mm-yyyy'), 'Zachary Stanton', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (324, to_date('17-08-2023', 'dd-mm-yyyy'), 'Christopher Harris', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (325, to_date('19-02-2023', 'dd-mm-yyyy'), 'Wesley Schmidt', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (326, to_date('15-04-2023', 'dd-mm-yyyy'), 'Yvonne Lane', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (327, to_date('17-07-2023', 'dd-mm-yyyy'), 'Jeffrey Banks', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (328, to_date('31-01-2023', 'dd-mm-yyyy'), 'Deborah Simpson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (329, to_date('12-02-2023', 'dd-mm-yyyy'), 'Joshua Butler', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (330, to_date('08-06-2023', 'dd-mm-yyyy'), 'Jeffery Spencer', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (331, to_date('14-10-2023', 'dd-mm-yyyy'), 'Shane Dalton', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (332, to_date('21-10-2023', 'dd-mm-yyyy'), 'Nicole Robinson', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (333, to_date('22-07-2023', 'dd-mm-yyyy'), 'Tina Hunt', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (334, to_date('25-11-2023', 'dd-mm-yyyy'), 'Amber Perez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (335, to_date('23-02-2023', 'dd-mm-yyyy'), 'Clifford Kelley', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (336, to_date('06-09-2023', 'dd-mm-yyyy'), 'Timothy Jordan', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (337, to_date('05-01-2023', 'dd-mm-yyyy'), 'Jade Parrish', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (338, to_date('15-03-2023', 'dd-mm-yyyy'), 'Shawn Kane', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (339, to_date('15-12-2023', 'dd-mm-yyyy'), 'Alexis Reyes', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (340, to_date('20-07-2023', 'dd-mm-yyyy'), 'Amanda Rodriguez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (341, to_date('15-11-2023', 'dd-mm-yyyy'), 'Paul Walker', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (342, to_date('21-01-2023', 'dd-mm-yyyy'), 'Toni Greene', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (343, to_date('07-03-2023', 'dd-mm-yyyy'), 'Anthony Garcia', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (344, to_date('06-10-2023', 'dd-mm-yyyy'), 'Molly Brock', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (345, to_date('04-06-2023', 'dd-mm-yyyy'), 'Patrick Jacobs', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (346, to_date('11-08-2023', 'dd-mm-yyyy'), 'Angie Richmond', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (347, to_date('25-09-2023', 'dd-mm-yyyy'), 'Clinton Liu', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (348, to_date('01-01-2023', 'dd-mm-yyyy'), 'Tina Dyer', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (349, to_date('02-04-2023', 'dd-mm-yyyy'), 'Lauren Underwood', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (350, to_date('06-09-2023', 'dd-mm-yyyy'), 'Michael Hernandez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (351, to_date('09-08-2023', 'dd-mm-yyyy'), 'Sarah Wells', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (352, to_date('16-06-2023', 'dd-mm-yyyy'), 'Jessica Serrano', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (353, to_date('03-06-2023', 'dd-mm-yyyy'), 'Tonya Vasquez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (354, to_date('26-03-2023', 'dd-mm-yyyy'), 'Jonathan House', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (355, to_date('29-03-2023', 'dd-mm-yyyy'), 'Scott Young', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (356, to_date('10-10-2023', 'dd-mm-yyyy'), 'Andrew Gill', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (357, to_date('16-11-2023', 'dd-mm-yyyy'), 'Michelle Rios', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (358, to_date('07-06-2023', 'dd-mm-yyyy'), 'Randy Rice', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (359, to_date('14-07-2023', 'dd-mm-yyyy'), 'Frank Williams', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (360, to_date('17-12-2023', 'dd-mm-yyyy'), 'Rebecca Wilkerson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (361, to_date('12-01-2023', 'dd-mm-yyyy'), 'Nicholas Mccoy', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (362, to_date('14-12-2023', 'dd-mm-yyyy'), 'Joseph Hughes', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (363, to_date('01-06-2023', 'dd-mm-yyyy'), 'Brandon Miller', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (364, to_date('24-08-2023', 'dd-mm-yyyy'), 'Suzanne Klein', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (365, to_date('19-09-2023', 'dd-mm-yyyy'), 'Mark Jones', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (366, to_date('27-10-2023', 'dd-mm-yyyy'), 'William Hayes', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (367, to_date('08-12-2023', 'dd-mm-yyyy'), 'Amy Miller', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (368, to_date('01-04-2023', 'dd-mm-yyyy'), 'Melissa Christensen', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (369, to_date('11-03-2023', 'dd-mm-yyyy'), 'Ian Jenkins', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (370, to_date('20-10-2023', 'dd-mm-yyyy'), 'Zachary Willis', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (371, to_date('15-07-2023', 'dd-mm-yyyy'), 'Cameron Wu', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (372, to_date('29-04-2023', 'dd-mm-yyyy'), 'Christine Mann', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (373, to_date('04-01-2023', 'dd-mm-yyyy'), 'Jessica Ward', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (374, to_date('08-05-2023', 'dd-mm-yyyy'), 'Matthew Barnett', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (375, to_date('16-11-2023', 'dd-mm-yyyy'), 'John Ballard', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (376, to_date('11-10-2023', 'dd-mm-yyyy'), 'Shannon Brown', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (377, to_date('04-09-2023', 'dd-mm-yyyy'), 'Sherry Daniels', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (378, to_date('12-09-2023', 'dd-mm-yyyy'), 'Michael Hendrix', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (379, to_date('04-12-2023', 'dd-mm-yyyy'), 'Wendy Rodriguez', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (380, to_date('06-03-2023', 'dd-mm-yyyy'), 'Ruth Newman', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (381, to_date('26-06-2023', 'dd-mm-yyyy'), 'Lisa Walker', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (382, to_date('13-10-2023', 'dd-mm-yyyy'), 'Christopher Rodriguez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (383, to_date('15-08-2023', 'dd-mm-yyyy'), 'James Franklin', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (384, to_date('28-06-2023', 'dd-mm-yyyy'), 'Madison Thompson', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (385, to_date('19-09-2023', 'dd-mm-yyyy'), 'Melissa Aguilar', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (386, to_date('09-12-2023', 'dd-mm-yyyy'), 'Paul Martinez', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (387, to_date('16-03-2023', 'dd-mm-yyyy'), 'Andrew Brown DDS', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (388, to_date('23-10-2023', 'dd-mm-yyyy'), 'Lori Wilcox', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (389, to_date('08-08-2023', 'dd-mm-yyyy'), 'Laura Gaines', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (390, to_date('14-11-2023', 'dd-mm-yyyy'), 'Jessica Silva', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (391, to_date('08-02-2023', 'dd-mm-yyyy'), 'Vincent Price', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (392, to_date('06-01-2023', 'dd-mm-yyyy'), 'Elizabeth Kelley', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (393, to_date('09-09-2023', 'dd-mm-yyyy'), 'Christopher Brown', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (394, to_date('08-12-2023', 'dd-mm-yyyy'), 'Marcus Chung', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (395, to_date('18-04-2023', 'dd-mm-yyyy'), 'Derek Orr', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (396, to_date('17-09-2023', 'dd-mm-yyyy'), 'Rose Munoz', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (397, to_date('28-03-2023', 'dd-mm-yyyy'), 'Madison Williams', 'NO');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (398, to_date('27-06-2023', 'dd-mm-yyyy'), 'Joshua Barnett', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (399, to_date('06-09-2023', 'dd-mm-yyyy'), 'Jenna Wolfe', 'YES');
insert into TRANSPORTATION (transportation_id, departure_time, driver_name, in_time)
values (400, to_date('14-05-2023', 'dd-mm-yyyy'), 'Janet Hernandez', 'NO');
commit;
prompt 400 records loaded
prompt Loading ARRIVE...
insert into ARRIVE (transportation_id, student_id)
values (1, 1);
insert into ARRIVE (transportation_id, student_id)
values (2, 2);
insert into ARRIVE (transportation_id, student_id)
values (3, 3);
insert into ARRIVE (transportation_id, student_id)
values (4, 4);
insert into ARRIVE (transportation_id, student_id)
values (5, 5);
insert into ARRIVE (transportation_id, student_id)
values (7, 7);
insert into ARRIVE (transportation_id, student_id)
values (8, 8);
insert into ARRIVE (transportation_id, student_id)
values (9, 9);
insert into ARRIVE (transportation_id, student_id)
values (10, 10);
insert into ARRIVE (transportation_id, student_id)
values (11, 11);
insert into ARRIVE (transportation_id, student_id)
values (12, 12);
insert into ARRIVE (transportation_id, student_id)
values (13, 13);
insert into ARRIVE (transportation_id, student_id)
values (15, 15);
insert into ARRIVE (transportation_id, student_id)
values (16, 16);
insert into ARRIVE (transportation_id, student_id)
values (17, 17);
insert into ARRIVE (transportation_id, student_id)
values (18, 18);
insert into ARRIVE (transportation_id, student_id)
values (19, 19);
insert into ARRIVE (transportation_id, student_id)
values (20, 20);
insert into ARRIVE (transportation_id, student_id)
values (21, 21);
insert into ARRIVE (transportation_id, student_id)
values (22, 22);
insert into ARRIVE (transportation_id, student_id)
values (23, 23);
insert into ARRIVE (transportation_id, student_id)
values (24, 24);
insert into ARRIVE (transportation_id, student_id)
values (25, 25);
insert into ARRIVE (transportation_id, student_id)
values (26, 26);
insert into ARRIVE (transportation_id, student_id)
values (27, 27);
insert into ARRIVE (transportation_id, student_id)
values (28, 28);
insert into ARRIVE (transportation_id, student_id)
values (29, 29);
insert into ARRIVE (transportation_id, student_id)
values (30, 30);
insert into ARRIVE (transportation_id, student_id)
values (31, 31);
insert into ARRIVE (transportation_id, student_id)
values (32, 32);
insert into ARRIVE (transportation_id, student_id)
values (33, 33);
insert into ARRIVE (transportation_id, student_id)
values (34, 34);
insert into ARRIVE (transportation_id, student_id)
values (35, 35);
insert into ARRIVE (transportation_id, student_id)
values (36, 36);
insert into ARRIVE (transportation_id, student_id)
values (37, 37);
insert into ARRIVE (transportation_id, student_id)
values (38, 38);
insert into ARRIVE (transportation_id, student_id)
values (39, 39);
insert into ARRIVE (transportation_id, student_id)
values (40, 40);
insert into ARRIVE (transportation_id, student_id)
values (41, 41);
insert into ARRIVE (transportation_id, student_id)
values (42, 42);
insert into ARRIVE (transportation_id, student_id)
values (43, 43);
insert into ARRIVE (transportation_id, student_id)
values (44, 44);
insert into ARRIVE (transportation_id, student_id)
values (45, 45);
insert into ARRIVE (transportation_id, student_id)
values (46, 46);
insert into ARRIVE (transportation_id, student_id)
values (47, 47);
insert into ARRIVE (transportation_id, student_id)
values (48, 48);
insert into ARRIVE (transportation_id, student_id)
values (49, 49);
insert into ARRIVE (transportation_id, student_id)
values (50, 50);
insert into ARRIVE (transportation_id, student_id)
values (51, 51);
insert into ARRIVE (transportation_id, student_id)
values (52, 52);
insert into ARRIVE (transportation_id, student_id)
values (53, 53);
insert into ARRIVE (transportation_id, student_id)
values (54, 54);
insert into ARRIVE (transportation_id, student_id)
values (56, 56);
insert into ARRIVE (transportation_id, student_id)
values (57, 57);
insert into ARRIVE (transportation_id, student_id)
values (58, 58);
insert into ARRIVE (transportation_id, student_id)
values (59, 59);
insert into ARRIVE (transportation_id, student_id)
values (60, 60);
insert into ARRIVE (transportation_id, student_id)
values (61, 61);
insert into ARRIVE (transportation_id, student_id)
values (62, 62);
insert into ARRIVE (transportation_id, student_id)
values (63, 63);
insert into ARRIVE (transportation_id, student_id)
values (64, 64);
insert into ARRIVE (transportation_id, student_id)
values (65, 65);
insert into ARRIVE (transportation_id, student_id)
values (66, 66);
insert into ARRIVE (transportation_id, student_id)
values (67, 67);
insert into ARRIVE (transportation_id, student_id)
values (68, 68);
insert into ARRIVE (transportation_id, student_id)
values (69, 69);
insert into ARRIVE (transportation_id, student_id)
values (70, 70);
insert into ARRIVE (transportation_id, student_id)
values (71, 71);
insert into ARRIVE (transportation_id, student_id)
values (72, 72);
insert into ARRIVE (transportation_id, student_id)
values (73, 73);
insert into ARRIVE (transportation_id, student_id)
values (74, 74);
insert into ARRIVE (transportation_id, student_id)
values (75, 75);
insert into ARRIVE (transportation_id, student_id)
values (76, 76);
insert into ARRIVE (transportation_id, student_id)
values (77, 77);
insert into ARRIVE (transportation_id, student_id)
values (78, 78);
insert into ARRIVE (transportation_id, student_id)
values (79, 79);
insert into ARRIVE (transportation_id, student_id)
values (80, 80);
insert into ARRIVE (transportation_id, student_id)
values (81, 81);
insert into ARRIVE (transportation_id, student_id)
values (82, 82);
insert into ARRIVE (transportation_id, student_id)
values (83, 83);
insert into ARRIVE (transportation_id, student_id)
values (84, 84);
insert into ARRIVE (transportation_id, student_id)
values (85, 85);
insert into ARRIVE (transportation_id, student_id)
values (86, 86);
insert into ARRIVE (transportation_id, student_id)
values (87, 87);
insert into ARRIVE (transportation_id, student_id)
values (88, 88);
insert into ARRIVE (transportation_id, student_id)
values (89, 89);
insert into ARRIVE (transportation_id, student_id)
values (90, 90);
insert into ARRIVE (transportation_id, student_id)
values (91, 91);
insert into ARRIVE (transportation_id, student_id)
values (92, 92);
insert into ARRIVE (transportation_id, student_id)
values (93, 93);
insert into ARRIVE (transportation_id, student_id)
values (94, 94);
insert into ARRIVE (transportation_id, student_id)
values (95, 95);
insert into ARRIVE (transportation_id, student_id)
values (96, 96);
insert into ARRIVE (transportation_id, student_id)
values (97, 97);
insert into ARRIVE (transportation_id, student_id)
values (98, 98);
insert into ARRIVE (transportation_id, student_id)
values (99, 99);
insert into ARRIVE (transportation_id, student_id)
values (100, 100);
insert into ARRIVE (transportation_id, student_id)
values (101, 101);
insert into ARRIVE (transportation_id, student_id)
values (102, 102);
insert into ARRIVE (transportation_id, student_id)
values (103, 103);
commit;
prompt 100 records committed...
insert into ARRIVE (transportation_id, student_id)
values (104, 104);
insert into ARRIVE (transportation_id, student_id)
values (105, 105);
insert into ARRIVE (transportation_id, student_id)
values (106, 106);
insert into ARRIVE (transportation_id, student_id)
values (107, 107);
insert into ARRIVE (transportation_id, student_id)
values (108, 108);
insert into ARRIVE (transportation_id, student_id)
values (109, 109);
insert into ARRIVE (transportation_id, student_id)
values (110, 110);
insert into ARRIVE (transportation_id, student_id)
values (111, 111);
insert into ARRIVE (transportation_id, student_id)
values (112, 112);
insert into ARRIVE (transportation_id, student_id)
values (113, 113);
insert into ARRIVE (transportation_id, student_id)
values (114, 114);
insert into ARRIVE (transportation_id, student_id)
values (115, 115);
insert into ARRIVE (transportation_id, student_id)
values (116, 116);
insert into ARRIVE (transportation_id, student_id)
values (117, 117);
insert into ARRIVE (transportation_id, student_id)
values (118, 118);
insert into ARRIVE (transportation_id, student_id)
values (119, 119);
insert into ARRIVE (transportation_id, student_id)
values (120, 120);
insert into ARRIVE (transportation_id, student_id)
values (121, 121);
insert into ARRIVE (transportation_id, student_id)
values (122, 122);
insert into ARRIVE (transportation_id, student_id)
values (123, 123);
insert into ARRIVE (transportation_id, student_id)
values (124, 124);
insert into ARRIVE (transportation_id, student_id)
values (125, 125);
insert into ARRIVE (transportation_id, student_id)
values (126, 126);
insert into ARRIVE (transportation_id, student_id)
values (127, 127);
insert into ARRIVE (transportation_id, student_id)
values (128, 128);
insert into ARRIVE (transportation_id, student_id)
values (129, 129);
insert into ARRIVE (transportation_id, student_id)
values (130, 130);
insert into ARRIVE (transportation_id, student_id)
values (131, 131);
insert into ARRIVE (transportation_id, student_id)
values (132, 132);
insert into ARRIVE (transportation_id, student_id)
values (133, 133);
insert into ARRIVE (transportation_id, student_id)
values (134, 134);
insert into ARRIVE (transportation_id, student_id)
values (135, 135);
insert into ARRIVE (transportation_id, student_id)
values (136, 136);
insert into ARRIVE (transportation_id, student_id)
values (137, 137);
insert into ARRIVE (transportation_id, student_id)
values (138, 138);
insert into ARRIVE (transportation_id, student_id)
values (139, 139);
insert into ARRIVE (transportation_id, student_id)
values (140, 140);
insert into ARRIVE (transportation_id, student_id)
values (141, 141);
insert into ARRIVE (transportation_id, student_id)
values (142, 142);
insert into ARRIVE (transportation_id, student_id)
values (143, 143);
insert into ARRIVE (transportation_id, student_id)
values (144, 144);
insert into ARRIVE (transportation_id, student_id)
values (145, 145);
insert into ARRIVE (transportation_id, student_id)
values (146, 146);
insert into ARRIVE (transportation_id, student_id)
values (147, 147);
insert into ARRIVE (transportation_id, student_id)
values (148, 148);
insert into ARRIVE (transportation_id, student_id)
values (149, 149);
insert into ARRIVE (transportation_id, student_id)
values (150, 150);
insert into ARRIVE (transportation_id, student_id)
values (151, 151);
insert into ARRIVE (transportation_id, student_id)
values (152, 152);
insert into ARRIVE (transportation_id, student_id)
values (153, 153);
insert into ARRIVE (transportation_id, student_id)
values (154, 154);
insert into ARRIVE (transportation_id, student_id)
values (155, 155);
insert into ARRIVE (transportation_id, student_id)
values (156, 156);
insert into ARRIVE (transportation_id, student_id)
values (157, 157);
insert into ARRIVE (transportation_id, student_id)
values (158, 158);
insert into ARRIVE (transportation_id, student_id)
values (159, 159);
insert into ARRIVE (transportation_id, student_id)
values (160, 160);
insert into ARRIVE (transportation_id, student_id)
values (161, 161);
insert into ARRIVE (transportation_id, student_id)
values (162, 162);
insert into ARRIVE (transportation_id, student_id)
values (163, 163);
insert into ARRIVE (transportation_id, student_id)
values (164, 164);
insert into ARRIVE (transportation_id, student_id)
values (165, 165);
insert into ARRIVE (transportation_id, student_id)
values (166, 166);
insert into ARRIVE (transportation_id, student_id)
values (167, 167);
insert into ARRIVE (transportation_id, student_id)
values (168, 168);
insert into ARRIVE (transportation_id, student_id)
values (169, 169);
insert into ARRIVE (transportation_id, student_id)
values (170, 170);
insert into ARRIVE (transportation_id, student_id)
values (171, 171);
insert into ARRIVE (transportation_id, student_id)
values (172, 172);
insert into ARRIVE (transportation_id, student_id)
values (173, 173);
insert into ARRIVE (transportation_id, student_id)
values (174, 174);
insert into ARRIVE (transportation_id, student_id)
values (175, 175);
insert into ARRIVE (transportation_id, student_id)
values (176, 176);
insert into ARRIVE (transportation_id, student_id)
values (177, 177);
insert into ARRIVE (transportation_id, student_id)
values (178, 178);
insert into ARRIVE (transportation_id, student_id)
values (179, 179);
insert into ARRIVE (transportation_id, student_id)
values (180, 180);
insert into ARRIVE (transportation_id, student_id)
values (181, 181);
insert into ARRIVE (transportation_id, student_id)
values (182, 182);
insert into ARRIVE (transportation_id, student_id)
values (183, 183);
insert into ARRIVE (transportation_id, student_id)
values (184, 184);
insert into ARRIVE (transportation_id, student_id)
values (185, 185);
insert into ARRIVE (transportation_id, student_id)
values (186, 186);
insert into ARRIVE (transportation_id, student_id)
values (187, 187);
insert into ARRIVE (transportation_id, student_id)
values (188, 188);
insert into ARRIVE (transportation_id, student_id)
values (189, 189);
insert into ARRIVE (transportation_id, student_id)
values (190, 190);
insert into ARRIVE (transportation_id, student_id)
values (191, 191);
insert into ARRIVE (transportation_id, student_id)
values (192, 192);
insert into ARRIVE (transportation_id, student_id)
values (193, 193);
insert into ARRIVE (transportation_id, student_id)
values (194, 194);
insert into ARRIVE (transportation_id, student_id)
values (195, 195);
insert into ARRIVE (transportation_id, student_id)
values (196, 196);
insert into ARRIVE (transportation_id, student_id)
values (197, 197);
insert into ARRIVE (transportation_id, student_id)
values (198, 198);
insert into ARRIVE (transportation_id, student_id)
values (199, 199);
insert into ARRIVE (transportation_id, student_id)
values (200, 200);
insert into ARRIVE (transportation_id, student_id)
values (201, 201);
insert into ARRIVE (transportation_id, student_id)
values (202, 202);
insert into ARRIVE (transportation_id, student_id)
values (203, 203);
commit;
prompt 200 records committed...
insert into ARRIVE (transportation_id, student_id)
values (204, 204);
insert into ARRIVE (transportation_id, student_id)
values (205, 205);
insert into ARRIVE (transportation_id, student_id)
values (206, 206);
insert into ARRIVE (transportation_id, student_id)
values (207, 207);
insert into ARRIVE (transportation_id, student_id)
values (208, 208);
insert into ARRIVE (transportation_id, student_id)
values (209, 209);
insert into ARRIVE (transportation_id, student_id)
values (210, 210);
insert into ARRIVE (transportation_id, student_id)
values (211, 211);
insert into ARRIVE (transportation_id, student_id)
values (212, 212);
insert into ARRIVE (transportation_id, student_id)
values (213, 213);
insert into ARRIVE (transportation_id, student_id)
values (214, 214);
insert into ARRIVE (transportation_id, student_id)
values (215, 215);
insert into ARRIVE (transportation_id, student_id)
values (216, 216);
insert into ARRIVE (transportation_id, student_id)
values (217, 217);
insert into ARRIVE (transportation_id, student_id)
values (218, 218);
insert into ARRIVE (transportation_id, student_id)
values (219, 219);
insert into ARRIVE (transportation_id, student_id)
values (220, 220);
insert into ARRIVE (transportation_id, student_id)
values (221, 221);
insert into ARRIVE (transportation_id, student_id)
values (222, 222);
insert into ARRIVE (transportation_id, student_id)
values (223, 223);
insert into ARRIVE (transportation_id, student_id)
values (224, 224);
insert into ARRIVE (transportation_id, student_id)
values (225, 225);
insert into ARRIVE (transportation_id, student_id)
values (226, 226);
insert into ARRIVE (transportation_id, student_id)
values (227, 227);
insert into ARRIVE (transportation_id, student_id)
values (228, 228);
insert into ARRIVE (transportation_id, student_id)
values (229, 229);
insert into ARRIVE (transportation_id, student_id)
values (230, 230);
insert into ARRIVE (transportation_id, student_id)
values (231, 231);
insert into ARRIVE (transportation_id, student_id)
values (232, 232);
insert into ARRIVE (transportation_id, student_id)
values (233, 233);
insert into ARRIVE (transportation_id, student_id)
values (234, 234);
insert into ARRIVE (transportation_id, student_id)
values (235, 235);
insert into ARRIVE (transportation_id, student_id)
values (236, 236);
insert into ARRIVE (transportation_id, student_id)
values (237, 237);
insert into ARRIVE (transportation_id, student_id)
values (238, 238);
insert into ARRIVE (transportation_id, student_id)
values (239, 239);
insert into ARRIVE (transportation_id, student_id)
values (240, 240);
insert into ARRIVE (transportation_id, student_id)
values (241, 241);
insert into ARRIVE (transportation_id, student_id)
values (242, 242);
insert into ARRIVE (transportation_id, student_id)
values (243, 243);
insert into ARRIVE (transportation_id, student_id)
values (244, 244);
insert into ARRIVE (transportation_id, student_id)
values (245, 245);
insert into ARRIVE (transportation_id, student_id)
values (246, 246);
insert into ARRIVE (transportation_id, student_id)
values (247, 247);
insert into ARRIVE (transportation_id, student_id)
values (248, 248);
insert into ARRIVE (transportation_id, student_id)
values (249, 249);
insert into ARRIVE (transportation_id, student_id)
values (250, 250);
insert into ARRIVE (transportation_id, student_id)
values (251, 251);
insert into ARRIVE (transportation_id, student_id)
values (252, 252);
insert into ARRIVE (transportation_id, student_id)
values (253, 253);
insert into ARRIVE (transportation_id, student_id)
values (254, 254);
insert into ARRIVE (transportation_id, student_id)
values (255, 255);
insert into ARRIVE (transportation_id, student_id)
values (256, 256);
insert into ARRIVE (transportation_id, student_id)
values (257, 257);
insert into ARRIVE (transportation_id, student_id)
values (258, 258);
insert into ARRIVE (transportation_id, student_id)
values (259, 259);
insert into ARRIVE (transportation_id, student_id)
values (260, 260);
insert into ARRIVE (transportation_id, student_id)
values (261, 261);
insert into ARRIVE (transportation_id, student_id)
values (262, 262);
insert into ARRIVE (transportation_id, student_id)
values (263, 263);
insert into ARRIVE (transportation_id, student_id)
values (264, 264);
insert into ARRIVE (transportation_id, student_id)
values (265, 265);
insert into ARRIVE (transportation_id, student_id)
values (266, 266);
insert into ARRIVE (transportation_id, student_id)
values (267, 267);
insert into ARRIVE (transportation_id, student_id)
values (268, 268);
insert into ARRIVE (transportation_id, student_id)
values (269, 269);
insert into ARRIVE (transportation_id, student_id)
values (270, 270);
insert into ARRIVE (transportation_id, student_id)
values (271, 271);
insert into ARRIVE (transportation_id, student_id)
values (272, 272);
insert into ARRIVE (transportation_id, student_id)
values (273, 273);
insert into ARRIVE (transportation_id, student_id)
values (274, 274);
insert into ARRIVE (transportation_id, student_id)
values (275, 275);
insert into ARRIVE (transportation_id, student_id)
values (276, 276);
insert into ARRIVE (transportation_id, student_id)
values (277, 277);
insert into ARRIVE (transportation_id, student_id)
values (278, 278);
insert into ARRIVE (transportation_id, student_id)
values (279, 279);
insert into ARRIVE (transportation_id, student_id)
values (280, 280);
insert into ARRIVE (transportation_id, student_id)
values (281, 281);
insert into ARRIVE (transportation_id, student_id)
values (282, 282);
insert into ARRIVE (transportation_id, student_id)
values (283, 283);
insert into ARRIVE (transportation_id, student_id)
values (284, 284);
insert into ARRIVE (transportation_id, student_id)
values (285, 285);
insert into ARRIVE (transportation_id, student_id)
values (286, 286);
insert into ARRIVE (transportation_id, student_id)
values (287, 287);
insert into ARRIVE (transportation_id, student_id)
values (288, 288);
insert into ARRIVE (transportation_id, student_id)
values (289, 289);
insert into ARRIVE (transportation_id, student_id)
values (290, 290);
insert into ARRIVE (transportation_id, student_id)
values (291, 291);
insert into ARRIVE (transportation_id, student_id)
values (292, 292);
insert into ARRIVE (transportation_id, student_id)
values (293, 293);
insert into ARRIVE (transportation_id, student_id)
values (294, 294);
insert into ARRIVE (transportation_id, student_id)
values (295, 295);
insert into ARRIVE (transportation_id, student_id)
values (296, 296);
insert into ARRIVE (transportation_id, student_id)
values (297, 297);
insert into ARRIVE (transportation_id, student_id)
values (298, 298);
insert into ARRIVE (transportation_id, student_id)
values (299, 299);
insert into ARRIVE (transportation_id, student_id)
values (300, 300);
insert into ARRIVE (transportation_id, student_id)
values (301, 301);
insert into ARRIVE (transportation_id, student_id)
values (302, 302);
insert into ARRIVE (transportation_id, student_id)
values (303, 303);
commit;
prompt 300 records committed...
insert into ARRIVE (transportation_id, student_id)
values (304, 304);
insert into ARRIVE (transportation_id, student_id)
values (305, 305);
insert into ARRIVE (transportation_id, student_id)
values (306, 306);
insert into ARRIVE (transportation_id, student_id)
values (307, 307);
insert into ARRIVE (transportation_id, student_id)
values (308, 308);
insert into ARRIVE (transportation_id, student_id)
values (309, 309);
insert into ARRIVE (transportation_id, student_id)
values (310, 310);
insert into ARRIVE (transportation_id, student_id)
values (311, 311);
insert into ARRIVE (transportation_id, student_id)
values (312, 312);
insert into ARRIVE (transportation_id, student_id)
values (313, 313);
insert into ARRIVE (transportation_id, student_id)
values (314, 314);
insert into ARRIVE (transportation_id, student_id)
values (315, 315);
insert into ARRIVE (transportation_id, student_id)
values (316, 316);
insert into ARRIVE (transportation_id, student_id)
values (317, 317);
insert into ARRIVE (transportation_id, student_id)
values (318, 318);
insert into ARRIVE (transportation_id, student_id)
values (319, 319);
insert into ARRIVE (transportation_id, student_id)
values (320, 320);
insert into ARRIVE (transportation_id, student_id)
values (321, 321);
insert into ARRIVE (transportation_id, student_id)
values (322, 322);
insert into ARRIVE (transportation_id, student_id)
values (323, 323);
insert into ARRIVE (transportation_id, student_id)
values (324, 324);
insert into ARRIVE (transportation_id, student_id)
values (325, 325);
insert into ARRIVE (transportation_id, student_id)
values (326, 326);
insert into ARRIVE (transportation_id, student_id)
values (327, 327);
insert into ARRIVE (transportation_id, student_id)
values (328, 328);
insert into ARRIVE (transportation_id, student_id)
values (329, 329);
insert into ARRIVE (transportation_id, student_id)
values (330, 330);
insert into ARRIVE (transportation_id, student_id)
values (331, 331);
insert into ARRIVE (transportation_id, student_id)
values (332, 332);
insert into ARRIVE (transportation_id, student_id)
values (333, 333);
insert into ARRIVE (transportation_id, student_id)
values (334, 334);
insert into ARRIVE (transportation_id, student_id)
values (335, 335);
insert into ARRIVE (transportation_id, student_id)
values (336, 336);
insert into ARRIVE (transportation_id, student_id)
values (337, 337);
insert into ARRIVE (transportation_id, student_id)
values (338, 338);
insert into ARRIVE (transportation_id, student_id)
values (339, 339);
insert into ARRIVE (transportation_id, student_id)
values (340, 340);
insert into ARRIVE (transportation_id, student_id)
values (341, 341);
insert into ARRIVE (transportation_id, student_id)
values (342, 342);
insert into ARRIVE (transportation_id, student_id)
values (343, 343);
insert into ARRIVE (transportation_id, student_id)
values (344, 344);
insert into ARRIVE (transportation_id, student_id)
values (345, 345);
insert into ARRIVE (transportation_id, student_id)
values (346, 346);
insert into ARRIVE (transportation_id, student_id)
values (347, 347);
insert into ARRIVE (transportation_id, student_id)
values (348, 348);
insert into ARRIVE (transportation_id, student_id)
values (349, 349);
insert into ARRIVE (transportation_id, student_id)
values (350, 350);
insert into ARRIVE (transportation_id, student_id)
values (351, 351);
insert into ARRIVE (transportation_id, student_id)
values (352, 352);
insert into ARRIVE (transportation_id, student_id)
values (353, 353);
insert into ARRIVE (transportation_id, student_id)
values (354, 354);
insert into ARRIVE (transportation_id, student_id)
values (355, 355);
insert into ARRIVE (transportation_id, student_id)
values (356, 356);
insert into ARRIVE (transportation_id, student_id)
values (357, 357);
insert into ARRIVE (transportation_id, student_id)
values (358, 358);
insert into ARRIVE (transportation_id, student_id)
values (359, 359);
insert into ARRIVE (transportation_id, student_id)
values (360, 360);
insert into ARRIVE (transportation_id, student_id)
values (361, 361);
insert into ARRIVE (transportation_id, student_id)
values (362, 362);
insert into ARRIVE (transportation_id, student_id)
values (363, 363);
insert into ARRIVE (transportation_id, student_id)
values (364, 364);
insert into ARRIVE (transportation_id, student_id)
values (365, 365);
insert into ARRIVE (transportation_id, student_id)
values (366, 366);
insert into ARRIVE (transportation_id, student_id)
values (367, 367);
insert into ARRIVE (transportation_id, student_id)
values (368, 368);
insert into ARRIVE (transportation_id, student_id)
values (369, 369);
insert into ARRIVE (transportation_id, student_id)
values (370, 370);
insert into ARRIVE (transportation_id, student_id)
values (371, 371);
insert into ARRIVE (transportation_id, student_id)
values (372, 372);
insert into ARRIVE (transportation_id, student_id)
values (373, 373);
insert into ARRIVE (transportation_id, student_id)
values (374, 374);
insert into ARRIVE (transportation_id, student_id)
values (375, 375);
insert into ARRIVE (transportation_id, student_id)
values (376, 376);
insert into ARRIVE (transportation_id, student_id)
values (377, 377);
insert into ARRIVE (transportation_id, student_id)
values (378, 378);
insert into ARRIVE (transportation_id, student_id)
values (379, 379);
insert into ARRIVE (transportation_id, student_id)
values (380, 380);
insert into ARRIVE (transportation_id, student_id)
values (381, 381);
insert into ARRIVE (transportation_id, student_id)
values (382, 382);
insert into ARRIVE (transportation_id, student_id)
values (383, 383);
insert into ARRIVE (transportation_id, student_id)
values (384, 384);
insert into ARRIVE (transportation_id, student_id)
values (385, 385);
insert into ARRIVE (transportation_id, student_id)
values (386, 386);
insert into ARRIVE (transportation_id, student_id)
values (387, 387);
insert into ARRIVE (transportation_id, student_id)
values (388, 388);
insert into ARRIVE (transportation_id, student_id)
values (389, 389);
insert into ARRIVE (transportation_id, student_id)
values (390, 390);
insert into ARRIVE (transportation_id, student_id)
values (391, 391);
insert into ARRIVE (transportation_id, student_id)
values (392, 392);
insert into ARRIVE (transportation_id, student_id)
values (393, 393);
insert into ARRIVE (transportation_id, student_id)
values (394, 394);
insert into ARRIVE (transportation_id, student_id)
values (395, 395);
insert into ARRIVE (transportation_id, student_id)
values (396, 396);
insert into ARRIVE (transportation_id, student_id)
values (397, 397);
insert into ARRIVE (transportation_id, student_id)
values (398, 398);
insert into ARRIVE (transportation_id, student_id)
values (399, 399);
insert into ARRIVE (transportation_id, student_id)
values (400, 400);
insert into ARRIVE (transportation_id, student_id)
values (1, 372925001);
insert into ARRIVE (transportation_id, student_id)
values (2, 372925002);
insert into ARRIVE (transportation_id, student_id)
values (3, 372925003);
commit;
prompt 400 records committed...
insert into ARRIVE (transportation_id, student_id)
values (4, 372925004);
insert into ARRIVE (transportation_id, student_id)
values (5, 372925005);
insert into ARRIVE (transportation_id, student_id)
values (6, 372925006);
insert into ARRIVE (transportation_id, student_id)
values (7, 372925007);
insert into ARRIVE (transportation_id, student_id)
values (8, 372925008);
insert into ARRIVE (transportation_id, student_id)
values (9, 372925009);
insert into ARRIVE (transportation_id, student_id)
values (10, 372925010);
insert into ARRIVE (transportation_id, student_id)
values (11, 372925011);
insert into ARRIVE (transportation_id, student_id)
values (12, 372925012);
insert into ARRIVE (transportation_id, student_id)
values (13, 372925013);
insert into ARRIVE (transportation_id, student_id)
values (14, 372925014);
insert into ARRIVE (transportation_id, student_id)
values (15, 372925015);
insert into ARRIVE (transportation_id, student_id)
values (16, 372925016);
insert into ARRIVE (transportation_id, student_id)
values (17, 372925017);
insert into ARRIVE (transportation_id, student_id)
values (18, 372925018);
insert into ARRIVE (transportation_id, student_id)
values (19, 372925019);
insert into ARRIVE (transportation_id, student_id)
values (20, 372925020);
insert into ARRIVE (transportation_id, student_id)
values (21, 372925021);
insert into ARRIVE (transportation_id, student_id)
values (22, 372925022);
insert into ARRIVE (transportation_id, student_id)
values (23, 372925023);
insert into ARRIVE (transportation_id, student_id)
values (24, 372925024);
insert into ARRIVE (transportation_id, student_id)
values (25, 372925025);
insert into ARRIVE (transportation_id, student_id)
values (26, 372925026);
insert into ARRIVE (transportation_id, student_id)
values (27, 372925027);
insert into ARRIVE (transportation_id, student_id)
values (28, 372925028);
insert into ARRIVE (transportation_id, student_id)
values (29, 372925029);
insert into ARRIVE (transportation_id, student_id)
values (30, 372925030);
insert into ARRIVE (transportation_id, student_id)
values (31, 372925031);
insert into ARRIVE (transportation_id, student_id)
values (32, 372925032);
insert into ARRIVE (transportation_id, student_id)
values (33, 372925033);
insert into ARRIVE (transportation_id, student_id)
values (34, 372925034);
insert into ARRIVE (transportation_id, student_id)
values (35, 372925035);
insert into ARRIVE (transportation_id, student_id)
values (36, 372925036);
insert into ARRIVE (transportation_id, student_id)
values (37, 372925037);
insert into ARRIVE (transportation_id, student_id)
values (38, 372925038);
insert into ARRIVE (transportation_id, student_id)
values (39, 372925039);
insert into ARRIVE (transportation_id, student_id)
values (40, 372925040);
insert into ARRIVE (transportation_id, student_id)
values (41, 372925041);
insert into ARRIVE (transportation_id, student_id)
values (42, 372925042);
insert into ARRIVE (transportation_id, student_id)
values (43, 372925043);
insert into ARRIVE (transportation_id, student_id)
values (44, 372925044);
insert into ARRIVE (transportation_id, student_id)
values (45, 372925045);
insert into ARRIVE (transportation_id, student_id)
values (46, 372925046);
insert into ARRIVE (transportation_id, student_id)
values (47, 372925047);
insert into ARRIVE (transportation_id, student_id)
values (48, 372925048);
insert into ARRIVE (transportation_id, student_id)
values (49, 372925049);
insert into ARRIVE (transportation_id, student_id)
values (50, 372925050);
insert into ARRIVE (transportation_id, student_id)
values (51, 372925051);
insert into ARRIVE (transportation_id, student_id)
values (52, 372925052);
insert into ARRIVE (transportation_id, student_id)
values (53, 372925053);
insert into ARRIVE (transportation_id, student_id)
values (54, 372925054);
insert into ARRIVE (transportation_id, student_id)
values (55, 372925055);
insert into ARRIVE (transportation_id, student_id)
values (56, 372925056);
insert into ARRIVE (transportation_id, student_id)
values (57, 372925057);
insert into ARRIVE (transportation_id, student_id)
values (58, 372925058);
insert into ARRIVE (transportation_id, student_id)
values (59, 372925059);
insert into ARRIVE (transportation_id, student_id)
values (60, 372925060);
insert into ARRIVE (transportation_id, student_id)
values (61, 372925061);
insert into ARRIVE (transportation_id, student_id)
values (62, 372925062);
insert into ARRIVE (transportation_id, student_id)
values (63, 372925063);
insert into ARRIVE (transportation_id, student_id)
values (64, 372925064);
insert into ARRIVE (transportation_id, student_id)
values (65, 372925065);
insert into ARRIVE (transportation_id, student_id)
values (66, 372925066);
insert into ARRIVE (transportation_id, student_id)
values (67, 372925067);
insert into ARRIVE (transportation_id, student_id)
values (68, 372925068);
insert into ARRIVE (transportation_id, student_id)
values (69, 372925069);
insert into ARRIVE (transportation_id, student_id)
values (70, 372925070);
insert into ARRIVE (transportation_id, student_id)
values (71, 372925071);
insert into ARRIVE (transportation_id, student_id)
values (72, 372925072);
insert into ARRIVE (transportation_id, student_id)
values (73, 372925073);
insert into ARRIVE (transportation_id, student_id)
values (74, 372925074);
insert into ARRIVE (transportation_id, student_id)
values (75, 372925075);
insert into ARRIVE (transportation_id, student_id)
values (76, 372925076);
insert into ARRIVE (transportation_id, student_id)
values (77, 372925077);
insert into ARRIVE (transportation_id, student_id)
values (78, 372925078);
insert into ARRIVE (transportation_id, student_id)
values (79, 372925079);
insert into ARRIVE (transportation_id, student_id)
values (80, 372925080);
insert into ARRIVE (transportation_id, student_id)
values (81, 372925081);
insert into ARRIVE (transportation_id, student_id)
values (82, 372925082);
insert into ARRIVE (transportation_id, student_id)
values (83, 372925083);
insert into ARRIVE (transportation_id, student_id)
values (84, 372925084);
insert into ARRIVE (transportation_id, student_id)
values (85, 372925085);
insert into ARRIVE (transportation_id, student_id)
values (86, 372925086);
insert into ARRIVE (transportation_id, student_id)
values (87, 372925087);
insert into ARRIVE (transportation_id, student_id)
values (88, 372925088);
insert into ARRIVE (transportation_id, student_id)
values (89, 372925089);
insert into ARRIVE (transportation_id, student_id)
values (90, 372925090);
insert into ARRIVE (transportation_id, student_id)
values (91, 372925091);
insert into ARRIVE (transportation_id, student_id)
values (92, 372925092);
insert into ARRIVE (transportation_id, student_id)
values (93, 372925093);
insert into ARRIVE (transportation_id, student_id)
values (94, 372925094);
insert into ARRIVE (transportation_id, student_id)
values (95, 372925095);
insert into ARRIVE (transportation_id, student_id)
values (96, 372925096);
insert into ARRIVE (transportation_id, student_id)
values (97, 372925097);
insert into ARRIVE (transportation_id, student_id)
values (98, 372925098);
insert into ARRIVE (transportation_id, student_id)
values (99, 372925099);
insert into ARRIVE (transportation_id, student_id)
values (100, 372925100);
insert into ARRIVE (transportation_id, student_id)
values (101, 372925101);
insert into ARRIVE (transportation_id, student_id)
values (102, 372925102);
insert into ARRIVE (transportation_id, student_id)
values (103, 372925103);
commit;
prompt 500 records committed...
insert into ARRIVE (transportation_id, student_id)
values (104, 372925104);
insert into ARRIVE (transportation_id, student_id)
values (105, 372925105);
insert into ARRIVE (transportation_id, student_id)
values (106, 372925106);
insert into ARRIVE (transportation_id, student_id)
values (107, 372925107);
insert into ARRIVE (transportation_id, student_id)
values (108, 372925108);
insert into ARRIVE (transportation_id, student_id)
values (109, 372925109);
insert into ARRIVE (transportation_id, student_id)
values (110, 372925110);
insert into ARRIVE (transportation_id, student_id)
values (111, 372925111);
insert into ARRIVE (transportation_id, student_id)
values (112, 372925112);
insert into ARRIVE (transportation_id, student_id)
values (113, 372925113);
insert into ARRIVE (transportation_id, student_id)
values (114, 372925114);
insert into ARRIVE (transportation_id, student_id)
values (115, 372925115);
insert into ARRIVE (transportation_id, student_id)
values (116, 372925116);
insert into ARRIVE (transportation_id, student_id)
values (117, 372925117);
insert into ARRIVE (transportation_id, student_id)
values (118, 372925118);
insert into ARRIVE (transportation_id, student_id)
values (119, 372925119);
insert into ARRIVE (transportation_id, student_id)
values (120, 372925120);
insert into ARRIVE (transportation_id, student_id)
values (121, 372925121);
insert into ARRIVE (transportation_id, student_id)
values (122, 372925122);
insert into ARRIVE (transportation_id, student_id)
values (123, 372925123);
insert into ARRIVE (transportation_id, student_id)
values (124, 372925124);
insert into ARRIVE (transportation_id, student_id)
values (125, 372925125);
insert into ARRIVE (transportation_id, student_id)
values (126, 372925126);
insert into ARRIVE (transportation_id, student_id)
values (127, 372925127);
insert into ARRIVE (transportation_id, student_id)
values (128, 372925128);
insert into ARRIVE (transportation_id, student_id)
values (129, 372925129);
insert into ARRIVE (transportation_id, student_id)
values (130, 372925130);
insert into ARRIVE (transportation_id, student_id)
values (131, 372925131);
insert into ARRIVE (transportation_id, student_id)
values (132, 372925132);
insert into ARRIVE (transportation_id, student_id)
values (133, 372925133);
insert into ARRIVE (transportation_id, student_id)
values (134, 372925134);
insert into ARRIVE (transportation_id, student_id)
values (135, 372925135);
insert into ARRIVE (transportation_id, student_id)
values (136, 372925136);
insert into ARRIVE (transportation_id, student_id)
values (137, 372925137);
insert into ARRIVE (transportation_id, student_id)
values (138, 372925138);
insert into ARRIVE (transportation_id, student_id)
values (139, 372925139);
insert into ARRIVE (transportation_id, student_id)
values (140, 372925140);
insert into ARRIVE (transportation_id, student_id)
values (141, 372925141);
insert into ARRIVE (transportation_id, student_id)
values (142, 372925142);
insert into ARRIVE (transportation_id, student_id)
values (143, 372925143);
insert into ARRIVE (transportation_id, student_id)
values (144, 372925144);
insert into ARRIVE (transportation_id, student_id)
values (145, 372925145);
insert into ARRIVE (transportation_id, student_id)
values (146, 372925146);
insert into ARRIVE (transportation_id, student_id)
values (147, 372925147);
insert into ARRIVE (transportation_id, student_id)
values (148, 372925148);
insert into ARRIVE (transportation_id, student_id)
values (149, 372925149);
insert into ARRIVE (transportation_id, student_id)
values (150, 372925150);
insert into ARRIVE (transportation_id, student_id)
values (151, 372925151);
insert into ARRIVE (transportation_id, student_id)
values (152, 372925152);
insert into ARRIVE (transportation_id, student_id)
values (153, 372925153);
insert into ARRIVE (transportation_id, student_id)
values (154, 372925154);
insert into ARRIVE (transportation_id, student_id)
values (155, 372925155);
insert into ARRIVE (transportation_id, student_id)
values (156, 372925156);
insert into ARRIVE (transportation_id, student_id)
values (157, 372925157);
insert into ARRIVE (transportation_id, student_id)
values (158, 372925158);
insert into ARRIVE (transportation_id, student_id)
values (159, 372925159);
insert into ARRIVE (transportation_id, student_id)
values (160, 372925160);
insert into ARRIVE (transportation_id, student_id)
values (161, 372925161);
insert into ARRIVE (transportation_id, student_id)
values (162, 372925162);
insert into ARRIVE (transportation_id, student_id)
values (163, 372925163);
insert into ARRIVE (transportation_id, student_id)
values (164, 372925164);
insert into ARRIVE (transportation_id, student_id)
values (165, 372925165);
insert into ARRIVE (transportation_id, student_id)
values (166, 372925166);
insert into ARRIVE (transportation_id, student_id)
values (167, 372925167);
insert into ARRIVE (transportation_id, student_id)
values (168, 372925168);
insert into ARRIVE (transportation_id, student_id)
values (169, 372925169);
insert into ARRIVE (transportation_id, student_id)
values (170, 372925170);
insert into ARRIVE (transportation_id, student_id)
values (171, 372925171);
insert into ARRIVE (transportation_id, student_id)
values (172, 372925172);
insert into ARRIVE (transportation_id, student_id)
values (173, 372925173);
insert into ARRIVE (transportation_id, student_id)
values (174, 372925174);
insert into ARRIVE (transportation_id, student_id)
values (175, 372925175);
insert into ARRIVE (transportation_id, student_id)
values (176, 372925176);
insert into ARRIVE (transportation_id, student_id)
values (177, 372925177);
insert into ARRIVE (transportation_id, student_id)
values (178, 372925178);
insert into ARRIVE (transportation_id, student_id)
values (179, 372925179);
insert into ARRIVE (transportation_id, student_id)
values (180, 372925180);
insert into ARRIVE (transportation_id, student_id)
values (181, 372925181);
insert into ARRIVE (transportation_id, student_id)
values (182, 372925182);
insert into ARRIVE (transportation_id, student_id)
values (183, 372925183);
insert into ARRIVE (transportation_id, student_id)
values (184, 372925184);
insert into ARRIVE (transportation_id, student_id)
values (185, 372925185);
insert into ARRIVE (transportation_id, student_id)
values (186, 372925186);
insert into ARRIVE (transportation_id, student_id)
values (187, 372925187);
insert into ARRIVE (transportation_id, student_id)
values (188, 372925188);
insert into ARRIVE (transportation_id, student_id)
values (189, 372925189);
insert into ARRIVE (transportation_id, student_id)
values (190, 372925190);
insert into ARRIVE (transportation_id, student_id)
values (191, 372925191);
insert into ARRIVE (transportation_id, student_id)
values (192, 372925192);
insert into ARRIVE (transportation_id, student_id)
values (193, 372925193);
insert into ARRIVE (transportation_id, student_id)
values (194, 372925194);
insert into ARRIVE (transportation_id, student_id)
values (195, 372925195);
insert into ARRIVE (transportation_id, student_id)
values (196, 372925196);
insert into ARRIVE (transportation_id, student_id)
values (197, 372925197);
insert into ARRIVE (transportation_id, student_id)
values (198, 372925198);
insert into ARRIVE (transportation_id, student_id)
values (199, 372925199);
insert into ARRIVE (transportation_id, student_id)
values (200, 372925200);
insert into ARRIVE (transportation_id, student_id)
values (201, 372925201);
insert into ARRIVE (transportation_id, student_id)
values (202, 372925202);
insert into ARRIVE (transportation_id, student_id)
values (203, 372925203);
commit;
prompt 600 records committed...
insert into ARRIVE (transportation_id, student_id)
values (204, 372925204);
insert into ARRIVE (transportation_id, student_id)
values (205, 372925205);
insert into ARRIVE (transportation_id, student_id)
values (206, 372925206);
insert into ARRIVE (transportation_id, student_id)
values (207, 372925207);
insert into ARRIVE (transportation_id, student_id)
values (208, 372925208);
insert into ARRIVE (transportation_id, student_id)
values (209, 372925209);
insert into ARRIVE (transportation_id, student_id)
values (210, 372925210);
insert into ARRIVE (transportation_id, student_id)
values (211, 372925211);
insert into ARRIVE (transportation_id, student_id)
values (212, 372925212);
insert into ARRIVE (transportation_id, student_id)
values (213, 372925213);
insert into ARRIVE (transportation_id, student_id)
values (214, 372925214);
insert into ARRIVE (transportation_id, student_id)
values (215, 372925215);
insert into ARRIVE (transportation_id, student_id)
values (216, 372925216);
insert into ARRIVE (transportation_id, student_id)
values (217, 372925217);
insert into ARRIVE (transportation_id, student_id)
values (218, 372925218);
insert into ARRIVE (transportation_id, student_id)
values (219, 372925219);
insert into ARRIVE (transportation_id, student_id)
values (220, 372925220);
insert into ARRIVE (transportation_id, student_id)
values (221, 372925221);
insert into ARRIVE (transportation_id, student_id)
values (222, 372925222);
insert into ARRIVE (transportation_id, student_id)
values (223, 372925223);
insert into ARRIVE (transportation_id, student_id)
values (224, 372925224);
insert into ARRIVE (transportation_id, student_id)
values (225, 372925225);
insert into ARRIVE (transportation_id, student_id)
values (226, 372925226);
insert into ARRIVE (transportation_id, student_id)
values (227, 372925227);
insert into ARRIVE (transportation_id, student_id)
values (228, 372925228);
insert into ARRIVE (transportation_id, student_id)
values (229, 372925229);
insert into ARRIVE (transportation_id, student_id)
values (230, 372925230);
insert into ARRIVE (transportation_id, student_id)
values (231, 372925231);
insert into ARRIVE (transportation_id, student_id)
values (232, 372925232);
insert into ARRIVE (transportation_id, student_id)
values (233, 372925233);
insert into ARRIVE (transportation_id, student_id)
values (234, 372925234);
insert into ARRIVE (transportation_id, student_id)
values (235, 372925235);
insert into ARRIVE (transportation_id, student_id)
values (236, 372925236);
insert into ARRIVE (transportation_id, student_id)
values (237, 372925237);
insert into ARRIVE (transportation_id, student_id)
values (238, 372925238);
insert into ARRIVE (transportation_id, student_id)
values (239, 372925239);
insert into ARRIVE (transportation_id, student_id)
values (240, 372925240);
insert into ARRIVE (transportation_id, student_id)
values (241, 372925241);
insert into ARRIVE (transportation_id, student_id)
values (242, 372925242);
insert into ARRIVE (transportation_id, student_id)
values (243, 372925243);
insert into ARRIVE (transportation_id, student_id)
values (244, 372925244);
insert into ARRIVE (transportation_id, student_id)
values (245, 372925245);
insert into ARRIVE (transportation_id, student_id)
values (246, 372925246);
insert into ARRIVE (transportation_id, student_id)
values (247, 372925247);
insert into ARRIVE (transportation_id, student_id)
values (248, 372925248);
insert into ARRIVE (transportation_id, student_id)
values (249, 372925249);
insert into ARRIVE (transportation_id, student_id)
values (250, 372925250);
insert into ARRIVE (transportation_id, student_id)
values (251, 372925251);
insert into ARRIVE (transportation_id, student_id)
values (252, 372925252);
insert into ARRIVE (transportation_id, student_id)
values (253, 372925253);
insert into ARRIVE (transportation_id, student_id)
values (254, 372925254);
insert into ARRIVE (transportation_id, student_id)
values (255, 372925255);
insert into ARRIVE (transportation_id, student_id)
values (256, 372925256);
insert into ARRIVE (transportation_id, student_id)
values (257, 372925257);
insert into ARRIVE (transportation_id, student_id)
values (258, 372925258);
insert into ARRIVE (transportation_id, student_id)
values (259, 372925259);
insert into ARRIVE (transportation_id, student_id)
values (260, 372925260);
insert into ARRIVE (transportation_id, student_id)
values (261, 372925261);
insert into ARRIVE (transportation_id, student_id)
values (262, 372925262);
insert into ARRIVE (transportation_id, student_id)
values (263, 372925263);
insert into ARRIVE (transportation_id, student_id)
values (264, 372925264);
insert into ARRIVE (transportation_id, student_id)
values (265, 372925265);
insert into ARRIVE (transportation_id, student_id)
values (266, 372925266);
insert into ARRIVE (transportation_id, student_id)
values (267, 372925267);
insert into ARRIVE (transportation_id, student_id)
values (268, 372925268);
insert into ARRIVE (transportation_id, student_id)
values (269, 372925269);
insert into ARRIVE (transportation_id, student_id)
values (270, 372925270);
insert into ARRIVE (transportation_id, student_id)
values (271, 372925271);
insert into ARRIVE (transportation_id, student_id)
values (272, 372925272);
insert into ARRIVE (transportation_id, student_id)
values (273, 372925273);
insert into ARRIVE (transportation_id, student_id)
values (274, 372925274);
insert into ARRIVE (transportation_id, student_id)
values (275, 372925275);
insert into ARRIVE (transportation_id, student_id)
values (276, 372925276);
insert into ARRIVE (transportation_id, student_id)
values (277, 372925277);
insert into ARRIVE (transportation_id, student_id)
values (278, 372925278);
insert into ARRIVE (transportation_id, student_id)
values (279, 372925279);
insert into ARRIVE (transportation_id, student_id)
values (280, 372925280);
insert into ARRIVE (transportation_id, student_id)
values (281, 372925281);
insert into ARRIVE (transportation_id, student_id)
values (282, 372925282);
insert into ARRIVE (transportation_id, student_id)
values (283, 372925283);
insert into ARRIVE (transportation_id, student_id)
values (284, 372925284);
insert into ARRIVE (transportation_id, student_id)
values (285, 372925285);
insert into ARRIVE (transportation_id, student_id)
values (286, 372925286);
insert into ARRIVE (transportation_id, student_id)
values (287, 372925287);
insert into ARRIVE (transportation_id, student_id)
values (288, 372925288);
insert into ARRIVE (transportation_id, student_id)
values (289, 372925289);
insert into ARRIVE (transportation_id, student_id)
values (290, 372925290);
insert into ARRIVE (transportation_id, student_id)
values (291, 372925291);
insert into ARRIVE (transportation_id, student_id)
values (292, 372925292);
insert into ARRIVE (transportation_id, student_id)
values (293, 372925293);
insert into ARRIVE (transportation_id, student_id)
values (294, 372925294);
insert into ARRIVE (transportation_id, student_id)
values (295, 372925295);
insert into ARRIVE (transportation_id, student_id)
values (296, 372925296);
insert into ARRIVE (transportation_id, student_id)
values (297, 372925297);
insert into ARRIVE (transportation_id, student_id)
values (298, 372925298);
insert into ARRIVE (transportation_id, student_id)
values (299, 372925299);
insert into ARRIVE (transportation_id, student_id)
values (300, 372925300);
insert into ARRIVE (transportation_id, student_id)
values (301, 372925301);
insert into ARRIVE (transportation_id, student_id)
values (302, 372925302);
insert into ARRIVE (transportation_id, student_id)
values (303, 372925303);
commit;
prompt 700 records committed...
insert into ARRIVE (transportation_id, student_id)
values (304, 372925304);
insert into ARRIVE (transportation_id, student_id)
values (305, 372925305);
insert into ARRIVE (transportation_id, student_id)
values (306, 372925306);
insert into ARRIVE (transportation_id, student_id)
values (307, 372925307);
insert into ARRIVE (transportation_id, student_id)
values (308, 372925308);
insert into ARRIVE (transportation_id, student_id)
values (309, 372925309);
insert into ARRIVE (transportation_id, student_id)
values (310, 372925310);
insert into ARRIVE (transportation_id, student_id)
values (311, 372925311);
insert into ARRIVE (transportation_id, student_id)
values (312, 372925312);
insert into ARRIVE (transportation_id, student_id)
values (313, 372925313);
insert into ARRIVE (transportation_id, student_id)
values (314, 372925314);
insert into ARRIVE (transportation_id, student_id)
values (315, 372925315);
insert into ARRIVE (transportation_id, student_id)
values (316, 372925316);
insert into ARRIVE (transportation_id, student_id)
values (317, 372925317);
insert into ARRIVE (transportation_id, student_id)
values (318, 372925318);
insert into ARRIVE (transportation_id, student_id)
values (319, 372925319);
insert into ARRIVE (transportation_id, student_id)
values (320, 372925320);
insert into ARRIVE (transportation_id, student_id)
values (321, 372925321);
insert into ARRIVE (transportation_id, student_id)
values (322, 372925322);
insert into ARRIVE (transportation_id, student_id)
values (323, 372925323);
insert into ARRIVE (transportation_id, student_id)
values (324, 372925324);
insert into ARRIVE (transportation_id, student_id)
values (325, 372925325);
insert into ARRIVE (transportation_id, student_id)
values (326, 372925326);
insert into ARRIVE (transportation_id, student_id)
values (327, 372925327);
insert into ARRIVE (transportation_id, student_id)
values (328, 372925328);
insert into ARRIVE (transportation_id, student_id)
values (329, 372925329);
insert into ARRIVE (transportation_id, student_id)
values (330, 372925330);
insert into ARRIVE (transportation_id, student_id)
values (331, 372925331);
insert into ARRIVE (transportation_id, student_id)
values (332, 372925332);
insert into ARRIVE (transportation_id, student_id)
values (333, 372925333);
insert into ARRIVE (transportation_id, student_id)
values (334, 372925334);
insert into ARRIVE (transportation_id, student_id)
values (335, 372925335);
insert into ARRIVE (transportation_id, student_id)
values (336, 372925336);
insert into ARRIVE (transportation_id, student_id)
values (337, 372925337);
insert into ARRIVE (transportation_id, student_id)
values (338, 372925338);
insert into ARRIVE (transportation_id, student_id)
values (339, 372925339);
insert into ARRIVE (transportation_id, student_id)
values (340, 372925340);
insert into ARRIVE (transportation_id, student_id)
values (341, 372925341);
insert into ARRIVE (transportation_id, student_id)
values (342, 372925342);
insert into ARRIVE (transportation_id, student_id)
values (343, 372925343);
insert into ARRIVE (transportation_id, student_id)
values (344, 372925344);
insert into ARRIVE (transportation_id, student_id)
values (345, 372925345);
insert into ARRIVE (transportation_id, student_id)
values (346, 372925346);
insert into ARRIVE (transportation_id, student_id)
values (347, 372925347);
insert into ARRIVE (transportation_id, student_id)
values (348, 372925348);
insert into ARRIVE (transportation_id, student_id)
values (349, 372925349);
insert into ARRIVE (transportation_id, student_id)
values (350, 372925350);
insert into ARRIVE (transportation_id, student_id)
values (351, 372925351);
insert into ARRIVE (transportation_id, student_id)
values (352, 372925352);
insert into ARRIVE (transportation_id, student_id)
values (353, 372925353);
insert into ARRIVE (transportation_id, student_id)
values (354, 372925354);
insert into ARRIVE (transportation_id, student_id)
values (355, 372925355);
insert into ARRIVE (transportation_id, student_id)
values (356, 372925356);
insert into ARRIVE (transportation_id, student_id)
values (357, 372925357);
insert into ARRIVE (transportation_id, student_id)
values (358, 372925358);
insert into ARRIVE (transportation_id, student_id)
values (359, 372925359);
insert into ARRIVE (transportation_id, student_id)
values (360, 372925360);
insert into ARRIVE (transportation_id, student_id)
values (361, 372925361);
insert into ARRIVE (transportation_id, student_id)
values (362, 372925362);
insert into ARRIVE (transportation_id, student_id)
values (363, 372925363);
insert into ARRIVE (transportation_id, student_id)
values (364, 372925364);
insert into ARRIVE (transportation_id, student_id)
values (365, 372925365);
insert into ARRIVE (transportation_id, student_id)
values (366, 372925366);
insert into ARRIVE (transportation_id, student_id)
values (367, 372925367);
insert into ARRIVE (transportation_id, student_id)
values (368, 372925368);
insert into ARRIVE (transportation_id, student_id)
values (369, 372925369);
insert into ARRIVE (transportation_id, student_id)
values (370, 372925370);
insert into ARRIVE (transportation_id, student_id)
values (371, 372925371);
insert into ARRIVE (transportation_id, student_id)
values (372, 372925372);
insert into ARRIVE (transportation_id, student_id)
values (373, 372925373);
insert into ARRIVE (transportation_id, student_id)
values (374, 372925374);
insert into ARRIVE (transportation_id, student_id)
values (375, 372925375);
insert into ARRIVE (transportation_id, student_id)
values (376, 372925376);
insert into ARRIVE (transportation_id, student_id)
values (377, 372925377);
insert into ARRIVE (transportation_id, student_id)
values (378, 372925378);
insert into ARRIVE (transportation_id, student_id)
values (379, 372925379);
insert into ARRIVE (transportation_id, student_id)
values (380, 372925380);
insert into ARRIVE (transportation_id, student_id)
values (381, 372925381);
insert into ARRIVE (transportation_id, student_id)
values (382, 372925382);
insert into ARRIVE (transportation_id, student_id)
values (383, 372925383);
insert into ARRIVE (transportation_id, student_id)
values (384, 372925384);
insert into ARRIVE (transportation_id, student_id)
values (385, 372925385);
insert into ARRIVE (transportation_id, student_id)
values (386, 372925386);
insert into ARRIVE (transportation_id, student_id)
values (387, 372925387);
insert into ARRIVE (transportation_id, student_id)
values (388, 372925388);
insert into ARRIVE (transportation_id, student_id)
values (389, 372925389);
insert into ARRIVE (transportation_id, student_id)
values (390, 372925390);
insert into ARRIVE (transportation_id, student_id)
values (391, 372925391);
insert into ARRIVE (transportation_id, student_id)
values (392, 372925392);
insert into ARRIVE (transportation_id, student_id)
values (393, 372925393);
insert into ARRIVE (transportation_id, student_id)
values (394, 372925394);
insert into ARRIVE (transportation_id, student_id)
values (395, 372925395);
insert into ARRIVE (transportation_id, student_id)
values (396, 372925396);
insert into ARRIVE (transportation_id, student_id)
values (397, 372925397);
insert into ARRIVE (transportation_id, student_id)
values (398, 372925398);
insert into ARRIVE (transportation_id, student_id)
values (399, 372925399);
insert into ARRIVE (transportation_id, student_id)
values (400, 372925400);
insert into ARRIVE (transportation_id, student_id)
values (14, 372925058);
insert into ARRIVE (transportation_id, student_id)
values (14, 372925092);
insert into ARRIVE (transportation_id, student_id)
values (14, 372925145);
commit;
prompt 800 records committed...
insert into ARRIVE (transportation_id, student_id)
values (14, 372925199);
insert into ARRIVE (transportation_id, student_id)
values (14, 372925400);
insert into ARRIVE (transportation_id, student_id)
values (14, 372925273);
insert into ARRIVE (transportation_id, student_id)
values (14, 372925374);
insert into ARRIVE (transportation_id, student_id)
values (55, 372925015);
insert into ARRIVE (transportation_id, student_id)
values (55, 372925018);
insert into ARRIVE (transportation_id, student_id)
values (55, 372925026);
insert into ARRIVE (transportation_id, student_id)
values (55, 372925078);
insert into ARRIVE (transportation_id, student_id)
values (55, 372925084);
commit;
prompt 809 records loaded
prompt Loading MEALS...
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (1, 'Lunch', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (2, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (3, 'Lunch', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (4, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (5, 'Breakfast', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (6, 'Lunch', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (7, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (8, 'Lunch', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (9, 'Breakfast', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (10, 'Breakfast', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (11, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (12, 'Lunch', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (13, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (14, 'Dinner', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (15, 'Lunch', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (16, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (17, 'Lunch', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (18, 'Breakfast', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (19, 'Dinner', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (20, 'Breakfast', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (21, 'Lunch', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (22, 'Breakfast', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (23, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (24, 'Dinner', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (25, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (26, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (27, 'Breakfast', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (28, 'Dinner', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (29, 'Dinner', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (30, 'Dinner', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (31, 'Lunch', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (32, 'Lunch', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (33, 'Lunch', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (34, 'Lunch', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (35, 'Breakfast', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (36, 'Breakfast', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (37, 'Dinner', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (38, 'Lunch', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (39, 'Breakfast', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (40, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (41, 'Lunch', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (42, 'Lunch', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (43, 'Lunch', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (44, 'Breakfast', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (45, 'Breakfast', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (46, 'Breakfast', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (47, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (48, 'Lunch', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (49, 'Dinner', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (50, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (51, 'Breakfast', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (52, 'Dinner', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (53, 'Dinner', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (54, 'Lunch', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (55, 'Breakfast', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (56, 'Dinner', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (57, 'Breakfast', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (58, 'Lunch', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (59, 'Lunch', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (60, 'Lunch', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (61, 'Dinner', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (62, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (63, 'Lunch', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (64, 'Lunch', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (65, 'Breakfast', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (66, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (67, 'Dinner', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (68, 'Lunch', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (69, 'Breakfast', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (70, 'Lunch', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (71, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (72, 'Breakfast', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (73, 'Breakfast', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (74, 'Lunch', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (75, 'Breakfast', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (76, 'Dinner', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (77, 'Breakfast', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (78, 'Breakfast', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (79, 'Breakfast', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (80, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (81, 'Lunch', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (82, 'Lunch', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (83, 'Lunch', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (84, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (85, 'Breakfast', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (86, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (87, 'Breakfast', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (88, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (89, 'Dinner', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (90, 'Breakfast', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (91, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (92, 'Dinner', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (93, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (94, 'Lunch', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (95, 'Lunch', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (96, 'Lunch', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (97, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (98, 'Breakfast', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (99, 'Breakfast', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (100, 'Breakfast', 'No', 'Salad');
commit;
prompt 100 records committed...
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (101, 'Dinner', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (102, 'Dinner', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (103, 'Breakfast', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (104, 'Breakfast', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (105, 'Lunch', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (106, 'Breakfast', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (107, 'Lunch', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (108, 'Dinner', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (109, 'Lunch', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (110, 'Lunch', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (111, 'Lunch', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (112, 'Breakfast', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (113, 'Breakfast', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (114, 'Breakfast', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (115, 'Lunch', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (116, 'Lunch', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (117, 'Dinner', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (118, 'Dinner', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (119, 'Lunch', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (120, 'Dinner', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (121, 'Lunch', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (122, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (123, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (124, 'Dinner', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (125, 'Breakfast', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (126, 'Breakfast', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (127, 'Breakfast', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (128, 'Breakfast', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (129, 'Breakfast', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (130, 'Dinner', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (131, 'Dinner', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (132, 'Lunch', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (133, 'Breakfast', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (134, 'Lunch', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (135, 'Dinner', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (136, 'Breakfast', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (137, 'Dinner', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (138, 'Breakfast', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (139, 'Dinner', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (140, 'Lunch', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (141, 'Dinner', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (142, 'Breakfast', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (143, 'Breakfast', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (144, 'Dinner', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (145, 'Breakfast', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (146, 'Lunch', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (147, 'Dinner', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (148, 'Lunch', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (149, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (150, 'Dinner', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (151, 'Breakfast', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (152, 'Dinner', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (153, 'Lunch', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (154, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (155, 'Dinner', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (156, 'Lunch', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (157, 'Breakfast', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (158, 'Dinner', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (159, 'Lunch', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (160, 'Dinner', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (161, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (162, 'Dinner', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (163, 'Breakfast', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (164, 'Lunch', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (165, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (166, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (167, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (168, 'Breakfast', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (169, 'Breakfast', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (170, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (171, 'Breakfast', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (172, 'Breakfast', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (173, 'Dinner', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (174, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (175, 'Breakfast', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (176, 'Breakfast', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (177, 'Breakfast', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (178, 'Breakfast', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (179, 'Lunch', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (180, 'Dinner', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (181, 'Dinner', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (182, 'Dinner', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (183, 'Lunch', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (184, 'Dinner', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (185, 'Lunch', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (186, 'Dinner', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (187, 'Lunch', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (188, 'Lunch', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (189, 'Breakfast', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (190, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (191, 'Dinner', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (192, 'Breakfast', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (193, 'Breakfast', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (194, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (195, 'Breakfast', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (196, 'Lunch', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (197, 'Breakfast', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (198, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (199, 'Dinner', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (200, 'Breakfast', 'No', 'Steak');
commit;
prompt 200 records committed...
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (201, 'Dinner', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (202, 'Lunch', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (203, 'Dinner', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (204, 'Breakfast', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (205, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (206, 'Breakfast', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (207, 'Dinner', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (208, 'Breakfast', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (209, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (210, 'Breakfast', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (211, 'Lunch', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (212, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (213, 'Breakfast', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (214, 'Dinner', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (215, 'Dinner', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (216, 'Breakfast', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (217, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (218, 'Dinner', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (219, 'Dinner', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (220, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (221, 'Dinner', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (222, 'Breakfast', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (223, 'Dinner', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (224, 'Breakfast', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (225, 'Lunch', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (226, 'Dinner', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (227, 'Breakfast', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (228, 'Lunch', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (229, 'Lunch', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (230, 'Dinner', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (231, 'Breakfast', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (232, 'Breakfast', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (233, 'Lunch', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (234, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (235, 'Lunch', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (236, 'Breakfast', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (237, 'Dinner', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (238, 'Dinner', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (239, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (240, 'Breakfast', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (241, 'Lunch', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (242, 'Dinner', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (243, 'Breakfast', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (244, 'Breakfast', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (245, 'Lunch', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (246, 'Dinner', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (247, 'Lunch', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (248, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (249, 'Breakfast', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (250, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (251, 'Lunch', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (252, 'Lunch', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (253, 'Breakfast', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (254, 'Dinner', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (255, 'Dinner', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (256, 'Dinner', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (257, 'Lunch', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (258, 'Breakfast', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (259, 'Dinner', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (260, 'Breakfast', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (261, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (262, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (263, 'Lunch', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (264, 'Dinner', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (265, 'Breakfast', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (266, 'Breakfast', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (267, 'Lunch', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (268, 'Breakfast', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (269, 'Dinner', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (270, 'Breakfast', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (271, 'Dinner', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (272, 'Lunch', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (273, 'Lunch', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (274, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (275, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (276, 'Breakfast', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (277, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (278, 'Lunch', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (279, 'Breakfast', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (280, 'Breakfast', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (281, 'Dinner', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (282, 'Lunch', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (283, 'Lunch', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (284, 'Breakfast', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (285, 'Breakfast', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (286, 'Breakfast', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (287, 'Dinner', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (288, 'Breakfast', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (289, 'Lunch', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (290, 'Lunch', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (291, 'Lunch', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (292, 'Dinner', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (293, 'Dinner', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (294, 'Lunch', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (295, 'Breakfast', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (296, 'Lunch', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (297, 'Breakfast', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (298, 'Breakfast', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (299, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (300, 'Lunch', 'Yes', 'Tacos');
commit;
prompt 300 records committed...
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (301, 'Breakfast', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (302, 'Dinner', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (303, 'Lunch', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (304, 'Dinner', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (305, 'Breakfast', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (306, 'Breakfast', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (307, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (308, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (309, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (310, 'Dinner', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (311, 'Lunch', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (312, 'Dinner', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (313, 'Lunch', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (314, 'Breakfast', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (315, 'Dinner', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (316, 'Dinner', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (317, 'Breakfast', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (318, 'Lunch', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (319, 'Lunch', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (320, 'Lunch', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (321, 'Lunch', 'Yes', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (322, 'Lunch', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (323, 'Lunch', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (324, 'Lunch', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (325, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (326, 'Dinner', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (327, 'Dinner', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (328, 'Lunch', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (329, 'Lunch', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (330, 'Breakfast', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (331, 'Dinner', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (332, 'Breakfast', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (333, 'Dinner', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (334, 'Dinner', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (335, 'Breakfast', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (336, 'Dinner', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (337, 'Dinner', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (338, 'Dinner', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (339, 'Dinner', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (340, 'Lunch', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (341, 'Dinner', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (342, 'Lunch', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (343, 'Dinner', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (344, 'Breakfast', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (345, 'Lunch', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (346, 'Dinner', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (347, 'Dinner', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (348, 'Breakfast', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (349, 'Lunch', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (350, 'Dinner', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (351, 'Dinner', 'Yes', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (352, 'Breakfast', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (353, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (354, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (355, 'Lunch', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (356, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (357, 'Lunch', 'No', 'Steak');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (358, 'Breakfast', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (359, 'Breakfast', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (360, 'Lunch', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (361, 'Lunch', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (362, 'Breakfast', 'No', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (363, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (364, 'Lunch', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (365, 'Dinner', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (366, 'Breakfast', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (367, 'Dinner', 'Yes', 'Tacos');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (368, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (369, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (370, 'Lunch', 'Yes', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (371, 'Breakfast', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (372, 'Breakfast', 'No', 'Sushi');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (373, 'Dinner', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (374, 'Dinner', 'No', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (375, 'Dinner', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (376, 'Dinner', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (377, 'Dinner', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (378, 'Breakfast', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (379, 'Breakfast', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (380, 'Dinner', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (381, 'Breakfast', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (382, 'Dinner', 'Yes', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (383, 'Dinner', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (384, 'Breakfast', 'Yes', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (385, 'Lunch', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (386, 'Dinner', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (387, 'Breakfast', 'No', 'Pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (388, 'Lunch', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (389, 'Dinner', 'No', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (390, 'Lunch', 'No', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (391, 'Lunch', 'No', 'Salad');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (392, 'Dinner', 'No', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (393, 'Dinner', 'No', 'Sandwich');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (394, 'Lunch', 'Yes', 'Hamburger');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (395, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (396, 'Breakfast', 'Yes', 'pizza');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (397, 'Lunch', 'Yes', 'Spaghetti');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (398, 'Breakfast', 'Yes', 'Soup');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (399, 'Breakfast', 'Yes', 'Pasta');
insert into MEALS (meal_id, type_meal, is_dairy, meal_name)
values (400, 'Breakfast', 'No', 'Pizza');
commit;
prompt 400 records loaded
prompt Loading EATER...
insert into EATER (meal_id, student_id)
values (1, 1);
insert into EATER (meal_id, student_id)
values (2, 2);
insert into EATER (meal_id, student_id)
values (3, 3);
insert into EATER (meal_id, student_id)
values (4, 4);
insert into EATER (meal_id, student_id)
values (5, 5);
insert into EATER (meal_id, student_id)
values (7, 7);
insert into EATER (meal_id, student_id)
values (8, 8);
insert into EATER (meal_id, student_id)
values (9, 9);
insert into EATER (meal_id, student_id)
values (10, 10);
insert into EATER (meal_id, student_id)
values (11, 11);
insert into EATER (meal_id, student_id)
values (12, 12);
insert into EATER (meal_id, student_id)
values (13, 13);
insert into EATER (meal_id, student_id)
values (15, 15);
insert into EATER (meal_id, student_id)
values (16, 16);
insert into EATER (meal_id, student_id)
values (17, 17);
insert into EATER (meal_id, student_id)
values (18, 18);
insert into EATER (meal_id, student_id)
values (19, 19);
insert into EATER (meal_id, student_id)
values (20, 20);
insert into EATER (meal_id, student_id)
values (21, 21);
insert into EATER (meal_id, student_id)
values (22, 22);
insert into EATER (meal_id, student_id)
values (23, 23);
insert into EATER (meal_id, student_id)
values (24, 24);
insert into EATER (meal_id, student_id)
values (25, 25);
insert into EATER (meal_id, student_id)
values (26, 26);
insert into EATER (meal_id, student_id)
values (27, 27);
insert into EATER (meal_id, student_id)
values (28, 28);
insert into EATER (meal_id, student_id)
values (29, 29);
insert into EATER (meal_id, student_id)
values (30, 30);
insert into EATER (meal_id, student_id)
values (31, 31);
insert into EATER (meal_id, student_id)
values (32, 32);
insert into EATER (meal_id, student_id)
values (33, 33);
insert into EATER (meal_id, student_id)
values (34, 34);
insert into EATER (meal_id, student_id)
values (35, 35);
insert into EATER (meal_id, student_id)
values (36, 36);
insert into EATER (meal_id, student_id)
values (37, 37);
insert into EATER (meal_id, student_id)
values (38, 38);
insert into EATER (meal_id, student_id)
values (39, 39);
insert into EATER (meal_id, student_id)
values (40, 40);
insert into EATER (meal_id, student_id)
values (41, 41);
insert into EATER (meal_id, student_id)
values (42, 42);
insert into EATER (meal_id, student_id)
values (43, 43);
insert into EATER (meal_id, student_id)
values (44, 44);
insert into EATER (meal_id, student_id)
values (45, 45);
insert into EATER (meal_id, student_id)
values (46, 46);
insert into EATER (meal_id, student_id)
values (47, 47);
insert into EATER (meal_id, student_id)
values (48, 48);
insert into EATER (meal_id, student_id)
values (49, 49);
insert into EATER (meal_id, student_id)
values (50, 50);
insert into EATER (meal_id, student_id)
values (51, 51);
insert into EATER (meal_id, student_id)
values (52, 52);
insert into EATER (meal_id, student_id)
values (53, 53);
insert into EATER (meal_id, student_id)
values (54, 54);
insert into EATER (meal_id, student_id)
values (55, 55);
insert into EATER (meal_id, student_id)
values (56, 56);
insert into EATER (meal_id, student_id)
values (57, 57);
insert into EATER (meal_id, student_id)
values (58, 58);
insert into EATER (meal_id, student_id)
values (59, 59);
insert into EATER (meal_id, student_id)
values (60, 60);
insert into EATER (meal_id, student_id)
values (61, 61);
insert into EATER (meal_id, student_id)
values (62, 62);
insert into EATER (meal_id, student_id)
values (63, 63);
insert into EATER (meal_id, student_id)
values (64, 64);
insert into EATER (meal_id, student_id)
values (65, 65);
insert into EATER (meal_id, student_id)
values (66, 66);
insert into EATER (meal_id, student_id)
values (67, 67);
insert into EATER (meal_id, student_id)
values (68, 68);
insert into EATER (meal_id, student_id)
values (69, 69);
insert into EATER (meal_id, student_id)
values (70, 70);
insert into EATER (meal_id, student_id)
values (71, 71);
insert into EATER (meal_id, student_id)
values (72, 72);
insert into EATER (meal_id, student_id)
values (73, 73);
insert into EATER (meal_id, student_id)
values (74, 74);
insert into EATER (meal_id, student_id)
values (75, 75);
insert into EATER (meal_id, student_id)
values (76, 76);
insert into EATER (meal_id, student_id)
values (77, 77);
insert into EATER (meal_id, student_id)
values (78, 78);
insert into EATER (meal_id, student_id)
values (79, 79);
insert into EATER (meal_id, student_id)
values (80, 80);
insert into EATER (meal_id, student_id)
values (81, 81);
insert into EATER (meal_id, student_id)
values (82, 82);
insert into EATER (meal_id, student_id)
values (83, 83);
insert into EATER (meal_id, student_id)
values (84, 84);
insert into EATER (meal_id, student_id)
values (85, 85);
insert into EATER (meal_id, student_id)
values (86, 86);
insert into EATER (meal_id, student_id)
values (87, 87);
insert into EATER (meal_id, student_id)
values (88, 88);
insert into EATER (meal_id, student_id)
values (89, 89);
insert into EATER (meal_id, student_id)
values (90, 90);
insert into EATER (meal_id, student_id)
values (91, 91);
insert into EATER (meal_id, student_id)
values (92, 92);
insert into EATER (meal_id, student_id)
values (93, 93);
insert into EATER (meal_id, student_id)
values (94, 94);
insert into EATER (meal_id, student_id)
values (95, 95);
insert into EATER (meal_id, student_id)
values (96, 96);
insert into EATER (meal_id, student_id)
values (97, 97);
insert into EATER (meal_id, student_id)
values (98, 98);
insert into EATER (meal_id, student_id)
values (99, 99);
insert into EATER (meal_id, student_id)
values (100, 100);
insert into EATER (meal_id, student_id)
values (101, 101);
insert into EATER (meal_id, student_id)
values (102, 102);
commit;
prompt 100 records committed...
insert into EATER (meal_id, student_id)
values (103, 103);
insert into EATER (meal_id, student_id)
values (104, 104);
insert into EATER (meal_id, student_id)
values (105, 105);
insert into EATER (meal_id, student_id)
values (106, 106);
insert into EATER (meal_id, student_id)
values (107, 107);
insert into EATER (meal_id, student_id)
values (108, 108);
insert into EATER (meal_id, student_id)
values (109, 109);
insert into EATER (meal_id, student_id)
values (110, 110);
insert into EATER (meal_id, student_id)
values (111, 111);
insert into EATER (meal_id, student_id)
values (112, 112);
insert into EATER (meal_id, student_id)
values (113, 113);
insert into EATER (meal_id, student_id)
values (114, 114);
insert into EATER (meal_id, student_id)
values (115, 115);
insert into EATER (meal_id, student_id)
values (116, 116);
insert into EATER (meal_id, student_id)
values (117, 117);
insert into EATER (meal_id, student_id)
values (118, 118);
insert into EATER (meal_id, student_id)
values (119, 119);
insert into EATER (meal_id, student_id)
values (120, 120);
insert into EATER (meal_id, student_id)
values (121, 121);
insert into EATER (meal_id, student_id)
values (122, 122);
insert into EATER (meal_id, student_id)
values (123, 123);
insert into EATER (meal_id, student_id)
values (124, 124);
insert into EATER (meal_id, student_id)
values (125, 125);
insert into EATER (meal_id, student_id)
values (126, 126);
insert into EATER (meal_id, student_id)
values (127, 127);
insert into EATER (meal_id, student_id)
values (128, 128);
insert into EATER (meal_id, student_id)
values (129, 129);
insert into EATER (meal_id, student_id)
values (130, 130);
insert into EATER (meal_id, student_id)
values (131, 131);
insert into EATER (meal_id, student_id)
values (132, 132);
insert into EATER (meal_id, student_id)
values (133, 133);
insert into EATER (meal_id, student_id)
values (134, 134);
insert into EATER (meal_id, student_id)
values (135, 135);
insert into EATER (meal_id, student_id)
values (136, 136);
insert into EATER (meal_id, student_id)
values (137, 137);
insert into EATER (meal_id, student_id)
values (138, 138);
insert into EATER (meal_id, student_id)
values (139, 139);
insert into EATER (meal_id, student_id)
values (140, 140);
insert into EATER (meal_id, student_id)
values (141, 141);
insert into EATER (meal_id, student_id)
values (142, 142);
insert into EATER (meal_id, student_id)
values (143, 143);
insert into EATER (meal_id, student_id)
values (144, 144);
insert into EATER (meal_id, student_id)
values (145, 145);
insert into EATER (meal_id, student_id)
values (146, 146);
insert into EATER (meal_id, student_id)
values (147, 147);
insert into EATER (meal_id, student_id)
values (148, 148);
insert into EATER (meal_id, student_id)
values (149, 149);
insert into EATER (meal_id, student_id)
values (150, 150);
insert into EATER (meal_id, student_id)
values (151, 151);
insert into EATER (meal_id, student_id)
values (152, 152);
insert into EATER (meal_id, student_id)
values (153, 153);
insert into EATER (meal_id, student_id)
values (154, 154);
insert into EATER (meal_id, student_id)
values (155, 155);
insert into EATER (meal_id, student_id)
values (156, 156);
insert into EATER (meal_id, student_id)
values (157, 157);
insert into EATER (meal_id, student_id)
values (158, 158);
insert into EATER (meal_id, student_id)
values (159, 159);
insert into EATER (meal_id, student_id)
values (160, 160);
insert into EATER (meal_id, student_id)
values (161, 161);
insert into EATER (meal_id, student_id)
values (162, 162);
insert into EATER (meal_id, student_id)
values (163, 163);
insert into EATER (meal_id, student_id)
values (164, 164);
insert into EATER (meal_id, student_id)
values (165, 165);
insert into EATER (meal_id, student_id)
values (166, 166);
insert into EATER (meal_id, student_id)
values (167, 167);
insert into EATER (meal_id, student_id)
values (168, 168);
insert into EATER (meal_id, student_id)
values (169, 169);
insert into EATER (meal_id, student_id)
values (170, 170);
insert into EATER (meal_id, student_id)
values (171, 171);
insert into EATER (meal_id, student_id)
values (172, 172);
insert into EATER (meal_id, student_id)
values (173, 173);
insert into EATER (meal_id, student_id)
values (174, 174);
insert into EATER (meal_id, student_id)
values (175, 175);
insert into EATER (meal_id, student_id)
values (176, 176);
insert into EATER (meal_id, student_id)
values (177, 177);
insert into EATER (meal_id, student_id)
values (178, 178);
insert into EATER (meal_id, student_id)
values (179, 179);
insert into EATER (meal_id, student_id)
values (180, 180);
insert into EATER (meal_id, student_id)
values (181, 181);
insert into EATER (meal_id, student_id)
values (182, 182);
insert into EATER (meal_id, student_id)
values (183, 183);
insert into EATER (meal_id, student_id)
values (184, 184);
insert into EATER (meal_id, student_id)
values (185, 185);
insert into EATER (meal_id, student_id)
values (186, 186);
insert into EATER (meal_id, student_id)
values (187, 187);
insert into EATER (meal_id, student_id)
values (188, 188);
insert into EATER (meal_id, student_id)
values (189, 189);
insert into EATER (meal_id, student_id)
values (190, 190);
insert into EATER (meal_id, student_id)
values (191, 191);
insert into EATER (meal_id, student_id)
values (192, 192);
insert into EATER (meal_id, student_id)
values (193, 193);
insert into EATER (meal_id, student_id)
values (194, 194);
insert into EATER (meal_id, student_id)
values (195, 195);
insert into EATER (meal_id, student_id)
values (196, 196);
insert into EATER (meal_id, student_id)
values (197, 197);
insert into EATER (meal_id, student_id)
values (198, 198);
insert into EATER (meal_id, student_id)
values (199, 199);
insert into EATER (meal_id, student_id)
values (200, 200);
insert into EATER (meal_id, student_id)
values (201, 201);
insert into EATER (meal_id, student_id)
values (202, 202);
commit;
prompt 200 records committed...
insert into EATER (meal_id, student_id)
values (203, 203);
insert into EATER (meal_id, student_id)
values (204, 204);
insert into EATER (meal_id, student_id)
values (205, 205);
insert into EATER (meal_id, student_id)
values (206, 206);
insert into EATER (meal_id, student_id)
values (207, 207);
insert into EATER (meal_id, student_id)
values (208, 208);
insert into EATER (meal_id, student_id)
values (209, 209);
insert into EATER (meal_id, student_id)
values (210, 210);
insert into EATER (meal_id, student_id)
values (211, 211);
insert into EATER (meal_id, student_id)
values (212, 212);
insert into EATER (meal_id, student_id)
values (213, 213);
insert into EATER (meal_id, student_id)
values (214, 214);
insert into EATER (meal_id, student_id)
values (215, 215);
insert into EATER (meal_id, student_id)
values (216, 216);
insert into EATER (meal_id, student_id)
values (217, 217);
insert into EATER (meal_id, student_id)
values (218, 218);
insert into EATER (meal_id, student_id)
values (219, 219);
insert into EATER (meal_id, student_id)
values (220, 220);
insert into EATER (meal_id, student_id)
values (221, 221);
insert into EATER (meal_id, student_id)
values (222, 222);
insert into EATER (meal_id, student_id)
values (223, 223);
insert into EATER (meal_id, student_id)
values (224, 224);
insert into EATER (meal_id, student_id)
values (225, 225);
insert into EATER (meal_id, student_id)
values (226, 226);
insert into EATER (meal_id, student_id)
values (227, 227);
insert into EATER (meal_id, student_id)
values (228, 228);
insert into EATER (meal_id, student_id)
values (229, 229);
insert into EATER (meal_id, student_id)
values (230, 230);
insert into EATER (meal_id, student_id)
values (231, 231);
insert into EATER (meal_id, student_id)
values (232, 232);
insert into EATER (meal_id, student_id)
values (233, 233);
insert into EATER (meal_id, student_id)
values (234, 234);
insert into EATER (meal_id, student_id)
values (235, 235);
insert into EATER (meal_id, student_id)
values (236, 236);
insert into EATER (meal_id, student_id)
values (237, 237);
insert into EATER (meal_id, student_id)
values (238, 238);
insert into EATER (meal_id, student_id)
values (239, 239);
insert into EATER (meal_id, student_id)
values (240, 240);
insert into EATER (meal_id, student_id)
values (241, 241);
insert into EATER (meal_id, student_id)
values (242, 242);
insert into EATER (meal_id, student_id)
values (243, 243);
insert into EATER (meal_id, student_id)
values (244, 244);
insert into EATER (meal_id, student_id)
values (245, 245);
insert into EATER (meal_id, student_id)
values (246, 246);
insert into EATER (meal_id, student_id)
values (247, 247);
insert into EATER (meal_id, student_id)
values (248, 248);
insert into EATER (meal_id, student_id)
values (249, 249);
insert into EATER (meal_id, student_id)
values (250, 250);
insert into EATER (meal_id, student_id)
values (251, 251);
insert into EATER (meal_id, student_id)
values (252, 252);
insert into EATER (meal_id, student_id)
values (253, 253);
insert into EATER (meal_id, student_id)
values (254, 254);
insert into EATER (meal_id, student_id)
values (255, 255);
insert into EATER (meal_id, student_id)
values (256, 256);
insert into EATER (meal_id, student_id)
values (257, 257);
insert into EATER (meal_id, student_id)
values (258, 258);
insert into EATER (meal_id, student_id)
values (259, 259);
insert into EATER (meal_id, student_id)
values (260, 260);
insert into EATER (meal_id, student_id)
values (261, 261);
insert into EATER (meal_id, student_id)
values (262, 262);
insert into EATER (meal_id, student_id)
values (263, 263);
insert into EATER (meal_id, student_id)
values (264, 264);
insert into EATER (meal_id, student_id)
values (265, 265);
insert into EATER (meal_id, student_id)
values (266, 266);
insert into EATER (meal_id, student_id)
values (267, 267);
insert into EATER (meal_id, student_id)
values (268, 268);
insert into EATER (meal_id, student_id)
values (269, 269);
insert into EATER (meal_id, student_id)
values (270, 270);
insert into EATER (meal_id, student_id)
values (271, 271);
insert into EATER (meal_id, student_id)
values (272, 272);
insert into EATER (meal_id, student_id)
values (273, 273);
insert into EATER (meal_id, student_id)
values (274, 274);
insert into EATER (meal_id, student_id)
values (275, 275);
insert into EATER (meal_id, student_id)
values (276, 276);
insert into EATER (meal_id, student_id)
values (277, 277);
insert into EATER (meal_id, student_id)
values (278, 278);
insert into EATER (meal_id, student_id)
values (279, 279);
insert into EATER (meal_id, student_id)
values (280, 280);
insert into EATER (meal_id, student_id)
values (281, 281);
insert into EATER (meal_id, student_id)
values (282, 282);
insert into EATER (meal_id, student_id)
values (283, 283);
insert into EATER (meal_id, student_id)
values (284, 284);
insert into EATER (meal_id, student_id)
values (285, 285);
insert into EATER (meal_id, student_id)
values (286, 286);
insert into EATER (meal_id, student_id)
values (287, 287);
insert into EATER (meal_id, student_id)
values (288, 288);
insert into EATER (meal_id, student_id)
values (289, 289);
insert into EATER (meal_id, student_id)
values (290, 290);
insert into EATER (meal_id, student_id)
values (291, 291);
insert into EATER (meal_id, student_id)
values (292, 292);
insert into EATER (meal_id, student_id)
values (293, 293);
insert into EATER (meal_id, student_id)
values (294, 294);
insert into EATER (meal_id, student_id)
values (295, 295);
insert into EATER (meal_id, student_id)
values (296, 296);
insert into EATER (meal_id, student_id)
values (297, 297);
insert into EATER (meal_id, student_id)
values (298, 298);
insert into EATER (meal_id, student_id)
values (299, 299);
insert into EATER (meal_id, student_id)
values (300, 300);
insert into EATER (meal_id, student_id)
values (301, 301);
insert into EATER (meal_id, student_id)
values (302, 302);
commit;
prompt 300 records committed...
insert into EATER (meal_id, student_id)
values (303, 303);
insert into EATER (meal_id, student_id)
values (304, 304);
insert into EATER (meal_id, student_id)
values (305, 305);
insert into EATER (meal_id, student_id)
values (306, 306);
insert into EATER (meal_id, student_id)
values (307, 307);
insert into EATER (meal_id, student_id)
values (308, 308);
insert into EATER (meal_id, student_id)
values (309, 309);
insert into EATER (meal_id, student_id)
values (310, 310);
insert into EATER (meal_id, student_id)
values (311, 311);
insert into EATER (meal_id, student_id)
values (312, 312);
insert into EATER (meal_id, student_id)
values (313, 313);
insert into EATER (meal_id, student_id)
values (314, 314);
insert into EATER (meal_id, student_id)
values (315, 315);
insert into EATER (meal_id, student_id)
values (316, 316);
insert into EATER (meal_id, student_id)
values (317, 317);
insert into EATER (meal_id, student_id)
values (318, 318);
insert into EATER (meal_id, student_id)
values (319, 319);
insert into EATER (meal_id, student_id)
values (320, 320);
insert into EATER (meal_id, student_id)
values (321, 321);
insert into EATER (meal_id, student_id)
values (322, 322);
insert into EATER (meal_id, student_id)
values (323, 323);
insert into EATER (meal_id, student_id)
values (324, 324);
insert into EATER (meal_id, student_id)
values (325, 325);
insert into EATER (meal_id, student_id)
values (326, 326);
insert into EATER (meal_id, student_id)
values (327, 327);
insert into EATER (meal_id, student_id)
values (328, 328);
insert into EATER (meal_id, student_id)
values (329, 329);
insert into EATER (meal_id, student_id)
values (330, 330);
insert into EATER (meal_id, student_id)
values (331, 331);
insert into EATER (meal_id, student_id)
values (332, 332);
insert into EATER (meal_id, student_id)
values (333, 333);
insert into EATER (meal_id, student_id)
values (334, 334);
insert into EATER (meal_id, student_id)
values (335, 335);
insert into EATER (meal_id, student_id)
values (336, 336);
insert into EATER (meal_id, student_id)
values (337, 337);
insert into EATER (meal_id, student_id)
values (338, 338);
insert into EATER (meal_id, student_id)
values (339, 339);
insert into EATER (meal_id, student_id)
values (340, 340);
insert into EATER (meal_id, student_id)
values (341, 341);
insert into EATER (meal_id, student_id)
values (342, 342);
insert into EATER (meal_id, student_id)
values (343, 343);
insert into EATER (meal_id, student_id)
values (344, 344);
insert into EATER (meal_id, student_id)
values (345, 345);
insert into EATER (meal_id, student_id)
values (346, 346);
insert into EATER (meal_id, student_id)
values (347, 347);
insert into EATER (meal_id, student_id)
values (348, 348);
insert into EATER (meal_id, student_id)
values (349, 349);
insert into EATER (meal_id, student_id)
values (350, 350);
insert into EATER (meal_id, student_id)
values (351, 351);
insert into EATER (meal_id, student_id)
values (352, 352);
insert into EATER (meal_id, student_id)
values (353, 353);
insert into EATER (meal_id, student_id)
values (354, 354);
insert into EATER (meal_id, student_id)
values (355, 355);
insert into EATER (meal_id, student_id)
values (356, 356);
insert into EATER (meal_id, student_id)
values (357, 357);
insert into EATER (meal_id, student_id)
values (358, 358);
insert into EATER (meal_id, student_id)
values (359, 359);
insert into EATER (meal_id, student_id)
values (360, 360);
insert into EATER (meal_id, student_id)
values (361, 361);
insert into EATER (meal_id, student_id)
values (362, 362);
insert into EATER (meal_id, student_id)
values (363, 363);
insert into EATER (meal_id, student_id)
values (364, 364);
insert into EATER (meal_id, student_id)
values (365, 365);
insert into EATER (meal_id, student_id)
values (366, 366);
insert into EATER (meal_id, student_id)
values (367, 367);
insert into EATER (meal_id, student_id)
values (368, 368);
insert into EATER (meal_id, student_id)
values (369, 369);
insert into EATER (meal_id, student_id)
values (370, 370);
insert into EATER (meal_id, student_id)
values (371, 371);
insert into EATER (meal_id, student_id)
values (372, 372);
insert into EATER (meal_id, student_id)
values (373, 373);
insert into EATER (meal_id, student_id)
values (374, 374);
insert into EATER (meal_id, student_id)
values (375, 375);
insert into EATER (meal_id, student_id)
values (376, 376);
insert into EATER (meal_id, student_id)
values (377, 377);
insert into EATER (meal_id, student_id)
values (378, 378);
insert into EATER (meal_id, student_id)
values (379, 379);
insert into EATER (meal_id, student_id)
values (380, 380);
insert into EATER (meal_id, student_id)
values (381, 381);
insert into EATER (meal_id, student_id)
values (382, 382);
insert into EATER (meal_id, student_id)
values (383, 383);
insert into EATER (meal_id, student_id)
values (384, 384);
insert into EATER (meal_id, student_id)
values (385, 385);
insert into EATER (meal_id, student_id)
values (386, 386);
insert into EATER (meal_id, student_id)
values (387, 387);
insert into EATER (meal_id, student_id)
values (388, 388);
insert into EATER (meal_id, student_id)
values (389, 389);
insert into EATER (meal_id, student_id)
values (390, 390);
insert into EATER (meal_id, student_id)
values (391, 391);
insert into EATER (meal_id, student_id)
values (392, 392);
insert into EATER (meal_id, student_id)
values (393, 393);
insert into EATER (meal_id, student_id)
values (394, 394);
insert into EATER (meal_id, student_id)
values (395, 395);
insert into EATER (meal_id, student_id)
values (396, 396);
insert into EATER (meal_id, student_id)
values (397, 397);
insert into EATER (meal_id, student_id)
values (398, 398);
insert into EATER (meal_id, student_id)
values (399, 399);
insert into EATER (meal_id, student_id)
values (400, 400);
insert into EATER (meal_id, student_id)
values (1, 372925001);
insert into EATER (meal_id, student_id)
values (2, 372925002);
commit;
prompt 400 records committed...
insert into EATER (meal_id, student_id)
values (3, 372925003);
insert into EATER (meal_id, student_id)
values (4, 372925004);
insert into EATER (meal_id, student_id)
values (5, 372925005);
insert into EATER (meal_id, student_id)
values (6, 372925006);
insert into EATER (meal_id, student_id)
values (7, 372925007);
insert into EATER (meal_id, student_id)
values (8, 372925008);
insert into EATER (meal_id, student_id)
values (9, 372925009);
insert into EATER (meal_id, student_id)
values (10, 372925010);
insert into EATER (meal_id, student_id)
values (11, 372925011);
insert into EATER (meal_id, student_id)
values (12, 372925012);
insert into EATER (meal_id, student_id)
values (13, 372925013);
insert into EATER (meal_id, student_id)
values (14, 372925014);
insert into EATER (meal_id, student_id)
values (15, 372925015);
insert into EATER (meal_id, student_id)
values (16, 372925016);
insert into EATER (meal_id, student_id)
values (17, 372925017);
insert into EATER (meal_id, student_id)
values (18, 372925018);
insert into EATER (meal_id, student_id)
values (19, 372925019);
insert into EATER (meal_id, student_id)
values (20, 372925020);
insert into EATER (meal_id, student_id)
values (21, 372925021);
insert into EATER (meal_id, student_id)
values (22, 372925022);
insert into EATER (meal_id, student_id)
values (23, 372925023);
insert into EATER (meal_id, student_id)
values (24, 372925024);
insert into EATER (meal_id, student_id)
values (25, 372925025);
insert into EATER (meal_id, student_id)
values (26, 372925026);
insert into EATER (meal_id, student_id)
values (27, 372925027);
insert into EATER (meal_id, student_id)
values (28, 372925028);
insert into EATER (meal_id, student_id)
values (29, 372925029);
insert into EATER (meal_id, student_id)
values (30, 372925030);
insert into EATER (meal_id, student_id)
values (31, 372925031);
insert into EATER (meal_id, student_id)
values (32, 372925032);
insert into EATER (meal_id, student_id)
values (33, 372925033);
insert into EATER (meal_id, student_id)
values (34, 372925034);
insert into EATER (meal_id, student_id)
values (35, 372925035);
insert into EATER (meal_id, student_id)
values (36, 372925036);
insert into EATER (meal_id, student_id)
values (37, 372925037);
insert into EATER (meal_id, student_id)
values (38, 372925038);
insert into EATER (meal_id, student_id)
values (39, 372925039);
insert into EATER (meal_id, student_id)
values (40, 372925040);
insert into EATER (meal_id, student_id)
values (41, 372925041);
insert into EATER (meal_id, student_id)
values (42, 372925042);
insert into EATER (meal_id, student_id)
values (43, 372925043);
insert into EATER (meal_id, student_id)
values (44, 372925044);
insert into EATER (meal_id, student_id)
values (45, 372925045);
insert into EATER (meal_id, student_id)
values (46, 372925046);
insert into EATER (meal_id, student_id)
values (47, 372925047);
insert into EATER (meal_id, student_id)
values (48, 372925048);
insert into EATER (meal_id, student_id)
values (49, 372925049);
insert into EATER (meal_id, student_id)
values (50, 372925050);
insert into EATER (meal_id, student_id)
values (51, 372925051);
insert into EATER (meal_id, student_id)
values (52, 372925052);
insert into EATER (meal_id, student_id)
values (53, 372925053);
insert into EATER (meal_id, student_id)
values (54, 372925054);
insert into EATER (meal_id, student_id)
values (55, 372925055);
insert into EATER (meal_id, student_id)
values (56, 372925056);
insert into EATER (meal_id, student_id)
values (57, 372925057);
insert into EATER (meal_id, student_id)
values (58, 372925058);
insert into EATER (meal_id, student_id)
values (59, 372925059);
insert into EATER (meal_id, student_id)
values (60, 372925060);
insert into EATER (meal_id, student_id)
values (61, 372925061);
insert into EATER (meal_id, student_id)
values (62, 372925062);
insert into EATER (meal_id, student_id)
values (63, 372925063);
insert into EATER (meal_id, student_id)
values (64, 372925064);
insert into EATER (meal_id, student_id)
values (65, 372925065);
insert into EATER (meal_id, student_id)
values (66, 372925066);
insert into EATER (meal_id, student_id)
values (67, 372925067);
insert into EATER (meal_id, student_id)
values (68, 372925068);
insert into EATER (meal_id, student_id)
values (69, 372925069);
insert into EATER (meal_id, student_id)
values (70, 372925070);
insert into EATER (meal_id, student_id)
values (71, 372925071);
insert into EATER (meal_id, student_id)
values (72, 372925072);
insert into EATER (meal_id, student_id)
values (73, 372925073);
insert into EATER (meal_id, student_id)
values (74, 372925074);
insert into EATER (meal_id, student_id)
values (75, 372925075);
insert into EATER (meal_id, student_id)
values (76, 372925076);
insert into EATER (meal_id, student_id)
values (77, 372925077);
insert into EATER (meal_id, student_id)
values (78, 372925078);
insert into EATER (meal_id, student_id)
values (79, 372925079);
insert into EATER (meal_id, student_id)
values (80, 372925080);
insert into EATER (meal_id, student_id)
values (81, 372925081);
insert into EATER (meal_id, student_id)
values (82, 372925082);
insert into EATER (meal_id, student_id)
values (83, 372925083);
insert into EATER (meal_id, student_id)
values (84, 372925084);
insert into EATER (meal_id, student_id)
values (85, 372925085);
insert into EATER (meal_id, student_id)
values (86, 372925086);
insert into EATER (meal_id, student_id)
values (87, 372925087);
insert into EATER (meal_id, student_id)
values (88, 372925088);
insert into EATER (meal_id, student_id)
values (89, 372925089);
insert into EATER (meal_id, student_id)
values (90, 372925090);
insert into EATER (meal_id, student_id)
values (91, 372925091);
insert into EATER (meal_id, student_id)
values (92, 372925092);
insert into EATER (meal_id, student_id)
values (93, 372925093);
insert into EATER (meal_id, student_id)
values (94, 372925094);
insert into EATER (meal_id, student_id)
values (95, 372925095);
insert into EATER (meal_id, student_id)
values (96, 372925096);
insert into EATER (meal_id, student_id)
values (97, 372925097);
insert into EATER (meal_id, student_id)
values (98, 372925098);
insert into EATER (meal_id, student_id)
values (99, 372925099);
insert into EATER (meal_id, student_id)
values (100, 372925100);
insert into EATER (meal_id, student_id)
values (101, 372925101);
insert into EATER (meal_id, student_id)
values (102, 372925102);
commit;
prompt 500 records committed...
insert into EATER (meal_id, student_id)
values (103, 372925103);
insert into EATER (meal_id, student_id)
values (104, 372925104);
insert into EATER (meal_id, student_id)
values (105, 372925105);
insert into EATER (meal_id, student_id)
values (106, 372925106);
insert into EATER (meal_id, student_id)
values (107, 372925107);
insert into EATER (meal_id, student_id)
values (108, 372925108);
insert into EATER (meal_id, student_id)
values (109, 372925109);
insert into EATER (meal_id, student_id)
values (110, 372925110);
insert into EATER (meal_id, student_id)
values (111, 372925111);
insert into EATER (meal_id, student_id)
values (112, 372925112);
insert into EATER (meal_id, student_id)
values (113, 372925113);
insert into EATER (meal_id, student_id)
values (114, 372925114);
insert into EATER (meal_id, student_id)
values (115, 372925115);
insert into EATER (meal_id, student_id)
values (116, 372925116);
insert into EATER (meal_id, student_id)
values (117, 372925117);
insert into EATER (meal_id, student_id)
values (118, 372925118);
insert into EATER (meal_id, student_id)
values (119, 372925119);
insert into EATER (meal_id, student_id)
values (120, 372925120);
insert into EATER (meal_id, student_id)
values (121, 372925121);
insert into EATER (meal_id, student_id)
values (122, 372925122);
insert into EATER (meal_id, student_id)
values (123, 372925123);
insert into EATER (meal_id, student_id)
values (124, 372925124);
insert into EATER (meal_id, student_id)
values (125, 372925125);
insert into EATER (meal_id, student_id)
values (126, 372925126);
insert into EATER (meal_id, student_id)
values (127, 372925127);
insert into EATER (meal_id, student_id)
values (128, 372925128);
insert into EATER (meal_id, student_id)
values (129, 372925129);
insert into EATER (meal_id, student_id)
values (130, 372925130);
insert into EATER (meal_id, student_id)
values (131, 372925131);
insert into EATER (meal_id, student_id)
values (132, 372925132);
insert into EATER (meal_id, student_id)
values (133, 372925133);
insert into EATER (meal_id, student_id)
values (134, 372925134);
insert into EATER (meal_id, student_id)
values (135, 372925135);
insert into EATER (meal_id, student_id)
values (136, 372925136);
insert into EATER (meal_id, student_id)
values (137, 372925137);
insert into EATER (meal_id, student_id)
values (138, 372925138);
insert into EATER (meal_id, student_id)
values (139, 372925139);
insert into EATER (meal_id, student_id)
values (140, 372925140);
insert into EATER (meal_id, student_id)
values (141, 372925141);
insert into EATER (meal_id, student_id)
values (142, 372925142);
insert into EATER (meal_id, student_id)
values (143, 372925143);
insert into EATER (meal_id, student_id)
values (144, 372925144);
insert into EATER (meal_id, student_id)
values (145, 372925145);
insert into EATER (meal_id, student_id)
values (146, 372925146);
insert into EATER (meal_id, student_id)
values (147, 372925147);
insert into EATER (meal_id, student_id)
values (148, 372925148);
insert into EATER (meal_id, student_id)
values (149, 372925149);
insert into EATER (meal_id, student_id)
values (150, 372925150);
insert into EATER (meal_id, student_id)
values (151, 372925151);
insert into EATER (meal_id, student_id)
values (152, 372925152);
insert into EATER (meal_id, student_id)
values (153, 372925153);
insert into EATER (meal_id, student_id)
values (154, 372925154);
insert into EATER (meal_id, student_id)
values (155, 372925155);
insert into EATER (meal_id, student_id)
values (156, 372925156);
insert into EATER (meal_id, student_id)
values (157, 372925157);
insert into EATER (meal_id, student_id)
values (158, 372925158);
insert into EATER (meal_id, student_id)
values (159, 372925159);
insert into EATER (meal_id, student_id)
values (160, 372925160);
insert into EATER (meal_id, student_id)
values (161, 372925161);
insert into EATER (meal_id, student_id)
values (162, 372925162);
insert into EATER (meal_id, student_id)
values (163, 372925163);
insert into EATER (meal_id, student_id)
values (164, 372925164);
insert into EATER (meal_id, student_id)
values (165, 372925165);
insert into EATER (meal_id, student_id)
values (166, 372925166);
insert into EATER (meal_id, student_id)
values (167, 372925167);
insert into EATER (meal_id, student_id)
values (168, 372925168);
insert into EATER (meal_id, student_id)
values (169, 372925169);
insert into EATER (meal_id, student_id)
values (170, 372925170);
insert into EATER (meal_id, student_id)
values (171, 372925171);
insert into EATER (meal_id, student_id)
values (172, 372925172);
insert into EATER (meal_id, student_id)
values (173, 372925173);
insert into EATER (meal_id, student_id)
values (174, 372925174);
insert into EATER (meal_id, student_id)
values (175, 372925175);
insert into EATER (meal_id, student_id)
values (176, 372925176);
insert into EATER (meal_id, student_id)
values (177, 372925177);
insert into EATER (meal_id, student_id)
values (178, 372925178);
insert into EATER (meal_id, student_id)
values (179, 372925179);
insert into EATER (meal_id, student_id)
values (180, 372925180);
insert into EATER (meal_id, student_id)
values (181, 372925181);
insert into EATER (meal_id, student_id)
values (182, 372925182);
insert into EATER (meal_id, student_id)
values (183, 372925183);
insert into EATER (meal_id, student_id)
values (184, 372925184);
insert into EATER (meal_id, student_id)
values (185, 372925185);
insert into EATER (meal_id, student_id)
values (186, 372925186);
insert into EATER (meal_id, student_id)
values (187, 372925187);
insert into EATER (meal_id, student_id)
values (188, 372925188);
insert into EATER (meal_id, student_id)
values (189, 372925189);
insert into EATER (meal_id, student_id)
values (190, 372925190);
insert into EATER (meal_id, student_id)
values (191, 372925191);
insert into EATER (meal_id, student_id)
values (192, 372925192);
insert into EATER (meal_id, student_id)
values (193, 372925193);
insert into EATER (meal_id, student_id)
values (194, 372925194);
insert into EATER (meal_id, student_id)
values (195, 372925195);
insert into EATER (meal_id, student_id)
values (196, 372925196);
insert into EATER (meal_id, student_id)
values (197, 372925197);
insert into EATER (meal_id, student_id)
values (198, 372925198);
insert into EATER (meal_id, student_id)
values (199, 372925199);
insert into EATER (meal_id, student_id)
values (200, 372925200);
insert into EATER (meal_id, student_id)
values (201, 372925201);
insert into EATER (meal_id, student_id)
values (202, 372925202);
commit;
prompt 600 records committed...
insert into EATER (meal_id, student_id)
values (203, 372925203);
insert into EATER (meal_id, student_id)
values (204, 372925204);
insert into EATER (meal_id, student_id)
values (205, 372925205);
insert into EATER (meal_id, student_id)
values (206, 372925206);
insert into EATER (meal_id, student_id)
values (207, 372925207);
insert into EATER (meal_id, student_id)
values (208, 372925208);
insert into EATER (meal_id, student_id)
values (209, 372925209);
insert into EATER (meal_id, student_id)
values (210, 372925210);
insert into EATER (meal_id, student_id)
values (211, 372925211);
insert into EATER (meal_id, student_id)
values (212, 372925212);
insert into EATER (meal_id, student_id)
values (213, 372925213);
insert into EATER (meal_id, student_id)
values (214, 372925214);
insert into EATER (meal_id, student_id)
values (215, 372925215);
insert into EATER (meal_id, student_id)
values (216, 372925216);
insert into EATER (meal_id, student_id)
values (217, 372925217);
insert into EATER (meal_id, student_id)
values (218, 372925218);
insert into EATER (meal_id, student_id)
values (219, 372925219);
insert into EATER (meal_id, student_id)
values (220, 372925220);
insert into EATER (meal_id, student_id)
values (221, 372925221);
insert into EATER (meal_id, student_id)
values (222, 372925222);
insert into EATER (meal_id, student_id)
values (223, 372925223);
insert into EATER (meal_id, student_id)
values (224, 372925224);
insert into EATER (meal_id, student_id)
values (225, 372925225);
insert into EATER (meal_id, student_id)
values (226, 372925226);
insert into EATER (meal_id, student_id)
values (227, 372925227);
insert into EATER (meal_id, student_id)
values (228, 372925228);
insert into EATER (meal_id, student_id)
values (229, 372925229);
insert into EATER (meal_id, student_id)
values (230, 372925230);
insert into EATER (meal_id, student_id)
values (231, 372925231);
insert into EATER (meal_id, student_id)
values (232, 372925232);
insert into EATER (meal_id, student_id)
values (233, 372925233);
insert into EATER (meal_id, student_id)
values (234, 372925234);
insert into EATER (meal_id, student_id)
values (235, 372925235);
insert into EATER (meal_id, student_id)
values (236, 372925236);
insert into EATER (meal_id, student_id)
values (237, 372925237);
insert into EATER (meal_id, student_id)
values (238, 372925238);
insert into EATER (meal_id, student_id)
values (239, 372925239);
insert into EATER (meal_id, student_id)
values (240, 372925240);
insert into EATER (meal_id, student_id)
values (241, 372925241);
insert into EATER (meal_id, student_id)
values (242, 372925242);
insert into EATER (meal_id, student_id)
values (243, 372925243);
insert into EATER (meal_id, student_id)
values (244, 372925244);
insert into EATER (meal_id, student_id)
values (245, 372925245);
insert into EATER (meal_id, student_id)
values (246, 372925246);
insert into EATER (meal_id, student_id)
values (247, 372925247);
insert into EATER (meal_id, student_id)
values (248, 372925248);
insert into EATER (meal_id, student_id)
values (249, 372925249);
insert into EATER (meal_id, student_id)
values (250, 372925250);
insert into EATER (meal_id, student_id)
values (251, 372925251);
insert into EATER (meal_id, student_id)
values (252, 372925252);
insert into EATER (meal_id, student_id)
values (253, 372925253);
insert into EATER (meal_id, student_id)
values (254, 372925254);
insert into EATER (meal_id, student_id)
values (255, 372925255);
insert into EATER (meal_id, student_id)
values (256, 372925256);
insert into EATER (meal_id, student_id)
values (257, 372925257);
insert into EATER (meal_id, student_id)
values (258, 372925258);
insert into EATER (meal_id, student_id)
values (259, 372925259);
insert into EATER (meal_id, student_id)
values (260, 372925260);
insert into EATER (meal_id, student_id)
values (261, 372925261);
insert into EATER (meal_id, student_id)
values (262, 372925262);
insert into EATER (meal_id, student_id)
values (263, 372925263);
insert into EATER (meal_id, student_id)
values (264, 372925264);
insert into EATER (meal_id, student_id)
values (265, 372925265);
insert into EATER (meal_id, student_id)
values (266, 372925266);
insert into EATER (meal_id, student_id)
values (267, 372925267);
insert into EATER (meal_id, student_id)
values (268, 372925268);
insert into EATER (meal_id, student_id)
values (269, 372925269);
insert into EATER (meal_id, student_id)
values (270, 372925270);
insert into EATER (meal_id, student_id)
values (271, 372925271);
insert into EATER (meal_id, student_id)
values (272, 372925272);
insert into EATER (meal_id, student_id)
values (273, 372925273);
insert into EATER (meal_id, student_id)
values (274, 372925274);
insert into EATER (meal_id, student_id)
values (275, 372925275);
insert into EATER (meal_id, student_id)
values (276, 372925276);
insert into EATER (meal_id, student_id)
values (277, 372925277);
insert into EATER (meal_id, student_id)
values (278, 372925278);
insert into EATER (meal_id, student_id)
values (279, 372925279);
insert into EATER (meal_id, student_id)
values (280, 372925280);
insert into EATER (meal_id, student_id)
values (281, 372925281);
insert into EATER (meal_id, student_id)
values (282, 372925282);
insert into EATER (meal_id, student_id)
values (283, 372925283);
insert into EATER (meal_id, student_id)
values (284, 372925284);
insert into EATER (meal_id, student_id)
values (285, 372925285);
insert into EATER (meal_id, student_id)
values (286, 372925286);
insert into EATER (meal_id, student_id)
values (287, 372925287);
insert into EATER (meal_id, student_id)
values (288, 372925288);
insert into EATER (meal_id, student_id)
values (289, 372925289);
insert into EATER (meal_id, student_id)
values (290, 372925290);
insert into EATER (meal_id, student_id)
values (291, 372925291);
insert into EATER (meal_id, student_id)
values (292, 372925292);
insert into EATER (meal_id, student_id)
values (293, 372925293);
insert into EATER (meal_id, student_id)
values (294, 372925294);
insert into EATER (meal_id, student_id)
values (295, 372925295);
insert into EATER (meal_id, student_id)
values (296, 372925296);
insert into EATER (meal_id, student_id)
values (297, 372925297);
insert into EATER (meal_id, student_id)
values (298, 372925298);
insert into EATER (meal_id, student_id)
values (299, 372925299);
insert into EATER (meal_id, student_id)
values (300, 372925300);
insert into EATER (meal_id, student_id)
values (301, 372925301);
insert into EATER (meal_id, student_id)
values (302, 372925302);
commit;
prompt 700 records committed...
insert into EATER (meal_id, student_id)
values (303, 372925303);
insert into EATER (meal_id, student_id)
values (304, 372925304);
insert into EATER (meal_id, student_id)
values (305, 372925305);
insert into EATER (meal_id, student_id)
values (306, 372925306);
insert into EATER (meal_id, student_id)
values (307, 372925307);
insert into EATER (meal_id, student_id)
values (308, 372925308);
insert into EATER (meal_id, student_id)
values (309, 372925309);
insert into EATER (meal_id, student_id)
values (310, 372925310);
insert into EATER (meal_id, student_id)
values (311, 372925311);
insert into EATER (meal_id, student_id)
values (312, 372925312);
insert into EATER (meal_id, student_id)
values (313, 372925313);
insert into EATER (meal_id, student_id)
values (314, 372925314);
insert into EATER (meal_id, student_id)
values (315, 372925315);
insert into EATER (meal_id, student_id)
values (316, 372925316);
insert into EATER (meal_id, student_id)
values (317, 372925317);
insert into EATER (meal_id, student_id)
values (318, 372925318);
insert into EATER (meal_id, student_id)
values (319, 372925319);
insert into EATER (meal_id, student_id)
values (320, 372925320);
insert into EATER (meal_id, student_id)
values (321, 372925321);
insert into EATER (meal_id, student_id)
values (322, 372925322);
insert into EATER (meal_id, student_id)
values (323, 372925323);
insert into EATER (meal_id, student_id)
values (324, 372925324);
insert into EATER (meal_id, student_id)
values (325, 372925325);
insert into EATER (meal_id, student_id)
values (326, 372925326);
insert into EATER (meal_id, student_id)
values (327, 372925327);
insert into EATER (meal_id, student_id)
values (328, 372925328);
insert into EATER (meal_id, student_id)
values (329, 372925329);
insert into EATER (meal_id, student_id)
values (330, 372925330);
insert into EATER (meal_id, student_id)
values (331, 372925331);
insert into EATER (meal_id, student_id)
values (332, 372925332);
insert into EATER (meal_id, student_id)
values (333, 372925333);
insert into EATER (meal_id, student_id)
values (334, 372925334);
insert into EATER (meal_id, student_id)
values (335, 372925335);
insert into EATER (meal_id, student_id)
values (336, 372925336);
insert into EATER (meal_id, student_id)
values (337, 372925337);
insert into EATER (meal_id, student_id)
values (338, 372925338);
insert into EATER (meal_id, student_id)
values (339, 372925339);
insert into EATER (meal_id, student_id)
values (340, 372925340);
insert into EATER (meal_id, student_id)
values (341, 372925341);
insert into EATER (meal_id, student_id)
values (342, 372925342);
insert into EATER (meal_id, student_id)
values (343, 372925343);
insert into EATER (meal_id, student_id)
values (344, 372925344);
insert into EATER (meal_id, student_id)
values (345, 372925345);
insert into EATER (meal_id, student_id)
values (346, 372925346);
insert into EATER (meal_id, student_id)
values (347, 372925347);
insert into EATER (meal_id, student_id)
values (348, 372925348);
insert into EATER (meal_id, student_id)
values (349, 372925349);
insert into EATER (meal_id, student_id)
values (350, 372925350);
insert into EATER (meal_id, student_id)
values (351, 372925351);
insert into EATER (meal_id, student_id)
values (352, 372925352);
insert into EATER (meal_id, student_id)
values (353, 372925353);
insert into EATER (meal_id, student_id)
values (354, 372925354);
insert into EATER (meal_id, student_id)
values (355, 372925355);
insert into EATER (meal_id, student_id)
values (356, 372925356);
insert into EATER (meal_id, student_id)
values (357, 372925357);
insert into EATER (meal_id, student_id)
values (358, 372925358);
insert into EATER (meal_id, student_id)
values (359, 372925359);
insert into EATER (meal_id, student_id)
values (360, 372925360);
insert into EATER (meal_id, student_id)
values (361, 372925361);
insert into EATER (meal_id, student_id)
values (362, 372925362);
insert into EATER (meal_id, student_id)
values (363, 372925363);
insert into EATER (meal_id, student_id)
values (364, 372925364);
insert into EATER (meal_id, student_id)
values (365, 372925365);
insert into EATER (meal_id, student_id)
values (366, 372925366);
insert into EATER (meal_id, student_id)
values (367, 372925367);
insert into EATER (meal_id, student_id)
values (368, 372925368);
insert into EATER (meal_id, student_id)
values (369, 372925369);
insert into EATER (meal_id, student_id)
values (370, 372925370);
insert into EATER (meal_id, student_id)
values (371, 372925371);
insert into EATER (meal_id, student_id)
values (372, 372925372);
insert into EATER (meal_id, student_id)
values (373, 372925373);
insert into EATER (meal_id, student_id)
values (374, 372925374);
insert into EATER (meal_id, student_id)
values (375, 372925375);
insert into EATER (meal_id, student_id)
values (376, 372925376);
insert into EATER (meal_id, student_id)
values (377, 372925377);
insert into EATER (meal_id, student_id)
values (378, 372925378);
insert into EATER (meal_id, student_id)
values (379, 372925379);
insert into EATER (meal_id, student_id)
values (380, 372925380);
insert into EATER (meal_id, student_id)
values (381, 372925381);
insert into EATER (meal_id, student_id)
values (382, 372925382);
insert into EATER (meal_id, student_id)
values (383, 372925383);
insert into EATER (meal_id, student_id)
values (384, 372925384);
insert into EATER (meal_id, student_id)
values (385, 372925385);
insert into EATER (meal_id, student_id)
values (386, 372925386);
insert into EATER (meal_id, student_id)
values (387, 372925387);
insert into EATER (meal_id, student_id)
values (388, 372925388);
insert into EATER (meal_id, student_id)
values (389, 372925389);
insert into EATER (meal_id, student_id)
values (390, 372925390);
insert into EATER (meal_id, student_id)
values (391, 372925391);
insert into EATER (meal_id, student_id)
values (392, 372925392);
insert into EATER (meal_id, student_id)
values (393, 372925393);
insert into EATER (meal_id, student_id)
values (394, 372925394);
insert into EATER (meal_id, student_id)
values (395, 372925395);
insert into EATER (meal_id, student_id)
values (396, 372925396);
insert into EATER (meal_id, student_id)
values (397, 372925397);
insert into EATER (meal_id, student_id)
values (398, 372925398);
insert into EATER (meal_id, student_id)
values (399, 372925399);
insert into EATER (meal_id, student_id)
values (400, 372925400);
commit;
prompt 798 records loaded
prompt Loading TRIPS...
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Matthew', '8', 1, to_date('19-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Sarah', '8', 2, to_date('23-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Carloston', '1', 3, to_date('28-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Danahaven', '3', 4, to_date('20-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Jordan', '8', 5, to_date('20-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Logan', '1', 6, to_date('21-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Megan', '9', 7, to_date('19-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Patricialand', '4', 8, to_date('07-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Davidborough', '11', 9, to_date('09-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Kimberly', '8', 10, to_date('30-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Crystalport', '1', 11, to_date('27-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Paynehaven', '5', 12, to_date('27-01-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Laura', '6', 13, to_date('25-09-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Smithside', '7', 14, to_date('18-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Amberburgh', '7', 15, to_date('02-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Jonborough', '7', 16, to_date('16-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Ashley', '11', 17, to_date('24-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Crystalport', '4', 18, to_date('13-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Perezland', '1', 19, to_date('08-10-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Westberg', '2', 20, to_date('09-03-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Darrenfurt', '5', 21, to_date('19-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Daisy', '8', 22, to_date('24-10-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Wilsonstad', '5', 23, to_date('27-09-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Chasebury', '6', 24, to_date('07-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Travis', '5', 25, to_date('05-10-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Michelle', '9', 26, to_date('12-10-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Mcdonaldmouth', '2', 27, to_date('15-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Bradley', '1', 28, to_date('30-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Westberg', '7', 29, to_date('13-12-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Rodneyfurt', '5', 30, to_date('04-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Elizabeth', '6', 31, to_date('07-10-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Debra', '12', 32, to_date('06-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Michael', '8', 33, to_date('21-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Michelle', '2', 34, to_date('22-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Penningtonburgh', '5', 35, to_date('06-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Laurentown', '5', 36, to_date('18-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Tristanville', '4', 37, to_date('16-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Rodneyfurt', '5', 38, to_date('23-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Weissport', '9', 39, to_date('11-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Aprilfort', '2', 40, to_date('08-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Wesleyborough', '9', 41, to_date('07-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Brandymouth', '9', 42, to_date('04-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Curtisfurt', '2', 43, to_date('24-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Summer', '7', 44, to_date('13-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Jesusfurt', '11', 45, to_date('22-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lanetown', '4', 46, to_date('30-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Kevinland', '9', 47, to_date('27-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Jeremy', '1', 48, to_date('02-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Brendanchester', '4', 49, to_date('05-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Mariaport', '6', 50, to_date('13-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Jacquelinebury', '4', 51, to_date('21-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Duaneside', '8', 52, to_date('14-10-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Isaac', '5', 53, to_date('07-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Mendezside', '11', 54, to_date('09-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Jasmineton', '4', 55, to_date('30-08-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Stephanieport', '2', 56, to_date('10-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Pamelabury', '6', 57, to_date('16-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Sarahmouth', '9', 58, to_date('02-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Matthew', '5', 59, to_date('18-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Zacharyland', '7', 60, to_date('06-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Clarkberg', '2', 61, to_date('07-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Rogersbury', '10', 62, to_date('03-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Wilsonbury', '3', 63, to_date('20-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Katiefort', '10', 64, to_date('06-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Randallmouth', '2', 65, to_date('16-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Elizabeth', '1', 66, to_date('02-10-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Patricialand', '10', 67, to_date('16-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Michelle', '6', 68, to_date('29-11-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Mcgeechester', '2', 69, to_date('01-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Danielle', '1', 70, to_date('20-04-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Haleymouth', '11', 71, to_date('09-03-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Charlesview', '10', 72, to_date('12-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Mendezside', '10', 73, to_date('15-03-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Hughestown', '1', 74, to_date('09-10-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Patricia', '3', 75, to_date('24-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Montgomerymouth', '7', 76, to_date('14-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Kimberly', '3', 77, to_date('27-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Julieport', '10', 78, to_date('24-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Turnerville', '2', 79, to_date('03-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Gonzalezborough', '3', 80, to_date('21-09-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Gonzalezhaven', '6', 81, to_date('29-01-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Jessicachester', '1', 82, to_date('12-02-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Shawn', '5', 83, to_date('27-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Joshuatown', '4', 84, to_date('15-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake David', '12', 85, to_date('20-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Allenbury', '3', 86, to_date('07-02-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Kevinview', '3', 87, to_date('07-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Hortontown', '10', 88, to_date('31-12-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Kenneth', '3', 89, to_date('02-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Joanchester', '4', 90, to_date('29-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Hutchinsonbury', '11', 91, to_date('14-12-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake David', '11', 92, to_date('05-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Olivia', '8', 93, to_date('19-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Jasonburgh', '4', 94, to_date('22-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Charlesview', '5', 95, to_date('10-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Goodmanburgh', '3', 96, to_date('11-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Justinmouth', '7', 97, to_date('27-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Michelleport', '9', 98, to_date('16-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Josephport', '12', 99, to_date('25-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Patrick', '3', 100, to_date('23-01-2023', 'dd-mm-yyyy'), 'History');
commit;
prompt 100 records committed...
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Darrenfurt', '5', 101, to_date('27-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Alexis', '3', 102, to_date('07-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Flemingmouth', '4', 103, to_date('11-04-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Amandaborough', '10', 104, to_date('18-03-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Shannon', '6', 105, to_date('18-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Johnsonchester', '4', 106, to_date('11-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Julia', '2', 107, to_date('10-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Ballardview', '6', 108, to_date('10-10-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Morrowhaven', '5', 109, to_date('06-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Jeffrey', '4', 110, to_date('03-08-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Joseph', '5', 111, to_date('07-10-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Eatontown', '6', 112, to_date('12-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Destinyfort', '6', 113, to_date('10-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Mcdonaldmouth', '12', 114, to_date('17-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Jesseburgh', '7', 115, to_date('27-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Gregoryport', '11', 116, to_date('08-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Patrick', '1', 117, to_date('16-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Jamesmouth', '9', 118, to_date('23-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Allenbury', '9', 119, to_date('21-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Jessica', '7', 120, to_date('18-01-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Denisetown', '6', 121, to_date('30-10-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Justinmouth', '8', 122, to_date('11-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Don', '11', 123, to_date('22-10-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Joshuatown', '3', 124, to_date('18-02-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Nicoleville', '1', 125, to_date('04-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Penningtonburgh', '4', 126, to_date('07-09-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Stephensonchester', '12', 127, to_date('23-04-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Michelle', '1', 128, to_date('14-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Anitabury', '5', 129, to_date('05-12-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Chelseyton', '6', 130, to_date('23-01-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Stephanieport', '2', 131, to_date('03-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Amberton', '7', 132, to_date('16-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Sarah', '4', 133, to_date('08-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Andreafort', '9', 134, to_date('07-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East John', '2', 135, to_date('28-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Cathyberg', '7', 136, to_date('21-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Christopherchester', '5', 137, to_date('26-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Nathanside', '8', 138, to_date('14-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Raymond', '7', 139, to_date('20-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Glendafort', '4', 140, to_date('09-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Katrina', '3', 141, to_date('29-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Nicolefort', '10', 142, to_date('05-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Hallchester', '4', 143, to_date('05-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Ryan', '8', 144, to_date('29-09-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Danielmouth', '5', 145, to_date('24-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Nathanside', '9', 146, to_date('25-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Logan', '8', 147, to_date('30-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Zacharyville', '5', 148, to_date('18-10-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Kaitlynville', '2', 149, to_date('24-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Duaneside', '5', 150, to_date('17-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Westberg', '7', 151, to_date('15-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Danashire', '6', 152, to_date('22-06-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Denise', '1', 153, to_date('15-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Kurtburgh', '12', 154, to_date('29-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Gregorytown', '4', 155, to_date('25-10-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Johnborough', '6', 156, to_date('31-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Amandaborough', '12', 157, to_date('23-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Millerhaven', '1', 158, to_date('14-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Leahbury', '2', 159, to_date('24-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Jessica', '10', 160, to_date('10-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Gainesstad', '9', 161, to_date('02-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Cathyberg', '1', 162, to_date('08-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Joshuatown', '8', 163, to_date('18-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Wilsonstad', '2', 164, to_date('16-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Raymond', '7', 165, to_date('29-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Natalie', '11', 166, to_date('28-01-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Chelseyton', '4', 167, to_date('08-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Comptonbury', '10', 168, to_date('20-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Jamesmouth', '1', 169, to_date('10-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Hillhaven', '9', 170, to_date('22-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Pearsonchester', '2', 171, to_date('15-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Shawn', '7', 172, to_date('11-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Bryantown', '9', 173, to_date('04-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Rhonda', '2', 174, to_date('17-12-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Michaelbury', '5', 175, to_date('17-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Harperfurt', '12', 176, to_date('23-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Hughestown', '3', 177, to_date('08-09-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Cynthiashire', '7', 178, to_date('20-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Smithhaven', '12', 179, to_date('19-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Haleymouth', '10', 180, to_date('20-01-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Nicoleville', '9', 181, to_date('14-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Sandraport', '11', 182, to_date('03-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Jonborough', '1', 183, to_date('07-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Wilsonbury', '5', 184, to_date('14-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Wilsonmouth', '10', 185, to_date('06-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Derek', '8', 186, to_date('01-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Denisetown', '2', 187, to_date('28-04-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Robert', '1', 188, to_date('10-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Kaneborough', '11', 189, to_date('23-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Raymond', '9', 190, to_date('25-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Bowenhaven', '9', 191, to_date('16-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Karina', '4', 192, to_date('07-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Harperfurt', '2', 193, to_date('03-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Kylefort', '9', 194, to_date('16-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Chasebury', '11', 195, to_date('25-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Justinborough', '9', 196, to_date('19-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Amberton', '7', 197, to_date('16-04-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Amy', '5', 198, to_date('23-08-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Shannon', '5', 199, to_date('06-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Christopherchester', '3', 200, to_date('16-02-2023', 'dd-mm-yyyy'), 'Sports');
commit;
prompt 200 records committed...
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Eatontown', '10', 201, to_date('12-02-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Calebview', '12', 202, to_date('22-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Alanland', '10', 203, to_date('31-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Gregoryport', '9', 204, to_date('01-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Darrenfurt', '3', 205, to_date('14-08-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Calebview', '11', 206, to_date('11-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Holtview', '2', 207, to_date('11-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Clarkberg', '10', 208, to_date('28-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Anthony', '3', 209, to_date('15-09-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Jessica', '6', 210, to_date('14-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Colonland', '4', 211, to_date('08-01-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Shawn', '9', 212, to_date('22-03-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Jamesmouth', '6', 213, to_date('02-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Stephensonchester', '6', 214, to_date('07-02-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Joshua', '6', 215, to_date('18-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Westberg', '11', 216, to_date('27-03-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Calebview', '10', 217, to_date('12-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Russellhaven', '1', 218, to_date('07-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Ryan', '7', 219, to_date('21-10-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Stacychester', '3', 220, to_date('26-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Charlesfort', '2', 221, to_date('04-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Bowenhaven', '11', 222, to_date('02-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Kathleenton', '10', 223, to_date('07-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Kaneborough', '1', 224, to_date('21-02-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Briannaland', '4', 225, to_date('11-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Garciaville', '8', 226, to_date('03-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Sotohaven', '10', 227, to_date('11-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Blakehaven', '8', 228, to_date('06-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Patrick', '6', 229, to_date('31-01-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Clayton', '4', 230, to_date('24-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Isaac', '10', 231, to_date('29-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Jesseburgh', '7', 232, to_date('23-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Travisport', '1', 233, to_date('06-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Woodtown', '12', 234, to_date('29-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Clarkberg', '8', 235, to_date('26-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Courtneyview', '12', 236, to_date('09-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Calebview', '3', 237, to_date('19-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Tonyatown', '4', 238, to_date('29-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Sandersmouth', '5', 239, to_date('09-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Carloston', '5', 240, to_date('23-12-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Davidland', '9', 241, to_date('03-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Philliphaven', '2', 242, to_date('24-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Julieport', '12', 243, to_date('01-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Johnsonchester', '8', 244, to_date('26-02-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Brandon', '6', 245, to_date('05-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Wheelermouth', '7', 246, to_date('30-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Dominguezburgh', '6', 247, to_date('25-11-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Richardmouth', '12', 248, to_date('26-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Cisnerosberg', '8', 249, to_date('15-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Emilystad', '5', 250, to_date('06-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Conniestad', '9', 251, to_date('08-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Cynthiashire', '8', 252, to_date('01-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Scotttown', '1', 253, to_date('04-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Davidborough', '2', 254, to_date('06-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Gregory', '7', 255, to_date('19-02-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Clarkberg', '7', 256, to_date('29-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Maria', '6', 257, to_date('02-12-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Tristanville', '6', 258, to_date('20-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Laurentown', '12', 259, to_date('05-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Dawn', '7', 260, to_date('07-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Frederickport', '12', 261, to_date('25-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Harperview', '2', 262, to_date('23-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Danielmouth', '2', 263, to_date('24-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Morrowhaven', '2', 264, to_date('30-01-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Comptonbury', '1', 265, to_date('28-08-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Tammy', '3', 266, to_date('21-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Cathyberg', '3', 267, to_date('07-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Robert', '6', 268, to_date('09-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Travisport', '1', 269, to_date('31-01-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Tristanville', '6', 270, to_date('12-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Jenniferhaven', '11', 271, to_date('29-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Steventon', '1', 272, to_date('13-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Katiefort', '9', 273, to_date('26-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Douglasland', '12', 274, to_date('16-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Thomasfurt', '3', 275, to_date('13-11-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Rodneyfurt', '3', 276, to_date('22-10-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Hutchinsonbury', '8', 277, to_date('31-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Williamfort', '8', 278, to_date('17-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Morrowhaven', '9', 279, to_date('09-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Michelle', '11', 280, to_date('08-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Chadberg', '1', 281, to_date('04-09-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Mcgeechester', '5', 282, to_date('26-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Nathanside', '5', 283, to_date('17-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Carrieberg', '10', 284, to_date('25-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Andreafort', '2', 285, to_date('03-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Emilystad', '10', 286, to_date('26-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Maria', '12', 287, to_date('31-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Jasonfurt', '5', 288, to_date('05-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Ashley', '9', 289, to_date('10-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Wilsonmouth', '11', 290, to_date('20-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Evelynshire', '10', 291, to_date('05-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Jessicahaven', '7', 292, to_date('13-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Courtneyview', '9', 293, to_date('14-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Megan', '3', 294, to_date('26-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Craigshire', '8', 295, to_date('06-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Kevin', '12', 296, to_date('08-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Barbaraside', '11', 297, to_date('11-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Teresaburgh', '11', 298, to_date('12-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Davidview', '1', 299, to_date('08-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Mcdonaldmouth', '7', 300, to_date('09-03-2023', 'dd-mm-yyyy'), 'Sports');
commit;
prompt 300 records committed...
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Brandon', '12', 301, to_date('01-01-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Scott', '3', 302, to_date('14-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Cisnerosberg', '5', 303, to_date('18-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Alicefort', '3', 304, to_date('25-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Danielleborough', '5', 305, to_date('30-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Isaacburgh', '4', 306, to_date('22-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Robert', '3', 307, to_date('18-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Baileyfort', '8', 308, to_date('25-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Julia', '5', 309, to_date('15-11-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Jessicachester', '2', 310, to_date('22-10-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Johnside', '6', 311, to_date('27-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Richard', '7', 312, to_date('04-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Wallacetown', '4', 313, to_date('08-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Caldwellhaven', '2', 314, to_date('11-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Vasquezborough', '2', 315, to_date('05-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Ashleyview', '7', 316, to_date('21-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Rickmouth', '3', 317, to_date('19-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Gonzalezfort', '4', 318, to_date('05-12-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Calebview', '7', 319, to_date('30-03-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Conniestad', '4', 320, to_date('01-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Dennis', '5', 321, to_date('12-11-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Sarah', '7', 322, to_date('08-12-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Paulberg', '10', 323, to_date('13-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Timstad', '11', 324, to_date('08-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Brendanchester', '10', 325, to_date('01-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Bryantown', '12', 326, to_date('16-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Danielmouth', '11', 327, to_date('24-09-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Mendezside', '12', 328, to_date('17-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Sarahmouth', '3', 329, to_date('22-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Thomasfurt', '9', 330, to_date('20-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Wagnermouth', '12', 331, to_date('27-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Stacychester', '10', 332, to_date('11-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Andrea', '12', 333, to_date('02-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Maria', '4', 334, to_date('04-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Jillchester', '11', 335, to_date('09-01-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Emily', '7', 336, to_date('26-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Albert', '7', 337, to_date('14-03-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Davidborough', '1', 338, to_date('09-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Tristanville', '11', 339, to_date('01-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Jasonborough', '7', 340, to_date('09-09-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Anne', '10', 341, to_date('17-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Gregorytown', '4', 342, to_date('24-02-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Stephenborough', '4', 343, to_date('02-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Mooreville', '9', 344, to_date('28-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Julieport', '2', 345, to_date('17-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Gregoryport', '5', 346, to_date('06-06-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Joshua', '2', 347, to_date('29-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Samuel', '3', 348, to_date('03-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Bradley', '4', 349, to_date('06-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Samuel', '7', 350, to_date('29-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Nicolefort', '1', 351, to_date('19-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Calebview', '9', 352, to_date('04-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Woodtown', '1', 353, to_date('18-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Joshua', '8', 354, to_date('23-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Rhonda', '10', 355, to_date('05-03-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Baileyfort', '12', 356, to_date('26-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Gonzalezhaven', '6', 357, to_date('05-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Caldwellhaven', '7', 358, to_date('01-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Michelleport', '7', 359, to_date('10-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Joshuachester', '12', 360, to_date('21-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Michaelfort', '10', 361, to_date('19-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Ashley', '10', 362, to_date('24-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Tonyatown', '9', 363, to_date('06-10-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Carloston', '9', 364, to_date('10-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Angela', '3', 365, to_date('17-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Patrick', '7', 366, to_date('20-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Michaelburgh', '1', 367, to_date('16-10-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Hallchester', '7', 368, to_date('08-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Wesleyborough', '6', 369, to_date('09-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Joshua', '2', 370, to_date('13-12-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Kingshire', '9', 371, to_date('18-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Markside', '12', 372, to_date('23-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Riosshire', '10', 373, to_date('10-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Matthew', '5', 374, to_date('21-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Michelleshire', '1', 375, to_date('14-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Gregory', '2', 376, to_date('24-04-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Jacquelinebury', '7', 377, to_date('04-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Clarktown', '12', 378, to_date('07-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Barbaraside', '10', 379, to_date('27-12-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Stevenside', '10', 380, to_date('29-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Joanchester', '3', 381, to_date('28-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Brian', '3', 382, to_date('23-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Maria', '12', 383, to_date('03-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Jasonburgh', '7', 384, to_date('24-06-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Joshuachester', '12', 385, to_date('29-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Matthew', '6', 386, to_date('23-04-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Annberg', '10', 387, to_date('27-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Matthew', '1', 388, to_date('05-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Kingshire', '6', 389, to_date('13-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Jenniferland', '1', 390, to_date('28-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Bryantown', '4', 391, to_date('28-01-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('North Angela', '3', 392, to_date('26-09-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New John', '7', 393, to_date('16-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('New Emilystad', '11', 394, to_date('22-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Ronaldmouth', '3', 395, to_date('05-01-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Port Tammy', '2', 396, to_date('27-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('East Travis', '6', 397, to_date('29-08-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Jasonborough', '12', 398, to_date('27-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Crystalport', '1', 399, to_date('16-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Lake Bradley', '11', 400, to_date('02-05-2023', 'dd-mm-yyyy'), 'Science');
commit;
prompt 400 records committed...
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474001, to_date('03-08-2023', 'dd-mm-yyyy'), 'Diving');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474002, to_date('15-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474003, to_date('20-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474004, to_date('02-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474005, to_date('10-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474006, to_date('18-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474007, to_date('19-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474008, to_date('15-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474009, to_date('28-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474010, to_date('12-09-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474011, to_date('12-09-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474012, to_date('21-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474013, to_date('19-10-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474014, to_date('16-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474015, to_date('22-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474016, to_date('19-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474017, to_date('18-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474018, to_date('04-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474019, to_date('09-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474020, to_date('24-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474021, to_date('04-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474022, to_date('14-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474023, to_date('30-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474024, to_date('25-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474025, to_date('03-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474026, to_date('13-10-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474027, to_date('21-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474028, to_date('15-01-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474029, to_date('06-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474030, to_date('11-12-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474031, to_date('27-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474032, to_date('02-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474033, to_date('03-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474034, to_date('18-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474035, to_date('18-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474036, to_date('10-01-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474037, to_date('27-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474038, to_date('06-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474039, to_date('02-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474040, to_date('13-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474041, to_date('05-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474042, to_date('01-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474043, to_date('01-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474044, to_date('24-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474045, to_date('09-06-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474046, to_date('08-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474047, to_date('02-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474048, to_date('25-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474049, to_date('11-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474050, to_date('23-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474051, to_date('25-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474052, to_date('19-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474053, to_date('17-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474054, to_date('04-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474055, to_date('23-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474056, to_date('15-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474057, to_date('14-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474058, to_date('10-01-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474059, to_date('28-04-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474060, to_date('22-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474061, to_date('22-04-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474062, to_date('25-04-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474063, to_date('03-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474064, to_date('21-02-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474065, to_date('12-12-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474066, to_date('12-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474067, to_date('18-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474068, to_date('25-06-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474069, to_date('27-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474070, to_date('24-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474071, to_date('10-11-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474072, to_date('10-09-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474073, to_date('16-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474074, to_date('19-10-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474075, to_date('29-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474076, to_date('09-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474077, to_date('20-10-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474078, to_date('06-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474079, to_date('13-09-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474080, to_date('16-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474081, to_date('15-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474082, to_date('10-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474083, to_date('06-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474084, to_date('12-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474085, to_date('14-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474086, to_date('22-09-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474087, to_date('29-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474088, to_date('25-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474089, to_date('02-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474090, to_date('05-10-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474091, to_date('24-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474092, to_date('09-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474093, to_date('17-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474094, to_date('07-09-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474095, to_date('21-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474096, to_date('06-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474097, to_date('11-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474098, to_date('28-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474099, to_date('10-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474100, to_date('08-05-2023', 'dd-mm-yyyy'), 'Science');
commit;
prompt 500 records committed...
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474101, to_date('01-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474102, to_date('14-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474103, to_date('15-09-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474104, to_date('04-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474105, to_date('16-03-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474106, to_date('23-04-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474107, to_date('25-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474108, to_date('12-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474109, to_date('12-11-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474110, to_date('18-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474111, to_date('08-12-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474112, to_date('21-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474113, to_date('12-02-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474114, to_date('17-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474115, to_date('31-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474116, to_date('21-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474117, to_date('17-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474118, to_date('06-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474119, to_date('25-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474120, to_date('17-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474121, to_date('21-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474122, to_date('21-02-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474123, to_date('24-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474124, to_date('26-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474125, to_date('24-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474126, to_date('05-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474127, to_date('05-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474128, to_date('08-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474129, to_date('02-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474130, to_date('19-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474131, to_date('20-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474132, to_date('16-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474133, to_date('06-02-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474134, to_date('07-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474135, to_date('01-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474136, to_date('24-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474137, to_date('17-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474138, to_date('04-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474139, to_date('04-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474140, to_date('02-12-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474141, to_date('05-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474142, to_date('03-04-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474143, to_date('17-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474144, to_date('11-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474145, to_date('21-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474146, to_date('05-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474147, to_date('25-05-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474148, to_date('11-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474149, to_date('19-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474150, to_date('25-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474151, to_date('14-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474152, to_date('21-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474153, to_date('13-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474154, to_date('12-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474155, to_date('24-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474156, to_date('09-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474157, to_date('10-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474158, to_date('11-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474159, to_date('30-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474160, to_date('17-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474161, to_date('20-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474162, to_date('10-06-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474163, to_date('17-10-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474164, to_date('18-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474165, to_date('15-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474166, to_date('22-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474167, to_date('12-08-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474168, to_date('08-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474169, to_date('07-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474170, to_date('21-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474171, to_date('11-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474172, to_date('19-03-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474173, to_date('14-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474174, to_date('08-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474175, to_date('04-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474176, to_date('28-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474177, to_date('21-02-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474178, to_date('12-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474179, to_date('02-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474180, to_date('16-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474181, to_date('13-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474182, to_date('06-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474183, to_date('29-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474184, to_date('24-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474185, to_date('09-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474186, to_date('18-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474187, to_date('06-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474188, to_date('03-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474189, to_date('15-04-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474190, to_date('08-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474191, to_date('12-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474192, to_date('04-10-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474193, to_date('25-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474194, to_date('10-01-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474195, to_date('05-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474196, to_date('10-11-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474197, to_date('30-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474198, to_date('01-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474199, to_date('16-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474200, to_date('22-07-2023', 'dd-mm-yyyy'), 'Nature');
commit;
prompt 600 records committed...
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474201, to_date('19-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474202, to_date('03-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474203, to_date('10-04-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474204, to_date('06-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474205, to_date('17-05-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474206, to_date('17-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474207, to_date('16-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474208, to_date('30-09-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474209, to_date('29-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474210, to_date('31-12-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474211, to_date('13-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474212, to_date('23-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474213, to_date('24-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474214, to_date('06-11-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474215, to_date('04-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474216, to_date('11-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474217, to_date('22-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474218, to_date('11-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474219, to_date('17-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474220, to_date('19-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474221, to_date('24-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474222, to_date('05-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474223, to_date('22-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474224, to_date('23-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474225, to_date('23-02-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474226, to_date('29-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474227, to_date('20-04-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474228, to_date('20-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474229, to_date('14-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474230, to_date('06-06-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474231, to_date('17-05-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474232, to_date('14-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474233, to_date('14-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474234, to_date('13-12-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474235, to_date('03-06-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474236, to_date('11-09-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474237, to_date('11-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474238, to_date('28-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474239, to_date('04-08-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474240, to_date('28-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474241, to_date('04-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474242, to_date('10-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474243, to_date('11-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474244, to_date('22-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474245, to_date('12-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474246, to_date('01-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474247, to_date('18-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474248, to_date('18-04-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474249, to_date('01-09-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474250, to_date('30-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474251, to_date('14-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474252, to_date('04-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474253, to_date('28-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474254, to_date('08-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474255, to_date('07-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474256, to_date('17-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474257, to_date('17-09-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474258, to_date('06-06-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474259, to_date('13-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474260, to_date('25-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474261, to_date('09-12-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474262, to_date('24-07-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474263, to_date('24-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474264, to_date('15-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474265, to_date('17-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474266, to_date('13-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474267, to_date('18-06-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474268, to_date('08-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474269, to_date('01-02-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474270, to_date('17-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474271, to_date('16-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474272, to_date('11-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474273, to_date('03-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474274, to_date('16-07-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474275, to_date('22-05-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474276, to_date('28-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474277, to_date('28-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474278, to_date('21-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474279, to_date('20-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474280, to_date('12-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474281, to_date('27-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474282, to_date('23-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474283, to_date('03-08-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474284, to_date('28-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474285, to_date('09-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474286, to_date('10-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474287, to_date('03-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474288, to_date('19-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474289, to_date('19-12-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474290, to_date('02-01-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474291, to_date('13-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474292, to_date('26-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474293, to_date('05-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474294, to_date('04-04-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474295, to_date('28-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474296, to_date('10-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474297, to_date('13-10-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474298, to_date('03-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474299, to_date('21-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474300, to_date('27-01-2023', 'dd-mm-yyyy'), 'Sports');
commit;
prompt 700 records committed...
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474301, to_date('08-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474302, to_date('08-04-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474303, to_date('12-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474304, to_date('25-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474305, to_date('01-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474306, to_date('27-05-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474307, to_date('06-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474308, to_date('18-09-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474309, to_date('30-10-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474310, to_date('17-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474311, to_date('04-08-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474312, to_date('13-03-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474313, to_date('05-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474314, to_date('30-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474315, to_date('13-12-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474316, to_date('05-05-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474317, to_date('10-02-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474318, to_date('07-02-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474319, to_date('30-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474320, to_date('03-04-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474321, to_date('04-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474322, to_date('09-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474323, to_date('19-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474324, to_date('04-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474325, to_date('24-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474326, to_date('24-06-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474327, to_date('29-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474328, to_date('06-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474329, to_date('17-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474330, to_date('07-06-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474331, to_date('01-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474332, to_date('12-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474333, to_date('06-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474334, to_date('30-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474335, to_date('19-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474336, to_date('21-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474337, to_date('17-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474338, to_date('26-11-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474339, to_date('15-01-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474340, to_date('24-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474341, to_date('23-06-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474342, to_date('11-09-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474343, to_date('26-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474344, to_date('04-09-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474345, to_date('13-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474346, to_date('27-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474347, to_date('23-07-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474348, to_date('23-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474349, to_date('23-04-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474350, to_date('13-09-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474351, to_date('06-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474352, to_date('20-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474353, to_date('30-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474354, to_date('19-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474355, to_date('15-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474356, to_date('12-01-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474357, to_date('10-04-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474358, to_date('30-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474359, to_date('23-01-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474360, to_date('31-07-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474361, to_date('08-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474362, to_date('06-02-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474363, to_date('10-05-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474364, to_date('31-07-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474365, to_date('28-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '12', 219474366, to_date('26-11-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474367, to_date('29-08-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474368, to_date('08-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474369, to_date('07-05-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474370, to_date('20-05-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474371, to_date('09-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474372, to_date('27-05-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474373, to_date('10-12-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474374, to_date('02-11-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474375, to_date('25-06-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474376, to_date('12-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474377, to_date('11-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '7', 219474378, to_date('05-03-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474379, to_date('20-03-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474380, to_date('23-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '5', 219474381, to_date('31-08-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474382, to_date('03-04-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474383, to_date('08-09-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474384, to_date('29-01-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474385, to_date('12-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '8', 219474386, to_date('02-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474387, to_date('24-09-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474388, to_date('18-08-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '11', 219474389, to_date('09-12-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474390, to_date('16-05-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474391, to_date('29-06-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474392, to_date('11-02-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '10', 219474393, to_date('14-05-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474394, to_date('26-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '2', 219474395, to_date('28-04-2023', 'dd-mm-yyyy'), 'History');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '6', 219474396, to_date('19-02-2023', 'dd-mm-yyyy'), 'Science');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '4', 219474397, to_date('22-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '9', 219474398, to_date('06-03-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '3', 219474399, to_date('24-10-2023', 'dd-mm-yyyy'), 'Art');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('West Danny', '1', 219474400, to_date('16-03-2023', 'dd-mm-yyyy'), 'Sports');
commit;
prompt 800 records committed...
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Kathrynport', '9', 219474501, to_date('25-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Leroy', '4', 219474502, to_date('25-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Leroy', '5', 219474503, to_date('25-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Kathrynport', '7', 219474504, to_date('25-10-2023', 'dd-mm-yyyy'), 'Sports');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('South Leroy', '6', 219474505, to_date('25-10-2023', 'dd-mm-yyyy'), 'Nature');
insert into TRIPS (locations, grade, trip_maneger_id, trip_date, trip_topic)
values ('Kathrynport', '8', 219474506, to_date('25-10-2023', 'dd-mm-yyyy'), 'Sports');
commit;
prompt 806 records loaded
prompt Loading GOING...
insert into GOING (student_id, trip_maneger_id)
values (372925301, 219474502);
insert into GOING (student_id, trip_maneger_id)
values (372925326, 219474502);
insert into GOING (student_id, trip_maneger_id)
values (372925278, 219474502);
insert into GOING (student_id, trip_maneger_id)
values (372925272, 219474502);
insert into GOING (student_id, trip_maneger_id)
values (372925082, 219474503);
insert into GOING (student_id, trip_maneger_id)
values (372925071, 219474503);
insert into GOING (student_id, trip_maneger_id)
values (372925072, 219474503);
insert into GOING (student_id, trip_maneger_id)
values (327547772, 219474503);
insert into GOING (student_id, trip_maneger_id)
values (372925245, 219474503);
insert into GOING (student_id, trip_maneger_id)
values (372925364, 219474504);
insert into GOING (student_id, trip_maneger_id)
values (372925367, 219474504);
insert into GOING (student_id, trip_maneger_id)
values (372925107, 219474504);
insert into GOING (student_id, trip_maneger_id)
values (372925061, 219474504);
insert into GOING (student_id, trip_maneger_id)
values (372925059, 219474504);
insert into GOING (student_id, trip_maneger_id)
values (372925083, 219474506);
insert into GOING (student_id, trip_maneger_id)
values (372925119, 219474506);
insert into GOING (student_id, trip_maneger_id)
values (372925138, 219474506);
insert into GOING (student_id, trip_maneger_id)
values (372925123, 219474506);
insert into GOING (student_id, trip_maneger_id)
values (327547723, 219474506);
insert into GOING (student_id, trip_maneger_id)
values (372925376, 219474501);
insert into GOING (student_id, trip_maneger_id)
values (372925366, 219474501);
insert into GOING (student_id, trip_maneger_id)
values (372925349, 219474501);
insert into GOING (student_id, trip_maneger_id)
values (372925310, 219474501);
insert into GOING (student_id, trip_maneger_id)
values (372925283, 219474501);
insert into GOING (student_id, trip_maneger_id)
values (372925110, 219474111);
insert into GOING (student_id, trip_maneger_id)
values (372925134, 219474110);
insert into GOING (student_id, trip_maneger_id)
values (372925167, 219474110);
insert into GOING (student_id, trip_maneger_id)
values (372925247, 219474110);
insert into GOING (student_id, trip_maneger_id)
values (372925369, 219474110);
insert into GOING (student_id, trip_maneger_id)
values (372925247, 1);
insert into GOING (student_id, trip_maneger_id)
values (372925247, 219474001);
insert into GOING (student_id, trip_maneger_id)
values (372925248, 219474001);
insert into GOING (student_id, trip_maneger_id)
values (372925097, 219474502);
commit;
prompt 33 records loaded
prompt Enabling foreign key constraints for STUDENT_...
alter table STUDENT_ enable constraint SYS_C009113;
prompt Enabling foreign key constraints for ACTIVE...
alter table ACTIVE enable constraint SYS_C009127;
alter table ACTIVE enable constraint SYS_C009128;
prompt Enabling foreign key constraints for ARRIVE...
alter table ARRIVE enable constraint SYS_C009117;
alter table ARRIVE enable constraint SYS_C009118;
prompt Enabling foreign key constraints for EATER...
alter table EATER enable constraint SYS_C009122;
alter table EATER enable constraint SYS_C009123;
prompt Enabling foreign key constraints for GOING...
alter table GOING enable constraint SYS_C009132;
alter table GOING enable constraint SYS_C009133;
prompt Enabling triggers for ACTIVITY...
alter table ACTIVITY enable all triggers;
prompt Enabling triggers for COUNSELOR...
alter table COUNSELOR enable all triggers;
prompt Enabling triggers for STUDENT_...
alter table STUDENT_ enable all triggers;
prompt Enabling triggers for ACTIVE...
alter table ACTIVE enable all triggers;
prompt Enabling triggers for TRANSPORTATION...
alter table TRANSPORTATION enable all triggers;
prompt Enabling triggers for ARRIVE...
alter table ARRIVE enable all triggers;
prompt Enabling triggers for MEALS...
alter table MEALS enable all triggers;
prompt Enabling triggers for EATER...
alter table EATER enable all triggers;
prompt Enabling triggers for TRIPS...
alter table TRIPS enable all triggers;
prompt Enabling triggers for GOING...
alter table GOING enable all triggers;

set feedback on
set define on
prompt Done
