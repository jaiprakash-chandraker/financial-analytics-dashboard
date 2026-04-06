-- Monthly Revenue
SELECT 
    DATE_TRUNC('month', transaction_date) AS month,
    SUM(revenue) AS total_revenue
FROM financial_data
GROUP BY 1
ORDER BY 1;

-- Top Customers
SELECT 
    customer_id,
    SUM(revenue) AS total_revenue
FROM financial_data
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Revenue Anomalies
SELECT 
    transaction_date,
    revenue
FROM financial_data
WHERE revenue > (
    SELECT AVG(revenue) * 2 FROM financial_data
);
