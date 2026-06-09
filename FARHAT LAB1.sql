Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.41 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database StudentManagementSystem;

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| classicmodels      |
| ecommerce          |
| emp_details        |
| hospital           |
| information_schema |
| mysql              |
| performance_schema |
| studentmanagement  |
| sys                |
+--------------------+
9 rows in set (0.00 sec)

mysql> use StudentManagement;
Database changed

mysql> create table Student(StudentId varchar(10) primary key not null,name varchar(30) not null,Age varchar(5) not null,Address varchar(100) not null);
Query OK, 0 rows affected (0.10 sec)

mysql> show tables;
+-----------------------------+
| Tables_in_studentmanagement |
+-----------------------------+
| student                     |
+-----------------------------+
1 row in set (0.00 sec)

mysql> desc Student;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| StudentId | varchar(10)  | NO   | PRI | NULL    |       |
| name      | varchar(30)  | NO   |     | NULL    |       |
| Age       | varchar(5)   | NO   |     | NULL    |       |
| Address   | varchar(100) | NO   |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into student value('S101','Shaikh Farhat','21','Mumbra');
Query OK, 1 row affected (0.02 sec)

mysql> select * from Student;
+-----------+---------------+-----+---------+
| StudentId | name          | Age | Address |
+-----------+---------------+-----+---------+
| S101      | Shaikh Farhat | 21  | Mumbra  |
+-----------+---------------+-----+---------+
1 row in set (0.00 sec)

mysql> insert into Student value('S102','Shaikh Nazir','23','Mumbai'),('S103','Sayyed Almas','20','Malad'),('S104','Arif Shaikh','22','Ghatkopar'),('S105','Arshin Patel','22','Grant Road');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from Student;
+-----------+---------------+-----+------------+
| StudentId | name          | Age | Address    |
+-----------+---------------+-----+------------+
| S101      | Shaikh Farhat | 21  | Mumbra     |
| S102      | Shaikh Nazir  | 23  | Mumbai     |
| S103      | Sayyed Almas  | 20  | Malad      |
| S104      | Arif Shaikh   | 22  | Ghatkopar  |
| S105      | Arshin Patel  | 22  | Grant Road |
+-----------+---------------+-----+------------+
5 rows in set (0.00 sec)

mysql> create table feedback(FeedbackId varchar(10) primary key not null,StudentId varchar(10) not null,feedback_date date not null,instructor_name varchar(15) not null,feedback varchar(50) not null,foreign key (StudentId) references Student(StudentId));
Query OK, 0 rows affected (0.07 sec)

mysql> show tables;
+-----------------------------+
| Tables_in_studentmanagement |
+-----------------------------+
| feedback                    |
| student                     |
+-----------------------------+
2 rows in set (0.00 sec)

mysql> desc feedback;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| FeedbackId      | varchar(10) | NO   | PRI | NULL    |       |
| StudentId       | varchar(10) | NO   | MUL | NULL    |       |
| feedback_date   | date        | NO   |     | NULL    |       |
| instructor_name | varchar(15) | NO   |     | NULL    |       |
| feedback        | varchar(50) | NO   |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> insert into feedback
    -> values
    -> ('F101','S101','2026-06-08','Mr. Khan','Excellent performance'),
    -> ('F102','S102','2026-06-09','Ms. Sharma','Good attendance'),
    -> ('F103','S103','2026-06-10','Mr. Patel','Needs improvement'),
    -> ('F105','S104','2026-06-10','Ms.Sayyed','Good Performance'),
    -> ('F104','S105','2026-06-11','Mr. Khan','Excellent performance');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from feedback;
+------------+-----------+---------------+-----------------+-----------------------+
| FeedbackId | StudentId | feedback_date | instructor_name | feedback              |
+------------+-----------+---------------+-----------------+-----------------------+
| F101       | S101      | 2026-06-08    | Mr. Khan        | Excellent performance |
| F102       | S102      | 2026-06-09    | Ms. Sharma      | Good attendance       |
| F103       | S103      | 2026-06-10    | Mr. Patel       | Needs improvement     |
| F104       | S105      | 2026-06-11    | Mr. Khan        | Excellent performance |
| F105       | S104      | 2026-06-10    | Ms.Sayyed       | Good Performance      |
+------------+-----------+---------------+-----------------+-----------------------+
5 rows in set (0.00 sec)

mysql>