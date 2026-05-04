--------------------------------------------------------
-- Checking the overall data
SELECT * 
FROM `big-query-project-493910.Car_sales.Car_sales_data` 
LIMIT 10;

--------------------------------------------------------
-- Checking for different vin numbers
-- There is 550 296 different vin numbers, thus there are duplicate records
SELECT DISTINCT `vin`
FROM `big-query-project-493910.Car_sales.Car_sales_data`;

-- There are 8 326 duplicates in vin numbers
SELECT vin,
      COUNT(*) AS number_of_rows
FROM `big-query-project-493910.Car_sales.Car_sales_data`
GROUP BY `vin`
HAVING COUNT(*) > 1;

-- Remove car records with same vin number
CREATE OR REPLACE TABLE `big-query-project-493910.Car_sales.Car_sales_data` AS
SELECT *
FROM (
  SELECT 
         *,
         ROW_NUMBER() OVER (
             PARTITION BY vin
             ORDER BY saledate DESC
         ) AS remove
  FROM `big-query-project-493910.Car_sales.Car_sales_data`
)
WHERE remove = 1;

--------------------------------------------------------
-- How big is this data
-- There are 550296 records
SELECT COUNT(*)
FROM `big-query-project-493910.Car_sales.Car_sales_data`;

--------------------------------------------------------
-- Checking the first and last year of car models sold 
--Start and end years are 1982 and 2015, respectively
SELECT 
        MIN(year) AS Start_year,
        MAX(year) AS End_year
FROM `big-query-project-493910.Car_sales.Car_sales_data`; 

--------------------------------------------------------
-- Checking different make of cars
--There is 97 different make of cars
SELECT DISTINCT make
FROM `big-query-project-493910.Car_sales.Car_sales_data`; 

---------------------------------------------------------
-- Checking different models cars
--There is 973 different models of cars
SELECT DISTINCT `model`
FROM `big-query-project-493910.Car_sales.Car_sales_data`; 

---------------------------------------------------------
-- Checking different trims
-- There is 1963 different trims of cars
SELECT DISTINCT `trim`
FROM `big-query-project-493910.Car_sales.Car_sales_data`; 

---------------------------------------------------------
-- Checking different car body types
-- There is 87 different body of cars
SELECT DISTINCT `body`
FROM `big-query-project-493910.Car_sales.Car_sales_data`; 

---------------------------------------------------------
-- Checking different transmissions
-- There is 3 different transmission of cars
SELECT DISTINCT `transmission`
FROM `big-query-project-493910.Car_sales.Car_sales_data`; 

---------------------------------------------------------
-- Checking different states
-- There is 38 different states where cars are sold
SELECT DISTINCT `state`
FROM `big-query-project-493910.Car_sales.Car_sales_data`;

---------------------------------------------------------
-- Checking the highest and lowest condition ratings
-- Ratings range from 1 and 49
SELECT 
      MIN(`condition`) AS lowest_rating,
      MAX(`condition`) AS highest_rating
FROM `big-query-project-493910.Car_sales.Car_sales_data`; 

---------------------------------------------------------
-- Checking the highest and lowest odometer readings
-- Ratings range from 1 and 999 999
SELECT 
      MIN(`odometer`) AS lowest_Odometer_reading,
      MAX(`odometer`) AS highest_Odometer_rating
FROM `big-query-project-493910.Car_sales.Car_sales_data`; 


---------------------------------------------------------
-- Checking different colors
--There is 21 different colors
SELECT DISTINCT `color`
FROM `big-query-project-493910.Car_sales.Car_sales_data`; 

---------------------------------------------------------
-- Checking different interiors colors
-- There is 18 different interior colors
SELECT DISTINCT `interior`
FROM `big-query-project-493910.Car_sales.Car_sales_data`;

---------------------------------------------------------
-- Checking different sellers
-- There is 14 140 different sellers
SELECT DISTINCT `seller`
FROM `big-query-project-493910.Car_sales.Car_sales_data`;

---------------------------------------------------------
-- Checking the highest and lowest mmr values
-- mmr range from 25 and 182 000
SELECT 
      MIN(`mmr`) AS lowest_mmr,
      MAX(`mmr`) AS highest_mmr
