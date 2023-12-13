#4.2 what are the peak and low season months for hyderabad based on the data from 2016 -2019 for hyderabad district only
#Year wise Peak and Low

WITH CTE1 AS
     (
     SELECT District,Year,Month,SUM(Visitors) AS Total_Visitors,
     RANK() OVER (PARTITION BY Year ORDER BY SUM(visitors) DESC) AS A,
     RANK() OVER (PARTITION BY Year ORDER BY SUM(visitors) ASC) AS B
     FROM df_visitors
     WHERE district = 'Hyderabad'
     GROUP BY DISTRICT,Year,Month
     )
SELECT District,Year,Month,
(CASE When a = 1 Then ' Peak ' 
when b = 1 then ' Low ' 
END) AS Type,Total_visitors FROM CTE1
WHERE A=1 OR B=1
ORDER BY Type;
     