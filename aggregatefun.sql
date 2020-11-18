/*Introduction to Aggregate functions*/



create table student(rollno int,name varchar(20),physics int,chemistry int,maths int);
insert into student values(1,'adam',20,20,33);
insert into student values(2,'bob',18,9,41);
insert into student values(3,'bright',22,7,31);
insert into student values(4,'duke',13,21,20);
insert into student values(5,'elvin',14,22,23);
insert into student values(6,'fletcher',2,10,48);
insert into student values(7,'georgina',22,12,22);
insert into student values(8,'mary',24,14,31);
insert into student values(9,'tom',19,15,24);
insert into student values(10,'zack',8,20,36);
select * from student;

/* 1|adam|20|20|33                                                                 
2|bob|18|9|41                                                                   
3|bright|22|7|31                                                                
4|duke|13|21|20                                                                 
5|elvin|14|22|23                                                                
6|fletcher|2|10|48                                                              
7|georgina|22|12|22                                                             
8|mary|24|14|31                                                                 
9|tom|19|15|24                                                                  
10|zack|8|20|36  */

select avg(physics) from student;

/* 16.2 */

select max(maths) as highest_marks_maths from student;

/* 48 */

select min(chemistry) as lowest_mark_chemistry from student;

/* 7 */

select count(physics) from student where physics>=12;

/* 8 */

select * from student where physics>=12 and chemistry>=12 and maths>=25;

/* 1|adam|20|20|33                                                                 
   8|mary|24|14|31    */
   
alter table student add total int;
update student set total=physics+chemistry+maths;
alter table student add rank varchar(10);
update student set rank='pass' where physics>=12 and chemistry>=12 and maths>=25;
update student set rank='fail' where physics<12 or chemistry<12 or maths<25;
select * from student order by total desc;

/* 1|adam|20|20|33|73|pass                                                         
   8|mary|24|14|31|69|pass                                                         
   2|bob|18|9|41|68|fail                                                           
  10|zack|8|20|36|64|fail                                                         
   3|bright|22|7|31|60|fail                                                        
   6|fletcher|2|10|48|60|fail                                                      
   5|elvin|14|22|23|59|fail                                                        
   9|tom|19|15|24|58|fail                                                          
   7|georgina|22|12|22|56|fail                                                     
   4|duke|13|21|20|54|fail    */
 
select (count(maths)*(100/10)) from student where maths>=25;
/* 60 */

SELECT COUNT(rank)*10 AS pass_percentage from student where rank="pass";
/* 20 */

SELECT sum(total)/10 AS class_avg from student;
/*62*/

select count(rank) from student where rank='pass';

/* 2 */
