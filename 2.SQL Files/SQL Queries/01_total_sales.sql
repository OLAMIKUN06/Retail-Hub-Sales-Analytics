# 1. What is the total sales amount? 
#Multiply UnitPrice by Quantity and display the result as totalsalesamountBeforeDiscount
-- total sales amount before discount
	select SalesID, SalesPersonID, CustomerID, ProductID, UnitPrice, Quantity, Discount, SalesDate, TransactionNumber,
	(UnitPrice * Quantity) as totalsalesamountBeforeDiscount
	from sales;
-- sum total sales amount before discount
    select sum(UnitPrice * Quantity) as totalsalesamountBeforeDiscount_2
	from sales;
-- total sales amount after discount
	select SalesID, SalesPersonID, CustomerID, ProductID, UnitPrice, Quantity, Discount, SalesDate, TransactionNumber,
	round(UnitPrice * Quantity * (1 - Discount), 2) as totalsalesamountAfterDiscount
	from sales;
-- sum total sales amount after discount(totalsalesamount)
    select round(sum((UnitPrice) * Quantity * (1 - Discount)), 2) as totalsalesamount
	from sales;
-- shows the display of all 3 together
	SELECT 
	s.SalesID,
	s.SalesPersonID,
	s.CustomerID,
	s.ProductID,
	s.UnitPrice,
	s.Quantity,
	s.Discount,
	s.SalesDate,
	s.TransactionNumber,
	-- Per-row totals
	(s.UnitPrice * s.Quantity) AS totalSalesBeforeDiscount,
	ROUND(s.UnitPrice * s.Quantity * (1 - s.Discount), 2) AS totalSalesAfterDiscount,
	-- Total sum over the entire table (same value in every row)
	ROUND(SUM(s.UnitPrice * s.Quantity * (1 - s.Discount)) OVER (), 2) AS totalsalesamount
	FROM Sales s;