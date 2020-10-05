-- d_labitems探索
-- 1625

-- 1. 总览
-- SELECT * FROM d_labitems
-- LIMIT 100

-- 2. 组织液分类
-- SELECT fluid, COUNT(*) FROM d_labitems
-- GROUP BY fluid

-- 3. 化验种类分类
-- SELECT category, COUNT(*) FROM d_labitems
-- GROUP BY category

-- 4. 总和
-- SELECT fluid, category, COUNT(*) FROM d_labitems
-- GROUP BY fluid, category 
-- ORDER BY fluid, category
