USE school;
SHOW TABLEs;
desc user;
select * from user;
-- 添加一条记录
ALTER TABLE user AlTER COLUMN gender SET default '保密';
ALTER TABLE user MODIFY `gender` varchar(2) default '保密';
delete from user where id =4;
insert INTO user(`id`, `name`, `age`) values(4,'nana', 34);
-- 批量添加记录
desc user;
create table batch(
    id int primary key AUto_INCREMENT,
    name varchar(10),
    age int
);
-- insert values
-- method 1 （慢）starting from 1 in 16 ms (execution: 3 ms, fetching: 13 ms)
insert batch(name, age) values('ao', 35);
insert batch(name, age) values('ao', 35);
insert batch(name, age) values('ao', 35);
insert batch(name, age) values('ao', 35);
insert batch(name, age) values('ao', 35);
insert batch(name, age) values('ao', 35);
insert batch(name, age) values('ao', 35);
insert batch(name, age) values('ao', 35);
insert batch(name, age) values('ao', 35);
insert batch(name, age) values('ao', 35);
-- method 2 （快，推荐） 10 rows affected in 5 ms
insert batch(name, age) values('ao', 35),
                              ('ao', 35),
                              ('ao', 35),
                              ('ao', 35),
                              ('ao', 35),
                              ('ao', 35),
                              ('ao', 35),
                              ('ao', 35),
                              ('ao', 35),
                              ('ao', 35);
select * from batch;

-- (2)insert set
insert batch set name ='yaun', age = 28;

-- 选择，区分大小写
insert batch(name, age) values('Yaun', 26),
                                ('Yijgh', 45 ),
                                ('yer', 56);
select * from batch where name like 'Y%';          # 不区分大小写
select * from batch where binary name like 'Y%';   # 区分，只要大写
select * from batch where binary name like 'y%';   # 区分，只要小写
SELECT * FROM batch WHERE REGEXP_LIKE(name, '^Y'); # 不区分大小写
SELECT * FROM batch WHERE REGEXP_LIKE(name, '^Y', 'c'); # 区分,只要大写
SELECT * FROM batch WHERE REGEXP_LIKE(name, '^y', 'c'); # 区分,只要小写

desc batch;
drop table batch;
create table batch(
    id int primary key AUto_INCREMENT,
    name varchar(10),
    gender enum('男','女','保密') default '保密',
    age int,
    birth DATE NOT NULL,
    dep VARCHAR(5),
    salary INT
);
insert batch(name, gender, age, birth, dep, salary) values('Yaun','男', 26, '1999-10-03', '研发部', 34000),
                                ('Yigh', '男',45 , '1986-10-03','教学部', 43000),
                                ('yer','女', 16, '2008-10-03', '新闻部', 45000),
                                ('LIna','女', 42 , '1989-10-03','教学部', 78000),
                                ('Trun', '男',42 , '1989-09-03','教学部', 65000),
                                ('tom', '男',21, '2005-05-03','新闻部', 47000);
select * from batch;
-- 查询1999年出生的所有员工
select * from batch where YEAR('birth') = 1999;
-- 查询 10月份出生的所有员工
select * from batch where MONTH('birth') = 10;
-- 查询 3号出生的所有员工
select * from batch where DAY('birth') = 3;
-- 摩羯座 12.22 -1.19
select count(*) from batch where (month('birth') =12 and day('birth') >22)
                              or (month('birth') =1 and day('birth') < 19);

-- GROUP BY
-- 查询每个部门的员工平均工资
select `dep`,AVG(`salary`) from batch group by `dep`;
select dep,format(AVG(salary),2) from batch group by dep;
select dep, round(AVG(salary), 2) from batch group by dep;
select dep as 部门, round(AVG(salary), 2) 平均工资 from batch group by dep;
-- 查询每个部门的员工最高工资
select dep, round(max(salary), 2) as max_salary from batch group by dep;
-- 查询每个部门的员工数
select dep, count(*) num from batch group by dep;

-- HAVING
-- 查询男女员工各有多少人
select gender 性别, count(*) from batch group by gender;
-- 查询年龄大于25岁的男女员工各有多少人
select gender, count(*) from batch where age > 25 group by gender;
-- 查询教学部员工最高工资
select dep, round(max(salary), 2) from batch where dep = '教学部' group by dep;
select dep, round(max(salary), 2) from batch group by dep having dep = '教学部';
-- 查询平均薪水超过50000的部门
select dep,AVG(salary) from batch group by dep having avg(salary) > 50000;
select dep,AVG(salary) avg_salary from batch group by dep having avg_salary > 50000;
# select dep,AVG(salary) from batch where avg(salary) > 50000  group by dep;
# 错误， where 不能接聚合函数，但是having可以
-- 查询每个部门所有员工姓名
select dep,group_concat(name) from batch group by dep;
-- 查询公司一共多少员工(可以将所有记录看作一个组)
select count(*) num_of_employees from  batch;
-- 每年出生的员工人数
select year(birth) year, count(*) c from batch group by year(birth) order by year(birth);
-- 查询公司所有员工的平均工资
select round(avg(salary),2) from batch;
select format(sum(salary)/count(*),2) from batch;

-- LIMIT
select * from batch;
select * from batch limit 3;
select * from batch limit 2,3;
select * from batch order by salary desc, age desc;
-- limit分页
-- 第一页
select * from batch limit 10;
-- 第二页
select * from batch limit 10, 10;
-- 第三页
select * from batch limit 20, 10;

-- DISTINCT
select * from batch;
select id, name, gender from batch;
select distinct name, gender from batch;

-- 日期函数
select curdate();
select now();
select curdate() - interval 7 day;
select curdate() - interval 1 week;
select curdate() - interval 1 month;
select curdate() - interval 1 year;
select curdate() + interval 7 day;