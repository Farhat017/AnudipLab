 create database StudentInfo;
Query OK, 1 row affected (0.01 sec)

mysql> use StudentInfo;
Database changed

mysql> create table Student(Stud_Id varchar(22) primary key not null,FirstName varchar(20) not null,LastName varchar(30) not null,Age int not null,Phoneno varchar(10) not null,Address varchar(50) not null);
Query OK, 0 rows affected (0.04 sec)

mysql> desc Student;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| Stud_Id   | varchar(22) | NO   | PRI | NULL    |       |
| FirstName | varchar(20) | NO   |     | NULL    |       |
| LastName  | varchar(30) | NO   |     | NULL    |       |
| Age       | int         | NO   |     | NULL    |       |
| Phoneno   | varchar(10) | NO   |     | NULL    |       |
| Address   | varchar(50) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> insert into Student values('1001','Sheetal','Patel',21,'8976543209','Mumbai');
Query OK, 1 row affected (0.01 sec)

mysql> insert into Student values('1002','Rami','Patel',21,'8976543209','Mumbai'),('1003','Karina','kapoor',35,'6789023456','Bandra'),('1004','Saif Ali','khan',40,'7689034567','Bandra'),('1005','Mustafa','Karvat',33,'9876543210','Malad');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from Student;
+---------+-----------+----------+-----+------------+---------+
| Stud_Id | FirstName | LastName | Age | Phoneno    | Address |
+---------+-----------+----------+-----+------------+---------+
| 1001    | Sheetal   | Patel    |  21 | 8976543209 | Mumbai  |
| 1002    | Rami      | Patel    |  21 | 8976543209 | Mumbai  |
| 1003    | Karina    | kapoor   |  35 | 6789023456 | Bandra  |
| 1004    | Saif Ali  | khan     |  40 | 7689034567 | Bandra  |
| 1005    | Mustafa   | Karvat   |  33 | 9876543210 | Malad   |
+---------+-----------+----------+-----+------------+---------+
5 rows in set (0.00 sec)


mysql> select * from Student order by LastName ASC;
+---------+-----------+----------+-----+------------+---------+
| Stud_Id | FirstName | LastName | Age | Phoneno    | Address |
+---------+-----------+----------+-----+------------+---------+
| 1003    | Karina    | kapoor   |  35 | 6789023456 | Bandra  |
| 1005    | Mustafa   | Karvat   |  33 | 9876543210 | Malad   |
| 1004    | Saif Ali  | khan     |  40 | 7689034567 | Bandra  |
| 1001    | Sheetal   | Patel    |  21 | 8976543209 | Mumbai  |
| 1002    | Rami      | Patel    |  21 | 8976543209 | Mumbai  |
+---------+-----------+----------+-----+------------+---------+
5 rows in set (0.01 sec)
