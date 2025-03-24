select * from `employee`;

-- on delete
-- ON DELETE SET NULL 对应不到设为null
-- ON DELETE CASCADE 对应不到则联级删除

DELETE FROM `employee` WHERE `emp_id` = 207; 
SELECT * FROM `branch`;
SELECT * FROM `employee`;
SELECT * FROM `works_with`;
