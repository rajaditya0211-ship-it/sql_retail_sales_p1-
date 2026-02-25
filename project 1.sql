create database project_1;
use project_1;
 SELECT * FROM project_1.`sql - retail sales analysis_utf`;
 rename table project_1.`sql - retail sales analysis_utf`
 to project_1;
 
select * from project_1;

alter table project_1
modify sale_date date;
alter table project_1
modify sale_time time;

-- 1 Write a SQL query to retrieve all columns for sales made on '2022-11-05:
select *
from project_1
where sale_date = '2022-11-05';

-- 2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
select *
from project_1
where category = 'clothing'
and quantiy >= 4
and sale_date between '2022-11-01' and '2022-11-30';

-- 3  Write a SQL query to calculate the total sales (total_sale) for each category.
select category , sum(total_sale)
from project_1
group by category;

-- 4  Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select round(avg(age),2) as avg_age
from project_1 
where category = 'beauty';

-- 5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
 select *
 from project_1
 where total_sale > 1000;
 
 -- 6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
 select gender , category , count(*) as total_trans
 from project_1
 group by gender , category;
 
 -- 7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
 select year(sale_date) , month(sale_date), avg(total_sale)
 from
 (
 select
 year(sale_date) ,
 month(sale_date), 
 avg(total_sale) ,
 rank() over(partition by year(sale_date)  order by avg(total_sale) desc as rnk
 from project_1
 group by year(sale_date) , month(sale_date)
 ) as a
 where rnk = 1;
 
 -- 8 Write a SQL query to find the top 5 customers based on the highest total sales
 select customer_id , sum(total_sale) as total_sale
 from project_1
 group by customer_id
 order by total_sale desc
 limit 5;
 
 -- 9 Write a SQL query to find the number of unique customers who purchased items from each category.
 
 select category, count(distinct customer_id)
 from project_1
 group by category;
 
 -- 10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17
 
 
 
 
 
 


