# 10.  List the products that are greater than the average price using a subquery. 
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);