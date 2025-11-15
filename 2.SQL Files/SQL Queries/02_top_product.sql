# 2. Which product has the highest total sales amount?
	select p.ProductID, p.ProductName, 
	round(sum(s.UnitPrice * s.Quantity * (1 - s.Discount)), 2) as totalSalesamount
	from sales s
	join products p on s.ProductID = p.ProductID
	group by p.ProductID, p.ProductName
	order by totalsalesamount desc
	limit 1;