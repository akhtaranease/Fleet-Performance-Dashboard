
-- Total Deliveries
SELECT COUNT(*) AS total_deliveries
FROM `project_id.logistics_data.freight_data`;

-- Revenue by City
SELECT city, SUM(`Net Revenue`) AS total_revenue
FROM `project_id.logistics_data.freight_data`
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 10;

-- Deliveries by Truck
SELECT `Truck ID`, COUNT(*) AS delivery_count
FROM `project_id.logistics_data.freight_data`
GROUP BY `Truck ID`
ORDER BY delivery_count DESC
LIMIT 10;

-- Monthly Revenue Trend
SELECT
  EXTRACT(YEAR FROM Date) AS year,
  EXTRACT(MONTH FROM Date) AS month,
  SUM(`Net Revenue`) AS monthly_revenue
FROM `project_id.logistics_data.freight_data`
GROUP BY year, month
ORDER BY year, month;

-- Average Weight per Delivery
SELECT
  ROUND(AVG(`Weight_Kg`), 2) AS avg_weight_kg,
  ROUND(AVG(`Weight_Cubic`), 2) AS avg_weight_cubic
FROM `project_id.logistics_data.freight_data`;
