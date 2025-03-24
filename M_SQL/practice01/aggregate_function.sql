SHOW TABLES;
SHOW TABLES FROM `company`;
SHOW TABLE STATUS;
DESCRIBE TABLE `employee`;
SELECT * FROM `branch`;

-- aggregation function 聚合函数
-- 1. 取得员工人数
SELECT COUNT(*) FROM `employee`;
-- 2. 取得所有出生于1970-01-01之后的女性与员工人数
select * from `employee`;
SELECT COUNT(*) FROM `employee` WHERE `sex` = 'F' AND `birth_data` > '1970-01-01';
-- 3. 取得所有员工的平均薪水
SELECT AVG(`salary`) FROM `employee`;
-- 4. 取得所有员工薪水的总和
SELECT SUM(`salary`) FROM `employee`;
-- 5. 取得薪水最高的员工
-- SELECT * FROM `employee` ORDER BY `salary` DESC LIMIT 1; 
SELECT MAX(`salary`) FROM `employee`;
-- 6. 取得薪水最低的员工
-- SELECT * FROM `employee` ORDER BY `salary` ASC LIMIT 1;
SELECT MIN(`salary`) FROM `employee`;