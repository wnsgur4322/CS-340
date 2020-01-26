-- Written by Junhyeok Jeong
-- Quiz 3 - query 7
--
-- Delete all people whose age is NULL. Then, list all such people whose age is NOT NULL. -- 13 points
--
-- Write your query BELOW this line.
DELETE FROM bsg_people WHERE age IS NULL; SELECT * FROM bsg_people WHERE age IS NOT NULL;
