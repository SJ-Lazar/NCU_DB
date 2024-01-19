

--  A Literal select statement is a select statement that does not use a table.
--  It is used to return a single value or a set of values that are not stored in a table.

-- SELECT is a keyword that tells the database that you want to return data.

SELECT 'Brewster Knowlton' -- string incated by single quotes

SELECT 123 -- integer

SELECT 123.456 -- decimal

--  The following select statement returns the current date and time.
SELECT GETDATE() AS CurrentDateTime;


-- SELECT More Columns 
SELECT 'Brewster' AS FirstName, 'Knowlton' AS LastName, 123 AS SomeNumber, GETDATE() AS CurrentDateTime;


--Maths
SELECT 1 + 1 AS OnePlusOne;

-- Order of operations 
SELECT (5 * 5) - 3 AS FiveTimesFiveMinusThree;


-- Mathmatical Operators
SELECT 1 + 1 AS OnePlusOne, 2 * 2 AS TwoTimesTwo, 3 / 3 AS ThreeDividedByThree, 4 - 4 AS FourMinusFour;

--Mathmatical Experssions
SELECT 1 + 1 * 2 AS OnePlusOneTimesTwo, (1 + 1) * 2 AS OnePlusOneTimesTwoWithParenthesis;
