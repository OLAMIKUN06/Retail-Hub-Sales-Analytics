# 6. Show all the ProductName and what categories they belong to? 
	SELECT 
	p.ProductName,
	COALESCE(c.CategoryName, 'Unknown') AS CategoryName
	FROM Products p
	LEFT JOIN Categories c ON p.CategoryID = c.CategoryID;