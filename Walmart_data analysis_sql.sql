-- Create the database Walmartsales--

create database walmartsales;
use walmartsales
create table salesdata1(
Invoice_ID varchar(30) not null primary key,
Branch	varchar(5) not null,
City varchar(30) not null,	
Customer_type varchar(30) not null,	
Gender	varchar(10) not null,
Product_line varchar(100) not null,
Uniy_price	decimal(10,2) not null,
Quantity int not null,	
VAT	FLOAT not null,
Total DECIMAL(12,4) not null,
Date	datetime not null,
Time	time not null,
Payment	varchar(15) not null,
cogs	decimal(10,2) not null,
gross_margin_percentage	float not null,
gross_income float not null,
Rating float );


-- Mofity the 'Date' column to datatype date from datetime-- 

ALTER TABLE salesdata1
MODIFY COLUMN `date` DATE;

-- check for any null values in the column--

select * from salesdata1
where 
'Invoice_ID' is null;
DELETE FROM salesdata1
WHERE `Invoice_ID` IS NULL;

           -- Feature Engineering--

-- Add a new column named 'time_of_day'

SELECT Time,
(CASE
    WHEN Time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
    WHEN Time BETWEEN '12:00:00' AND '15:59:59' THEN 'Afternoon'
    ELSE 'Evening'
END) AS time_of_day
FROM salesdata1;

-- add this new column ' time_of_day' to the table-- 

ALTER TABLE salesdata1 ADD COLUMN time_of_day VARCHAR(20);

UPDATE salesdata1
SET time_of_day = (
CASE
    WHEN Time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
    WHEN Time BETWEEN '12:00:00' AND '15:59:59' THEN 'Afternoon'
    ELSE 'Evening'
END);

-- add new column named day_name--

ALTER TABLE salesdata1 ADD COLUMN day_name varchar(20);

UPDATE salesdata1
SET day_name = DAYNAME(Date);

-- add new column named month_name--

ALTER TABLE salesdata1 ADD COLUMN month_name VARCHAR(10);

UPDATE salesdata1
SET month_name = MONTHNAME(Date);


