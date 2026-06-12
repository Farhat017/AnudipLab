mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bankdb             |
| classicmodels      |
| ecommerce          |
| emp_details        |
| hospital           |
| information_schema |
| mysql              |
| performance_schema |
| studentinfo        |
| studentmanagement  |
| sys                |
+--------------------+
11 rows in set (0.29 sec)

mysql> create database joins;
Query OK, 1 row affected (0.04 sec)

mysql> use joins;
Database changed

mysql> create table dept(dept_id int not null primary key,dept_name varchar(30) not null);
Query OK, 0 rows affected (0.09 sec)

mysql> desc dept;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.04 sec)

mysql> insert into dept values(1,'HR'),(2,'IT'),(3,'Fiance'),(4,'Marketing');
Query OK, 4 rows affected (0.05 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from dept;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | Fiance    |
|       4 | Marketing |
+---------+-----------+
4 rows in set (0.00 sec)

mysql> CREATE TABLE emp(
    ->     emp_id INT PRIMARY KEY NOT NULL,
    ->     emp_name VARCHAR(20) NOT NULL,
    ->     dept_id INT,
    ->     FOREIGN KEY (dept_id) REFERENCES dept(dept_id)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> desc emp;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_id   | int         | NO   | PRI | NULL    |       |
| emp_name | varchar(20) | NO   |     | NULL    |       |
| dept_id  | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> INSERT INTO emp VALUES
    -> (101,'Farhat',1),
    -> (102,'Aisha',2),
    -> (103,'Rahul',3),
    -> (104,'Sana',4);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from emp;
+--------+----------+---------+
| emp_id | emp_name | dept_id |
+--------+----------+---------+
|    101 | Farhat   |       1 |
|    102 | Aisha    |       2 |
|    103 | Rahul    |       3 |
|    104 | Sana     |       4 |
+--------+----------+---------+
4 rows in set (0.00 sec)

mysql> select * from emp_name,dept_name from emp cross join dept;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from emp cross join dept' at line 1
mysql> select emp_name,dept_name from emp cross join dept;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Sana     | HR        |
| Rahul    | HR        |
| Aisha    | HR        |
| Farhat   | HR        |
| Sana     | IT        |
| Rahul    | IT        |
| Aisha    | IT        |
| Farhat   | IT        |
| Sana     | Fiance    |
| Rahul    | Fiance    |
| Aisha    | Fiance    |
| Farhat   | Fiance    |
| Sana     | Marketing |
| Rahul    | Marketing |
| Aisha    | Marketing |
| Farhat   | Marketing |
+----------+-----------+
16 rows in set (0.00 sec)

mysql> select emp_name,dept_name from emp left join dept on emp.dept_id=dept.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Farhat   | HR        |
| Aisha    | IT        |
| Rahul    | Fiance    |
| Sana     | Marketing |
+----------+-----------+
4 rows in set (0.00 sec)

mysql> select emp_name,dept_name from emp right join dept on emp.dept_id=dept.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Farhat   | HR        |
| Aisha    | IT        |
| Rahul    | Fiance    |
| Sana     | Marketing |
+----------+-----------+
4 rows in set (0.00 sec)
