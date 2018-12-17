CREATE OR REPLACE FUNCTION createorder(
 	in CustID             INTEGER ,
 	in itemID             INTEGER ,
        in qty            INTEGER ,
	in date_processed  DATE,
	in note            VARCHAR , 
	in order_date      DATE  ) RETURNS INTEGER AS 
$$
Declare
    result INTEGER;
    temp_result2 ord_contains;
    temp_result Ord;
BEGIN
	SET Transaction READ WRITE;
        
        insert into ord (CID,date_processed,note,order_date) values(CustID, date_processed, note, order_date );
        select *  into temp_result from Ord o where not exists (select oid  from Ord o2 where o2.oid > o.oid );
        
        result = temp_result.oid;
        RETURN result;
EXCEPTION
        WHEN others THEN
	raise 'createorder() failed due to  %', SQLERRM; 
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION orderitem(
 	in ordID             INTEGER ,
 	in itemID             INTEGER ,
        in qty            INTEGER ) RETURNS void AS 
$$
Declare
    result INTEGER;
    temp_result item;
BEGIN
	SET Transaction READ WRITE;
        
        select * into temp_result from item i where i.IID = itemID;
        result = temp_result.price;
        insert into ord_contains(OID,IID,quantity,s_price) values(ordID,itemID,qty,result);

EXCEPTION
        WHEN others THEN
	raise 'orderitem() failed due to  %', SQLERRM; 
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION deleteitem(
 	in itemID          INTEGER,
        in ordID INTEGER ) RETURNS void AS 
$$
Declare
    result INTEGER;
    temp_result ord_contains;
BEGIN
	SET Transaction READ WRITE;
        
        delete from ord_contains where IID = itemID AND oid = ordID;
EXCEPTION
        WHEN others THEN
	raise 'deleteitem() failed due to  %', SQLERRM; 
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION averageprice(
 	in N         INTEGER ) RETURNS INTEGER AS 
$$
Declare
    total INTEGER :=0;
    temp_result item;
    tmp INTEGER;
BEGIN
	SET Transaction READ WRITE;


        select *  into temp_result from item i where not exists (select iid  from item i2 where i2.iid > i.iid );
        tmp = temp_result.iid - N;
        select avg(price) into total from item where iid < temp_result.iid and iid > tmp ; 
        return total;
EXCEPTION
        WHEN others THEN
	raise 'deleteitem() failed due to  %', SQLERRM; 
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION lesserDate(
       in date1 date,
       in date2 date,
       out lesser date
) AS $$
BEGIN
  lesser = least(date1::date, date2::date);
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION greaterDate(
       in date1 date,
       in date2 date,
       out greater date
) AS $$
BEGIN
  greater = greatest(date1::date, date2::date);
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION bestSellersBetweenDates(
        in date1 date,
        in date2 date
)
RETURNS TABLE (
        
        Amount_Sold BIGINT,
        Item_Name VARCHAR
)
AS $$
BEGIN
  RETURN QUERY 
  SELECT count(IID) as sold, Iname as itemName 
  FROM Ord_contains natural join item natural join ord
  WHERE ord.date_processed > lesserDate(date1, date2) AND ord.date_processed < greaterDate(date1, date2)
  group by itemName
  order by sold desc;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION totalSalesBetweenDates(
        in date1 date,
        in date2 date
  )
  RETURNS TABLE (
          total_revenue BIGINT,
          total_orders BIGINT,
          start_month date
  )
  AS $$
  BEGIN 
    RETURN QUERY 
    SELECT SUM(amount) AS total, count(PAID) as totalOrders, date1::date
    FROM payment natural join ord
    WHERE ord.date_processed > lesserDate(date1, date2) AND ord.date_processed < greaterDate(date1, date2)
    ;
    END;
    $$ LANGUAGE plpgsql;











/*
CREATE OR REPLACE FUNCTION getorders(
 	in CustID             INTEGER ,
        in order_date1      DATE  ,
	in order_date2      DATE  ) RETURNS INTEGER AS 
$$
Declare
    result INTEGER;
    temp_result vOrders;
BEGIN
	SET Transaction READ WRITE;
        
        select *  into temp_result from vOrders o where OID = CustID;
    
        result = temp_result.oid;
        RETURN result;
EXCEPTION
        WHEN others THEN
	raise 'getorders() failed due to  %', SQLERRM; 
END;
$$ LANGUAGE plpgsql;
*/