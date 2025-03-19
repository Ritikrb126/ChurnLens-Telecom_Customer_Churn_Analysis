CREATE DATABASE	 telecom_customer;
USE telecom_customer;
CREATE TABLE demographics 
	(
    Customer_ID VARCHAR(15) PRIMARY KEY,
    Count TINYINT NULL,
    Gender VARCHAR(10) NULL,
    Age INT UNSIGNED NULL,
    Under_30 CHAR(3) NULL,
    Senior_Citizen CHAR(3) NULL,
    Married CHAR(3) NULL,
    Dependents CHAR(3) NULL,
    No_of_Dependents smallint UNSIGNED NULL
    );
CREATE TABLE location
		(
        Customer_ID VARCHAR(15) PRIMARY KEY,
        Count TINYINT NULL,
        Country VARCHAR(25) NULL,
        State VARCHAR(25) NULL,
        City VARCHAR(25) NULL,
        Zip_Code CHAR(5) NULL,
        Lat_Long VARCHAR(30) NULL,
        Latitude DOUBLE NULL,
        Longitude DOUBLE NULL
        );

CREATE TABLE population
	(
    ID INT unique NOT NULL,
    Zip_Code CHAR(5) PRIMARY KEY ,
    Population BIGINT NULL
    );

CREATE TABLE status
	(
    Customer_ID VARCHAR(15) PRIMARY KEY,
    Count TINYINT NULL,
    Quarter CHAR(2) NULL,
    Satisfaction_Score INT NULL,
    Customer_Status VARCHAR(25) NULL,
    Churn_Label CHAR(3) NULL,
    Churn_Value TINYINT NULL,
    Churn_Score INT NULL,
    CLVT INT NULL,
    Churn_Category VARCHAR(30) NULL,
    Churn_Reason TEXT NULL
    );

CREATE TABLE services
	(
    Customer_ID VARCHAR(15) PRIMARY KEY,
    Referred_friend CHAR(3) NULL,
    Number_of_Referrals TINYINT NULL,
    Tenure_In_Months INT NULL,
    Offer VARCHAR(15) NULL,
    Phone_Service CHAR(3) NULL,
    Avg_Monthly_Long_Dist_Charges DEC(10,2) NULL,
    Multiple_Lines CHAR(3) NULL,
    Internet_Service CHAR(3) NULL,
    Internet_Type VARCHAR(15) NULL,
    Avg_MOnthly_GB_Download INT NULL,
    Online_Security CHAR(3) NULL,
    Online_Backup CHAR(3) NULL,
    Device_Protectin_Plan CHAR(3) NULL,
    Premium_Tech_Support CHAR(3) NULL,
    Streaming_TV CHAR(3) NULL,
    Streaming_Movies CHAR(3) NULL,
    Streaming_Music CHAR(3) NULL,
    Unlimited_Data CHAR(3) NULL,
    Contract VARCHAR(25) NULL,
    Paperless_Billing CHAR(3) NULL,
    Payment_Method VARCHAR(25) NULL,
    Monthly_Charges DEC(10,2) NULL,
    Total_Charges DEC(10,2) NULL,
    Total_Refunds DEC(10,2) NULL,
    Total_Extra_Data_Charges DEC(10,2) NULL,
    Total_Long_Dist_Charges DEC(10,2) NULL,
    Total_Revenue DEC(10,2) NULL
    );
    
-- importing data values or records 
SELECT * FROM demographics;
SELECT * FROM location;
SELECT * FROM population;
SELECT * FROM services;
SELECT * FROM status;

