# 9.  Find the average discount given for each product 
SELECT p.ProductID, p.ProductName, AVG(s.Discount) AS AvgDiscount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName;