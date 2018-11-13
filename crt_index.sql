DROP   INDEX  IF  EXISTS     idx_Customer_name;
CREATE INDEX   IF NOT EXISTS idx_Customer_name
	ON Customer(name)
;
DROP   INDEX IF EXIStS       idx_Order_customer ;
CREATE INDEX IF NOT EXISTS   idx_Order_customer
	ON Ord(cid)
;
DROP   INDEX IF EXIStS       idx_SOrder_supplier ;
CREATE INDEX IF NOT EXISTS   idx_SOrder_supplier
	ON Supply_ord(spid)
;