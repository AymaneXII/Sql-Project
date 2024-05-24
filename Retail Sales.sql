-- Retail Sales EDA Using SQL

SELECT * 
FROM retail_sales;
--  Checking/Cleaning Data --
SELECT DISTINCT `Transaction ID` 
FROM retail_sales;

SELECT DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Retail_Sales' AND COLUMN_NAME = 'Date';

ALTER TABLE retail_sales
MODIFY COLUMN Date DATE;

SELECT * 
FROM retail_sales
WHERE Date IS NULL 
OR `Customer ID` IS NULL 
OR Gender IS NULL 
OR Age IS NULL
OR `Product Category` IS NULL
OR Quantity IS NULL
OR `Price per Unit` IS NULL
OR `Total Amount` IS NULL;


-- Anlysis --

-- Total Spending Monthly

SELECT Month(date), 
SUM(`total amount`) As Total_Spending
FROM retail_sales
GROUP BY 1
ORDER BY 1;

-- Total Spending By Gender Monthly

SELECT Month(date),
Gender, 
SUM(`total amount`) As Total_Spending
FROM retail_sales
GROUP BY 1
ORDER BY 1;

-- Total Spending By Product Monthly

SELECT Month(Date), 
`Product Category`, 
SUM(`total amount`) As Total_Spending
FROM retail_sales
GROUP BY 1,2
ORDER BY 1,2;


 -- Total spending for each combination of Age and Gender -- 
 SELECT Age, gender, 
 SUM(`total amount`) As Total_Spending
 FROM retail_sales
 group by age, gender
 order by 1,2;
 
 -- Top Product Categories for each Age and Gender --
 
 
SELECT Age, Gender, 
`Product Category`, 
SUM(`total amount`) As Total_Spending
FROM retail_sales
GROUP BY Age, Gender, `Product Category`
ORDER BY 1,2,3;




