--1
\! echo 1) "Find price and  quantity of each item ordered on 4/1/18"
SELECT  c.quantity, c.s_price FROM Ord_contains c, Ord o WHERE o.Oid = c.Oid AND o.order_date = '2018-4-1';

--2
\! echo 2) "Find the most expensive item that was ordered with at least one other item"
SELECT DISTINCT i.* FROM Item i NATURAL JOIN Ord_contains c1 NATURAL JOIN Ord o1 WHERE 
EXISTS(SELECT c2.* FROM Ord_contains c2 WHERE c2.Oid = c1.Oid AND c1.Iid != c2.Iid ) AND 
NOT EXISTS (SELECT c3.* FROM Ord_contains c3 NATURAL JOIN Ord o WHERE c1.s_price < c3.s_price AND 
EXISTS(SELECT c4.* FROM Ord_contains c4 WHERE c3.Oid = c4.Oid AND c3.Iid != c4.Iid ));

--3
\! echo 3) "Find every item that was shipped by UPS between 6/1/18 and 7/1/18"
SELECT  DISTINCT i.* FROM Item i NATURAL JOIN Ord_contains 
NATURAL JOIN (SELECT * FROM Ord  where order_date > '2018-6-1' AND order_date < '2018-7-1' ) as o 
NATURAL JOIN Package NATURAL JOIN (SELECT * FROM Shipper WHERE name='UPS') as s;

--4
\! echo 4) "Find suppliers who have only supplied M rated games"
SELECT DISTINCT s.* FROM Supplier s 
WHERE NOT EXISTS (SELECT o.* FROM Supply_ord o NATURAL JOIN Supply_contains NATURAL JOIN Item 
WHERE msrb != 'M' AND o.SPID = s.SPID);

--5
\! echo 5) "Find customers who have placed an order that have not placed a new order in over a month"
SELECT DISTINCT c.* FROM Customer c NATURAL JOIN Ord 
WHERE NOT EXISTS(SELECT c2.* FROM Customer c2 NATURAL JOIN Ord WHERE order_date  > '2018-10-11' and c2.CID = c.CID);

--6
\! echo 6) "Find every order that was paid for with a gift card before 2018"
SELECT DISTINCT o.* FROM Ord o NATURAL JOIN Payment 
WHERE gift_num IS NOT NULL AND order_date <= '2017-12-31';

--7
\! echo 7) "Find every order sent in more than one package"
SELECT DISTINCT o.* FROM Ord o, Package p1 ,  Package p2 
WHERE p1.PID != p2.pid AND p1.Oid = o.Oid AND p2.Oid = o.Oid;

--8
\! echo 8) "Find customers who have only made one order who also did not pay with a gift card"
SELECT DISTINCT c.* FROM Customer c NATURAL JOIN Payment p NATURAL JOIN  Ord o 
WHERE NOT EXISTS ( SELECT o2.* FROM Ord o2 WHERE o2.Cid = c.Cid AND o2.Oid != o.Oid ) AND p.gift_num is NULL;

--9
\! echo 9) "Find customers who have made orders containing an item that cost > $100"
SELECT DISTINCT c.* FROM Customer c NATURAL JOIN Ord NATURAL JOIN Ord_contains WHERE s_price >= 100;

--10
\! echo 10) "Find the second most expensive item ordered in 2017"
SELECT DISTINCT i.* FROM Item i NATURAL JOIN Ord_contains c1 NATURAL JOIN Ord o1 
    WHERE o1.order_date < '2017-12-31' AND 
EXISTS (SELECT c2.*  FROM Ord_contains c2 NATURAL JOIN Ord o2 
    WHERE c1.s_price < c2.s_price AND o2.order_date < '2017-12-31' AND  
NOT EXISTS (SELECT c3.*  FROM Ord_contains c3 NATURAL JOIN Ord o3 
    WHERE c2.s_price < c3.s_price AND o3.order_date < '2017-12-31') AND 
NOT EXISTS (SELECT o4.* FROM Ord_contains c4 NATURAL JOIN Ord o4 
    where c4.s_price < c2.s_price AND c4.s_price > c1.s_price ));