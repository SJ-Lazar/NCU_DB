

-- The Where Clause 
-- The where clause is used to filter the results of a select statement.
-- Comes after the from clause and before the order by clause.
-- filter out rows that do not meet the criteria specified in the where clause.


--Price Greater Than 10
SELECT * FROM Production.Product
WHERE ListPrice > 10;

--Less Than or Equal To 10
SELECT * FROM Production.Product
WHERE ListPrice <= 10;

--Equal To 10
SELECT * FROM Production.Product
WHERE ListPrice = 10;

--Not Equal To 10
SELECT * FROM Production.Product
WHERE ListPrice <> 10;

-- Practices 

SELECT * FROM HumanResources.vEmployee

-- Filter on first name is equal to chris
SELECT * FROM HumanResources.Employee
WHERE FirstName = 'Chris';


-- Filter on first name is not equal to chris
SELECT * FROM HumanResources.Employee
WHERE FirstName <> 'Chris';

-- Filtering Dates
-- Filter on BirthDate is greater or equal to  '1980-01-01'
SELECT * FROM HumanResources.Employee
WHERE BirthDate >= '1980-01-01';


-- Filter on BirthDate is less than '1980-01-01'
SELECT * FROM HumanResources.Employee
WHERE BirthDate < '1980-01-01';

-- Complex Where Clauses
-- AND / OR
-- Filter on BirthDate is greater or equal to  '1980-01-01' AND are female
SELECT * FROM HumanResources.Employee
WHERE BirthDate >= '1980-01-01' AND Gender = 'F';

-- Filter Employee on marital status is single OR married and male
SELECT * FROM HumanResources.Employee 
WHERE MaritalStatus = 'S' AND Gender = 'M'


-- OR Operator , Returns all rows where the first name is Chris or the last name is Smith, only one of the conditions needs to be true.
SELECT * FROM HumanResources.Employee 
WHERE MaritalStatus = 'S' OR Gender = 'M'

-- AND and OR Operator

SELECT * FROM HumanResources.Employee 
WHERE (MaritalStatus = 'S' AND Gender = 'M') OR OrganizationLevel = 4


-- Symbolic logic , use parenthesis to group conditions together and determine the order of operations.
--parenthesis to force the order of operations
SELECT * FROM HumanResources.Employee 
WHERE MaritalStatus = 'S' AND (Gender = 'M' OR OrganizationLevel = 4)


-- And Complexity 
SELECT * FROM Production.Product 
WHERE (ListPrice > 100 AND Color = 'RED') OR StandardCost > 30


SELECT * FROM Production.Product 
WHERE ListPrice > 100 AND (Color = 'RED' OR StandardCost > 30)


SELECT * FROM HumanResources.vEmployeeDepartment 
WHERE Department = 'Research and Development' OR (StartDate < '1/1/2005' AND Department = 'Executive')


SELECT
	* 
FROM 
	Sales.vStoreWithDemographics 
WHERE
	(AnnualSales > 1000000 and BusinessType = 'OS')
OR
	( YearOpened < 1990 AND SquareFeet > 40000 AND NumberEmployees > 10)


-- IN and NOT IN and BETWEEN and NOT BETWEEN and wildcards

SELECT * FROM HumanResources.vEmployee 
WHERE FirstName IN ('Chris', 'Steve', 'Michael', 'Thomas')

SELECT * FROM Production.Product 
WHERE Color IN ('Red', 'Black', 'Blue')

-- Between and Not Between
SELECT * FROM Sales.vStoreWithDemographics 
WHERE AnnualSales BETWEEN 1000000 AND 2000000


SELECT * FROM Production.Product 
WHERE ListPrice BETWEEN 10 AND 20

SELECT * FROM Production.Product 
WHERE ListPrice NOT BETWEEN 10 AND 20

-- Wildcards
-- % is a wildcard that represents zero or more characters
-- _ is a wildcard that represents a single character

SELECT * FROM HumanResources.vEmployee 
WHERE FirstName LIKE 'Mi%' -- % is a wildcard that represents zero or more characters

--bracket expression
SELECT * FROM HumanResources.vEmployee 
WHERE FirstName LIKE 'D[a,o]n'

--caret expression
SELECT * FROM HumanResources.vEmployee 
WHERE FirstName LIKE 'D[^a,o]n'

--character range
SELECT * FROM HumanResources.vEmployee 
WHERE FirstName LIKE 'D[a-z]n'


