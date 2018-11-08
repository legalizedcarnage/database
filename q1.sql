SELECT c.quantity, c.s_price FROM Ord_contains c, Ord o WHERE o.Oid = c.Oid AND o.Order_date = '2018-4-1';
