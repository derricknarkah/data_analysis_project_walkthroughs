WITH CTE AS (
SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1)

SELECT
dteday,
season,
CTE.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders*price AS revenue,
riders*price-COGS AS profit

FROM CTE
LEFT JOIN dbo.cost_table
ON CTE.yr = dbo.cost_table.yr