# 7. Classify the totalSalesAfterDiscount column as High sales, Medium sales, or Low sales based on their total sales amount.
	SELECT 
	p.ProductID,
	p.ProductName,
	ROUND(SUM(s.UnitPrice * s.Quantity * (1 - s.Discount)), 2) AS totalSalesAfterDiscount,
	CASE
	WHEN SUM(s.UnitPrice * s.Quantity * (1 - s.Discount)) >= 1000 THEN 'High Sales'
	WHEN SUM(s.UnitPrice * s.Quantity * (1 - s.Discount)) >= 500 THEN 'Medium Sales'
	ELSE 'Low Sales'
	END AS SalesCategory
	FROM Sales s
	JOIN Products p ON s.ProductID = p.ProductID
	GROUP BY p.ProductID, p.ProductName
	ORDER BY totalSalesAfterDiscount DESC;