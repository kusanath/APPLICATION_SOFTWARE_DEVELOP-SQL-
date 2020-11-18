/*To study about various data constraints in SQL*/

CREATE TABLE Subjects(subid int NOT NULL,subname varchar(10) NOT NULL);

/*Populating Table*/
INSERT INTO Subjects VALUES(1,'Physics');
INSERT INTO Subjects VALUES(2,'Chemistry');
INSERT INTO Subjects VALUES(3,'Math');
INSERT INTO Subjects VALUES(4,'English');
INSERT INTO Subjects VALUES(5,'Computer Science');

SELECT *FROM Subjects;
/*
1|Physics                                                                       
2|Chemistry                                                                     
3|Math                                                                          
4|English                                                                       
5|Computer Science         
*/

/*a) Alter the table to set subid as the primary key*/
ALTER TABLE Subjects ADD PRIMARY KEY(subid);

/*b) Create a table named Staff with the given attributes

-staffid (Should be UNIQUE)

-staffname

-dept

-Age ( Greater than 22)

-Salary (Less than 35000) */
CREATE TABLE Staff(Staffid int,Staffname varchar(15),Dept varchar(10),Age int,Salary int, CONSTRAINT chk_sal CHECK (Salary<35000),CONSTRAINT chk_age CHECK (Age>22), CONSTRAINT u_sid UNIQUE(Staffid));

/* Populating the table*/
INSERT INTO Staff VALUES(1,'Mary','Sales',24,32000);
INSERT INTO Staff VALUES(2,'Tony','Purchasing',29,30000);
INSERT INTO Staff VALUES(3,'William','Sales',28,25000);

SELECT *FROM Staff;
/*
1|Mary|Sales|24|32000                                                           
2|Tony|Purchasing|29|30000                                                      
3|William|Sales|28|25000
*/

/* i)Delete the check constrain imposed on the attribute salary */
ALTER TABLE Staff DROP CONSTRAINT chk_sal;

/*ii)Delete the unique constraint on the attribute staffid*/
ALTER TABLE Staff DROP CONSTRAINT u_sid;

/* c. Create a table named Bank with the following attributes
-bankcode (To be set as Primary Key, type= varchar )

-bankname (Should not be NULL)

-headoffice

-branches (Integer value greater than Zero)*/
CREATE TABLE Bank(bankcode varchar(3) NOT NULL PRIMARY KEY,bankname varchar(10) NOT NULL,headoffice varchar(10),branchoffice int);

/*populate the table*/
INSERT INTO Bank VALUES('ABC','SBI','Ernakulam',6);
INSERT INTO Bank VALUES('DEF','FEDERAL','Kottayam',7);
INSERT INTO Bank VALUES('GHI','CANARA','Trivandrum',8);

SELECT * FROM Bank;
/*
ABC|SBI|Ernakulam|6                                                             
DEF|FEDERAL|Kottayam|7                                                          
GHI|CANARA|Trivandrum|8 
*/

/* d. Create a table named Branch with the following attributes

-branchid (To be set as Primary Key)

-branchname (Set Default value as ‘New Delhi’)

-bankid (Foreign Key:- Refers to bankcode of Bank

table)
*/
CREATE TABLE Branch(branchid int PRIMARY KEY,branchname varchar(15) DEFAULT('New Delhi'),bankid varchar(3) references bank(bankcode));
/* i) Populate the database.*/
INSERT INTO branch VALUES(01,'Kottayam','ABC');
INSERT INTO branch VALUES(05,'Calicut','SBT');
/* demonstrate how the DEFAULT Constraint is satisfied.*/
INSERT INTO branch(branchid,bankid) VALUES(02,'DEF');

SELECT * FROM Branch;
/*
1|Kottayam|ABC                                                                  
5|Calicut|SBT                                                                   
2|New Delhi|DEF 
*/

/* iii) Delete the bank with bank code ‘SBT’*/
INSERT INTO Bank VALUES('SBT','Indian','Delhi',10);
DELETE FROM branch WHERE bankid='SBT';
DELETE FROM bank WHERE bankcode='SBT';

SELECT *FROM Bank;
/*
ABC|SBI|Ernakulam|6                                                             
DEF|FEDERAL|Kottayam|7                                                          
GHI|CANARA|Trivandrum|8
*/

SELECT *FROM Branch;
/* 
1|Kottayam|ABC                                                                  
2|New Delhi|DEF
*/

/* iv) Drop the Primary Key using ALTER command*/
ALTER TABLE branch DROP PRIMARY KEY ;

/* 2. Create a View named sales_staff to hold the details of all staff working in sales*/
CREATE VIEW sales_staff as SELECT * FROM staff WHERE dept='Sales';
SELECT * FROM sales_staff;
/*
1|Mary|Sales|24|32000                                                           
3|William|Sales|28|25000
*/

/*3. Drop table branch. Create another table named branch and name all constraints as given in the question*/
DROP TABLE branch;
CREATE TABLE Branch (branch_id int,branchname varchar(15) DEFAULT('New Delhi'),bankid varchar(3));
ALTER TABLE Branch ADD CONSTRAINT pk PRIMARY KEY(branch_id);
ALTER TABLE Branch ADD CONSTRAINT fk FOREIGN KEY(bankid) REFERENCES bank(bankcode);

/*i) Delete the default constraint in the table*/
ALTER TABLE Branch ALTER COLUMN branch_name DROP DEFAULT;

/*ii) Delete the primary key constraint*/
ALTER TABLE Branch DROP CONSTRAINT pk;

/*4. Update the view sales_staff to include the details of staff belonging to sales department whose salary is greater than 20000*/
CREATE OR REPLACE VIEW sales_staff as SELECT * FROM Staff WHERE Salary>20000;
SELECT *FROM sales_staff;
/*
1|Mary|Sales|24|32000                                                           
3|William|Sales|28|25000
*/

/*5. Delete the view sales_staff.*/
DROP VIEW sales_staff;








