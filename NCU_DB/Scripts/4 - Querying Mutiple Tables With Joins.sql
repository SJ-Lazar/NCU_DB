-- JOINS 

-- Returns columns from both tables
SELECT * FROM Customers, Orders

-- INNER JOIN 
-- Intersection of both tables 
-- Returns columns from both tables where the join condition is true
SELECT 
	* 
FROM 
	Customers 
INNER JOIN 
	Orders ON Customers.CustomerID = Orders.CustomerID

SELECT 
	P.Name, P.ProductNumber
	,PS.Name AS SubcategoryName
FROM 
	Production.Product P
INNER JOIN 
	Production.ProductSubcategory PS 
ON 
	P.ProductSubcategoryID = PS.ProductSubcategoryID


-- INNER JOIN CONTINUED
-- Returns column if a match is found in both tables

SELECT 
	PS.Name AS ProductSubcategoryName
   ,PC.Name AS ProductCategoryName
FROM 
	Production.ProductSubcategory PS
INNER JOIN 
	Production.ProductCategory PC
ON 
	PS.ProductCategoryID = PC.ProductCategoryID



SELECT P.FirstName, p.LastName, PE.EmailAddress, PP.PhoneNumber FROM Person.Person P
INNER JOIN Person.EmailAddress PE ON P.BusinessEntityID = PE.BusinessEntityID
INNER JOIN 
Person.PersonPhone PP ON P.BusinessEntityID = PP.BusinessEntityID



/*
1) Using	the	Person.Person	and	Person.Password	tables,	INNER	JOIN	the	two	tables	
using	the	BusinessEntityID	column	and	return	the	FirstName	and	LastName	
columns	from	Person.Person	and	then	PasswordHash	column	from	
Person.Password
2) Join	the	HumanResources.Employee	and	the	
HumanResources.EmployeeDepartmentHistory	tables	together	via	an	INNER	JOIN	
using	the	BusinessEntityID	column.		Return	the	BusinessEntityID,	
NationalIDNumber	and	JobTitle	columns	from	HumanResources.Employee	and	the	
DepartmentID,	StartDate,	and	EndDate	columns	from	
HumanResources.EmployeeDepartmentHistory.		Notice	the	number	of	rows	
returned.		Why	is	the	row	count	what	it	is?
3) Expand	upon	the	query	used	in	question	1.		Using	the	existing	query,	add	another	
INNER	JOIN	to	the	Person.EmailAddress	table	and	include	the	EmailAddress	column	
in	your	select	statement.
4) Using	the	Book,	BookAuthor	and	Author	tables,	join	them	together	so	that	you	
return	the	Title	and	ISBN	columns	from	Book	and	the	AuthorName	column	from	
Author.		(Hint:	You	must	start	with	the	BookAuthor	table	in	your	FROM	clause	even	
though	we	will	not	be	returning	any	columns	from	this	table)
5) Using	the	query	from	example	4,	add	another	INNER	JOIN	that	joins	the	Publisher	
table	with	your	query.		Return	the	PublisherName	column	from	this	table.		So,	you	
should	return	the	Title	and	ISBN	columns	from	Book,	the	AuthorName	column	from	
Author,	and	the	PublisherName	column	from	Publisher.		(Hint:	this	will	require	
three	separate	INNER	JOINs).

Question	1:
SELECT
P.FirstName,
P.LastName,
PP.PasswordHash
FROM Person.Person P
INNER JOIN Person.[Password] PP
ON PP.BusinessEntityID = P.BusinessEntityID
Question	2:
SELECT
E.BusinessEntityID,
E.NationalIDNumber,
E.JobTitle,
EDH.DepartmentID,
EDH.StartDate,
EDH.EndDate
FROM HumanResources.Employee E
INNER JOIN HumanResources.EmployeeDepartmentHistory EDH
ON E.BusinessEntityID = EDH.BusinessEntityID
Since	the	HumanResources.Employee	table	has	290	rows,	you	might	expect the	INNER	JOIN	
of	that	table	with	HumanResources.EmployeeDepartmentHistory	would	have	no	more	than	
290	rows.		However,	there	are	multiple	instances	of	a	few	BusinessEntityID	values	in	
HumanResources.EmployeeDepartmentHistory.		Instead	of	matching	a	single row	from	
HumanResources.Employee	to	a	single	row	in	
HumanResources.EmployeeDepartmentHistory,	a	row	in	HumanResources.Employee	is	
matching	to	potentially	two	rows.		This	means	that	multiple	rows	are	returned	for	the	
duplicate	BusinessEntityID	values.		The lowest	level	of	detail	of	uniqueness	is	often	referred	
to	as	the	grain of	a	table.		Making	sure	that	your	joins	account	for	potential	grain	differences	
is	critical	to	produce	proper	queries.
Question	3:
SELECT
P.FirstName,
P.LastName,
PP.PasswordHash,
E.EmailAddress
FROM Person.Person P
INNER JOIN Person.[Password] PP
ON PP.BusinessEntityID = P.BusinessEntityID
INNER JOIN Person.EmailAddress E
ON E.BusinessEntityID = P.BusinessEntityID
Question	4:
SELECT
B.Title,
B.ISBN,
A.AuthorName
FROM BookAuthor BA
INNER JOIN Book B
ON B.BookID = BA.BookID
INNER JOIN Author A
ON A.AuthorID = BA.AuthorID
Question	5:
SELECT
B.Title,
B.ISBN,
A.AuthorName,
P.PublisherName
FROM BookAuthor BA
INNER JOIN Book B
ON B.BookID = BA.BookID
INNER JOIN Author A
ON A.AuthorID = BA.AuthorID
INNER JOIN Publisher P
ON P.PublisherID = B.PublisherID
*/


-- LEFT JOIN AND RIGHT JOIN
-- LEFT OUTER JOIN SHOW ALL ROWS FROM THE LEFT TABLE AND ONLY MATCHING ROWS FROM THE RIGHT TABLE
SELECT 
	* 
FROM
	Production.Product P
INNER JOIN 
	Production.ProductSubcategory PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID


SELECT 
	* 
FROM
	Production.Product P
LEFT OUTER JOIN 
	Production.ProductSubcategory PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID


SELECT 
	* 
FROM
	Production.Product P
RIGHT OUTER JOIN 
	Production.ProductSubcategory PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID

-- ORDERING SQL EVALUATION


SELECT P.FirstName, P.LastName,
	   SOH.SalesOrderNumber, SOH.TotalDue AS SalesAmount, 
	   T.[Name] AS TerritoryName
FROM Sales.SalesOrderHeader SOH
LEFT OUTER JOIN Sales.SalesPerson SP 
ON SOH.SalesPersonID = SP.BusinessEntityID -- Keys 
LEFT OUTER JOIN HumanResources.Employee E ON
SP.BusinessEntityID = E.BusinessEntityID
LEFT OUTER JOIN Person.Person P ON
E.BusinessEntityID = P.BusinessEntityID
LEFT OUTER JOIN Sales.SalesTerritory T ON
T.TerritoryID = SOH.TerritoryID
WHERE T.Name = 'Northwest'
ORDER BY 4 DESC


-- SEE Attached PDF  /INNER+JOIN+Practice+Problems.pdf

