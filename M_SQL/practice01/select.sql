USE school;
SELECT * FROM `student`;
DROP TABLE student;
CREATE TABLE student(
	`student_id` INT AUTO_INCREMENT,
	`name` VARCHAR(20),
    `major` VARCHAR(20),
    `score` INT,
    PRIMARY KEY (`student_id`)
    );
INSERT INTO `student` VALUES(1, "小贝", "历史", 20);
SELECT * FROM `student`;
INSERT INTO `student`(`name`,`major`,`score` ) VALUES( "小黑", "数学", 30);
INSERT INTO `student`(`name`,`major`,`score` ) VALUES( "小王", "语文", 40);
INSERT INTO `student`(`name`,`major`,`score` ) VALUES( "小李", "英语", 60);
INSERT INTO `student`(`name`,`major`,`score` ) VALUES( "小昏", "政治", 80);
SELECT * FROM `student`;

SELECT `name` FROM `student` ;
SELECT `name`, `name` FROM `student` ;
SET SQL_SAFE_UPDATES = 0;
UPDATE `student` SET `score`=90 WHERE `name` =  "小王";
SELECT * FROM `student`;

SELECT * FROM `student` ORDER BY `score`; # default = ascent
SELECT * 
FROM `student` 
ORDER BY `score` DESC;

SELECT * 
FROM `student` 
ORDER BY `score`, `student_id`
LIMIT 3;

select * from student;

SELECT * 
FROM `student` 
ORDER BY `score` DESC
LIMIT 3;

SELECT * 
FROM `student` 
WHERE `major` = '英语' OR `score` > 40
ORDER BY `score` DESC;

SELECT * 
FROM `student` 
WHERE `major` = '英语' OR `score` <> 60
ORDER BY `score` DESC
LIMIT 3;

SELECT * FROM `student`;
SELECT * 
FROM `student`
WHERE  `major` IN('历史','英语','政治'); # = WHERE `major` = '历史' OR `major` = '英语' OR `major` = '政治';
