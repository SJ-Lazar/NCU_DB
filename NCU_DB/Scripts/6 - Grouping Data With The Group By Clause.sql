

--Group By Cluase 

SELECT SalesPersonID, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID, TotalDue


SELECT ProductID, SUM(Quantity) AS TotalInStock , COUNT(*) AS TotalLocations
FROM Production.ProductInventory
GROUP BY ProductID	
ORDER BY ProductID 


SELECT ST.Name, P.FirstName, P.LastName, SUM(TotalDue) AS TotalSales FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesPerson SP ON SOH.SalesPersonID = SP.BusinessEntityID
INNER JOIN Sales.SalesTerritory ST ON SP.TerritoryID = SOH.TerritoryID
INNER JOIN Person.Person P ON SP.BusinessEntityID = P.BusinessEntityID
WHERE OrderDate BETWEEN '2006-01-01' AND '2006-12-31'
GROUP BY ST.Name, P.FirstName, P.LastName	
ORDER BY 1, 2

--In	the	Person.Person	table,	how	many	people	are	associated	with	each	PersonType?
--2) Using	only	one	query,	find	out	how	many	products	in	Production.Product	are	the	
--color	“red”	and	how	many	are	“black”.
--3) Using	Sales.SalesOrderHeader,	how	many	sales	occurred	in	each	territory	between	
--July	1,	2005	and	December	31,	2006?		Order	the	results	by	the	sale	count	in	
--descending	order.
--4) Expanding	on	the	previous	example,	group	the	results	not	by	the	TerritoryID	but	by	
--the	name	of	the	territory	(found	in	the	Sales.SalesTerritory	table).
--5) Using	the	Book,	BookAuthor,	Author	and/or	Publisher	tables,	identify	how	many	
--books	each	author	either	wrote	or	co-authored.

--Question	1:
--SELECT
--PersonType,
--COUNT(*) AS PersonCount
--FROM Person.Person
--GROUP BY PersonType
--Question	2:
--SELECT
--Color,
--COUNT(*) AS ProductCount
--FROM Production.Product
--WHERE Color IN ('Red', 'Black')
--GROUP BY Color
--Question	3:
--SELECT
--TerritoryID,
--COUNT(*) AS SalesCount
--FROM Sales.SalesOrderHeader
--WHERE OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
--GROUP BY TerritoryID
--Question	4:
--SELECT
--ST.Name AS TerritoryName,
--COUNT(*) AS SalesCount
--FROM Sales.SalesOrderHeader SOH
--LEFT OUTER JOIN Sales.SalesTerritory ST
--ON ST.TerritoryID = SOH.TerritoryID
--WHERE OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
--GROUP BY ST.Name
--Question	5:
--SELECT
--A.AuthorName,
--COUNT(*) AS BookCount
--FROM BookAuthor BA
--INNER JOIN Author A
--ON A.AuthorID = BA.AuthorID
--GROUP BY A.AuthorName