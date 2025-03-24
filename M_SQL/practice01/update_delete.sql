SET SQL_SAFE_UPDATES = 0;

CREATE DATABASE school;
USE school;

CREATE TABLE `student`(
	`student_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name`VARCHAR(20),
    `major`VARCHAR(20),
    `score` INT
);
--  CREATE TABLE school.student (
--     student_id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(20),
--     major VARCHAR(20),
--     score INT
-- );
select * from `student`;
INSERT INTO student values(1, "小白", "history", 50);
INSERT INTO `student`(`name`, `major` , `score`) values("小黑", 'math', 60);
INSERT INTO `student`(`name`, `major` , `score`) values("小绿", 'English', 80);
delete FROM student where student_id = 5; 
INSERT INTO `student`(`student_id`, `name`, `major` , `score`) values(4, "小红", 'physical', 70);
select * from `student`;
INSERT INTO `student`(`student_id`, `name`, `major` , `score`) values(5, "小蓝", ' chemical', 60);
INSERT INTO `student`(`name`, `major` , `score`) values( "小黄", ' chemical', 70);
select * from `student`;
# major : english -> 英语文学
update 	`student`
set `major` = '英语文学'
where `major` = 'English';

update student set major = '生物系' where student_id = 3;
update student set score = 79 where student_id =5;
select * from student;

update student set major = '生化系合并' where major = ' chemical' or major = '生物系';
update student set major = '生化系合并' where major= '生物系';
select * from student;

update student set name = '小灰', major = '物理' where student_id= 1;

delete from student where  student_id =4;
DELETE FROM student WHERE `name` = '小灰' AND `major` = '物理';
SELECT * FROM student;

DELETE FROM `student` WHERE score <=65;
SELECT * FROM student;

DELETE FROM student; ##删除表格所有内容
SELECT * FROM student;