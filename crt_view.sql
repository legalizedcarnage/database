CREATE OR REPLACE View allTables AS
SELECT  tablename tname FROM  pg_tables
WHERE tableowner = 'games'
;

CREATE OR REPLACE View vOrders AS
SELECT  c.name, i.iname, oc.quantity, o.order_date 
FROM Item i NATURAL JOIN Ord_contains oc NATURAL JOIN Ord o NATURAL JOIN Customer c
;

CREATE OR REPLACE View employeeList AS
SELECT  e.eid, e.name, e.phone
FROM employee e 
;

CREATE OR REPLACE View pendingOrders AS
SELECT s.state AS Current_Status, o.order_date, o.oid, i.Iname, i.IID, oc.quantity, c.street, c.num, c.city, c.state, c.zip
FROM status s natural join ord o natural join Ord_contains oc natural join item i cross join customer c 
WHERE s.state = 'Pending' AND c.CID = o.CID
;

CREATE OR REPLACE View bestSellers AS
SELECT count(IID) as sold, Iname as itemName from Ord_contains natural join item
group by itemName
order by sold desc
LIMIT 10;

CREATE OR REPLACE View totalSales AS
SELECT SUM(amount) AS total, count(PAID) as totalOrders from payment
;
