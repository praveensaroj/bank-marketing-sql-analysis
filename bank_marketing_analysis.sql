DROP TABLE IF EXISTS bank_data;
CREATE TABLE bank_data (
    age INT,
    job TEXT,
    marital TEXT,
    education TEXT,
    "default" TEXT,
    housing TEXT,
    loan TEXT,
    contact TEXT,
    month TEXT,
    day_of_week TEXT,
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome TEXT,
    emp_var_rate FLOAT,
    cons_price_idx FLOAT,
    cons_conf_idx FLOAT,
    euribor3m NUMERIC,
    nr_employed FLOAT,
    y TEXT
);
SELECT * FROM bank_data;

SELECT y, COUNT(*) 
FROM bank_data 
GROUP BY y;

SELECT job,
	COUNT(*) AS total,
	ROUND(COUNT(*)*100.0/ (SELECT COUNT(*) FROM bank_data),2) AS percentage
FROM bank_data
GROUP BY job
ORDER BY percentage DESC;
	
---OVERALL PERFORMENCE---
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 END) AS conversions,
    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 END) * 100.0 / COUNT(*), 
        2
    	) AS conversion_rate
FROM bank_data;

---Job wise conversion rate---
---TOP 3
SELECT 
	job,
	COUNT(*) AS total,
	SUM(CASE WHEN y='yes' THEN 1 END) AS conversions,
	ROUND(SUM(CASE WHEN y='yes' THEN 1 END)*100.0/COUNT(*), 2) AS conversion_rate
FROM bank_data
GROUP BY job
ORDER BY conversion_rate DESC
LIMIT 3;


---BOTTOM 3
SELECT 
	job,
	COUNT(*) AS total,
	SUM(CASE WHEN y='yes' THEN 1 END) AS conversions,
	ROUND(SUM(CASE WHEN y='yes' THEN 1 END)*100.0/COUNT(*), 2) AS conversion_rate
FROM bank_data
GROUP BY job
ORDER BY conversion_rate
LIMIT 3;


---Education Wise conversion rate---
SELECT 
	education,
	COUNT(*) AS total,
	SUM(CASE WHEN y='yes' THEN 1 END) AS conversions,
	ROUND(SUM(CASE WHEN y='yes' THEN 1 END)*100.0/COUNT(*), 2) AS conversion_rate
FROM bank_data
GROUP BY education
ORDER BY conversion_rate DESC;


---Previous Outcome wise conversion rate---
SELECT 
	poutcome,
	COUNT(*) AS total,
	SUM(CASE WHEN y='yes' THEN 1 END) AS conversions,
	ROUND(SUM(CASE WHEN y='yes' THEN 1 END)*100.0/COUNT(*), 2) AS conversion_rate
FROM bank_data
GROUP BY poutcome
ORDER BY conversion_rate DESC;

---campaign wise conversion rate---
SELECT 
	campaign,
	COUNT(*) AS total,
	SUM(CASE WHEN y='yes' THEN 1 END) AS conversions,
	ROUND(SUM(CASE WHEN y='yes' THEN 1 END)*100.0/COUNT(*), 2) AS conversion_rate
FROM bank_data
GROUP BY campaign
ORDER BY campaign;


---Call Duration wise conversion rate---
SELECT 
	CASE
		WHEN duration < 100 THEN 'short'
		WHEN duration < 300 THEN 'medium'
		ELSE 'long' END AS call_type,
	COUNT(*) AS total,
	SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS conversion,
	ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS conversion_rate
FROM bank_data
GROUP BY call_type
ORDER BY conversion_rate DESC;


---PROXY BALANCE---
SELECT 
    ROUND(euribor3m,1) AS interest_rate,
    COUNT(*) AS total,
	SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS converts,
    ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS conversion_rate
FROM bank_data
GROUP BY interest_rate
HAVING COUNT(*)>1000
ORDER BY conversion_rate DESC;

---job and duration combined conversion rate---
SELECT job,
       CASE 
           WHEN duration < 100 THEN 'Short'
           WHEN duration < 300 THEN 'Medium'
           ELSE 'Long'
       END AS call_type,
       ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS conversion_rate
FROM bank_data
GROUP BY job, call_type
ORDER BY conversion_rate DESC;