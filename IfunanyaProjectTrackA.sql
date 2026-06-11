-- create database Northwind
-- use northwind
-- show tables
-- select count(*) from orders
-- select count(*) from products

-- Q1 Total Orders in the database
-- select count(*) As Total_orders 
-- from orders

-- - Q2 PRODUCT NAMES AND UNIT
-- describe products
-- select productName, UnitPrice
-- from products
-- order by UnitPrice desc

-- - Q3 NUMBER OFPRODUCTS IN EACH CATEGORY
-- describe categories
-- select c.CategoryName,
--  count(p.ProductId) as Product_Count
--  from categories c
-- join products p
-- on c.CategoryId = p.CategoryId
-- group by c.CategoryName;

--  Q4 COUNTRIES CUSTOMERS COME FROM
-- describe customers
-- SELECT distinct country
-- from customers

-- - Q5 TOTAL QUQNTITY ORDERED FOR EACH PRODUCT
-- select ProductName,
-- sum(QuantityPerUnit) as Toatal_Quantity
-- from order_details od
-- join products p
-- on od.ProductId = p.ProductId
-- group by p.ProductName

-- Q6 TOP 5 CUSTOMERS WITH MOST ORDERS
-- describe customers
-- select CompanyName,
-- count(OrderId) as Order_count
-- from customers c
-- join orders o
-- on c.CustomerId = o.CustomerId
-- group by CompanyName
-- order by Order_count desc
-- limit 5;

-- Q7 AVERAGE PRODUCT PRICE BY CATEGORY
-- select CategoryName,
-- avg(UnitPrice) as Average_price
-- from categories c
-- join products p
-- on c.CategoryId = p.CategoryId
-- group by c.CategoryName

-- Q8 EMPLOYEES TITLE AND HIRE
-- describe customers
-- describe employees
-- select
-- concat(FirstName, '', LastName) as FullName,
-- title,
-- HireDate as HireYear
-- from employees


-- Q9 ORDERS PLACED EACH YEAR
-- select 
-- year(OrderDate) as OrderYear,
-- count(OrderId) as Order_Count
-- from orders
-- group by year(OrderDate)
-- order by OrderYear;

-- Q10 REVENUE GENERATED PER PRODUCT CATEGORY
-- SELECT CategoryName,
-- sum(UnitPrice * QuantityPerUnit *(1 - Discount))
-- as TotalRevenue
-- from order_details od
-- join products p
-- on od.ProductId = p.ProductId
-- join categories c
-- on p.CategoryId = c.CategoryId
-- group by c.CategoryName
-- order by TotalRevenue desc

-- ----  Q11 SHIPPER WITH MOST ORDERS
-- describe shippers
 --  select CompanyName as ShipperName,
--  count(OrderId) as TotalOrders
--  from shippers s
--  join orders o
--  on s.ShipperID =ShipperID
--  group by s.CompanyName
--  order by TotalOrders desc
--  limit 1;

-- Q12 TOTAL NUMBER OF DISCONTINUED PRODUCTS
-- select
-- count(*) as DiscontinuedProductCount
-- from products
-- where discontinued =1;
-- LIST OF DISCONTINUED PRODUCTS
-- select 
-- ProductName, Unitprice, UnitsInStock,
-- (
-- select count(*) from products
-- where discontinued =1
-- )
-- as TotalDiscountedProducts
-- from products
-- where discontinued =1;

-- Q13 TOTAL REVENUE FOREACH CUSTOMER
-- select CompanyName,
-- round(sum(Quantity* UnitPrice*(1 -discount)),2)
-- as TotalRevenue
-- from customers c
-- join orders o
-- on c.CustomerID = o.CustomerID
-- join order_details od
-- on o.OrderID= od.OrderID
-- group by c.CompanyName
-- order by TotalRevenue desc;

-- Q14 ORDERS PLACED IN 1997
-- SELECT OrderID,
-- CompanyName, OrderDate
-- from orders o
-- join customers c
-- on o.CustomerID =c.CustomerID
-- where year(o.OrderDate) =1997;