SELECT * FROM HumanResources.vEmployee 
WHERE FirstName LIKE '%s' -- some number of characters  

SELECT * FROM HumanResources.vEmployee 
WHERE FirstName LIKE '%ch_' 

SELECT * FROM Production.Product 
WHERE Name LIKE 'Mountain%'

SELECT * FROM Production.Product 
WHERE Name LIKE 'Mountain-200%'

SELECT * FROM Production.Product 
WHERE Name LIKE 'Mountain-200_%'

SELECT * FROM Production.Product 
WHERE Name LIKE 'Mountain-200[_]%'

-- null values 
-- null is a special value that represents an unknown value
-- null is not equal to anything, not even another null value

SELECT * FROM HumanResources.Employee 
WHERE MiddleName IS NULL

SELECT * FROM HumanResources.Employee 
WHERE MiddleName IS NOT NULL



-- Practice Problems 
/*
1) Return	the	FirstName	and	LastName	columns	from	Person.Person	where	the	
FirstName	column	is	equal	to	“Mark”
2) Find	the	top	100	rows	from	Production.Product	where	the	ListPrice	is	not	equal	to	
0.00
3) Return	all	rows	and	columns	from	the	view	HumanResources.vEmployee	where	the	
employee’s	last	name	starts	with	a	letter	less	than	“D”
4) Return	all	rows	and	columns	from	Person.StateProvince	where	the	
CountryRegionCode	column	is	equal	to	“CA”
5) Return	the	FirstName	and	LastName	columns	from	the	view	
Sales.vIndividualCustomer	where	the	LastName	is	equal	to	“Smith”.		Give	the	
column	alias	“Customer	First	Name”	and	“Customer	Last	Name”	to	the	FirstName	
and	LastName	columns	respectively.
6) Using	the	Sales.vIndividualCustomer	view,	find	all	customers	with	a	
CountryRegionName	equal	to	“Australia”	or	all	customers	who	have	a	
PhoneNumberType	equal	to	“Cell”	and	an	EmailPromotion	column	value	equal	to	0.		
(Hint:	the	correct	query	requires	the	use	of	parentheses	in	your	WHERE	clause)
7) Find	all	employees	from	the	view	HumanResources.vEmployeeDepartment	who	
have	a	Department	column	value	in	the	list	of:	“Executive”,	“Tool	Design”,	and	
“Engineering”.		Complete	this	query	twice	– once	using	the	IN	operator	in	the	
WHERE	clause	and	a	second	time	using	multiple	OR	operators.
8) Using	HumanResources.vEmployeeDepartment,	find	all	employees	who	have	a	
StartDate	between	July	1,	2000	and	June	30,	2002.		Complete	this	query	twice	– once	
using	the	BETWEEN	operator	and	then	by	using	a	combination	of	the	“greater	than	
or	equal	to” and	“less	than	or	equal	to” operators.
9) Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	starts	
with	the	letter	“R”.		(Hint:	a	wildcard	character	can	assist	you	with	this	query)
10) Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	ends	
with	the	letter	“r”.		(Hint:	a	wildcard	character	can	assist	you	with	this	query)
11) Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	is	
either	“Lopez”,	“Martin”,	or	“Wood”	and	whose	FirstName	starts	with	any	letter	
between	“C”	and	“L”	in	the	alphabet.	(Hint:	multiple	wildcard	characters	will	be	used	
in	this	query)
12) Return	all	columns	from	the	Sales.SalesOrderHeader	table	for	all	sales	that	are	
associated	with	a	sales	person.		That	is,	return	all	rows	where	the	SalesPersonID	
column	does	not	contain	a	NULL	value.
13) Return	the	SalesPersonID	and	TotalDue	columns	from	Sales.SalesOrderHeader	for	
all	sales	that	do	not	have	a	NULL	value	in	the	SalesPersonID	column	and	whose	
TotalDue	value	exceeds	$70,000.
*/

-- 1) Return	the	FirstName	and	LastName	columns	from	Person.Person	where	the
-- FirstName	column	is	equal	to	“Mark”
SELECT FirstName, LastName FROM Person.Person
WHERE FirstName = 'Mark'

-- 2) Find	the	top	100	rows	from	Production.Product	where	the	ListPrice	is	not	equal	to
-- 0.00
SELECT TOP 100 * FROM Production.Product
WHERE ListPrice <> 0.00

