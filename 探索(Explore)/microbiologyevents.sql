-- microbiologyevents探索

-- 1. 微生物检查取样部位及检测项目
-- SELECT spec_type_desc, test_name, COUNT(*) FROM microbiologyevents
-- GROUP BY spec_type_desc, test_name
-- ORDER BY spec_type_desc, test_name

-- 2. 微生物的itemid，名字以及检查阳性结果数
-- SELECT org_itemid, org_name, COUNT(*) AS count
-- FROM 
-- 	(
-- 	SELECT org_itemid, org_name FROM microbiologyevents
-- 	GROUP BY micro_specimen_id, org_name, org_itemid
-- 	) abc
-- GROUP BY org_name, org_itemid
-- ORDER BY count DESC


-- 3. 药敏id及名字
-- SELECT ab_itemid, ab_name, COUNT(*) FROM microbiologyevents
-- GROUP BY ab_itemid, ab_name
-- ORDER BY ab_name
