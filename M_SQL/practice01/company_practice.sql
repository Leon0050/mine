-- 练习
-- 1. 取得所有员工资料
SELECT * FROM `employee`;

-- 2. 取得所有客户资料
SELECT * FROM `client`;

-- 3. 按薪水低到高取得员工资料
SELECT * 
FROM `employee`
ORDER BY `salary`;

-- 4. 取得薪水前3高的员工
SELECT * FROM `employee` ORDER BY `salary` DESC LIMIT 3;

-- 5. 取得所有员工名字
SELECT `name` FROM `employee`;

-- 不重复属性 sex
SELECT `sex` from `employee`;
SELECT DISTINCT `sex` from `employee`;

 