-- 3) Return	all	rows	and	columns	from	the	view	HumanResources.vEmployee	where	the
-- employee’s	last	name	starts	with	a	letter	less	than	“D”
SELECT * FROM HumanResources.vEmployee
WHERE LastName < 'D'

-- 4) Return	all	rows	and	columns	from	Person.StateProvince	where	the
-- CountryRegionCode	column	is	equal	to	“CA”
SELECT * FROM Person.StateProvince
WHERE CountryRegionCode = 'CA'

-- 5) Return	the	FirstName	and	LastName	columns	from	the	view
-- Sales.vIndividualCustomer	where	the	LastName	is	equal	to	“Smith”.		Give	the
-- column	alias	“Customer	First	Name”	and	“Customer	Last	Name”	to	the	FirstName
-- and	LastName	columns	respectively.
SELECT FirstName AS 'Customer First Name', LastName AS 'Customer Last Name' FROM Sales.vIndividualCustomer
WHERE LastName = 'Smith'

-- 6) Using	the	Sales.vIndividualCustomer	view,	find	all	customers	with	a
-- CountryRegionName	equal	to	“Australia”	or	all	customers	who	have	a
-- PhoneNumberType	equal	to	“Cell”	and	an	EmailPromotion	column	value	equal	to	0.
-- (Hint:	the	correct	query	requires	the	use	of	parentheses	in	your	WHERE	clause)
SELECT * FROM Sales.vIndividualCustomer
WHERE CountryRegionName = 'Australia' OR (PhoneNumberType = 'Cell' AND EmailPromotion = 0)


-- 7) Find	all	employees	from	the	view	HumanResources.vEmployeeDepartment	who
-- have	a	Department	column	value	in	the	list	of:	“Executive”,	“Tool	Design”,	and
-- “Engineering”.		Complete	this	query	twice	– once	using	the	IN	operator	in	the
-- WHERE	clause	and	a	second	time	using	multiple	OR	operators.
SELECT * FROM HumanResources.vEmployeeDepartment
WHERE Department IN ('Executive', 'Tool Design', 'Engineering')

SELECT * FROM HumanResources.vEmployeeDepartment
WHERE Department = 'Executive' OR Department = 'Tool Design' OR Department = 'Engineering'

-- 8) Using	HumanResources.vEmployeeDepartment,	find	all	employees	who	have	a
-- StartDate	between	July	1,	2000	and	June	30,	2002.		Complete	this	query	twice	– once
-- using	the	BETWEEN	operator	and	then	by	using	a	combination	of	the	“greater	than
-- or	equal	to” and	“less	than	or	equal	to” operators.
SELECT * FROM HumanResources.vEmployeeDepartment
WHERE StartDate BETWEEN '2000-07-01' AND '2002-06-30'

SELECT * FROM HumanResources.vEmployeeDepartment
WHERE StartDate >= '2000-07-01' AND StartDate <= '2002-06-30'

-- 9) Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	starts
-- with	the	letter	“R”.		(Hint:	a	wildcard	character	can	assist	you	with	this	query)
SELECT * FROM Sales.vIndividualCustomer
WHERE LastName LIKE 'R%'

-- 10) Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	ends
-- with	the	letter	“r”.		(Hint:	a	wildcard	character	can	assist	you	with	this	query)
SELECT * FROM Sales.vIndividualCustomer
WHERE LastName LIKE '%r'

-- 11) Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	is
-- either	“Lopez”,	“Martin”,	or	“Wood”	and	whose	FirstName	starts	with	any	letter
-- between	“C”	and	“L”	in	the	alphabet.	(Hint:	multiple	wildcard	characters	will	be	used
-- in	this	query)
SELECT * FROM Sales.vIndividualCustomer
WHERE (LastName = 'Lopez' OR LastName = 'Martin' OR LastName = 'Wood') AND FirstName LIKE '[C-L]%'

-- 12) Return	all	columns	from	the	Sales.SalesOrderHeader	table	for	all	sales	that	are
-- associated	with	a	sales	person.		That	is,	return	all	rows	where	the	SalesPersonID
-- column	does	not	contain	a	NULL	value.
SELECT * FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL

-- 13) Return	the	SalesPersonID	and	TotalDue	columns	from	Sales.SalesOrderHeader	for
-- all	sales	that	do	not	have	a	NULL	value	in	the	SalesPersonID	column	and	whose
-- TotalDue	value	exceeds	$70,000.
SELECT SalesPersonID, TotalDue FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL AND TotalDue > 70000