-- Q15 EMPLOYEES WHO PROCESSED MORE THAN 80 ORDDERS
-- select 
-- concat( FirstName, '', LastName) as EmployeeName,
-- count(*) as Order_Count
-- from employees e
-- join orders o
-- on e.EmployeeID = o.EmployeeID
-- group by e.EmployeeID, e.FirstName, e.LastName
-- having count(o.OrderID)> 80
-- order by Order_count desc;

-- Q16 ORDERS SHIPPED AFTER REQUIRED DATE
-- select OrderId,
-- OrderDate,
-- RequiredDate,
-- ShippedDate
-- from orders
-- where ShippedDate > RequiredDate
-- PERCENTAGE OF LATE ORDERS
-- SELECT 
-- round(
-- count(case when ShippedDate > RequiredDate then 1 end)
-- *100.0 / count(*),2
-- ) as LateOrderPercentage
-- from orders

-- Q17 SUPPLIERS PROVIDING THE MOST PRODUCTS
-- describe suppliers
-- select CompanyName,
-- count(ProductID) as Product_count
-- from suppliers s
-- join products p
-- on s.SupplierID= p.SupplierID
-- group by s.SupplierID, S.CompanyName
-- order by Product_count desc

-- Q18 PRODUCTS ABOVE AVERAGE UNIT PRICE
-- select ProductName,
-- UnitPrice
-- from products
-- where UnitPrice >
-- (
-- select avg(UnitPrice)
-- from products
-- )
-- order by UnitPrice desc

-- Q19 TOP 10 HIGHEST-VALUE ORDERS
-- describe orders
-- select  c.CompanyName,
-- o.OrderDate,
-- o.OrderID,
-- round(sum(quantity * UnitPrice *(1- discount)),2
-- ) As Total_value
-- from orders o
-- join customers c
-- on o.CustomerID=c.CustomerID
-- join order_details od
-- on o.OrderID = od.OrderID
-- group by o.OrderID, c.CompanyName, o.OrderDate
-- order by Total_Value desc
-- limit 10;

-- Q20 CUSTOMERS WHO NEVER PLACED AN ORDER
-- SELECT c.CustomerID,
-- c.CompanyName
-- from customers c
-- left join orders o
-- on c.CustomerID = o.CustomerID
-- where o.OrderID is null;

-- Q21 AVERAGE DAYS BETWEEN ORDER AND SHIPMENT PER EMPLOYEE
-- select
-- concat(e.FirstName, '', e.LastName) as EmployeeeName,
-- round(avg(datediff(ShippedDate, OrderDate)),2)
-- as Avg_days_ToShip
-- from employees e
-- join orders o
-- on e.EmployeeID= o.EmployeeID
-- where o.ShippedDate is not null
-- group by e.EmployeeID, e.FirstName, e.LastName
-- order by Avg_Days_ToShip asc

-- Q22 PRODUCTS SUPPLIED BY COMPANIES IN GERMANY
-- SELECT ProductName,
-- CompanyName as supplierName
-- from products p
-- join suppliers s
-- on p.SupplierID= s.SupplierID
-- where s.country = 'Germany';

-- Q23 MOST EXPENSIVE PRODUCT IN EACH CATEGORY
-- select
-- CategoryID, ProductName, UnitPrice
-- from products p1
-- where UnitPrice =
-- (
-- select max(p2.UnitPrice)
-- from products p2
-- where p1.CategoryID = p2.CategoryID
-- )
-- order by categoryID

-- Q24 ORDERS PER QUQRTER EACH YEAR
-- select 
-- year(OrderDate) as OrderYear,
-- quarter(OrderDate) as QuarterNo,
-- count(*) as Order_count
-- from orders 
-- group by 
-- year(OrderDate),
-- quarter(OrderDate)
-- order by
-- OrderYear,
-- QuarterNo;

-- Q25 CUSTOMERS WHO ORDERED IN 1996 BUT NOT IN 1997
-- select distinct
-- c.CompanyName
-- from customers c
-- join orders o
-- on c.CustomerID = o.CustomerId
-- where Year(o.OrderDate) =1996
-- and c.CustomerId not in
-- (
-- select CustomerID
-- from orders 
-- where year(OrderDate) = 1997
-- )

