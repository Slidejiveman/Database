/* Database Systems, Coronel/Morris */
/* Type of SQL : SQL Server*/


CREATE TABLE ASSIGNMENT (
ASSIGN_NUM int,
ASSIGN_DATE datetime,
PROJ_NUM varchar(3),
EMP_NUM varchar(3),
ASSIGN_JOB varchar(3),
ASSIGN_CHG_HR float(8),
ASSIGN_HOURS float(8),
ASSIGN_CHARGE float(8)
);

INSERT INTO ASSIGNMENT VALUES('1001','2014-3-22','18','103','503','84.5','3.5','295.75');
INSERT INTO ASSIGNMENT VALUES('1002','2014-3-22','22','117','509','34.55','4.2','145.11');
INSERT INTO ASSIGNMENT VALUES('1003','2014-3-22','18','117','509','34.55','2','69.10');
INSERT INTO ASSIGNMENT VALUES('1004','2014-3-22','18','103','503','84.5','5.9','498.55');
INSERT INTO ASSIGNMENT VALUES('1005','2014-3-22','25','108','501','96.75','2.2','212.85');
INSERT INTO ASSIGNMENT VALUES('1006','2014-3-22','22','104','501','96.75','4.2','406.35');
INSERT INTO ASSIGNMENT VALUES('1007','2014-3-22','25','113','508','50.75','3.8','192.85');
INSERT INTO ASSIGNMENT VALUES('1008','2014-3-22','18','103','503','84.5','0.9','76.05');
INSERT INTO ASSIGNMENT VALUES('1009','2014-3-23','15','115','501','96.75','5.6','541.80');
INSERT INTO ASSIGNMENT VALUES('1010','2014-3-23','15','117','509','34.55','2.4','82.92');
INSERT INTO ASSIGNMENT VALUES('1011','2014-3-23','25','105','502','105','4.3','451.5');
INSERT INTO ASSIGNMENT VALUES('1012','2014-3-23','18','108','501','96.75','3.4','328.95');
INSERT INTO ASSIGNMENT VALUES('1013','2014-3-23','25','115','501','96.75','2','193.5');
INSERT INTO ASSIGNMENT VALUES('1014','2014-3-23','22','104','501','96.75','2.8','270.9');
INSERT INTO ASSIGNMENT VALUES('1015','2014-3-23','15','103','503','84.5','6.1','515.45');
INSERT INTO ASSIGNMENT VALUES('1016','2014-3-23','22','105','502','105','4.7','493.5');
INSERT INTO ASSIGNMENT VALUES('1017','2014-3-23','18','117','509','34.55','3.8','131.29');
INSERT INTO ASSIGNMENT VALUES('1018','2014-3-23','25','117','509','34.55','2.2','76.01');
INSERT INTO ASSIGNMENT VALUES('1019','2014-3-24','25','104','501','110.5','4.9','541.45');
INSERT INTO ASSIGNMENT VALUES('1020','2014-3-24','15','101','502','125','3.1','387.5');
INSERT INTO ASSIGNMENT VALUES('1021','2014-3-24','22','108','501','110.5','2.7','298.35');
INSERT INTO ASSIGNMENT VALUES('1022','2014-3-24','22','115','501','110.5','4.9','541.45');
INSERT INTO ASSIGNMENT VALUES('1023','2014-3-24','22','105','502','125','3.5','437.5');
INSERT INTO ASSIGNMENT VALUES('1024','2014-3-24','15','103','503','84.5','3.3','278.85');
INSERT INTO ASSIGNMENT VALUES('1025','2014-3-24','18','117','509','34.55','4.2','145.11');


/* -- */

CREATE TABLE EMPLOYEE (
EMP_NUM varchar(3),
EMP_LNAME varchar(15),
EMP_FNAME varchar(15),
EMP_INITIAL varchar(1),
EMP_HIREDATE datetime,
JOB_CODE varchar(3),
EMP_YEARS int
);

