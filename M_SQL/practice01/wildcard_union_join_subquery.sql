-- 万用字元 wildcard： % 代表多个字元， _ 表示一个字元
select * from `client`;
 
-- 1. 取得电话号码尾号是723的客户
SELECT * FROM `client` WHERE `phone` LIKE '%723';
-- 1.5  取得电话号码开头是254的客户
SELECT * FROM `client` WHERE `phone` LIKE '254%';
-- 2. 取得姓小的客户
SELECT * FROM `client` WHERE `client_name` LIKE '小%';
SELECT * FROM `client` WHERE `client_name` LIKE '小_'; 
-- 3. 取得生日在12月的员工
SELECT * FROM `employee` WHERE `birth_data` LIKE '_____12%'; # 因为年份和天数也有，12用_表示具体到哪个位数

 
-- union 联集，联合查询
-- 1. 员工名字union客户名字
SELECT `name` FROM `employee` UNION SELECT `client_name` FROM `client`;
SELECT `name`,`sex` FROM `employee` UNION SELECT `client_name`,`client_id` FROM `client`;
-- 2. 员工ID + 员工名字 union 客户ID + 客户名字
SELECT `emp_id`,`name` FROM `employee` UNION SELECT `client_id`, `client_name` FROM `client`;
SELECT `emp_id`AS `all_id`,`name` AS `all_name` FROM `employee` UNION SELECT `client_id`, `client_name` FROM `client`;
-- 3. 员工薪水 union 销售金额
select * from `employee`;
select * from `works_with`;
SELECT `salary` FROM `employee` UNION SELECT `total_sales` FROM `works_with`;
SELECT `salary` AS `money` FROM `employee` UNION SELECT `total_sales` FROM `works_with`;

-- join 连接
select * from `branch`;
INSERT INTO `branch` VALUES(4, '偷懒', NULL);

-- 取得所有部门经理的id，名字，部门
SELECT `employee`.`emp_id`, `employee`.`name`, `branch`.`branch_name`
FROM `employee`
INNER JOIN `branch` # join = inner join
ON `employee`.`emp_id` = `branch`.`manager_id`;

-- LEFT JOIN 
SELECT `employee`.`emp_id`, `employee`.`name`, `branch`.`branch_name`
FROM `employee` LEFT JOIN `branch`  # 左边表格无论条件如何都会回传资料，右边的需要条件成立才回传
ON `employee`.`emp_id` = `branch`.`manager_id`;

-- RIGHT JOIN 
SELECT `employee`.`emp_id`, `employee`.`name`, `branch`.`branch_name`
FROM `employee`RIGHT JOIN `branch`  # 左边表格无论条件如何都会回传资料，右边的需要条件成立才回传
ON `employee`.`emp_id` = `branch`.`manager_id`;


-- subquery 子查询

-- 1. 找出研发部门的经理名字
SELECT `name` FROm `employee` WHERE `emp_id` = (
	SELECT `manager_id` 
	FROM `branch`
	WHERE `branch_name` ='研发'
);

-- 2. 找出对单一客户销售金额超过50000的员工的名字
SELECT `name` FROM `employee` WHERE `emp_id` IN (
	SELECT `emp_id`
	FROM `works_with`
	WHERE `total_sales` > 50000
);
-- 2. join method
SELECT `name` 
FROM `employee` JOIN `works_with` 
ON `employee`.`emp_id` = `works_with`.`emp_id`
WHERE `works_with`.`total_sales` > 50000;