-- Q26 SHOW EACH EMPLOYEES MANAGER; LIST EMPLOYEES FULL NAME AND THEIR MANAGER FULL NAME
-- describe employees
-- show columns from employees
-- select concat(e1.FirstName, '', e1.LastName)
-- as EmployeeName,
-- concat(e2.FirstName, '', e2.LastName)
-- as ManagerName
-- from employees e1
-- left join employees e2
-- on e1.ReportsTo = e2.EmployeeID
-- Order by EmployeeName
-- N.B no ReportsTo in my employees Table

-- Q27 TOTAL DISCOUNT GIVEN PER CUSTOMER IN DOLLAR TERMS. wHO RECIEVED THE MOST dISCOUNT?
-- select c.CustomerID,
-- c.CompanyName,
-- round(sum(od.UnitPrice *od.Quantity* od.discount), 2)
-- as Total_Discount
-- from customers c
-- join orders o 
-- on c.CustomerID = o.CustomerID
-- join order_details od
-- on o.OrderID= od.OrderID
-- group by c.CustomerID, c.CompanyName
-- order by Total_Discount desc;

-- Q28 ORDER WHERE TOTAL VALUE EXCEEDS $5000. LIST ORDER DETAILS AND CUSTOMER NAME
-- select o.OrderID,
-- c.CompanyName,
-- o.OrderDate,
-- round(sum(od.UnitPrice *od.Quantity* (1 - od.discount)), 2)
-- as Total_Order_Value
-- from orders o
-- join Customers c
-- on o.CustomerId = c.CustomerID
-- join order_details od
-- on o.OrderID= od.OrderID
-- group by 
-- o.OrderID, c.CompanyName, o.Orderdate
-- having sum(od.UnitPrice * od.Quantity * (1 - od.discount))>5000
-- order by Total_Order_Value desc

-- Q29 MONTHLY REVENUE TREND WITH MONTH-OVER-MONTH CHANGE USING CTE
-- Describe Products
-- describe categories
-- WITH monthly_revenue AS (
--     SELECT
--         YEAR(o.OrderDate) AS year,
--         MONTH(o.OrderDate) AS month,
--         ROUND(SUM(od.UnitPrice * od.quantity * (1 - od.discount)), 2) AS revenue
--     FROM orders o
--     JOIN order_details od
--         ON o.OrderID = od.OrderID
--     GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
-- )

-- SELECT
--     year,
--     month,
--     revenue,
--     revenue - LAG(revenue, 1) OVER (ORDER BY year, month) AS mom_change
-- FROM monthly_revenue
-- ORDER BY year, month;

-- -- Q30 RANK PRODUCTS BY REVENUNE WITHIN EACH CATEGORY (TOP 3)
-- WITH product_revenue AS (
--     SELECT
--         c.CategoryName,
--         p.ProductName,
--         ROUND(SUM(od.UnitPrice * od.quantity * (1 - od.discount)), 2) AS revenue
--     FROM categories c
--     JOIN products p
--         ON c.CategoryID = p.CategoryID
--     JOIN order_details od
--         ON p.ProductID = od.ProductID
--     GROUP BY c.CategoryName, p.ProductName
-- )

-- SELECT *
-- FROM (
--     SELECT
--         CategoryName,
--         ProductName
--         revenue,
--         RANK() OVER (
--             PARTITION BY CategoryName
--             ORDER BY revenue DESC
--         ) AS ranking
--     FROM product_revenue
-- ) ranked_products
-- WHERE ranking <= 3
-- ORDER BY CategoryName, ranking;

-- Q31 CUSTOMER RFM (RECENCY, FREQUENCY, MONETARY) ANALYSIS
-- SELECT
--     c.CustomerID,
--     c.CompanyName,

--     DATEDIFF(
--         (SELECT MAX(OrderDate) FROM orders),
--         MAX(o.OrderDate)
--     ) AS recency_days,

--     COUNT(DISTINCT o.OrderID) AS frequency,

--     ROUND(SUM(od.UnitPrice * od.quantity * (1 - od.discount)), 2) AS monetary_value

