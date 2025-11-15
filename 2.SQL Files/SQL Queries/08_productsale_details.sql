# 8. Display each product’s sales information — including ProductID, ProductName, and totalSalesAfterDiscount — along with a row number that 
#orders the total sales (after discount) for each product. Use a Common Table Expression (CTE) and the ROW_NUMBER() function
	WITH ProductSales AS (
	SELECT 
	p.ProductID, 
	p.ProductName, 
	SUM(s.UnitPrice * s.Quantity * (1 - s.Discount)) AS TotalSales
	FROM Sales s
	JOIN Products p ON s.ProductID = p.ProductID
	GROUP BY p.ProductID, p.ProductName
	)
	SELECT 
	*, 
	ROW_NUMBER() OVER (ORDER BY TotalSales DESC) AS RowNum
	FROM ProductSales;