-- assigning FK  to create a relationship between tables 
ALTER TABLE telecom_customer.demographics
ADD CONSTRAINT fk_demo_service_CustId
FOREIGN KEY (Customer_ID) REFERENCES telecom_customer.services(Customer_ID);

 ALTER TABLE telecom_customer.status 
 ADD CONSTRAINT fk_status_services_CustId
 FOREIGN KEY (Customer_ID) REFERENCES telecom_customer.services(Customer_ID);
 ALTER TABLE telecom_customer.status 
 ADD CONSTRAINT fk_status_demo_CustID 
 FOREIGN KEY (Customer_ID) REFERENCES telecom_customer.demographics(Customer_ID);
 ALTER TABLE telecom_customer.status 
 ADD CONSTRAINT fk_status_locationCustID 
 FOREIGN KEY (Customer_ID) REFERENCES telecom_customer.location(Customer_ID);
 
ALTER TABLE telecom_customer.location
 ADD CONSTRAINT fk_location_servicesCustID
 FOREIGN KEY (Customer_ID) REFERENCES telecom_customer.services(Customer_ID),
 ADD CONSTRAINT fk_location_demoCustID 
 FOREIGN KEY (Customer_ID) REFERENCES telecom_customer.demographics(Customer_ID),
 ADD CONSTRAINT fk_loca_populationZipC 
 FOREIGN KEY (Zip_Code) REFERENCES telecom_customer.population(Zip_Code);
 
-- ad hock question 
-- check for duplication 
SELECT Customer_ID,COUNT(*) AS duplicate_check
FROM demographics 
GROUP BY Customer_ID
HAVING duplicate_check>1
ORDER BY duplicate_check DESC;

SELECT Customer_ID,COUNT(*) AS duplicate_check
FROM location 
GROUP BY Customer_ID
HAVING duplicate_check>1
ORDER BY duplicate_check DESC;

SELECT Customer_ID,COUNT(*) AS duplicate_check
FROM services 
GROUP BY Customer_ID
HAVING duplicate_check>1
ORDER BY duplicate_check DESC;

SELECT Customer_ID,COUNT(*) AS duplicate_check
FROM status 
GROUP BY Customer_ID
HAVING duplicate_check>1
ORDER BY duplicate_check DESC;

-- no duplication were found 
-- check for null values 
-- to get the name of all column in a table dymanically 
SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'demographics' 
AND TABLE_SCHEMA = 'telecom_customer';

SELECT * 
FROM demographics
WHERE
	Count IS NULL OR
	Customer_ID IS NULL OR 
	Dependents IS NULL OR 
	Gender IS NULL OR
	Married IS NULL OR
	No_of_Dependents IS NULL OR
	Senior_Citizen IS NULL OR 
	Under_30 IS NULL ;
    
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME= 'location' 
		AND TABLE_SCHEMA ='telecom_customer';
 
 SELECT * 
 FROM location
 WHERE 
	City IS NULL OR
	Count IS NULL OR
	Country IS NULL OR
	Customer_ID IS NULL OR
	Lat_Long IS NULL OR
	Latitude IS NULL OR
	Longitude IS NULL OR
	State IS NULL OR
	Zip_Code IS NULL ;
    
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME ='population' 
	AND TABLE_SCHEMA = 'telecom_customer';
    
SELECT * 
FROM population
WHERE 
		ID IS NULL OR
	Population IS NULL OR
	Zip_Code IS NULL ;
    
SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'services' 
	 AND TABLE_SCHEMA = 'telecom_customer';
     
SELECT * 
FROM services 
WHERE 
		Avg_MOnthly_GB_Download IS NULL OR
	Avg_Monthly_Long_Dist_Charges IS NULL OR
	Contract IS NULL OR
	Customer_ID IS NULL OR
	Device_Protectin_Plan IS NULL OR
	Internet_Service IS NULL OR
	Internet_Type IS NULL OR
	Monthly_Charges IS NULL OR
	Multiple_Lines IS NULL OR
	Number_of_Referrals IS NULL OR
	Offer IS NULL OR
	Online_Backup IS NULL OR
	Online_Security IS NULL OR
	Paperless_Billing IS NULL OR
	Payment_Method IS NULL OR
	Phone_Service IS NULL OR
	Premium_Tech_Support IS NULL OR
	Referred_friend IS NULL OR
	Streaming_Movies IS NULL OR
	Streaming_Music IS NULL OR
	Streaming_TV IS NULL OR
	Tenure_In_Months IS NULL OR
	Total_Charges IS NULL OR
	Total_Extra_Data_Charges IS NULL OR
	Total_Long_Dist_Charges IS NULL OR
	Total_Refunds IS NULL OR
	Total_Revenue IS NULL OR
	Unlimited_Data IS NULL;
    
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'status'
	 AND TABLE_SCHEMA = 'telecom_customer';
     
