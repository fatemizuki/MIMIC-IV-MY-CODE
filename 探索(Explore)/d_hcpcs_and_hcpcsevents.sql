-- 对d_hcpcs和hcpcsevents的探索
-- Exploration of d_hcpcs and hcpcsevents

-- 计算不同hcpcs_cd的出现次数，并且给出其在d_hcpcs里的short和long description
-- Total number of different hcpcs_cd, and its short_description and long_description in d_hcpcs

SELECT 
	hcpcs_cd
	, COUNT (*)
	, hc.short_description AS hc_short
	, dh.short_description AS dh_short
	, long_description
FROM hcpcsevents hc
LEFT JOIN d_hcpcs dh
ON hc.hcpcs_cd = dh.code
GROUP BY 
	hcpcs_cd
	, hc.short_description
	, dh.short_description
	, long_description
ORDER BY COUNT (*) DESC
