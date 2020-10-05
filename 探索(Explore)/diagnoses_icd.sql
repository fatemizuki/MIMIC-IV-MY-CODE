-- diagnoses_icd探索


-- 1. 总览
-- SELECT * FROM diagnoses_icd
-- LIMIT 100

-- 2. 9和10的ICD各有多少人
-- SELECT icd_version, COUNT(*) 
-- FROM
-- 	(
-- 	SELECT  hadm_id, icd_version 
-- 	FROM diagnoses_icd
-- 	GROUP BY hadm_id, icd_version
-- 	) abc
-- GROUP BY icd_version

-- 3. 诊断数量分布
-- SELECT max_seq_num, COUNT(*) 
-- FROM 
-- 	(
-- 	SELECT  hadm_id, MAX(seq_num) AS max_seq_num 
-- 	FROM diagnoses_icd
-- 	GROUP BY hadm_id
-- 	) abc
-- GROUP BY max_seq_num
-- ORDER BY max_seq_num DESC
