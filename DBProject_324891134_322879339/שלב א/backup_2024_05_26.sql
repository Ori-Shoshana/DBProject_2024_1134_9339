prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by 212or on Sunday, 26 May 2024
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
  in_time           VARCHAR2(3) not null
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
prompt Table is empty
prompt Loading COUNSELOR...
prompt Table is empty
prompt Loading STUDENT_...
prompt Table is empty
prompt Loading ACTIVE...
prompt Table is empty
prompt Loading TRANSPORTATION...
prompt Table is empty
prompt Loading ARRIVE...
prompt Table is empty
prompt Loading MEALS...
prompt Table is empty
prompt Loading EATER...
prompt Table is empty
prompt Loading TRIPS...
prompt Table is empty
prompt Loading GOING...
prompt Table is empty
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