SELECT * 
FROM status
WHERE 
	Churn_Category IS NULL OR 
	Churn_Label IS NULL OR
	Churn_Reason IS NULL OR
	Churn_Score IS NULL OR
	Churn_Value IS NULL OR
	CLVT IS NULL OR
	Count IS NULL OR
	Customer_ID IS NULL OR
	Customer_Status IS NULL OR
	Quarter IS NULL OR
	Satisfaction_Score IS NULL;

-- NO NULL VALUES OR RECORDS WHERE FOUND 
--  removing unneccesary  column 
ALTER TABLE demographics
DROP COLUMN count;
ALTER TABLE location
DROP COLUMN count;
ALTER TABLE status
DROP COLUMN count;

-- Check for Referential Integrity (Foreign Keys Validation)
SELECT * 
FROM services s LEFT JOIN demographics d ON s.Customer_ID =d.Customer_ID
WHERE d.Customer_ID IS NULL;

SELECT *
FROM population p LEFT JOIN location l ON p.Zip_Code = l.Zip_Code
WHERE l.Zip_Code IS NULL;

-- EDA
-- General Customer Insights
-- Find the total number of customer?
SELECT 
	COUNT(DISTINCT Customer_ID) AS Total_Customer
FROM status;

-- What’s the typical tenure for churned customer?
SELECT 
	CASE WHEN s.Tenure_In_Months <=6 THEN '6 Months'
    WHEN s.Tenure_In_Months <=12 THEN '1 Year'
    WHEN s.Tenure_In_Months <=24 THEN '2 Years'
    ELSE '> 2 Years' END AS Tenure,
    ROUND(count(st.Customer_ID)*100/SUM(COUNT(st.Customer_ID)) OVER(),1) AS Percentage_Churn
FROM services s LEFT JOIN status st ON s.Customer_ID = st.Customer_ID
WHERE  st.Customer_Status='Churned'
GROUP BY 
	CASE WHEN s.Tenure_In_Months <=6 THEN '6 Months'
    WHEN s.Tenure_In_Months <=12 THEN '1 Year'
    WHEN s.Tenure_In_Months <=24 THEN '2 Years'
    ELSE '> 2 Years'END;
    
-- Identify which age category experiences the highest churn?
SELECT 
	Customer_Age_Category,
	ROUND(COUNT(st.Customer_ID)*100/SUM(COUNT(st.Customer_ID))OVER(),1) AS Percentage_Churn
FROM Age_Group ag JOIN status st ON ag.Customer_ID = st.Customer_ID
WHERE st.Customer_Status IN ('Churned')
GROUP BY Customer_Age_Category
ORDER BY Percentage_Churn DESC;

-- Revenue & Financial Impact
--  Calculate the percentage of total revenue lost to churned customers?
SELECT 
	st.Customer_Status,
	ROUND(SUM(s.Total_Revenue)*100/SUM(SUM(s.Total_Revenue))OVER(),1) AS Revenue_Percentage
FROM services s LEFT JOIN status st ON s.Customer_ID = st.Customer_ID
GROUP BY st.Customer_Status;
  
