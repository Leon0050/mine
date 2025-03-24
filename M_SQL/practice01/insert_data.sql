SHOW DATABASES;
USE `sql_tutorial`;
CREATE TABLE `student`(
	`student_id` INT PRIMARY KEY,
    `name` VARCHAR(20),
    `major` VARCHAR(20)
);
DESCRIBE `student`;
# insert method 1
INSERT INTO `student` VALUES(1, '小白', '历史');
SELECT * FROM `student`;
INSERT INTO `student` VALUES(2, '小黑', '生物');
INSERT INTO `student` VALUES(3, '小绿', NULL);
# insert method 2
INSERT INTO `student`(`name`, `major`,`student_id`) VALUES('小蓝', '英语', 4);
INSERT INTO `student`(`major`, `student_id`) VALUE('政治', '5');
SELECT * FROM `student`;