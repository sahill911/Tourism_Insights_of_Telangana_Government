# 2. List down 3 districts based on the compounded annual growth rate (CAGR) of visitors between (2016-2019)

WITH CTE1 AS
     (
     SELECT district,SUM(2016_visitors) AS X ,SUM(2019_visitors) AS Y,
	 ROUND(((POWER((SUM(2019_visitors) / SUM(2016_visitors)) , (1/3)) - 1)*100),2) AS CAGR
     FROM df_visitors
     GROUP BY district
     ORDER BY cagr DESC
     Limit 3
     )
SELECT District, X AS In_2016_Visitors, Y AS By_2019_Visitors,
CONCAT(CAGR,' %') AS CAGR
FROM CTE1 ;