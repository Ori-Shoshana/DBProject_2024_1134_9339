BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Going CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Active CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Eater CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Arrive CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Student_ CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Counselor CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Activity CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Meals CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Transportation CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Trips CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
