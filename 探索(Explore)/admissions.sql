-- 对admissions的探索，使用postgreSQL
-- Exploration of admissions, using postgreSQL

-- -- 1. 前100行总览
-- -- 1. Overview

-- SELECT * 
-- FROM admissions
-- LIMIT 100


-- -- 2. hadm_id总数
-- -- 2. Total number of hadm_id

-- SELECT count(*) 
-- FROM admissions
-- WHERE hadm_id IS NOT NULL


-- -- 3. 单次subject_id总数
-- -- 3. Total number of unique subject_id

-- SELECT count(*) 
-- FROM
-- (
-- SELECT subject_id FROM admissions
-- WHERE subject_id IS NOT NULL
-- GROUP BY subject_id
-- ) alias_name


-- -- 4. 取出只有一次入院记录的患者的subject_id
-- -- 4. Subject_id with only one admission record

-- SELECT subject_id 
-- FROM admissions
-- GROUP BY subject_id
-- HAVING count(*) = 1  -- count(*) > 1  The number of hadm_id > 1


-- -- 5. 取出第一次入院的hadm_id和subject_id
-- -- 5. Hadm_id and subject_id of the first admission

-- SELECT subject_id, MIN(id_count) AS hadm_id
-- FROM 
-- 	(
-- 	SELECT hadm_id, subject_id
-- 		, SUM (hadm_id) OVER (PARTITION BY subject_id ORDER BY admittime) AS id_count
-- 	FROM admissions
-- 	) alias_name	
-- GROUP BY subject_id


-- -- 6. 住院天数
-- -- 6. Length of hospital stay

-- SELECT hadm_id
-- 	,EXTRACT(epoch FROM (dischtime - admittime) /60/60/24) AS hospital_days
-- FROM admissions


-- -- 7. 不同住院类型的人数
-- -- 7. The number of different admission_type

-- SELECT admission_type, count(*) 
-- FROM admissions
-- GROUP BY admission_type


-- -- 8. 不同入院来源的人数
-- -- 8. The number of different admission_location

-- SELECT admission_location, count(*) 
-- FROM admissions
-- GROUP BY admission_location
 

-- -- 9. 不同出院目的地的人数
-- -- 9. The number of different discharge_location

-- SELECT discharge_location, count(*) 
-- FROM admissions
-- GROUP BY discharge_location


-- -- 10. 不同保险类型的人数
-- -- 10. The number of different insurance

-- SELECT insurance, count(*) 
-- FROM admissions
-- GROUP BY insurance


-- -- 11. 不同语言类型的人数
-- -- 11. The number of different language

-- SELECT language, count(*) 
-- FROM admissions
-- GROUP BY language


-- -- 12. 不同婚姻状况的人数
-- -- 12. The number of different marital_status

-- SELECT marital_status, count(*) 
-- FROM admissions
-- GROUP BY marital_status


-- -- 13. 不同种族的人数
-- -- 13. The number of different ethnicity

-- SELECT ethnicity, count(*) 
-- FROM admissions
-- GROUP BY ethnicity
