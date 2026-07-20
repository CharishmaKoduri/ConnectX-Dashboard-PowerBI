CREATE TABLE telecom_customers (
    customer_id                    VARCHAR(20) PRIMARY KEY,
    gender                         VARCHAR(10),
    age                            INT,
    number_of_dependents           INT,
    city                           VARCHAR(100),
    zip_code                       INT,
    number_of_referrals            INT,
    tenure_in_months               INT,
    offer                          VARCHAR(50),
    avg_monthly_gb_download        INT,
    contract                       VARCHAR(20),
    payment_method                 VARCHAR(30),
    total_charges                  DECIMAL(10,2),
    total_refunds                  DECIMAL(10,2),
    total_long_distance_charges    DECIMAL(10,2),
    total_revenue                  DECIMAL(10,2),
    customer_status                VARCHAR(20)
);

UPDATE telecom_customers
SET offer = 'No Offer'
WHERE offer IS NULL;

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END)
          / COUNT(*), 1) AS churn_rate_pct
FROM telecom_customers;

SELECT
    contract,
    COUNT(*) AS customers,
    SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END)
          / COUNT(*), 1) AS churn_rate_pct
FROM telecom_customers
GROUP BY contract
ORDER BY churn_rate_pct DESC;

SELECT
    payment_method,
    COUNT(*) AS customers,
    ROUND(100.0 * SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END)
          / COUNT(*), 1) AS churn_rate_pct
FROM telecom_customers
GROUP BY payment_method
ORDER BY churn_rate_pct DESC;

SELECT
    customer_status,
    COUNT(*) AS customers,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(AVG(total_revenue), 2) AS avg_revenue_per_customer
FROM telecom_customers
GROUP BY customer_status;

SELECT
    CASE
        WHEN tenure_in_months <= 12 THEN '0-12 months'
        WHEN tenure_in_months <= 24 THEN '13-24 months'
        WHEN tenure_in_months <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END AS tenure_bucket,
    COUNT(*) AS customers,
    ROUND(100.0 * SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END)
          / COUNT(*), 1) AS churn_rate_pct
FROM telecom_customers
GROUP BY tenure_bucket
ORDER BY MIN(tenure_in_months);

SELECT
    customer_id,
    contract,
    payment_method,
    tenure_in_months,
    total_revenue
FROM telecom_customers
WHERE customer_status = 'Churned'
ORDER BY total_revenue DESC
LIMIT 10;

SELECT
    customer_id,
    contract,
    total_revenue,
    RANK() OVER (PARTITION BY contract ORDER BY total_revenue DESC) AS revenue_rank_in_contract
FROM telecom_customers;