-- FROM customers c
-- JOIN orders o
--     ON c.CustomerID = o.CustomerID
-- JOIN order_details od
--     ON o.OrderID = od.OrderID

-- GROUP BY c.CustomerID, c.CompanyName
-- ORDER BY monetary_value DESC;

-- Q32 ASSIGN CUSTOMERS TO SPENDING TIERS USING CASE
-- WITH customer_spending AS (
--     SELECT
--         c.CustomerID,
--         c.CompanyName,
--         ROUND(SUM(od.UnitPrice * od.quantity * (1 - od.discount)), 2) AS total_spent
--     FROM customers c
--     JOIN orders o
--         ON c.CustomerID = o.CustomerID
--     JOIN order_details od
--         ON o.OrderID = od.OrderID
--     GROUP BY c.CustomerID, c.CompanyName
-- )

-- SELECT
--     spending_tier,
--     COUNT(*) AS customer_count
-- FROM (
--     SELECT
--         CompanyName,
--         total_spent,

--         CASE
--             WHEN total_spent > 10000 THEN 'Platinum'
--             WHEN total_spent BETWEEN 5000 AND 10000 THEN 'Gold'
--             WHEN total_spent BETWEEN 1000 AND 4999.99 THEN 'Silver'
--             ELSE 'Bronze'
--         END AS spending_tier

--     FROM customer_spending
-- ) tiers

-- GROUP BY spending_tier
-- ORDER BY customer_count DESC;

-- Q33 EMPLOYEE SHARE OF TOTAL COMPANY REVENUE
-- WITH employee_revenue AS (
--     SELECT
--         e.EmployeeID,
--         CONCAT(e.FirstName, ' ', e.LastName) AS employee_name,

--         ROUND(SUM(
--             od.UnitPrice * od.quantity * (1 - od.discount)
--         ), 2) AS revenue_generated

--     FROM employees e
--     JOIN orders o
--         ON e.EmployeeID = o.EmployeeID
--     JOIN order_details od
--         ON o.OrderID = od.OrderID

--     GROUP BY e.EmployeeID, employee_name
-- ),

-- company_total AS (
--     SELECT
--         SUM(revenue_generated) AS total_company_revenue
--     FROM employee_revenue
-- )

-- SELECT
--     er.employee_name,
--     er.revenue_generated,

--     ROUND(
--         (er.revenue_generated / ct.total_company_revenue) * 100,
--         2
--     ) AS revenue_share_percentage

-- FROM employee_revenue er
-- CROSS JOIN company_total ct

-- ORDER BY revenue_share_percentage DESC;

-- Q34 RUNNING TOTAL OF ORDERS PLACED EACH MONTH
-- WITH monthly_orders AS (
--     SELECT
--         YEAR(OrderDate) AS year,
--         MONTH(OrderDate) AS month,
--         COUNT(OrderID) AS order_count
--     FROM orders
--     GROUP BY YEAR(OrderDate), MONTH(OrderDate)
-- )

-- SELECT
--     year,
--     month,
--     order_count,

--     SUM(order_count) OVER (
--         ORDER BY year, month
--         ROWS UNBOUNDED PRECEDING
--     ) AS running_total_orders

-- FROM monthly_orders
-- ORDER BY year, month;

-- Q35 VIEW (VW_ORDER_SUMMARY)
-- CREATE VIEW vw_order_summary AS

-- SELECT
--     o.OrderID,
--     c.CompanyName AS customer_name,

--     CONCAT(e.FirstName, ' ', e.LastName) AS employee_name,

--     s.CompanyName AS shipper_name,

--     o.OrderDate,
--     o.ShippedDate,

--     DATEDIFF(o.ShippedDate, o.OrderDate) AS days_to_ship,

--     ROUND(SUM(
--         od.UnitPrice * od.quantity * (1 - od.discount)
--     ), 2) AS total_order_value

-- FROM orders o

-- JOIN customers c
--     ON o.CustomerID = c.customerID
-- JOIN employees e
--     ON o.EmployeeID = e.EmployeeID

