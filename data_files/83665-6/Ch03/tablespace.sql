REM ***************************
REM       Revise all occurrances of 
REM            ORACLE_BASE    to a real path name.
REM **************************
REM       Revise all occurrances of 
REM            ORACLE_HOME    to the real path of your ORACLE_HOME (where
REM                      the Oracle software resides).
REM **************************
REM       Run script when logged in as:
REM            SYSTEM
REM **************************
set echo off
rem
rem ****** start spooling to log ******
rem
SPOOL ORACLE_BASE\admin\trial02\create\tablespace.log
rem
rem ****** add Data Dictionary Views ******
rem
START ORACLE_HOME\rdbms\admin\catalog.sql;
rem
rem ****** add PL/SQL procedures ******
rem
START ORACLE_HOME\rdbms\admin\catproc.sql;
rem
rem ****** add USERS tablespace ******
rem
CREATE TABLESPACE USERS DATAFILE
  'ORACLE_BASE\oradata\trial02\users01.dbf' size 25M AUTOEXTEND ON 
   NEXT 5K MAXSIZE UNLIMITED;
rem
rem ****** add TEMP tablespace ******
rem
CREATE TABLESPACE TEMP DATAFILE
  'ORACLE_BASE\oradata\trial02\temp01.dbf' size 25M AUTOEXTEND ON 
   NEXT 5K MAXSIZE UNLIMITED;
rem
rem ****** end spooling to log ******
rem
spool off

