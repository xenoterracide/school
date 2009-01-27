CREATE TABLE CLASSMATE.CH05NEW_CUSTOMER
(FIRST_NAME VARCHAR2(20),
 LAST_NAME VARCHAR2(20),
 FAVORITE_COLORS CHAR(100),
 MOST_EMBARASSING_MOMENT VARCHAR2(200))
TABLESPACE CUST_TBS;
INSERT INTO CLASSMATE.CH05NEW_CUSTOMER VALUES
('Jane','Cooke','Green, lavender, yellow, and auburn',
'The junior prom, when my boyfriend forgot my name and got lost trying to find my house.');
INSERT INTO CLASSMATE.CH05NEW_CUSTOMER VALUES
('Barry','Domingo','Blue, red, orange, salmon',
'My uncle took me to the lake and I got poison ivy in a very uncomfortable place.');
INSERT INTO CLASSMATE.CH05NEW_CUSTOMER VALUES
('Karen','Vost','Black, gray, white, electric blue',
'I lost my passport while in Spain and had to call my parents to come get me.');
COMMIT;
rem
rem Data and foreign keys.
rem
CREATE TABLE CLASSMATE.CH05PALS
(CUST_ID NUMBER(3) PRIMARY KEY,
 FIRST_NAME VARCHAR2(20),
 LAST_NAME VARCHAR2(20),
 FAVORITE_COLORS CHAR(100),
 MOST_EMBARASSING_MOMENT VARCHAR2(200))
TABLESPACE USER_AUTO;
INSERT INTO CLASSMATE.CH05PALS VALUES
(10,'Jane','Cooke','Green, lavender, yellow, and auburn',
'The junior prom, when my boyfriend forgot my name and got lost trying to find my house.');
INSERT INTO CLASSMATE.CH05PALS VALUES
(20,'Barry','Domingo','Blue, red, orange, salmon',
'My uncle took me to the lake and I got poison ivy in a very uncomfortable place.');
INSERT INTO CLASSMATE.CH05PALS VALUES
(30,'Karen','Vost','Black, gray, white, electric blue',
'I lost my passport while in Spain and had to call my parents to come get me.');
COMMIT;
CREATE TABLE CLASSMATE.CH05BID
(BID_ID NUMBER(10), 
 CUST_ID NUMBER(3),
 BID_AMOUNT NUMBER(6,2),
 CONSTRAINT CUST_FK FOREIGN KEY (CUST_ID) REFERENCES CLASSMATE.CH05PALS)
 TABLESPACE USER_OMF1;
INSERT INTO CLASSMATE.CH05BID VALUES
(1,10,500.25);
INSERT INTO CLASSMATE.CH05BID VALUES
(2,10,430.25);
INSERT INTO CLASSMATE.CH05BID VALUES
(3,20,124);
COMMIT;