-- =====================================================
-- Customer Churn Analysis SQL Queries
-- Author: Muhammad Ali
-- Description:
-- SQL queries used to analyze customer churn, customer
-- retention, revenue, contract types, payment methods,
-- customer lifetime value, and churn reasons.
-- =====================================================-- ==========================================================


-- ==========================================================
-- Query 1: Total Customers
-- ==========================================================

SELECT COUNT(*) AS Total_Customers
FROM Cleaned_Customer_Churn;


-- ==========================================================
-- Query 2: Customer Status Distribution
-- ==========================================================

SELECT
    Customer_Status,
    COUNT(*) AS Total_Customers
FROM Cleaned_Customer_Churn
GROUP BY Customer_Status;


-- ==========================================================
-- Query 3: Churn Rate
-- ==========================================================

SELECT
ROUND(
SUM(CASE
WHEN Customer_Status='Churned'
THEN 1
ELSE 0
END)*100/COUNT(*),2) AS Churn_Rate
FROM Cleaned_Customer_Churn;


-- ==========================================================
-- Query 4: Churn by Contract Type
-- ==========================================================

SELECT
    Contract,
    COUNT(*) AS Churned_Customers
FROM Cleaned_Customer_Churn
WHERE Customer_Status='Churned'
GROUP BY Contract
ORDER BY Churned_Customers DESC;


-- ==========================================================
-- Query 5: Churn by Internet Type
-- ==========================================================

SELECT
    Internet_Type,
    COUNT(*) AS Churned_Customers
FROM Cleaned_Customer_Churn
WHERE Customer_Status='Churned'
GROUP BY Internet_Type
ORDER BY Churned_Customers DESC;


-- ==========================================================
-- Query 6: Churn by Payment Method
-- ==========================================================

SELECT
    Payment_Method,
    COUNT(*) AS Churned_Customers
FROM Cleaned_Customer_Churn
WHERE Customer_Status='Churned'
GROUP BY Payment_Method
ORDER BY Churned_Customers DESC;


-- ==========================================================
-- Query 7: Average Monthly Charge by Customer Status
-- ==========================================================

SELECT
    Customer_Status,
    ROUND(AVG(Monthly_Charge),2) AS Average_Monthly_Charge
FROM Cleaned_Customer_Churn
GROUP BY Customer_Status;


-- ==========================================================
-- Query 8: Average Total Revenue by Customer Status
-- ==========================================================

SELECT
    Customer_Status,
    ROUND(AVG(Total_Revenue),2) AS Average_Revenue
FROM Cleaned_Customer_Churn
GROUP BY Customer_Status;


-- ==========================================================
-- Query 9: Average CLTV by Customer Status
-- ==========================================================

SELECT
    Customer_Status,
    ROUND(AVG(CLTV),2) AS Average_CLTV
FROM Cleaned_Customer_Churn
GROUP BY Customer_Status;


-- ==========================================================
-- Query 10: Average Satisfaction Score
-- ==========================================================

SELECT
    Customer_Status,
    ROUND(AVG(Satisfaction_Score),2) AS Average_Satisfaction
FROM Cleaned_Customer_Churn
GROUP BY Customer_Status;


-- ==========================================================
-- Query 11: Top Churn Categories
-- ==========================================================

SELECT
    Churn_Category,
    COUNT(*) AS Customers
FROM Cleaned_Customer_Churn
WHERE Customer_Status='Churned'
GROUP BY Churn_Category
ORDER BY Customers DESC;


-- ==========================================================
-- Query 12: Top Churn Reasons
-- ==========================================================

SELECT
    Churn_Reason,
    COUNT(*) AS Customers
FROM Cleaned_Customer_Churn
WHERE Customer_Status='Churned'
GROUP BY Churn_Reason
ORDER BY Customers DESC;


-- ==========================================================
-- Query 13: Customer Distribution by State
-- ==========================================================

SELECT
    State,
    COUNT(*) AS Customers
FROM Cleaned_Customer_Churn
GROUP BY State
ORDER BY Customers DESC;


-- ==========================================================
-- Query 14: Top 10 Highest Revenue Customers
-- ==========================================================

SELECT
    Customer_ID,
    Total_Revenue
FROM Cleaned_Customer_Churn
ORDER BY Total_Revenue DESC
LIMIT 10;


-- ==========================================================
-- Query 15: Top 10 Longest Tenure Customers
-- ==========================================================

SELECT
    Customer_ID,
    Tenure_in_Months
FROM Cleaned_Customer_Churn
ORDER BY Tenure_in_Months DESC
LIMIT 10;


-- ==========================================================
-- Query 16: Churn by Gender
-- ==========================================================

SELECT
    Gender,
    COUNT(*) AS Churned_Customers
FROM Cleaned_Customer_Churn
WHERE Customer_Status='Churned'
GROUP BY Gender;


-- ==========================================================
-- Query 17: Churn by Age Group
-- ==========================================================

SELECT
CASE
WHEN Age < 30 THEN 'Under 30'
WHEN Age BETWEEN 30 AND 50 THEN '30-50'
ELSE 'Above 50'
END AS Age_Group,
COUNT(*) AS Churned_Customers
FROM Cleaned_Customer_Churn
WHERE Customer_Status='Churned'
GROUP BY Age_Group
ORDER BY Churned_Customers DESC;


-- ==========================================================
-- Query 18: Churn by Offer
-- ==========================================================

SELECT
    Offer,
    COUNT(*) AS Churned_Customers
FROM Cleaned_Customer_Churn
WHERE Customer_Status='Churned'
GROUP BY Offer
ORDER BY Churned_Customers DESC;


-- ==========================================================
-- Query 19: Churn by Unlimited Data
-- ==========================================================

SELECT
    Unlimited_Data,
    COUNT(*) AS Churned_Customers
FROM Cleaned_Customer_Churn
WHERE Customer_Status='Churned'
GROUP BY Unlimited_Data;


-- ==========================================================
-- Query 20: Average Monthly Charge by Contract
-- ==========================================================

SELECT
    Contract,
    ROUND(AVG(Monthly_Charge),2) AS Average_Monthly_Charge
FROM Cleaned_Customer_Churn
GROUP BY Contract
ORDER BY Average_Monthly_Charge DESC;