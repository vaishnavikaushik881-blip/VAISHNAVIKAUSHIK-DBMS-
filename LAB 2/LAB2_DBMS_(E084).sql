CREATE DATABASE company1323;
USE company1323;

CREATE TABLE Employee(
    fname VARCHAR(10) NOT NULL,
    mint VARCHAR(1),
    lname VARCHAR(10),
    ssn INT PRIMARY KEY NOT NULL,
    bdate VARCHAR(15),
    address VARCHAR(30),
    sex VARCHAR(10),
    salary INT NOT NULL,
    superssn INT NOT NULL,
    dno INT
);

CREATE TABLE department(
    dname VARCHAR(20),
    dnum INT PRIMARY KEY NOT NULL,
    mgrssn INT,
    stdate VARCHAR(15)
);

CREATE TABLE dep_loc(
    dlno INT,
    dloc VARCHAR(15),
    PRIMARY KEY(dlno, dloc)
);

CREATE TABLE project(
    pname VARCHAR(15),
    pnumber INT PRIMARY KEY,
    plocation VARCHAR(20),
    dnum INT
);

CREATE TABLE works_on(
    essn INT,
    pno INT,
    hours INT
);

CREATE TABLE dependent(
    esn INT,
    dependent_name VARCHAR(20),
    gender VARCHAR(5),
    birth_date VARCHAR(20),
    relationship VARCHAR(20)
);


-- Foreign Keys

ALTER TABLE Employee
ADD FOREIGN KEY (dno) REFERENCES department(dnum);

ALTER TABLE department
ADD FOREIGN KEY (mgrssn) REFERENCES Employee(ssn);

ALTER TABLE project
ADD FOREIGN KEY (pnumber) REFERENCES department(dnum);

ALTER TABLE dep_loc
ADD FOREIGN KEY (dlno) REFERENCES department(dnum);

ALTER TABLE works_on
ADD PRIMARY KEY(essn, pno);

ALTER TABLE works_on
ADD FOREIGN KEY (pno) REFERENCES project(pnumber);

ALTER TABLE dependent
ADD PRIMARY KEY(esn, dependent_name);

ALTER TABLE dependent
ADD FOREIGN KEY (esn) REFERENCES Employee(ssn);


SHOW TABLES;


-- Insert into department first
-- mgrssn is NULL initially because Employee does not exist yet

INSERT INTO department
(dname, dnum, mgrssn, stdate)
VALUES
('Research',1,NULL,'01-Jan-2020'),
('Administration',2,NULL,'15-Feb-2020'),
('Headquarters',3,NULL,'10-Mar-2020'),
('Software',4,NULL,'20-Apr-2021'),
('Sales',5,NULL,'05-May-2021');


-- Insert Employees

INSERT INTO Employee
(fname, mint, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('John','A','Smith',1001,'15-Jan-1985','New York','Male',60000,1001,1),
('Jane','B','Doe',1002,'20-Feb-1988','Chicago','Female',55000,1001,2),
('Robert','C','Brown',1003,'10-Mar-1982','Boston','Male',75000,1001,3),
('Emily','D','Davis',1004,'25-Apr-1990','Houston','Female',65000,1003,4),
('Michael','E','Wilson',1005,'05-May-1987','Seattle','Male',58000,1001,5);


-- Update department managers

UPDATE department SET mgrssn = 1001 WHERE dnum = 1;
UPDATE department SET mgrssn = 1002 WHERE dnum = 2;
UPDATE department SET mgrssn = 1003 WHERE dnum = 3;
UPDATE department SET mgrssn = 1004 WHERE dnum = 4;
UPDATE department SET mgrssn = 1005 WHERE dnum = 5;


-- Department Locations

INSERT INTO dep_loc
(dlno, dloc)
VALUES
(1,'New York'),
(2,'Chicago'),
(3,'Boston'),
(4,'Houston'),
(5,'Seattle');


-- Projects

INSERT INTO project
(pname, pnumber, plocation, dnum)
VALUES
('ProductX',1,'New York',1),
('ProductY',2,'Chicago',2),
('ProductZ',3,'Boston',3),
('Computerization',4,'Houston',4),
('Reorganization',5,'Seattle',5);


-- Works On

INSERT INTO works_on
(essn, pno, hours)
VALUES
(1001,1,20),
(1002,2,15),
(1003,3,25),
(1004,4,30),
(1005,5,18);



INSERT INTO dependent
(esn, dependent_name, gender, birth_date, relationship)
VALUES
(1001,'Alice Smith','F','10-Jun-2010','Daughter'),
(1002,'David Doe','M','15-Jul-2012','Son'),
(1003,'Sarah Brown','F','20-Aug-2011','Daughter'),
(1004,'James Davis','M','05-Sep-2015','Son'),
(1005,'Linda Wilson','F','12-Oct-2013','Daughter');



SELECT * FROM Employee;
SELECT * FROM department;
SELECT * FROM dep_loc;
SELECT * FROM project;
SELECT * FROM works_on;
SELECT * FROM dependent;