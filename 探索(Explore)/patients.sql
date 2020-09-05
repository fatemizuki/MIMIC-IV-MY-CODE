-- 对patients表的探索
-- Exploration of patients


-- -- 1. 总览
-- -- 1. Overview

-- SELECT * 
-- FROM patients
-- LIMIT 100


-- -- 2. 性别
-- -- 2. Gender

-- SELECT gender, count(*) 
-- FROM patients
-- GROUP BY gender


-- -- 3. 年龄
-- -- 3. Age

-- SELECT 
-- 	CASE WHEN anchor_age < 18 THEN '<18'
-- 	WHEN anchor_age >= 18 and anchor_age < 60 THEN '18-60'
-- 	WHEN anchor_age >= 60 and anchor_age < 90 THEN '60-89'
-- 	WHEN anchor_age > 90 THEN '>90'
-- 	ELSE NULL END AS age
-- 	, count(*) AS patients_number
-- FROM patients
-- GROUP BY 
-- 	CASE WHEN anchor_age < 18 THEN '<18'
-- 	WHEN anchor_age >= 18 and anchor_age < 60 THEN '18-60'
-- 	WHEN anchor_age >= 60 and anchor_age < 90 THEN '60-89'
-- 	WHEN anchor_age > 90 THEN '>90'
-- 	ELSE NULL END


-- -- 4. anchor_year_group分组
-- -- 4. anchor_year_group

-- SELECT anchor_year_group, count(*) 
-- FROM patients
-- GROUP BY anchor_year_group
