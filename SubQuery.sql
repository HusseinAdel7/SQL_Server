-- =============================================================================
-- List all suppliers with the number of products they offer.
SELECT CompanyName, number_of_products = (SELECT COUNT(P.id)FROM [Product] P WHERE P.SupplierId = S.Id)
FROM Supplier S



-- =============================================================================
-- List products with order quantities greater than 100.
SELECT ProductName
FROM Product
WHERE Id IN (SELECT ProductId FROM OrderItem WHERE Quantity > 100)



-- =============================================================================
-- List all customers with their total number of orders.
SELECT FirstName, LastName, OrderCount = (SELECT COUNT(O.id) FROM [Order] O WHERE O.CustomerId = C.Id)
FROM Customer C

