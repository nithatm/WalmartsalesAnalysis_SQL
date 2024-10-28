-- how many unique cities does the data have?--

select count(distinct City) as count_distinct_city 
from salesdata1;

-- in which city each branch --

select distinct City,Branch 
from salesdata1
order by Branch;

-- how many unique product line does the data have? --

select distinct Product_line from salesdata1;

-- what is the most common payment method --

select Payment,
count(Payment) as count from salesdata1
group by Payment; 

-- what is the most selling product line--

select Product_line,
count(Product_line) as count from salesdata1
group by Product_line
order by count desc
limit 1;

-- what is the total revenue by month --

select sum(Total) as revenue,
month_name from salesdata1
group by month_name
order by month_name;

-- what month had the largest COGS--

Select month_name as month, 
sum(cogs) as total_cogs
from salesdata1
group by month_name
order by total_cogs desc;

-- what product line has the largest revenue--

select sum(Total) as revenue,
Product_line from salesdata1
group by Product_line
order by Product_line;

-- what is the city with large revenue -- 

select City, Branch,
sum(Total) as revenue
from salesdata1
group by City, Branch
order by revenue desc;

-- what product line had the largest VAT--

select Product_line,
avg(VAT) as vat_count
from salesdata1
group by Product_line
order by vat_count desc;

-- fetch each product line and add a column to those product line showing "Good","Bad". Good if its greater than average sales--

SELECT 
Product_line,
ROUND(AVG(Total),2) AS avg_sales,
(CASE
WHEN AVG(Total) > (SELECT AVG(Total) FROM salesdata1) THEN "Good"
ELSE "Bad"
END)
AS Remarks
FROM salesdata1
GROUP BY Product_line;

