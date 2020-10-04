-- 对transfers表的探索
-- 2192963行

-- 1. 总览
-- SELECT * FROM transfers
-- LIMIT 100

-- 2. eventtype的类型
-- SELECT eventtype FROM transfers
-- GROUP BY eventtype

-- 3. eventtype各种类型的数量
-- SELECT eventtype,count(*) FROM transfers
-- GROUP BY eventtype

-- 4. careunit探索
-- SELECT careunit, count(*) FROM transfers
-- GROUP BY careunit

-- 5. eventtype和careunit总结
-- SELECT careunit, eventtype,count(*) FROM transfers
-- GROUP BY careunit, eventtype
