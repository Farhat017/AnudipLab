mysql> create database BankDB;
Query OK, 1 row affected (0.01 sec)

mysql> use BankDB;
Database changed
mysql>
mysql> create table BankAccount(
    ->     account_id int primary key not null,
    ->     account_holder_name varchar(20) not null,
    ->     account_balance double not null
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> desc BankAccount;
+---------------------+-------------+------+-----+---------+-------+
| Field               | Type        | Null | Key | Default | Extra |
+---------------------+-------------+------+-----+---------+-------+
| account_id          | int         | NO   | PRI | NULL    |       |
| account_holder_name | varchar(30) | NO   |     | NULL    |       |
| account_balance     | double      | NO   |     | NULL    |       |
+---------------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into BankAccount
    -> values
    -> (101,'Farhat Shaikh',25000),
    -> (102,'Aisha Khan',45000),
    -> (103,'Rahul Patel',30000),
    -> (104,'Sana Ansari',55000),
    -> (105,'Ali Sheikh',20000);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from BankAccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
|        101 | Farhat Shaikh       |           25000 |
|        102 | Aisha Khan          |           45000 |
|        103 | Rahul Patel         |           30000 |
|        104 | Sana Ansari         |           55000 |
|        105 | Ali Sheikh          |           20000 |
+------------+---------------------+-----------------+
5 rows in set (0.00 sec)

mysql> select account_holder_name, account_balance
    -> from BankAccount;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Farhat Shaikh       |           25000 |
| Aisha Khan          |           45000 |
| Rahul Patel         |           30000 |
| Sana Ansari         |           55000 |
| Ali Sheikh          |           20000 |
+---------------------+-----------------+
5 rows in set (0.00 sec)

mysql> select account_holder_name, account_balance
    -> from BankAccount
    -> where account_balance > 30000;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Aisha Khan          |           45000 |
| Sana Ansari         |           55000 |
+---------------------+-----------------+
2 rows in set (0.00 sec)

mysql> update BankAccount
    -> set account_balance = 40000
    -> where account_id = 101;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from BankAccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
|        101 | Farhat Shaikh       |           40000 |
|        102 | Aisha Khan          |           45000 |
|        103 | Rahul Patel         |           30000 |
|        104 | Sana Ansari         |           55000 |
|        105 | Ali Sheikh          |           20000 |
+------------+---------------------+-----------------+
5 rows in set (0.00 sec)


mysql> select * from BankAccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
|        101 | Farhat Shaikh       |           40000 |
|        102 | Aisha Khan          |           45000 |
|        103 | Rahul Patel         |           30000 |
|        104 | Sana Ansari         |           55000 |
|        105 | Ali Sheikh          |           20000 |
+------------+---------------------+-----------------+
5 rows in set (0.00 sec)

mysql>