-- JOIN shippers s
--     ON o.ShipVia = s.ShipperID

-- JOIN order_details od
--     ON o.OrderID = od.OrderID

-- GROUP BY
--     o.OrderID,
--     customer_name,
--     employee_name,
--     shipper_name,
    -- o.OrderDate,
     --  o.ShippedDate;
    
-- Q36 STORED PROCEDURE CUSTOMER REPORT
-- DROP procedure IF EXISTS get_customer_report
-- DELIMITER //

-- CREATE PROCEDURE get_customer_report(IN cust_id VARCHAR(10))

-- BEGIN

--     SELECT
--         c.CustomerID,
--         c.CompanyName,

--         COUNT(DISTINCT o.OrderID) AS total_orders,

--         ROUND(
--             SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--             2
--         ) AS total_revenue,

--         ROUND(
--             AVG(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--             2
--         ) AS average_order_value,

--         MAX(o.OrderDate) AS last_order_date

--     FROM customers c

--     JOIN orders o
--         ON c.CustomerID = o.CustomerID

--     JOIN order_details od
--         ON o.OrderID = od.OrderID

--     WHERE c.CustomerID = cust_id

--     GROUP BY
--         c.CustomerID,
--         c.CompanyName;

-- END //

-- DELIMITER ;

-- Q37 TOP 3 BEST SELLING PRODUCT PER CONTRY
-- SELECT *
-- FROM (

--     SELECT
--         c.Country,
--         p.ProductName,

--         SUM(od.Quantity) AS total_quantity,

--         RANK() OVER (
--             PARTITION BY c.Country
--             ORDER BY SUM(od.Quantity) DESC
--         ) AS ranking

--     FROM customers c

--     JOIN orders o
--         ON c.CustomerID = o.CustomerID

--     JOIN order_details od
--         ON o.OrderID = od.OrderID

--     JOIN products p
--         ON od.ProductID = p.ProductID

--     GROUP BY
--         c.Country,
--         p.ProductName

-- ) ranked_products

-- WHERE ranking <= 3

-- ORDER BY Country, ranking;

-- Q38 PRODUCTS NOT ORDERED IN THE LAST 12 MONTHS
-- SELECT
--     p.ProductID,
--     p.ProductName

-- FROM products p

-- WHERE p.ProductID NOT IN (

--     SELECT DISTINCT od.ProductID

--     FROM order_details od

--     JOIN orders o
--         ON od.OrderID = o.OrderID

--     WHERE o.OrderDate >= (
--         SELECT DATE_SUB(MAX(OrderDate), INTERVAL 12 MONTH)
--         FROM orders
--     )
-- );

-- Q39 QUARTER-OVER-QUARTER REVENUE GROWTH
-- WITH quarterly_revenue AS (

--     SELECT
--         YEAR(o.OrderDate) AS year,
--         QUARTER(o.OrderDate) AS quarter,

--         ROUND(
--             SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--             2
--         ) AS revenue

--     FROM orders o

--     JOIN order_details od
--         ON o.OrderID = od.OrderID

--     GROUP BY
--         YEAR(o.OrderDate),
--         QUARTER(o.OrderDate)
-- )

-- SELECT
--     year,
--     quarter,
--     revenue,

--     LAG(revenue) OVER (
--         PARTITION BY year
--         ORDER BY quarter
--     ) AS previous_quarter_revenue,

--     ROUND(
--         (
--             (revenue - LAG(revenue) OVER (
--                 PARTITION BY year
--                 ORDER BY quarter
--             ))
--             /
--             LAG(revenue) OVER (
--                 PARTITION BY year
--                 ORDER BY quarter
--             )
--         ) * 100,
--         2
--     ) AS growth_rate_percent

-- FROM quarterly_revenue;

-- Q40 POTENTIAL FRADULENT ORDERS
-- SELECT
--     o1.CustomerID,
--     COUNT(o2.OrderID) AS orders_within_7_days

-- FROM orders o1

-- JOIN orders o2
--     ON o1.CustomerID = o2.CustomerID
--     AND DATEDIFF(o2.OrderDate, o1.OrderDate) BETWEEN 0 AND 7

-- GROUP BY o1.CustomerID, o1.OrderDate

-- HAVING COUNT(o2.OrderID) >= 3

-- ORDER BY orders_within_7_days DESC;

-- Q41 SUPPLIER PERFORMANCE SCORECARD
-- SELECT
--     s.SupplierID,
--     s.CompanyName,

--     COUNT(DISTINCT p.ProductID) AS total_products_supplied,

--     SUM(od.Quantity) AS total_quantity_ordered,

--     ROUND(
--         SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--         2
--     ) AS total_revenue_generated,

--     ROUND(
--         AVG(DATEDIFF(o.ShippedDate, o.OrderDate)),
--         2
--     ) AS avg_days_to_ship

-- FROM suppliers s

-- JOIN products p
--     ON s.SupplierID = p.SupplierID

-- JOIN order_details od
--     ON p.ProductID = od.ProductID

-- JOIN orders o
--     ON od.OrderID = o.OrderID

-- GROUP BY
--     s.SupplierID,
--     s.CompanyName

-- ORDER BY total_revenue_generated DESC;

-- Q42 TERRITORY WITH HIGHEST REVENUE CONTRIBUTION
-- WITH territory_revenue AS (

--     SELECT
--         t.TerritoryDescription,
--         
--         ROUND(
--             SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--             2
--         ) AS territory_revenue

--     FROM territories t

--     JOIN employee_territory et
--         ON t.TerritoryID = et.TerritoryID

--     JOIN employees e
--         ON et.EmployeeID = e.EmployeeID

--     JOIN orders o
--         ON e.EmployeeID = o.EmployeeID

--     JOIN order_details od
--         ON o.OrderID = od.OrderID

--     GROUP BY t.TerritoryDescription
-- ),

-- employee_revenue AS (

--     SELECT
--         t.TerritoryDescription,
--         CONCAT(e.FirstName, ' ', e.LastName) AS employee_name,

--         ROUND(
--             SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--             2
--         ) AS employee_revenue

--     FROM territories t

--     JOIN employee_territory et
--         ON t.TerritoryID = et.TerritoryID

--     JOIN employees e
--         ON et.EmployeeID = e.EmployeeID

--     JOIN orders o
--         ON e.EmployeeID = o.EmployeeID

--     JOIN order_details od
--         ON o.OrderID = od.OrderID

--     GROUP BY
--         t.TerritoryDescription,
--         employee_name
-- )

-- SELECT
--     tr.TerritoryDescription,
--     tr.territory_revenue,

--     er.employee_name,
--     er.employee_revenue

-- FROM territory_revenue tr

-- JOIN employee_revenue er
--     ON tr.TerritoryDescription = er.TerritoryDescription

-- WHERE tr.territory_revenue = (
--     SELECT MAX(territory_revenue)
--     FROM territory_revenue
-- )

-- ORDER BY er.employee_revenue DESC;

-- Q43 BUSINESS REPORTING MONTHLY SALES REPORT
-- SELECT
--     YEAR(o.OrderDate) AS year,
--     MONTH(o.OrderDate) AS month,

--     COUNT(DISTINCT o.OrderID) AS total_orders,

--     ROUND(
--         SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--         2
--     ) AS total_revenue,

--     ROUND(
--         AVG(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--         2
--     ) AS average_order_value,

--     COUNT(DISTINCT o.CustomerID) AS unique_customers

-- FROM orders o

-- JOIN order_details od
--     ON o.OrderID = od.OrderID

-- GROUP BY
--     YEAR(o.OrderDate),
--     MONTH(o.OrderDate)

-- ORDER BY year, month;

-- Q44 PRODUCT REORDER REPORT
-- SELECT
--     ProductID,
--     ProductName,
--     UnitsInStock,
--     ReorderLevel,

--     CASE
--         WHEN UnitsInStock = 0 THEN 'Critical'
--         WHEN UnitsInStock < ReorderLevel THEN 'Low'
--         ELSE 'OK'
--     END AS stock_status

-- FROM products

-- WHERE
--     UnitsInStock <= ReorderLevel
--     AND Discontinued = 0;

-- Q45 CUSTOMER SEGEMENTATION BY ORDER FREQUENCY
-- WITH customer_orders AS (

--     SELECT
--         c.CustomerID,
--         c.CompanyName,

--         COUNT(DISTINCT o.OrderID) AS total_orders,

--         ROUND(
--             SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--             2
--         ) AS total_revenue

--     FROM customers c

--     JOIN orders o
--         ON c.CustomerID = o.CustomerID

--     JOIN order_details od
--         ON o.OrderID = od.OrderID

--     GROUP BY
--         c.CustomerID,
--         c.CompanyName
-- )

-- SELECT
--     customer_segment,

--     COUNT(*) AS total_customers,

--     ROUND(SUM(total_revenue), 2) AS segment_revenue

-- FROM (

--     SELECT
--         *,

--         CASE
--             WHEN total_orders >= 6 THEN 'Loyal'
--             WHEN total_orders BETWEEN 3 AND 5 THEN 'Regular'
--             ELSE 'Occasional'
--         END AS customer_segment

--     FROM customer_orders

-- ) segmented

-- GROUP BY customer_segment;

-- q46 geographic revenue heatmap
-- SELECT
--     c.Country,

--     COUNT(DISTINCT c.CustomerID) AS total_customers,

--     COUNT(DISTINCT o.OrderID) AS total_orders,

--     ROUND(
--         SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--         2
--     ) AS total_revenue,

--     ROUND(
--         AVG(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--         2
--     ) AS average_order_value

-- FROM customers c

-- JOIN orders o
--     ON c.CustomerID = o.CustomerID

-- JOIN order_details od
--     ON o.OrderID = od.OrderID

-- GROUP BY c.Country

-- ORDER BY total_revenue DESC;
-- SELECT
--     c.Country,

--     COUNT(DISTINCT c.CustomerID) AS total_customers,

--     COUNT(DISTINCT o.OrderID) AS total_orders,

--     ROUND(
--         SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--         2
--     ) AS total_revenue,

--     ROUND(
--         AVG(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--         2
--     ) AS average_order_value

-- FROM customers c

-- JOIN orders o
--     ON c.CustomerID = o.CustomerID

-- JOIN order_details od
--     ON o.OrderID = od.OrderID

-- GROUP BY c.Country

-- ORDER BY total_revenue DESC;

-- Q47 CATEGORIES WITH DECLINING REVENUE YOY
-- WITH category_yearly_revenue AS (

--     SELECT
--         c.CategoryName,

--         YEAR(o.OrderDate) AS year,

--         ROUND(
--             SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
--             2
--         ) AS revenue

--     FROM categories c

--     JOIN products p
--         ON c.CategoryID = p.CategoryID

--     JOIN order_details od
--         ON p.ProductID = od.ProductID

--     JOIN orders o
--         ON od.OrderID = o.OrderID

--     GROUP BY
--         c.CategoryName,
--         YEAR(o.OrderDate)
-- )

-- SELECT
--     CategoryName,
--     year,
--     revenue,

--     LAG(revenue) OVER (
--         PARTITION BY CategoryName
--         ORDER BY year
--     ) AS previous_year_revenue,

--     CASE
--         WHEN revenue < LAG(revenue) OVER (
--             PARTITION BY CategoryName
--             ORDER BY year
--         )
--         THEN 'Declining'
--         ELSE 'Growing'
--     END AS revenue_status

-- FROM category_yearly_revenue;

-- Q48 EMPLOYEE PERFORMANCE DASHBOSRD
----  SELECT
-- --     CONCAT(e.FirstName, ' ', e.LastName) AS employee_name,

-- --     COUNT(DISTINCT o.OrderID) AS total_orders_processed,

-- --     ROUND(
-- --         SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
-- --         2
-- --     ) AS total_revenue_managed,

-- --     ROUND(
-- --         AVG(od.UnitPrice * od.Quantity * (1 - od.Discount)),
-- --         2
-- --     ) AS average_order_value,

-- --     ROUND(
-- --         (
-- --             SUM(
-- --                 CASE
-- --                     WHEN o.ShippedDate <= o.RequiredDate
-- --                     THEN 1
-- --                     ELSE 0
-- --                 END
-- --             ) * 100.0
-- --         ) / COUNT(o.OrderID),
-- --         2
-- --     ) AS on_time_delivery_rate,

-- --     RANK() OVER (
-- --         ORDER BY
-- --         SUM(
-- --             od.UnitPrice * od.Quantity * (1 - od.Discount)
-- --         ) DESC
-- --     ) AS revenue_rank

-- -- FROM employees e

-- JOIN orders o
--     ON e.EmployeeID = o.EmployeeID

-- JOIN order_details od
--     ON o.OrderID = od.OrderID

-- GROUP BY
--     e.EmployeeID,
--     employee_name

-- ORDER BY revenue_rank;

-- Q49 CROSS SELLING OPPORTUNITIES
-- SELECT
--     p1.ProductName AS product_1,
--     p2.ProductName AS product_2,

--     COUNT(*) AS times_ordered_together

-- FROM order_details od1

-- JOIN order_details od2
--     ON od1.OrderID = od2.OrderID
--     AND od1.ProductID < od2.ProductID

-- JOIN products p1
--     ON od1.ProductID = p1.ProductID

-- JOIN products p2
--     ON od2.ProductID = p2.ProductID

-- GROUP BY
--     p1.ProductName,
--     p2.ProductName

-- ORDER BY times_ordered_together DESC;

-- Q50 CEO SUMMARY REPORT
-- SELECT 
--     'Total Revenue' AS metric_name,
--     CAST(ROUND(SUM(UnitPrice * Quantity * (1 - Discount)),2) AS CHAR) AS metric_value
-- FROM order_details

-- UNION ALL

-- SELECT
--     'Total Orders',
--     CAST(COUNT(OrderID) AS CHAR)
-- FROM orders

-- UNION ALL

-- SELECT
--     'Best Selling Product',
--     (
--         SELECT p.ProductName
--         FROM products p
--         JOIN order_details od
--             ON p.ProductID = od.ProductID
--         GROUP BY p.ProductID, p.ProductName
--         ORDER BY SUM(od.Quantity) DESC
--         LIMIT 1
--     )

-- UNION ALL

-- SELECT
--     'Top Customer By Revenue',
--     (
--         SELECT c.CompanyName
--         FROM customers c
--         JOIN orders o
--             ON c.CustomerID = o.CustomerID
--         JOIN order_details od
--             ON o.OrderID = od.OrderID
--         GROUP BY c.CustomerID, c.CompanyName
--         ORDER BY SUM(
--             od.UnitPrice * od.Quantity * (1 - od.Discount)
--         ) DESC
--         LIMIT 1
--     )

-- UNION ALL

-- SELECT
--     'Top Employee By Revenue',
--     (
--         SELECT CONCAT(e.FirstName, ' ', e.LastName)
--         FROM employees e
--         JOIN orders o
--             ON e.EmployeeID = o.EmployeeID
--         JOIN order_details od
--             ON o.OrderID = od.OrderID
--         GROUP BY e.EmployeeID, e.FirstName, e.LastName
--         ORDER BY SUM(
--             od.UnitPrice * od.Quantity * (1 - od.Discount)
--         ) DESC
--         LIMIT 1
--     )

-- UNION ALL

-- SELECT
--     'Average Order Value',
--     CAST(
--         ROUND(
--             AVG(UnitPrice * Quantity * (1 - Discount)),
--             2
--         ) AS CHAR
--     )
-- FROM order_details

-- UNION ALL

-- SELECT
--     'On-Time Delivery Rate',
--     CAST(
--         ROUND(
--             (
--                 SUM(
--                     CASE
--                         WHEN ShippedDate <= RequiredDate
--                         THEN 1
--                         ELSE 0
--                     END
--                 ) * 100.0
--             ) / COUNT(*),
--             2
--         ) AS CHAR
--     )
-- FROM orders

-- UNION ALL

-- SELECT
--     'Total Customers',
--     CAST(COUNT(CustomerID) AS CHAR)
-- FROM customers;