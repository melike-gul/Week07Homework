-- Tüm ürünlerin adlarını ve birim fiyatlarını listeleyin.
SELECT ProductName, UnitPrice
FROM Products;

--Müşterilerin şirket adlarını ve bulundukları şehirleri alfabetik sırayla listeleyin.
SELECT CompanyName, City
FROM Customers
ORDER BY City;

--Çalışanların ad ve soyadlarını birleştirerek tam isimlerini listeleyin.
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;

--Stok miktarı 10'dan az olan ürünleri listeleyin.
SELECT ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock < 10;

--1998 yılında yapılan siparişleri listeleyin.
SELECT *
FROM Orders
WHERE YEAR(OrderDate) = 1998;

--Her bir kategorideki ürün sayısını bulun.
SELECT Categories.CategoryName, COUNT(Products.ProductID) AS ProductCount
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName;

--En pahalı 5 ürünü fiyatlarıyla birlikte listeleyin.
SELECT TOP 5 ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

--Her bir ülkedeki müşteri sayısını bulun ve müşteri sayısına göre azalan sırayla listeleyin.
SELECT Country, COUNT(CustomerID) AS CustomerCount
FROM Customers
GROUP BY Country
ORDER BY CustomerCount DESC;

--Nakliye ücreti 50'den fazla olan siparişleri listeleyin.
SELECT *
FROM Orders
WHERE Freight > 50;

--10-Her bir çalışanın toplam sipariş sayısını bulun.
-- SELECT Employees.EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName, COUNT(Orders.OrderID) AS OrderCount
-- FROM Orders
-- JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
-- GROUP BY Employees.EmployeeID, FullName;

--Ürünleri kategorileriyle birlikte listeleyin.
SELECT ProductName,Categories.CategoryName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID;

--Her bir siparişin toplam tutarını hesaplayın.
SELECT OrderID, SUM(UnitPrice * quantity) AS TotalAmount
FROM OrderDetails
GROUP BY OrderID;

--13-En çok satılan 5 ürünü ve satış miktarlarını listeleyin.

--Her bir müşterinin verdiği sipariş sayısını bulun.
SELECT Customers.CustomerID, Customers.CompanyName, COUNT(Orders.OrderID) AS OrderCount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.CompanyName;

--15- Hangi kargo şirketinin kaç sipariş taşıdığını listeleyin.
-- SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS OrderCount
-- FROM Orders
-- JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
-- GROUP BY Shippers.ShipperName

--16-Her bir çalışanın toplam satış tutarını hesaplayın.
-- SELECT Employees.EmployeeID, CONCAT(FirstName, ' ',LastName)AS FullName, SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalSales
-- FROM Orders
-- JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
-- JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
-- GROUP BY Employees.EmployeeID, FullName;

--Her bir kategorideki ürünlerin ortalama fiyatını bulun.
SELECT Categories.CategoryName, AVG(Products.UnitPrice) AS AveragePrice
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName;

--En az 5 sipariş veren müşterileri ve sipariş sayılarını listeleyin.
SELECT Customers.CustomerID, Customers.CompanyName, COUNT(Orders.OrderID) AS OrderCount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.CompanyName
HAVING COUNT(Orders.OrderID) >= 5;

--Her bir ülke için toplam satış tutarını hesaplayın.
SELECT Customers.CustomerID, Customers.CompanyName, COUNT(Orders.OrderID) AS OrderCount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.CompanyName
HAVING COUNT(Orders.OrderID) >=5;

--Siparişleri, sipariş tarihine göre yıllar ve aylar bazında gruplayarak toplam satış tutarlarını listeleyin.
SELECT YEAR(OrderDate) AS OrderYear,MONTH(OrderDate) AS OrderMonth, SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalSales
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY YEAR(OrderDate), Month(OrderDate);