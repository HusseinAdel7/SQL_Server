CREATE DATABASE MyCompanyDB


-- ==================================================================================
-- =================================== Create Tables ================================
-- ==================================================================================


-- CREATE THE DEPARTMENT TABLE 
CREATE TABLE Department
(
  DeptNo	 INT NOT NULL PRIMARY KEY,
  DeptName	 NVARCHAR(20),
  [location] NVARCHAR(2)  CHECK ([location] in('NY','DS','KW')) DEFAULT 'NY' 
);


-- CREATE EMPLOYEE TABLE 
CREATE TABLE Employee 
(
  Empno  INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  FName  NVARCHAR(20) NOT NULL ,
  LName  NVARCHAR(20) NOT NULL ,  
  DeptNo INT FOREIGN KEY REFERENCES Department(DeptNo),
  Salary INT UNIQUE CHECK (Salary > 700 and Salary <6000)
); 


 -- CREATE PROJECT TABLE
CREATE TABLE Project 
(
  ProjectNo  NVARCHAR(20) NOT NULL PRIMARY KEY,
  ProjectName  NVARCHAR(40) NOT NULL,
  Budget FLOAT, 
); 



-- CREATE WORK_ON TABLE
CREATE TABLE Work_On 
(
  EmpNo INT NOT NULL  ,
  projectNo NVARCHAR(20) NOT NULL ,
  Job NVARCHAR(20),
  Enter_Data DATE  DEFAULT getDate()  NOT NULL
); 

ALTER TABLE Work_On
ADD CONSTRAINT Works_On_Pk PRIMARY KEY(EmpNo,projectNo)
ALTER TABLE Work_On
ADD CONSTRAINT Emp_No_Works_On_Fk FOREIGN KEY (EmpNo)  REFERENCES Employee(Empno);
ALTER TABLE Work_On
ADD CONSTRAINT Project_No_Works_On_Fk FOREIGN KEY (projectNo)  REFERENCES Project(projectNo);




-- ==================================================================================
-- =================================== Modify On Tables ================================
-- ==================================================================================

ALTER TABLE Employee
ADD Telephone_No int;

ALTER TABLE Employee 
DROP COLUMN Telephone_No

CREATE SCHEMA Company;

ALTER SCHEMA Company
transfer [dbo].[Department];

ALTER SCHEMA Company
transfer [dbo].[Employee];




INSERT INTO Employee VALUES('Hussein','Adel',20,10000);
INSERT INTO Employee VALUES('Mohamed','Adel',30,20000)
INSERT INTO Employee VALUES('Asmaa','Adel',40,30000)

INSERT INTO Department VALUES(1,'CyberSecurity','.NET Developer');
INSERT INTO Department VALUES(2,'Information Tech','Computer Science');
INSERT INTO Department VALUES(3,'Flutter Developer','Web Developer');

INSERT INTO Project VALUES('P200','Steganography',10);
INSERT INTO Project VALUES('P300','Web Page',20);
INSERT INTO Project VALUES('P400','Machine',30);

INSERT INTO Work_On (EmpNo,projectNo,job) VALUES(2,'P200','Security Engineer');
INSERT INTO Work_On (EmpNo,projectNo,job) VALUES(1,'P300','machine  Engineer');
INSERT INTO Work_On (EmpNo,projectNo,job) VALUES(3,'p400','web developer ');


UPDATE Employee  SET LName='Hussein' WHERE Empno=3
DELETE FROM  Employee  WHERE Empno=2;