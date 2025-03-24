CREATE DATABASE `company`;
SHOW DATABASES;
CREATE TABLE `employee`(
	`emp_id` INT PRIMARY KEY,
    `name` VARCHAR(20),
    `birth_data` DATE,
    `sex` VARCHAR(1),
    `salary` INT,
    `branch_id` INT,
    `sup_id` INT
);
select * from employee;
CREATE TABLE `branch`(
	`branch_id` INT PRIMARY KEY,
    `branch_name` VARCHAR(20),
    `manager_id` INT,
    FOREIGN KEY(`manager_id`) REFERENCES `employee`(`emp_id`) ON DELETE SET NULL
);
select * from branch;
ALTER TABLE `employee`
ADD FOREIGN KEY(`branch_id`) 
REFERENCES `branch`(`branch_id`)
ON DELETE SET NULL;

ALTER TABLE `employee`
ADD FOREIGN KEY(`sup_id`)
REFERENCES `employee`(`emp_id`)
ON DELETE SET NULL;


CREATE TABLE `client`(
	`client_id` INT PRIMARY KEY,
    `client_name` VARCHAR(20),
    `phone` VARCHAR(20)
);
CREATE TABLE `works_with`(
	`emp_id` INT,
    `client_id` INT,
    `total_sales` INT,
    PRIMARY KEY(`emp_id`,`client_id`),
    FOREIGN KEY(`emp_id`) REFERENCES `employee`(`emp_id`) ON DELETE CASCADE,
    FOREIGN KEY(`client_id`) REFERENCES `client`(`client_id`) ON DELETE CASCADE
);

# 新增加资料

INSERT INTO `branch` VALUES(1, '研发', NULL);
INSERT INTO `branch` VALUES(2, '行政', NULL);
INSERT INTO `branch` VALUES(3, '资讯', NULL);

INSERT INTO `employee` VALUES(206, '小黄', '1998-10-09', 'F', 50000, 1, NULL);
INSERT INTO `employee` VALUES(207, '小绿', '1985-09-16', 'M', 29000, 2, 206);
INSERT INTO `employee` VALUES(208, '小黑', '2000-12-19', 'M', 35000, 3, 206);
INSERT INTO `employee` VALUES(209, '小白', '1997-01-22', 'F', 39000, 3, 207);
INSERT INTO `employee` VALUES(210, '小蓝', '1925-11-10', 'F', 84000, 1, 207);

select * from `employee`;
select * from `branch`;

UPDATE `branch` SET `manager_id` = 206 WHERE `branch_id`= 1;
UPDATE `branch` SET `manager_id` = 207 WHERE `branch_id`=2;
UPDATE `branch` SET `manager_id` = 208 WHERE `branch_id`=3;

select * from `branch`;
select * from `client`;

INSERT INTO `client` VALUES(400, '小王', '254367788');
INSERT INTO `client` VALUES(401, '小李', '254367746');
INSERT INTO `client` VALUES(402, '小屋', '254367723');
INSERT INTO `client` VALUES(403, '消防', '254367744');
INSERT INTO `client` VALUES(404, '我国', '254367786');

select * from `client`;
select* from `works_with`;

INSERT INTO `works_with` VALUES(206, 400, '70000');
INSERT INTO `works_with` VALUES(207, 401, '25000');
INSERT INTO `works_with` VALUES(208, 402, '6000');
INSERT INTO `works_with` VALUES(209, 403, '240000');
INSERT INTO `works_with` VALUES(210, 404, '89000');

select* from `works_with`;











