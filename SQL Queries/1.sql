# 1.List down the top 10 districts that have the highest number of domestic visitors overall (2016 - 2019)?

WITH CTE1 AS
     (
     SELECT District , SUM(visitors) AS Total_Visitors,
     CONCAT(FORMAT(SUM(visitors)/1000000,'m'),' ','Million') AS 'Total_in_Million'
     FROM d_visitors
     GROUP BY district
     )
SELECT District,Total_Visitors,Total_in_Million,
RANK() OVER ( ORDER BY total_visitors DESC ) AS 'Rank'
FROM CTE1
LIMIT 10;