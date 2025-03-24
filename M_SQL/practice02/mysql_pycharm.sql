SHOW DATABASES;
use company;
SHOW TABLES;
select * from student;

-- 无约束版本
create table new_student(
    name varchar(32),
    gender bit,
    age int,
    birth date,
    gpt decimal(4,2)
) character set=gbk;
insert new_student(age) values(1);
select age from new_student;
delete from new_student where age = 1;
select * from new_student;
drop table user;

-- 有约束版本
create table user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(22) unique,
    age int NOT NULL,
    gender VARCHAR(2) DEFAULT '保密'
    );
select * from user;
insert into `user`(`name`,`age`) values('yuan', 20);
insert into `user`(`name`, `age`, `gender`) values('xuan', 34, '男');
INSERT INTO `user`(`name`, `age`) VALUES('lina', 28);
SHOW TABLES;
select* from branch;
SHOW CREATE DATABASE school;
DESC user;
DESCRIBE student;
SHOW COLUMNS FROM student;
SHOW COLUMNS FROM user;
select `name` from user where id = 1;
select * from user where id = 2;

-- 数据表删除，修改，查看
select database();
show tables;
desc user;
desc student;
select * from student;
show create table users;
drop table new_student;

-- 修改表名
alter table users rename to user;
desc user;
-- 修改编码集；
show create table student;
alter table student character set gbk;
-- 表的字段增删改
-- （1）添加字段
alter table student ADD `class_name` VARCHAR(20) NOT NULL;
select* from student;
DESC student;
-- (2)删除字段
alter table student drop class_name;
-- (3)修改字段（类型，约束，名字）
alter table student MODIFY name varchar(21) NOT NULL;
desc student;
alter table student change score scores INT;
alter table user ADD birth DATE;
desc user;
-- 补充 first after: 字段位置调整
alter table user modify birth DATE after id;
alter table user modify name VARCHAR(21) after id;
alter table user modify gender varchar(2) first;
alter table user modify id INT first;
desc user;
# SHOW VARIABLES LIKE 'datadir';