-- Churn Breakdown & Reasons
-- What is the churn breakdown by contract type (Month-to-Month, One Year, Two Year)?
SELECT s.Contract,ROUND((COUNT(st.Customer_ID)*100/SUM(COUNT(st.Customer_ID)) OVER()),1) AS Perct_Churn
FROM services s INNER JOIN status st ON s.Customer_ID =st.Customer_ID 
WHERE st.Customer_Status='Churned'
GROUP BY s.Contract;

-- What are the top 3 reasons for customer churn? 
SELECT  
	Churn_Reason,
	Churn_Category,
	ROUND(count(Customer_ID)*100/SUM(COUNT(Customer_ID)) OVER(),1) AS Percent_Churn
FROM churned_status
GROUP BY Churn_Reason,Churn_Category
ORDER BY Percent_Churn DESC
LIMIT 3;

--  Location & Demographics
-- Which cities have the highest churn rates?
SELECT 
	l.City,
	ROUND(count(st.Customer_ID)*100/sum(count(st.Customer_ID)) OVER(),1) AS Perct_Churn
FROM status st JOIN location l ON st.Customer_ID=l.Customer_ID
WHERE st.Customer_Status='Churned'
GROUP BY l.City
ORDER BY Perct_Churn DESC
LIMIT 5;

-- Are Churners Married
SELECT 
	d.Married,
    ROUND(count(st.Customer_ID)*100/SUM(COUNT(st.Customer_ID)) OVER(),1) AS Percentage_Churn
FROM demographics d LEFT JOIN status st ON d.Customer_ID = st.Customer_ID
WHERE st.Customer_Status='Churned'
GROUP BY d.Married;

-- Did churners have dependents
SELECT 
	d.Dependents,
    ROUND(count(st.Customer_ID)*100/SUM(COUNT(st.Customer_ID)) OVER(),1) AS Percentage_Churn
FROM demographics d LEFT JOIN status st ON d.Customer_ID = st.Customer_ID
WHERE st.Customer_Status='Churned'
GROUP BY d.Dependents;

-- Services & Offers Impact on Churn
-- What offers did churned customers have?
SELECT 
	s.Offer,
	ROUND(count(st.Customer_ID)*100/SUM(COUNT(st.Customer_ID)) OVER(),1) AS Percentage_Churn
FROM services s JOIN status st ON s.Customer_ID = st.Customer_ID
WHERE st.Customer_Status IN ('Churned')
GROUP BY s.Offer
ORDER BY Percentage_Churn DESC;

-- How does customer tenure differ based on the last marketing offer accepted?
SELECT 
	s.Offer, 
    ROUND(AVG(s.Tenure_In_Months)) AS Avg_tenure
FROM services s JOIN status st ON s.Customer_ID = st.Customer_ID
WHERE st.Customer_Status IN ('Churned')
GROUP BY s.Offer
ORDER BY Avg_tenure;

-- What internet type did churners have?
SELECT 
	s.Internet_Type,
	ROUND(count(st.Customer_ID)*100/SUM(COUNT(st.Customer_ID)) OVER(),1) AS Percentage_Churn
FROM services s LEFT JOIN status st ON s.Customer_ID = st.Customer_ID
WHERE s.Internet_Service='Yes' AND st.Customer_Status='Churned'
GROUP BY s.Internet_Type
ORDER BY Percentage_Churn DESC;

-- What Internet Type did 'Competitor' churners have?
SELECT 
	s.Internet_Type,Churn_Category,
	ROUND(count(st.Customer_ID)*100/SUM(COUNT(st.Customer_ID)) OVER(),1) AS Percentage_Churn
FROM services s LEFT JOIN status st ON s.Customer_ID = st.Customer_ID
WHERE Churn_Category='Competitor' AND st.Customer_Status='Churned'
GROUP BY s.Internet_Type,Churn_Category
ORDER BY Percentage_Churn DESC;

