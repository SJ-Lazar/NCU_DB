-- Having 

-- Filter out groups 

SELECT
	ST.Name AS 'Territory Name'
	,SUM(SOH.TotalDue) AS 'Total Sales - 2006'
FROM
	Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesTerritory ST ON ST.TerritoryID = SOH.TerritoryID
WHERE OrderDate between '1/1/2006' and '12/31/2006'
GROUP by ST.Name
HAVING SUM(TotalDue) > 4000000
ORDER BY 1


SELECT 
	PS.Name AS 'SubCategory Name',
	COUNT(*) AS 'Product Count'
FROM
	Production.Product P
INNER JOIN Production.ProductSubcategory PS ON PS.ProductSubcategoryID = P.ProductSubcategoryID
GROUP BY PS.Name
HAVING COUNT(*) > 15
ORDER BY 1

-- Having is used to filter out groups.


SELECT 
	Department AS [Department Name],
	COUNT(*) AS [Employee Count]
FROM HumanResources.vEmployeeDepartment
GROUP BY Department
HAVING COUNT(*) IN (10,6)


SELECT
	SalesPersonID
	,SUM(TotalDue) AS TotalDue
	,COUNT(*) AS OrderCount
FROM 
	Sales.SalesOrderHeader
WHERE
	OrderDate 
BETWEEN '1/1/2006' AND '12/31/2006'
AND 
SalesPersonID IS NOT NULL
group by SalesPersonID
having SUM(TotalDue) > 2000000 AND COUNT(*) > 75
order by 2 DESC

--1) Find	the	total	sales	by	territory	for	all	rows	in	the	Sales.SalesOrderHeader	table.		
--Return	only	those	territories	that	have	exceeded	$10	million	in	historical	sales.		
--Return	the	total	sales	and	the	TerritoryID	column.
--2) Using	the	query	from	the	previous	question,	join	to	the	Sales.SalesTerritory	table	
--and	replace	the	TerritoryID	column	with	the	territory’s	name.
--3) Using	the	Production.Product	table,	find	how	many	products	are	associated	with	
--each	color.		Ignore	all	rows	where	the	color	has	a	NULL	value.		Once	grouped,	return	
--to	the	results	only	those	colors	that	had	at	least	20	products	with	that color.
--4) Starting	with	the	Sales.SalesOrderHeader	table,	join	to	the	Sales.SalesOrderDetail	
--table.		This	table	contains	the	line	item	details	associated	with	each	sale.		From	
--Sales.SalesOrderDetail,	join	to	the	Production.Product	table.		Return	the	Name	
--column	from	Production.Product	and	assign	it	the	column	alias	“Product	Name”.		
--For	each	product,	find	out	how	many	of	each	product	was	ordered	for	all	orders	that	
--occurred	in	2006.		Only	output	those	products	where	at	least	200	were	ordered.
--5) Find	the	first	and	last	name	of	each	customer	who	has	placed	at	least	6	orders	
--between	July	1,	2005	and	December	31,	2006.		Order	your	results	by	the	number	of	
--orders	placed	in	descending	order.		(Hint:	You	will	need	to	join	to	three	tables	–
--Sales.SalesOrderHeader,	Sales.Customer,	and	Person.Person.		You	will	use	every	
--clause	to	complete	this	query).

--Question	1:
--SELECT
--TerritoryID,
--SUM(TotalDue) AS TotalSales
--FROM Sales.SalesOrderHeader
--GROUP BY TerritoryID
--HAVING SUM(TotalDue) > 10000000
--Question	2:
--SELECT
--ST.Name AS TerritoryName,
--SUM(TotalDue) AS TotalSales
--FROM Sales.SalesOrderHeader SOH
--LEFT OUTER JOIN Sales.SalesTerritory ST
--ON ST.TerritoryID = SOH.TerritoryID
--GROUP BY ST.Name
--HAVING SUM(TotalDue) > 10000000
--Question	3:
--SELECT
--Color,
--COUNT(*) AS ProductCount
--FROM Production.Product
--WHERE Color IS NOT NULL
--GROUP BY Color
--HAVING COUNT(*) >= 20
--Question	4:
--SELECT
--P.Name AS [Product	Name],
--SUM(SOD.OrderQty) AS ProductOrderCount
--FROM Sales.SalesOrderHeader SOH
--INNER JOIN Sales.SalesOrderDetail SOD
--ON SOD.SalesOrderID = SOH.SalesOrderID
--INNER JOIN Production.Product P
--ON P.ProductID = SOD.ProductID
--WHERE SOH.OrderDate BETWEEN '1/1/2006' AND '12/31/2006'
--GROUP BY P.Name
--HAVING SUM(SOD.OrderQty) >= 200
--Question	5:
--SELECT
--P.FirstName,
--P.LastName,
--COUNT(*) AS OrdersPlaced
--FROM Sales.SalesOrderHeader SOH
--INNER JOIN Sales.Customer C
--ON C.CustomerID = SOH.CustomerID
--INNER JOIN Person.Person P
--ON P.BusinessEntityID = C.PersonID
--WHERE OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
--GROUP BY P.FirstName, P.LastName
--HAVING COUNT(*) >= 6
--ORDER BY OrdersPlaced DESC