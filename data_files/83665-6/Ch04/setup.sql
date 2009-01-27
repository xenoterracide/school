REM ***************************
REM       Revise all occurrences of 
REM            ORACLE_BASE    to the correct path name.
REM **************************
REM       Run script when logged in as:
REM            SYSTEM
REM **************************
CREATE TABLESPACE USER_AUTO 
DATAFILE 'ORACLE_BASE\oradata\ORACLASS\user_auto01.dbf' 
SIZE 20M AUTOEXTEND OFF
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
SEGMENT SPACE MANAGEMENT AUTO
/ 

CREATE TYPE CLASSMATE.EDITOR_INFO AS OBJECT
 (PRIMARY_EDITOR CHAR(1),
  EDITOR_ID NUMBER(10))
/
CREATE TYPE CLASSMATE.CONTACT_TABLE AS 
    TABLE OF CLASSMATE.EDITOR_INFO
/
CREATE TYPE CLASSMATE.PHONE_ARRAY AS 
VARRAY (10) OF VARCHAR2(20)
/
CREATE TYPE CLASSMATE.CUSTOMER_ADDRESS_TYPE AS OBJECT
 ( CUSTOMER_ID VARCHAR2(10)
   , POBOX_SUITE VARCHAR2(24)
   , STREET_ADDRESS VARCHAR2(40)
   , CITY VARCHAR2(30)
   , STATE VARCHAR2(2)
   , COUNTRY VARCHAR2(20)
  )
/
CREATE TYPE CLASSMATE.PRICE_IN_CURRENCY AS 
VARRAY (5) OF NUMBER(12, 5)
/
CREATE TYPE CLASSMATE.PRICE_HISTORY AS
 VARRAY (10) OF NUMBER(8,5)
/
CREATE TYPE CLASSMATE.CHOSENSONG AS OBJECT 
( SONG_ID NUMBER, SEQUENCE_NO NUMBER(2, 0))
/
CREATE TYPE CLASSMATE.SONGLIST AS 
VARRAY (15) OF CLASSMATE.CHOSENSONG
/
CREATE TYPE CLASSMATE.CHANGEAUDIT AS OBJECT 
( EMPLOYEE_ID NUMBER, CHANGE_DATETIME DATE)
/
CREATE TYPE CLASSMATE.CHANGES AS 
VARRAY (5) OF CLASSMATE.CHANGEAUDIT
/