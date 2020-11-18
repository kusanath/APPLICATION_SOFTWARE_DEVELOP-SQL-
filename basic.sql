create table Employee(Emp_id int,Emp_name varchar(15),Dept varchar(15),Salary int);
INSERT INTO Employee values(1,'Michael','Production',2500);
INSERT INTO Employee values(2,'Joe','Production',2500);
INSERT INTO Employee values(3,'Smith','Sales',2250);
INSERT INTO Employee values(4,'David','Marketing',2900);
INSERT INTO Employee values(5,'Richard','Sales',1600);
INSERT INTO Employee values(6,'Jessy','Marketing',1800);
INSERT INTO Employee values(7,'Jane','Sales',2000);
INSERT INTO Employee values(8,'Janet','Production',3000);
INSERT INTO Employee values(9,'Neville','Marketing',2750);
INSERT INTO Employee values(10,'Richardson','Sales',1800);
SELECT * FROM Employee;

/*1|Michael|Production|2500
2|Joe|Production|2500
3|Smith|Sales|2250
4|David|Marketing|2900
5|Richard|Sales|1600
6|Jessy|Marketing|1800
7|Jane|Sales|2000
8|Janet|Production|3000
9|Neville|Marketing|2750
10|Richardson|Sales|1800*/

SELECT Emp_id,Emp_name FROM Employee;

/*1|Michael
2|Joe
3|Smith
4|David
5|Richard
6|Jessy
7|Jane
8|Janet
9|Neville
10|Richardson*/

DELETE FROM Employee WHERE Emp_id=10;
INSERT INTO Employee values(10,'Richardson','Sales',NULL);
SELECT * FROM Employee WHERE Dept='Marketing';

/*4|David|Marketing|2900
6|Jessy|Marketing|1800
9|Neville|Marketing|2750*/

UPDATE Employee set Salary=1900 WHERE Emp_id=10;
SELECT * FROM Employee;

/*1|Michael|Production|2500
2|Joe|Production|2500
3|Smith|Sales|2250
4|David|Marketing|2900
5|Richard|Sales|1600
6|Jessy|Marketing|1800
7|Jane|Sales|2000
8|Janet|Production|3000
9|Neville|Marketing|2750
10|Richardson|Sales|1900*/

UPDATE Employee set Salary=1900 WHERE Emp_name='Richardson';
SELECT * FROM Employee;

/*1|Michael|Production|2500
2|Joe|Production|2500
3|Smith|Sales|2250
4|David|Marketing|2900
5|Richard|Sales|1600
6|Jessy|Marketing|1800
7|Jane|Sales|2000
8|Janet|Production|3000
9|Neville|Marketing|2750
10|Richardson|Sales|1900*/

SELECT * FROM Employee WHERE Dept='Marketing' AND Salary>2000;

/*4|David|Marketing|2900
9|Neville|Marketing|2750*/

SELECT emp_name FROM Employee WHERE Dept='Marketing' OR Dept='Sales';

/*Smith
David
Richard
Jessy
Jane
Neville
Richardson*/

SELECT Emp_name,Dept FROM Employee WHERE Salary BETWEEN 2300 AND 3000;


/*Michael|Production
Joe|Production
David|Marketing
Janet|Production
Neville|Marketing*/

UPDATE Employee SET Salary=Salary+salary*0.12 WHERE Dept='Production';
SELECT * FROM Employee;

/*1|Michael|Production|2800
2|Joe|Production|2800
3|Smith|Sales|2250
4|David|Marketing|2900
5|Richard|Sales|1600
6|Jessy|Marketing|1800
7|Jane|Sales|2000
8|Janet|Production|3360
9|Neville|Marketing|2750
10|Richardson|Sales|1900*/

SELECT Emp_name FROM Employee WHERE Salary<2000 OR Dept='Sales';

/*Smith
Richard
Jessy
Jane
Richardson*/








                          

