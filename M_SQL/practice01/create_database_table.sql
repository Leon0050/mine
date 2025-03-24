CREATE DATABASE `database`;
SHOW DATABASES;
DROP DATABASE `database`;
DROP DATABASE `sql_tutorial`;
CREATE DATABASE `sql_tutorial`;

USE `sql_tutorial`;

CREATE TABLE student(
	`student_id` INT PRIMARY KEY,
    `name` VARCHAR(20),
    `major` VARCHAR(20)
);
-- CREATE TABLE student(
-- 	`student_id` INT,
--     `name` VARCHAR(20),
--     `major` VARCHAR(20),
--     PRIMARY KEY(`student_id`)
-- );
DESCRIBE `student`; 
DROP TABLE `student` ;
ALTER TABLE `student` ADD gpa DECIMAL(3,2);
ALTER TABLE `student` DROP COLUMN gpa;