-- Find the most common (top 3)additional services opted by churned customers.
WITH additional_Opted_Services AS 
(
SELECT  
	'Online_Security' AS Additional_Services,
	COUNT(st.Customer_ID) AS Opted_Customers
FROM services s INNER JOIN status st ON s.Customer_ID =st.Customer_ID 
WHERE st.Customer_Status = 'Churned' AND Online_Security='Yes'
UNION ALL
SELECT  
	'Online_Backup' AS Additional_Services,
	COUNT(st.Customer_ID) AS Opted_Customers
FROM services s INNER JOIN status st ON s.Customer_ID =st.Customer_ID 
WHERE st.Customer_Status = 'Churned' AND Online_Backup='Yes'
UNION ALL
SELECT  
	'Device_Protection_Plan' AS Additional_Services,
	COUNT(st.Customer_ID) AS Opted_Customers
FROM services s INNER JOIN status st ON s.Customer_ID =st.Customer_ID 
WHERE st.Customer_Status = 'Churned' AND Device_Protection_Plan='Yes'
UNION ALL
SELECT  
	'Premium_Tech_Support' AS Additional_Services,
	COUNT(st.Customer_ID) AS Opted_Customers
FROM services s INNER JOIN status st ON s.Customer_ID =st.Customer_ID 
WHERE st.Customer_Status = 'Churned' AND Premium_Tech_Support='Yes'
UNION ALL 
SELECT  
	'Streaming_TV' AS Additional_Services,
	COUNT(st.Customer_ID) AS Opted_Customers
FROM services s INNER JOIN status st ON s.Customer_ID =st.Customer_ID 
WHERE st.Customer_Status = 'Churned' AND Streaming_TV='Yes'
UNION ALL
SELECT  
	'Streaming_Movies' AS Additional_Services,
	COUNT(st.Customer_ID) AS Opted_Customers
FROM services s INNER JOIN status st ON s.Customer_ID =st.Customer_ID 
WHERE st.Customer_Status = 'Churned' AND Streaming_Movies='Yes'
UNION ALL
SELECT  
	'Streaming_Music' AS Additional_Services,
	COUNT(st.Customer_ID) AS Opted_Customers
FROM services s INNER JOIN status st ON s.Customer_ID =st.Customer_ID 
WHERE st.Customer_Status = 'Churned' AND Streaming_Music='Yes'
UNION ALL
SELECT  
	'Unlimited_Data' AS Additional_Services,
	COUNT(st.Customer_ID) AS Opted_Customers
FROM services s INNER JOIN status st ON s.Customer_ID =st.Customer_ID 
WHERE st.Customer_Status = 'Churned' AND Unlimited_Data='Yes'
)
SELECT 
	Additional_Services,
	ROUND(Opted_Customers*100/SUM(Opted_Customers)OVER(),1) AS Percentage_Churned
FROM additional_Opted_Services
ORDER BY Percentage_Churned DESC
LIMIT 3;

-- Customer Behavior & Risk Analysis
-- AVG Churn score, identifying pottential high risk of churn customer
SELECT 
	Customer_Status,
    AVG(Churn_Score) ACS,
    MAX(Churn_Score) AS Max_Score, 
    MIN(Churn_Score) AS Min_Score
FROM status
GROUP BY Customer_Status
ORDER BY ACS DESC; 

-- Is there a correlation between customer satisfaction score and churn rate?
SELECT 
	Satisfaction_Score,
	ROUND((COUNT(
	CASE WHEN Customer_Status='Churned' THEN 1 END)/COUNT(
    CASE WHEN Customer_Status !='Joined' THEN 1 END))*100,2) AS Churn_rate
FROM status 
GROUP BY Satisfaction_Score
ORDER BY Churn_rate DESC;

-- Did Churners Refer a Friend?
SELECT  
	Referred_friend,
	ROUND(count(st.Customer_ID)*100/SUM(COUNT(st.Customer_ID)) OVER(),1) AS Percentage_Churn
FROM services s LEFT JOIN status st ON s.Customer_ID = st.Customer_ID
WHERE  st.Customer_Status='Churned'
GROUP BY Referred_friend;