FROM `big-query-project-493910.Car_sales.Car_sales_data`; 

---------------------------------------------------------
-- Checking the highest and lowest selling prices
-- Selling prices range from 1 and 230 000
SELECT 
      MIN(`sellingprice`) AS lowest_selling_price,
      MAX(`sellingprice`) AS highest_selling_price
FROM `big-query-project-493910.Car_sales.Car_sales_data`; 

---------------------------------------------------------
-- Checking for null values
-- There are null values
SELECT *
FROM `big-query-project-493910.Car_sales.Car_sales_data` 
WHERE year IS NULL
      OR `make` IS NULL
      OR `model` IS NULL
      OR `trim` IS NULL
      OR `body` IS NULL
      OR `transmission` IS NULL
      OR `vin` IS NULL
      OR `state` IS NULL
      OR `condition` IS NULL
      OR `odometer` IS NULL
      OR `color` IS NULL
      OR `interior` IS NULL
      OR `seller` IS NULL
      OR `mmr` IS NULL
      OR `sellingprice` IS NULL
      OR `saledate` IS NULL;

---------------------------------------------------------
-- Checking for missing  values values
-- There are no missing values
SELECT *
FROM `big-query-project-493910.Car_sales.Car_sales_data` 
WHERE TRIM(`make`) = ' '
      OR TRIM(`model`) = ' '
      OR TRIM(`trim`) = ' '
      OR TRIM(`body`) = ' '
      OR TRIM(`transmission`) = ' '
      OR TRIM(`vin`) = ' '
      OR TRIM(`state`) = ' '
      OR TRIM(`color`) = ' '
      OR TRIM(`interior`) = ' '
      OR TRIM(`seller`) = ' ';
     
---------------------------------------------------------
--Aggregating everything
SELECT `year`,
       `make`,
       `model`,
       `trim`,
       `body`,
       `transmission`,
       `vin`,
       `state`,
       `condition`,
            CASE
                  WHEN `condition` BETWEEN 0 AND 10 THEN 'Excellent'
                  WHEN `condition` BETWEEN 11 AND 20 THEN 'Good'
                  WHEN `condition` BETWEEN 21 AND 30 THEN 'Fair'
                  WHEN `condition` BETWEEN 31 AND 40 THEN 'Average'
                  WHEN `condition` BETWEEN 41 AND 50 THEN 'Poor'
            END AS Condition_class,
       `odometer`,
            CASE
                  WHEN `odometer` BETWEEN 0 AND 100000 THEN 'low_odo_reading'
                  WHEN `odometer` BETWEEN 100001 AND 150000 THEN 'med_odo_reading' 
                  WHEN `odometer` BETWEEN 150001 AND 1000000 THEN 'high_odo_reading'
            END AS Odo_class,
       `color`,
       `interior`,
       `seller`,
       `mmr`,
       `sellingprice`,
       `saledate`,
       FORMAT_TIMESTAMP('%A', PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S', `saledate`)) AS sale_name,
            CASE
                  WHEN FORMAT_TIMESTAMP('%A', PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S', `saledate`)) IN ("Saturday", "Sunday") THEN "Weekend"
                  ELSE "Weekday"
            END AS Weekday_class,
       FORMAT_TIMESTAMP('%B', PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S', `saledate`)) AS sale_month,
       EXTRACT(`year` FROM PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S', `saledate`)) AS sale_year,
       FORMAT_TIMESTAMP('%H:%M:%S', PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S', `saledate`)) AS sale_time,
            CASE 
                  WHEN FORMAT_TIMESTAMP('%H:%M:%S', PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S', `saledate`)) BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
                  WHEN FORMAT_TIMESTAMP('%H:%M:%S', PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S', `saledate`)) BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
                  WHEN FORMAT_TIMESTAMP('%H:%M:%S', PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S', `saledate`)) BETWEEN '17:00:00' AND '23:59:59' THEN 'Evening'
            END AS Sales_time_class,
      sellingprice
FROM `big-query-project-493910.Car_sales.Car_sales_data`;

