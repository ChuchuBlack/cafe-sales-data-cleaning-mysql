CREATE TABLE cleaned_cafe_sales AS
SELECT *
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (
               PARTITION BY `Transaction ID`, Item, Quantity, `Price Per Unit`, `Total Spent`, `Payment Method`, Location, `Transaction Date`
               ORDER BY `Transaction ID`
           ) AS row_num
    FROM dirty_cafe_sales
) t
WHERE row_num = 1;

SELECT *
FROM cleaned_cafe_sales;

SELECT COUNT(*)
FROM cleaned_cafe_sales;

SELECT *
FROM cleaned_cafe_sales;

DELETE FROM cleaned_cafe_sales
WHERE `Payment Method` IS NULL
   OR `Payment Method` = 'UNKNOWN'
   OR `Payment Method` = ''
   OR location IS NULL
   OR location = 'UNKNOWN'
   OR location = '';
   
SELECT DISTINCT `Transaction Date`
FROM cleaned_cafe_sales
LIMIT 10;

ALTER TABLE cleaned_cafe_sales
MODIFY COLUMN `Transaction Date` DATE;

DELETE FROM cleaned_cafe_sales
WHERE `Transaction Date` = 'UNKNOWN'
   OR `Transaction Date` = ''
   OR `Transaction Date` = 'ERROR'
   OR `Transaction Date` IS NULL;
   
ALTER TABLE cleaned_cafe_sales
MODIFY COLUMN `Transaction Date` DATE;

SELECT *
FROM cleaned_cafe_sales
WHERE item IS NULL OR item = ''
   OR `Payment Method` IS NULL OR `Payment Method` = ''
   OR location IS NULL OR location = '';
   
DELETE FROM cleaned_cafe_sales
WHERE item IS NULL OR item = ''
   OR `Payment Method` IS NULL OR `Payment Method` = ''
   OR location IS NULL OR location = '';



SELECT *
FROM cleaned_cafe_sales;





































