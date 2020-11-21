-- 以下代码判断是否多次入住ICU的患者是同一次入住ICU，结果显示全部都是。。。
-- 也就意味着查和stay_id相关的参数时要转换成hadm_id来查，因为都是同一次入住ICU的，就是stay_id不同而已
WITH a AS 
(
SELECT hadm_id, stay_id, intime, outtime
	, ROW_NUMBER () OVER (PARTITION BY hadm_id ORDER BY intime) AS icu_count
	, LAG(outtime, 1) OVER (PARTITION BY hadm_id ORDER BY intime) AS outtime_change
FROM icustays
ORDER BY hadm_id, icu_count
)
, b AS
(
SELECT hadm_id, stay_id, intime, outtime, icu_count, outtime_change
	, CASE WHEN outtime_change IS NULL THEN 1
	WHEN intime = outtime_change THEN 1
		ELSE 0 END AS judge_the_same
FROM a
)
SELECT * FROM b WHERE judge_the_same = 0
