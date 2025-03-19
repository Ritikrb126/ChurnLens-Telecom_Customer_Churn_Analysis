# 
# 📊 ChurnLens:Telecom Customer Attrition Analysis

## 📌 Overview
Companies often use customer attrition analysis and customer attrition rates as one of their key business metrics (along with cash flow, EBITDA, etc.) because the cost of retaining an existing customer is far less than the cost of acquiring a new one.Hence, The process to analyze customer needs retention plays a significant part in improving the company's growth, protects loyal customers, and improve its customer relationship management (CRM). 
 As a data analyst, my job is to provide an in-depth analysis of  Telecom’s churn dataset and to answer the following questions

## 🔍 Key Questions Answered
✅ What is the overall churn rate?  
✅ Which services have the highest churn rate?  
✅ What is the revenue lost due to churn?  
✅ Does contract type affect churn rate?  
✅ How do customer demographics impact churn?

## 📂 Dataset
The dataset contains customer information, service usage, and churn status.

- **Total Customers:** `7043`
- **Key Features:** Customer tenure, monthly charges,demographics,location, internet/phone services, additional services (e.g., security, backup), and churn status.
- **Data Sources:** [Provided dataset (CSV format)](https://community.ibm.com/community/user/businessanalytics/blogs/steven-macko/2019/07/11/telco-customer-churn-1113).



## 🛠️ Tools Used
- **SQL (MySQL, BigQuery)**: Data extraction & transformation

## 📊 Insights & Findings
1️⃣ **Churn Rate**: `XX%`  
2️⃣ **Top Churned Services**: `Streaming TV, Online Security`  
3️⃣ **Highest Revenue Loss**: `Customers with Fiber Optic & Monthly Contracts`  
4️⃣ **Customer Segmentation**: Younger customers with high usage churn more.  
5️⃣ **Retention Strategies**: Discounts on long-term contracts, better customer support.

## 📌 SQL Query Examples
```sql
-- Overall Churn Rate
SELECT ROUND((COUNT(CASE WHEN Customer_Status = 'Churned' THEN Customer_ID END) * 100.0) / COUNT(Customer_ID), 2) AS Churn_Rate
FROM status;
