PIZZA SALES QUERIES

KPIs:

1.TOTAL REVENUE
SELECT SUM(total_price) AS TOTAL_REVENUE from pizza_sales

2.AVERAGE ORDER VALUE
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_order_value from pizza_sales

3.TOTAL PIZZAS SOLD
SELECT SUM(quantity) AS Total_pizza_sold from pizza_sales

4.TOTAL ORDERS
SELECT COUNT(DISTINCT order_id) AS TOTAL_ORDERS FROM pizza_sales

5.AVERAGE PIZZAS PER ORDER
SELECT CAST(CAST (SUM(quantity) AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) FROM pizza_sales

CHARTS:

6.DAILY TREND FOR TOTAL ORDERS
SELECT DATENAME(DW,order_date) AS ORDER_DAY , COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)

7.MONTHLY TREND FOR TOTAL ORDERS
SELECT DATENAME(MONTH,order_date) AS ORDER_MONTH , COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM pizza_sales
GROUP BY MONTH(order_date),DATENAME(MONTH,order_date)
ORDER BY MONTH(order_date)

8. Percentage of Pizza sales by Pizza category
select pizza_category,sum(total_price) as Total_sales_for_pizzacategory,sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales WHERE MONTH(order_date)=1) as pct
from pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category

9. PERCENTAGE OF SALES BY PIZZA SIZE
select pizza_size,sum(total_price) as Total_sales_for_pizzacategory,sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales )as pct
from pizza_sales
GROUP BY pizza_size
ORDER BY pct DESC

10. TOP 5 PIZZAS BASED ON TOTAL REVENUE
select TOP 5 pizza_name , sum(total_price) AS TOTAL_REVENUE
from pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_REVENUE DESC

11.TOP 5 PIZZAS BASED ON TOTAL QUANTITY
select TOP 5 pizza_name , sum(quantity) AS TOTAL_QUANTITY
from pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_QUANTITY DESC


