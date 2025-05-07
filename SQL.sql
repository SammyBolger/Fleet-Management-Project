
-- 1. Total Revenue by Month
SELECT 
  SUBSTRING(date, 1, 7) AS month,
  SUM(CAST(REPLACE(`Net Revenue`, ',', '.') AS DECIMAL(10,2))) AS total_revenue
FROM freight
GROUP BY month
ORDER BY month;

/* Output:
| Month   |   Total Revenue |
|:--------|----------------:|
| 2018-01 |          174193 |
| 2018-02 |          311167 |
| 2018-03 |          253121 |
| 2018-04 |          192485 |
| 2018-05 |          136371 |
| 2018-06 |          200711 |
| 2018-07 |          244625 |
| 2018-08 |          224130 |
| 2018-09 |          248537 |
| 2018-10 |          274321 |
| 2018-11 |          315046 |
| 2018-12 |          265556 |
| 2019-01 |          209142 |
| 2019-02 |          398530 |
| 2019-03 |          402743 |
| 2019-04 |          339867 |
| 2019-05 |          336598 |
| 2019-06 |          269187 |
| 2019-07 |          278110 |
| 2019-08 |          386585 |
*/

-- 2. Top 5 Cities by Goods Value
SELECT 
  City,
  SUM(CAST(REPLACE(`Goods Value`, ',', '.') AS DECIMAL(10,2))) AS total_goods_value
FROM freight
GROUP BY City
ORDER BY total_goods_value DESC
LIMIT 5;

/* Output:
| City       |   Goods Value |
|:-----------|--------------:|
| Bloom      |   2.51146e+07 |
| Sandy Lane |   9.21625e+06 |
| Enders     |   8.69984e+06 |
| Mineola    |   7.8633e+06  |
| Mcmechen   |   6.11475e+06 |
*/

-- 3. Average Weight per Delivery
SELECT 
  AVG(CAST(REPLACE(`Weight (Kg)`, ',', '.') AS DECIMAL(10,2))) AS avg_weight
FROM freight;

/* Output:
Average Weight: 86.61 kg
*/

-- 4. Revenue Efficiency (Revenue per KG)
SELECT 
  SUM(CAST(REPLACE(`Net Revenue`, ',', '.') AS DECIMAL(10,2))) /
  SUM(CAST(REPLACE(`Weight (Kg)`, ',', '.') AS DECIMAL(10,2))) AS revenue_per_kg
FROM freight;

/* Output:
Revenue per KG:** $0.6849
*/

-- 5. Deliveries by Truck ID (Top 10)
SELECT 
  `Truck ID`,
  COUNT(*) AS delivery_count
FROM freight
GROUP BY `Truck ID`
ORDER BY delivery_count DESC
LIMIT 10;

/* Output:
|   Truck ID |   Delivery Count |
|-----------:|-----------------:|
|         22 |            10574 |
|         33 |            10408 |
|         20 |             8343 |
|         23 |             8133 |
|          4 |             5846 |
|         24 |             5801 |
|         38 |             5102 |
|         29 |             4917 |
|         34 |             4676 |
|         19 |             4013 |
*/