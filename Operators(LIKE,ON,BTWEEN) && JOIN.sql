--=================
--  Like Operator

select FirstName
from Customer
where FirstName like 'a__'

select city
from Supplier
where city like 'a%'

select ProductName
from Product
where ProductName like '%a'

select ProductName
from Product
where ProductName like '%ov%'



--==============================================
--  IN Operator , NOT IN Operator and SUB QUERY

select FirstName,Country
from Customer
where Country in ('Germany','UK','Spain')
order by Country

select FirstName,Country
from Customer
where Country not in ('Germany','UK','Spain')
order by Country

select ProductName,UnitPrice
from Product
where UnitPrice  in (SELECT UnitPrice FROM OrderItem)



--=============================================
--  Between Operator  and NOT Between Operator 
select ProductName,UnitPrice
from Product
where ( UnitPrice  between 1 and 20)

select ProductName,UnitPrice
from Product
where ( UnitPrice not between 1 and 20)





--**************************************************************************************************************
--##############################################################################################################
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--__________________________________________ JOIN ______________________________________________________________ 




--===========================================================================
---- List all suppliers with their products, sorted by company and product.
SELECT CompanyName,ProductName
FROM Supplier inner join Product
On Supplier.Id = Product.SupplierId
ORDER BY CompanyName,ProductName



--=============================================================================
--  List all products and their total sales, including those that did not sell.
SELECT ProductName, SUM(I.UnitPrice) AS Total
FROM Product P LEFT OUTER JOIN OrderItem I 

ON P.Id = I.ProductId
GROUP BY ProductName



--======================================================================================================
-- List all customers and the total amount they spent irrespective whether they placed any orders or not.
SELECT FirstName, LastName,City,Country,Phone,SUM(TotalAmount) as TotalAmount
FROM Customer LEFT OUTER JOIN[Order] 
ON Customer.Id = [Order].CustomerId
GROUP BY FirstName,LastName,City,Country,Phone




--============================================
-- List customers that have not placed orders.
SELECT FirstName ,TotalAmount 
FROM [Order] Right OUTER JOIN Customer
ON Customer.Id = [Order].CustomerId
WHERE TotalAmount IS NULL



--==============================================
-- Match all customers and suppliers by country.
SELECT FirstName,  C.Country AS CustomerCountry, S.Country AS SupplierCountry
FROM Customer C  FULL OUTER JOIN Supplier S 
ON C.Country = S.Country
ORDER BY C.Country, S.Country



--=====================================================================
--  List all suppliers with products that have sold, sorted by supplier.
SELECT DISTINCT CompanyName, ProductName
FROM Supplier S JOIN Product P ON S.Id = P.SupplierId JOIN OrderItem I ON P.Id = I.ProductId
ORDER BY CompanyName



--=====================================================================================
--  List all orders, sorted by order number, with product names, quantities, and prices.
SELECT OrderNumber,  ProductName, Quantity, I.UnitPrice 
FROM [Order] O JOIN OrderItem I ON O.Id = I.OrderId JOIN Product P ON P.Id = I.ProductId
ORDER BY OrderNumber 



--============================================================================================
--  List all products that have sold. Include supplier and order numbers. Sort by order number.
SELECT OrderNumber, CompanyName, ProductName
FROM Product P JOIN Supplier S ON S.Id = P.SupplierId JOIN OrderItem I ON P.Id = I.ProductId JOIN [Order] O ON O.Id = I.OrderId
ORDER BY OrderNumber



--==================================================================================================
--  List all orders, sorted by order number, with supplier names, product names, quantities, prices.
SELECT OrderNumber,CompanyName,ProductName,Quantity, I.UnitPrice 
FROM Product P JOIN Supplier S ON S.Id=P.SupplierId	JOIN OrderItem I ON P.Id=I.ProductId JOIN [Order] O ON I.OrderId=O.Id
ORDER BY OrderNumber

