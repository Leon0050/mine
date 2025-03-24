# constraints
DESCRIBE `student`;
SELECT * FROM `student`;
CREATE TABLE `student`(
	`student_id` INT AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `major` VARCHAR(20) UNIQUE,
	`weight` INT DEFAULT 50,
    PRIMARY KEY(`student_id`)
);

DROP TABLE `student`;
INSERT INTO `student`(`student_id`, `name`, `major`)  VALUES(2, '小白', '政治');
INSERT INTO `student` VALUES(4, '小黑', '英语', 60);
INSERT INTO `student` VALUES(3, '小蓝', null, 70);
INSERT INTO `student`(`major`, `student_id`, `name`) VALUES('math', 5, 'Lisa');
SELECT * FROM `student`;

INSERT INTO `student`(`name`, `major`) VALUES('lin', 'history'); 
INSERT INTO `student`(`major`, `name`) VALUES('math', 'tom');
DELETE FROM student WHERE student_id= 3;
INSERT INTO `student` VALUES(3, 'may', 'policy', 50);
SELECT * FROM `student`;