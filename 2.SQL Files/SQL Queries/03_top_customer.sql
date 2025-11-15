# 3. What is the name of the top customer and their address who purchased the most?
	select s.CustomerID, c.FirstName, c.MiddleInitial, c.LastName, c.Address, 
	round(sum(s.UnitPrice * s.Quantity * (1 - s.Discount)), 2) as TotalPurchase
	from sales s
	left join customers c on s.CustomerID = c.CustomerID
	group by s.CustomerID, c.FirstName, c.MiddleInitial, c.LastName, c.Address
	order by TotalPurchase desc
	limit 1;
# OR THIS CAN BE USED
	SELECT s.CustomerID, 
	ROUND(SUM(s.UnitPrice * s.Quantity * (1 - s.Discount)), 2) AS TotalPurchase
	FROM Sales s
	GROUP BY s.CustomerID
	ORDER BY TotalPurchase DESC
	LIMIT 1;