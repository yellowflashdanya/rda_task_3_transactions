USE ShopDB; 

SET @orderDate = '2023-01-01';

SET @productId = '1';
SET @productCount = 1;

START TRANSACTION;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, @orderDate);

SET @orderId = LAST_INSERT_ID();

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUEs (@orderId, @productId, @productCount);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - @productCount
WHERE ID = @productId;

COMMIT; 