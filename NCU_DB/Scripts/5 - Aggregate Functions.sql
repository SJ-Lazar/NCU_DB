-- Aggregate Functions 

-- 1. COUNT
-- 2. SUM
-- 3. AVG
-- 4. MIN
-- 5. MAX


SELECT MAX(TotalDue) FROM Sales.SalesOrderHeader

SELECT MIN(TotalDue) FROM Sales.SalesOrderHeader

SELECT COUNT(*) FROM Sales.SalesOrderHeader

SELECT AVG(TotalDue) FROM Sales.SalesOrderHeader

SELECT SUM(TotalDue) FROM Sales.SalesOrderHeader

SELECT COUNT(DISTINCT FirstName) FROM Person.Person

-- USING SUM WITH BETWEEN 
SELECT SUM(TotalDue) FROM Sales.SalesOrderHeader WHERE OrderDate BETWEEN '2005-07-01' AND '2005-07-31'

--Beware of sum on non numeric data types
SELECT SUM(FirstName) FROM Person.Person -- error




/*
1) How	many	rows	are	in	the	Person.Person	table?		Use	an	aggregate	function	NOT	
“SELECT	*”.
2) How	many	rows	in	the	Person.Person	table	do	not	have	a	NULL	value	in	the	
MiddleName	column?
3) What	is	the	average	StandardCost	(located	in	Production.Product)	for	each	product	
where	the	StandardCost	is	greater	than	$0.00?
4) What	is	the	average	Freight	amount	for	each	sale	(found	in	Sales.SalesOrderHeader)	
where	the	sale	took	place	in	TerritoryID	4?
5) How	expensive	is	the	most	expensive	product,	by	ListPrice,	in	the	table	
Production.Product?
6) Join	the	Production.Product	table	and	the	Production.ProductInventory	table	for	
only	the	products	that	appear	in	both	table.		Use	the	ProductID	as	the	joining	
column.		Production.ProductInventory	contains	the	quantity	of	each	product	
(several	rows	can	appear	for	each	product	to	indicate	the	product	appears	in	
multiple	locations).		Your	goal	is	to	determine	how	much	money	we	would	earn	if	
we	sold	every	product	for	its	list	price for	each	product	with	a	ListPrice	greater	than	
$0.		That	is,	if	you	summed	the	product	of	each	product’s	inventory	by	its	list	price,	
what	would	that	value	be?		(Hint:	This	is	intentionally	challenging.		You	must	use	an	
aggregate	function	with	a	mathematical	expression	to	accomplish	your	goal)


Question	1:
SELECT COUNT(*)
FROM Person.Person
Question	2:
SELECT COUNT(MiddleName)
FROM Person.Person
Question	3:
SELECT AVG(StandardCost)
FROM Production.Product
WHERE StandardCost > 0
Question	4:
SELECT AVG(Freight)
FROM Sales.SalesOrderHeader
WHERE TerritoryID = 4
Question	5:
SELECT MAX(ListPrice)
FROM Production.Product
Question	6:
SELECT SUM(P.ListPrice*I.Quantity)
FROM Production.Product P
INNER JOIN Production.ProductInventory I
ON I.ProductID = P.ProductID
WHERE P.ListPrice > 0

*/
