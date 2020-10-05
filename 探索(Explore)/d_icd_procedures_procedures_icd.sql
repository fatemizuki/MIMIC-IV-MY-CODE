-- d_icd_procedures，procedures_icd探索

-- 1. icd总览
-- SELECT * FROM d_icd_procedures
-- LIMIT 100


-- 2. icd_version个数 
-- SELECT icd_version, COUNT(*) FROM d_icd_procedures
-- GROUP BY icd_version


-- 3. icd_version人数
-- SELECT icd_version, COUNT(*) 
-- FROM 
-- 	(
-- 	SELECT hadm_id, icd_version FROM procedures_icd
-- 	GROUP BY hadm_id, icd_version
-- 	) abc
-- GROUP BY icd_version


-- 4. seq_num人数
-- SELECT max_seq_num, COUNT(*) 
-- FROM 
-- 	(
-- 	SELECT hadm_id, MAX(seq_num) AS max_seq_num FROM procedures_icd
-- 	GROUP BY hadm_id
-- 	) abc
-- GROUP BY max_seq_num
-- ORDER BY max_seq_num
