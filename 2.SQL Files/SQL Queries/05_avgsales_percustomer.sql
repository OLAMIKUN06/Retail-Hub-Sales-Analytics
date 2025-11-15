# 5. What are the average sales purchased per customer?
	select
	concat_ws(' ', c.FirstName, c.MiddleInitial, c.LastName) as CustomerName, 
	round(avg(s.UnitPrice * s.Quantity * (1 - s.Discount)), 2) as AvgSales
	from sales s
	left join customers c ON s.CustomerID = c.CustomerID
	group by CustomerName;
# OR THIS CAN BE USED
	SELECT 
	ROUND(AVG(TotalPurchase), 2) AS AvgSalesPerCustomer
	FROM (
	SELECT 
	s.CustomerID, SUM(s.UnitPrice * s.Quantity * (1 - s.Discount)) AS TotalPurchase
	FROM Sales s
	GROUP BY s.CustomerID) AS CustomerTotals;