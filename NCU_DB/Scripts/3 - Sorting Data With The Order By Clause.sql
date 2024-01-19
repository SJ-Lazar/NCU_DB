 --ORDER BY CLAUSE 
 --Last Clause in a SQL Query
 --Used to sort the result set by one or more columns

 -- We Can Order by ColumnName, ColumnOrdinal or ColumnAlias
-- ASC = Ascending Order
-- DESC = Descending Order


SELECT FirstName, LastName  
FROM Sales.vIndividualCustomer
ORDER BY LastName ASC

SELECT FirstName, LastName
FROM Sales.vIndividualCustomer
ORDER BY 2 ASC -- ordnial position 

-- How we write Sql Queries
--SELECT 
--FROM 
--WHERE 
--GROUP BY 
--HAVING 
--ORDER BY

-- How SQL Server Executes
--FROM
--WHERE 
--GROUP BY
--HAVING 
--SELECT 
--ORDER BY 


-- Order by mutiple columns
SELECT FirstName, LastName, PhoneNumber
FROM Sales.vIndividualCustomer
ORDER BY LastName, FirstName ASC

-- Order by mutiple columns with different sort orders
SELECT FirstName, LastName, PhoneNumber
FROM Sales.vIndividualCustomer
ORDER BY LastName ASC, FirstName DESC

-- Using WHERE AND ORDER BY
SELECT FirstName, LastName, PhoneNumber
FROM Sales.vIndividualCustomer
WHERE PhoneNumber IS NOT NULL
ORDER BY LastName ASC, FirstName DESC


-- Practice Problems
/*
1) From	the	HumanResources.vEmployeeDepartment	view,	return	the	FirstName,	
LastName	and	JobTitle	columns.		Sort	the	results	by	the	FirstName	column	in	
ascending	order.
2) Modify	the	query	from	question	1	to	sort	the	results	by	the	FirstName	column	in	
ascending	order	and	then	by	the	LastName	column	in	descending	order.
3) From	the	Sales.vIndividualCustomer	view,	return	the	FirstName,	LastName	and	
CountryRegionName	columns.		Sort	the	results	by	the	CountryRegionName	column.		
Use	the	column	ordinal	in	the	ORDER	BY	clause.
4) From	the	Sales.vIndividualCustomer	view,	return	the	FirstName,	LastName	and	
CountryRegionName	columns	for	those	rows	with a	CountryRegionName	that	is	
either	“United	States”	or	“France”.		Sort	the	results	by	the	CountryRegionName	
column	in	ascending	order.	
5) From	the	Sales.vStoreWithDemographics	view,	return	the	Name,	AnnualSales,	
YearOpened,	SquareFeet,	and	NumberEmployees	columns.		Give	the	SquareFeet	
column	the	alias	“Store	Size”	and	the	NumberEmployees	column	the	alias	“Total	
Employees”.		Return	only	those	rows	with	AnnualSales	greater	than	1,000,000	and	
with	NumberEmployees	greater	than	or	equal	to	45.		Order	your	results by	the	
“Store	Size”	alias	in	descending	order	and	then	by	the	“Total	Employees”	alias	in	
descending	order
*/




/*
Question	1:
SELECT
FirstName,
LastName,
JobTitle
FROM HumanResources.vEmployeeDepartment
ORDER BY FirstName ASC
Question	2:
SELECT
FirstName,
LastName,
JobTitle
FROM HumanResources.vEmployeeDepartment
ORDER BY FirstName, LastName DESC
Question	3:
SELECT
FirstName,
LastName,
CountryRegionName
FROM Sales.vIndividualCustomer
ORDER BY 3
Question	4:
SELECT
FirstName,
LastName,
CountryRegionName
FROM Sales.vIndividualCustomer
WHERE CountryRegionName IN ('United	States', 'France')
ORDER BY CountryRegionName
Question	5:
SELECT
Name,
AnnualSales,
YearOpened,
SquareFeet AS [Store	Size],
NumberEmployees AS [Total	Employees]
FROM Sales.vStoreWithDemographics
WHERE AnnualSales > 1000000
AND NumberEmployees >= 45
ORDER BY [Store	Size] DESC, [Total	Employees] DESC
*/