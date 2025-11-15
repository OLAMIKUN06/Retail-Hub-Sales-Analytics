# 4. Show all the employee names and the cities they live in?
	select
	concat_ws(' ', e.FirstName, e.MiddleInitial, e.LastName) as EmployeeName, c.CityName as City
	from employees e
	join Cities c on e.CityID = c.CityID;