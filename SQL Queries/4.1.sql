#4.1 what are the peak and low season months for hyderabad based on the data from 2016 -2019 for hyderabad district only
# Peak and low in Total from 2016 - 2019

WITH CTE1 AS
     (
     SELECT District,Year,Month,SUM(Visitors) AS S,
     RANK() OVER (PARTITION BY district ORDER BY SUM(visitors) ASC) AS A,
     RANK() OVER (PARTITION BY district ORDER BY SUM(visitors) DESC) AS B
     FROM df_visitors
     WHERE district = 'Hyderabad'
     GROUP BY DISTRICT,Year,Month
     )
SELECT District,Month,
(CASE when A=1 then ' Low ' when b=1 then ' Peak ' END) as Type, S AS Total_Visitors FROM CTE1
WHERE A=1 or B=1;