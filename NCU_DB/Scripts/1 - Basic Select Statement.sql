
-- Basic Select Statements
SELECT FirstName FROM Person.Person


-- Select firstName and lastName from Person.Person
-- Commas separate columns
SELECT FirstName, LastName FROM Person.Person


-- Select firstName lastName and middleName from Person.Person
SELECT FirstName, MiddleName, LastName FROM Person.Person

-- Top operator limits the number of rows returned, For Performance
SELECT TOP 500 FirstName, MiddleName, LastName FROM Person.Person


-- SELECT TOP 10% Of Rows
SELECT TOP 10 PERCENT FirstName, MiddleName, LastName FROM Person.Person


-- Select All Columns
SELECT * FROM Person -- astrisk means all columns

-- Select All Columns From Person.Person
SELECT TOP 100 * FROM Person.Person

-- Select Distinct Values
SELECT DISTINCT FirstName, MiddleName, LastName FROM Person.Person

-- Select Columns and Alias Them , how we see the column name in the result set does not change the column name in the table
SELECT FirstName AS 'First Name', MiddleName AS 'Middle Name', LastName AS 'Last Name' FROM Person.Person

--You can use single quotes or double quotes for aliasing
SELECT FirstName AS "First Name", MiddleName AS "Middle Name", LastName AS "Last Name" FROM Person.Person

-- You can use square brackets for aliasing
SELECT FirstName AS [First Name], MiddleName AS [Middle Name], LastName AS [Last Name] FROM Person.Person


-- Select a view 
-- A view is a virtual table based on the result-set of an SQL statement.
-- A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.
-- You can add SQL functions, WHERE, and JOIN statements to a view and present the data as if the data were coming from one single table.
SELECT * FROM HumanResources.vEmployee

SELECT FirstName, LastName, EmailAddress, PhoneNumber FROM Sales.vIndividualCustomer

-- The Difference Between SQL Views and Tables 
SELECT * FROM HumanResources.Employee

-- Basic Select Statements Practice Problems 

-- 1) Retrieve all rows from the HumanResources.Employee table. Return only the NationalIDNumber column.
SELECT NationalIDNumber FROM HumanResources.Employee

-- 2) Retrieve all rows from the HumanResources.Employee table. Return the NationalIDNumber and JobTitle columns.
SELECT NationalIDNumber, JobTitle FROM HumanResources.Employee

-- 3) Retrieve the top 20 percent of rows from the HumanResources.Employee table. Return the NationalIDNumber, JobTitle and BirthDate columns.
SELECT TOP 20 PERCENT NationalIDNumber, JobTitle, BirthDate FROM HumanResources.Employee

-- 4) Retrieve the top 500 rows from the HumanResources.Employee table. Return the NationalIDNumber, JobTitle and BirthDate columns. Give the NationalIDNumber column an alias, “SSN”, and the JobTitle column an alias, “Job Title”.
SELECT TOP 500 NationalIDNumber AS 'SSN', JobTitle AS 'Job Title', BirthDate FROM HumanResources.Employee

-- 5) Return all rows and all columns from the Sales.SalesOrderHeader table.
SELECT * FROM Sales.SalesOrderHeader

-- 6) Return the top 50 percent of rows and all columns from the Sales.Customer table.
SELECT TOP 50 PERCENT * FROM Sales.Customer


-- 7) Return the Name column from the Production.vProductAndDescription view. Give this column an alias “Product’s Name”.
SELECT Name AS "Product's Name" FROM Production.vProductAndDescription

-- 8) Return the top 400 rows from HumanResources.Department
SELECT TOP 400 * FROM HumanResources.Department

-- 9) Return all rows and columns from the table named Production.BillOfMaterials
SELECT * FROM Production.BillOfMaterials


-- 10) Return the top 1500 rows and columns from the view named Sales.vPersonDemographics
SELECT TOP 1500 * FROM Sales.vPersonDemographics