INSERT INTO EMPLOYEE VALUES('101','News','John','G','2000-11-8','502','4');
INSERT INTO EMPLOYEE VALUES('102','Senior','David','H','1989-7-12','501','15');
INSERT INTO EMPLOYEE VALUES('103','Arbough','June','E','1996-12-1','503','8');
INSERT INTO EMPLOYEE VALUES('104','Ramoras','Anne','K','1987-11-15','501','17');
INSERT INTO EMPLOYEE VALUES('105','Johnson','Alice','K','1993-2-1','502','12');
INSERT INTO EMPLOYEE VALUES('106','Smithfield','William','','2004-6-22','500','0');
INSERT INTO EMPLOYEE VALUES('107','Alonzo','Maria','D','1993-10-10','500','11');
INSERT INTO EMPLOYEE VALUES('108','Washington','Ralph','B','1991-8-22','501','13');
INSERT INTO EMPLOYEE VALUES('109','Smith','Larry','W','1997-7-18','501','7');
INSERT INTO EMPLOYEE VALUES('110','Olenko','Gerald','A','1995-12-11','505','9');
INSERT INTO EMPLOYEE VALUES('111','Wabash','Geoff','B','1991-4-4','506','14');
INSERT INTO EMPLOYEE VALUES('112','Smithson','Darlene','M','1994-10-23','507','10');
INSERT INTO EMPLOYEE VALUES('113','Joenbrood','Delbert','K','1996-11-15','508','8');
INSERT INTO EMPLOYEE VALUES('114','Jones','Annelise','','1993-8-20','508','11');
INSERT INTO EMPLOYEE VALUES('115','Bawangi','Travis','B','1992-1-25','501','13');
INSERT INTO EMPLOYEE VALUES('116','Pratt','Gerald','L','1997-3-5','510','8');
INSERT INTO EMPLOYEE VALUES('117','Williamson','Angie','H','1996-6-19','509','8');
INSERT INTO EMPLOYEE VALUES('118','Frommer','James','J','2005-1-4','510','0');

/* -- */

CREATE TABLE JOB (
JOB_CODE varchar(3),
JOB_DESCRIPTION varchar(25),
JOB_CHG_HOUR float(8),
JOB_LAST_UPDATE datetime
);

INSERT INTO JOB VALUES('500','Programmer','35.75','2013-11-20');
INSERT INTO JOB VALUES('501','Systems Analyst','96.75','2013-11-20');
INSERT INTO JOB VALUES('502','Database Designer','125','2014-3-24');
INSERT INTO JOB VALUES('503','Electrical Engineer','84.5','2013-11-20');
INSERT INTO JOB VALUES('504','Mechanical Engineer','67.9','2013-11-20');
INSERT INTO JOB VALUES('505','Civil Engineer','55.78','2013-11-20');
INSERT INTO JOB VALUES('506','Clerical Support','26.87','2013-11-20');
INSERT INTO JOB VALUES('507','DSS Analyst','45.95','2013-11-20');
INSERT INTO JOB VALUES('508','Applications Designer','48.1','2014-3-24');
INSERT INTO JOB VALUES('509','Bio Technician','34.55','2013-11-20');
INSERT INTO JOB VALUES('510','General Support','18.36','2013-11-20');

/* -- */

CREATE TABLE PROJECT (
PROJ_NUM varchar(3),
PROJ_NAME varchar(25),
PROJ_VALUE float(8),
PROJ_BALANCE float(8),
EMP_NUM varchar(3)
);
INSERT INTO PROJECT VALUES('15','Evergreen','1453500','1002350','103');
INSERT INTO PROJECT VALUES('18','Amber Wave','3500500','2110346','108');
INSERT INTO PROJECT VALUES('22','Rolling Tide','805000','500345.2','102');
INSERT INTO PROJECT VALUES('25','Starflight','2650500','2309880','107');

