-- Crash Reporting - Drivers Data FROM Data.gov
-- Link : https://catalog.data.gov/dataset/crash-reporting-drivers-data

SELECT * 
FROM crash_reporting;


-- Cleaning--

-- Making Sure There is No Duplicate Using Group by And Count


SELECT Person_ID, COUNT(Person_ID)
FROM crash_reporting
GROUP BY Person_ID;

SELECT * 
FROM crash_reporting
WHERE Agency_Name IS NULL 
OR Crash_Date IS NULL 
OR Person_ID IS NULL 
OR Injury_Severity IS NULL
OR Road_Name = '';

UPDATE crash_reporting
SET Road_Name = 'Unknown'
WHERE road_Name = '';




-- Fix Crash_Date Datatype --

-- Update the date format
UPDATE crash_reporting
SET Crash_Date = STR_TO_DATE(Crash_Date, '%m/%d/%Y')
WHERE STR_TO_DATE(Crash_Date, '%m/%d/%Y') IS NOT NULL;

-- Modify the column type
ALTER TABLE crash_reporting
MODIFY COLUMN Crash_Date DATE;


-- Filtering and Aggregation / Grouping and Summarizing Data

SELECT * 
FROM crash_reporting
WHERE Agency_Name = 'Gaithersburg Police Depar';


SELECT Year(crash_date) As Year, 
Count(Person_ID) As Reports_Per_Year
FROM crash_reporting
Group By Year
ORDER BY 1;

SELECT Agency_Name, 
Count(Person_id) As Reports_Per_Agency
FROM crash_reporting
GROUP BY Agency_Name
ORDER BY 2 DESC;

-- Trend Analysis

SELECT Year(Crash_date) AS Year, 
EXTRACT(MONTH FROM crash_date) AS crash_month, 
COUNT(*) AS crash_count
FROM crash_reporting
GROUP BY Year, crash_month
ORDER BY Year ,crash_month;

-- Correlation and Pattern Detection

SELECT weather, 
ROUND(AVG(Speed_Limit),1) AS avg_SpeedLimit
FROM crash_reporting
GROUP BY weather;

SELECT Road_Name, 
Count(Person_ID) AS Reports
FROM crash_reporting
GROUP BY Road_Name
ORDER BY reports DESC LIMIT 5;


SELECT Collision_Type, 
Count(Person_ID) AS Reports
FROM crash_reporting
GROUP BY Collision_Type
ORDER BY reports DESC LIMIT 5;













