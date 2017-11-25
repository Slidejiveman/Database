DROP TABLE PEOPLE;
CREATE TABLE PEOPLE (
ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
FirstName varchar(20),
LastName varchar(20),
Phone varchar(11),
Email varchar(30),
Age int,
);

INSERT INTO PEOPLE VALUES('Sue', 'Jones', '123-4567', 'sue.jones@gmail.com', 26);
INSERT INTO PEOPLE VALUES('John', 'Harris', '789-3456', 'john.harris@gmail.com', 21);
INSERT INTO PEOPLE VALUES('Jim', 'Able', '342-8976', 'jim.able@gmail.com', 21);
INSERT INTO PEOPLE VALUES('Mary', 'Sims', '232-5678', 'mary.sims@gmail.com', 30);