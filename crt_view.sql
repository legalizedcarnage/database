CREATE OR REPLACE View allTables AS
SELECT  tablename tname FROM  pg_tables
WHERE tableowner = 'games'
;

CREATE OR REPLACE View vOrders AS
SELECT  c.name, i.iname, oc.quantity, o.order_date 
FROM Item i NATURAL JOIN Ord_contains oc NATURAL JOIN Ord o NATURAL JOIN Customer c
;
