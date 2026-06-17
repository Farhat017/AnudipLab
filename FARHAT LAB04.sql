mysql> create database StudentManagementSystem;

mysql> use StudentManagementSystem;
Database changed

mysql> create table student(stud_id int primary key not null,first_name varchar(10) not null,last_name varchar(10) not null);
Query OK, 0 rows affected (0.12 sec)

mysql> desc student;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| stud_id    | int         | NO   | PRI | NULL    |       |
| first_name | varchar(10) | NO   |     | NULL    |       |
| last_name  | varchar(10) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.09 sec)

mysql>insert into student values(1,'Faraj','Sheikh'),(2,'Anam','Sayyed'),(3,'Ali','Khan'),(4,'Sara','Ansari'),(5,'Aman','Patel');

mysql> select * from student;
+---------+------------+-----------+
| stud_id | first_name | last_name |
+---------+------------+-----------+
|       1 | Faraj      | Sheikh    |
|       2 | Anam       | Sayyed    |
|       3 | Ali        | Khan      |
|       4 | Sara       | Ansari    |
|       5 | Aman       | Patel     |
+---------+------------+-----------+
5 rows in set (0.00 sec)

mysql> create table Course (CourseID int primary key, CourseName varchar(100));
Query OK, 0 rows affected (0.02 sec)

mysql> desc Course;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| CourseID   | int          | NO   | PRI | NULL    |       |
| CourseName | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
2 rows in set (0.00 sec)
 
mysql>insert into Course values
(101,'SQL'),
(102,'Python'),
(103,'Power BI'),
(104,'Excel'),
(105,'Tableau');

mysql> select * from Course;
+----------+------------+
| CourseID | CourseName |
+----------+------------+
|      101 | SQL        |
|      102 | Python     |
|      103 | Power BI   |
|      104 | Excel      |
|      105 | Tableau    |
+----------+------------+
5 rows in set (0.00 sec)

mysql> create table Enrollment (
    ->     EnrollmentID int primary key,
    ->     stud_id int,
    ->     CourseID int,
    ->     foreign key(stud_id) REFERENCES Student(stud_id),
    ->     foreign key(CourseID) REFERENCES Course(CourseID)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> desc Enrollment;
+--------------+------+------+-----+---------+-------+
| Field        | Type | Null | Key | Default | Extra |
+--------------+------+------+-----+---------+-------+
| EnrollmentID | int  | NO   | PRI | NULL    |       |
| stud_id      | int  | YES  | MUL | NULL    |       |
| CourseID     | int  | YES  | MUL | NULL    |       |
+--------------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> insert into Enrollment values(1,1,101),(2,2,102),(3,3,103),(4,4,104),(5,5,105);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Enrollment;
+--------------+---------+----------+
| EnrollmentID | stud_id | CourseID |
+--------------+---------+----------+
|            1 |       1 |      101 |
|            2 |       2 |      102 |
|            3 |       3 |      103 |
|            4 |       4 |      104 |
|            5 |       5 |      105 |
+--------------+---------+----------+
5 rows in set (0.00 sec)

mysql> select
    ->     s.stud_id,
    ->     s.first_name,
    ->     s.last_name,
    ->     c.CourseID,
    ->     c.CourseName
    -> from Student s
    -> inner join Enrollment e
    -> on s.stud_id = e.stud_id
    -> inner join Course c
    -> on e.CourseID = c.CourseID;
+---------+------------+-----------+----------+------------+
| stud_id | first_name | last_name | CourseID | CourseName |
+---------+------------+-----------+----------+------------+
|       1 | Faraj      | Sheikh    |      101 | SQL        |
|       2 | Anam       | Sayyed    |      102 | Python     |
|       3 | Ali        | Khan      |      103 | Power BI   |
|       4 | Sara       | Ansari    |      104 | Excel      |
|       5 | Aman       | Patel     |      105 | Tableau    |
+---------+------------+-----------+----------+------------+
5 rows in set (0.01 sec)
