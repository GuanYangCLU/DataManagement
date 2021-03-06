/*Forum 4 SQL with SQL Server*/
/*IT 509-02 Data Management*/
/*Dr. Virginia ILIE*/
/*Yang, Guan*/
/*California Lutheran University*/

/*1*/
SELECT ProductID, SupplierID, UnitsInStock, Discontinued
FROM Products
WHERE SupplierID IN (2,12) AND Discontinued = 0 AND UnitsInStock <60
ORDER BY SupplierID, UnitsInStock DESC;

/*2*/
SELECT CompanyName, Region, Country
FROM Customers
WHERE Country != 'USA'
ORDER BY Region, CompanyName;

/*3*/
SELECT ProductID, ProductName
FROM Products AS P, Categories AS C
WHERE P.CategoryID = C.CategoryID AND C.CategoryName IN ('Beverages', 'Produce')
ORDER BY ProductName DESC;

/*4*/
SELECT CategoryID, AVG (UnitPrice) AS [Average Unit Price]
FROM Products
GROUP BY CategoryID
ORDER BY [Average Unit Price];

/*5*/
SELECT OrderID, SUM (Quantity) AS [Total Quantity]
FROM [Order Details]
GROUP BY OrderID
Having OrderID IN (10248, 10250, 10252)
ORDER BY [Total Quantity];

/*6*/
SELECT CompanyName, Country, ProductID, ProductName
FROM Products AS P, Suppliers AS S
WHERE P.SupplierID = S.SupplierID AND Country != 'USA'
ORDER BY Country, CompanyName, ProductName;