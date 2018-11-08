CREATE TABLE IF NOT EXISTS Item (
        IID         INTEGER NOT NULL,  -- SMALL : Oracle NUMBER(5, 0)
        type        VARCHAR(10),        -- VARCHAR: Oracle VARCHAR2()
        name        VARCHAR(30),
        condition   VARCHAR(4),
        maker       VARCHAR(10),
        msrb        CHAR(2),
	PRIMARY KEY (IID)
     )  TABLESPACE ezdata ;
CREATE TABLE  IF NOT EXISTS Customer (
	CID	            INTEGER	 NOT NULL,
	name	        VARCHAR(20)	 NOT NULL,
 	street          VARCHAR(10)   NOT NULL,
 	num             SMALLINT NOT NULL,
 	city	        VARCHAR(10) NOT NULL,
 	state           CHAR(2) NOT NULL, -- oracle NUMBER((3,0)
    zip             SMALLINT NOT NULL,
    phone           INTEGER,
	CONSTRAINT pk_Customer PRIMARY KEY (CID)

     )  TABLESPACE ezdata ;
CREATE TABLE  IF NOT EXISTS Warehouse (
	WID	            INTEGER	 NOT NULL,
	name	        VARCHAR(20)	 NOT NULL,
 	street          VARCHAR(10)   NOT NULL,
 	num             SMALLINT NOT NULL,
 	city	        VARCHAR(10) NOT NULL,
 	state           CHAR(2) NOT NULL, -- oracle NUMBER((3,0)
    zip             SMALLINT NOT NULL,
	CONSTRAINT pk_Warehouse PRIMARY KEY (WID)

     )  TABLESPACE ezdata ;
CREATE TABLE  IF NOT EXISTS Warehouse_inventory (
	WID	            INTEGER    NOT NULL,
    IID         INTEGER NOT NULL,
 	quantity        VARCHAR(10) NOT NULL,
	PRIMARY KEY (WID,IID),
    CONSTRAINT fk_WarehouseI_warehouse FOREIGN KEY (WID)
			      REFERENCES Warehouse(WID)
			      ON DELETE CASCADE
			      ON UPDATE CASCADE,
    CONSTRAINT fk_WarehouseI_Item FOREIGN KEY (IID)
			      REFERENCES Item(IID)
			      ON DELETE CASCADE
			      ON UPDATE CASCADE


     )  TABLESPACE ezdata ;
CREATE TABLE  IF NOT EXISTS Shipper (
	SHID	            INTEGER	 NOT NULL,	
	name	        VARCHAR(20)	 NOT NULL,
	CONSTRAINT pk_Shipper PRIMARY KEY (SHID)	
     )  TABLESPACE ezdata ;
CREATE TABLE  IF NOT EXISTS Employee (
	EID	            INTEGER	 NOT NULL,
	WID				INTEGER	 NOT NULL,
	name	        VARCHAR(20)	 NOT NULL,
 	street          VARCHAR(10)   NOT NULL,
 	num             SMALLINT NOT NULL,
 	city	        VARCHAR(10) NOT NULL,
 	state           CHAR(2) NOT NULL, -- oracle NUMBER((3,0)
    zip             SMALLINT NOT NULL,
    phone           INTEGER,
	
	CONSTRAINT pk_Employee PRIMARY KEY (EID),
	CONSTRAINT fk_Employee_warehouse FOREIGN KEY (WID)
			      REFERENCES Warehouse(WID)
			      ON DELETE CASCADE
			      ON UPDATE CASCADE


     )  TABLESPACE ezdata ;
 CREATE TABLE IF NOT EXISTS  Ord (
	OID	            INTEGER NOT NULL,  -- mysl: INT/INTEGER Oracle NUMBER(10,0)
 	CID             INTEGER NOT NULL,
 	EID             INTEGER NOT NULL,
	date_processed  DATE,
	note            VARCHAR(15) default '' , 
	order_date      DATE ,
	PRIMARY KEY (OID),
    CONSTRAINT fk_Ord_Customer FOREIGN KEY (CID)
			      REFERENCES Customer(CID)
			      ON DELETE CASCADE
			      ON UPDATE CASCADE,
    CONSTRAINT fk_Ord_Manager FOREIGN KEY (EID)
			      REFERENCES Employee(EID)
			      ON DELETE CASCADE
			      ON UPDATE CASCADE

    )  TABLESPACE ezdata ;
	
 CREATE TABLE IF NOT EXISTS  Ord_contains (
	OID		    INTEGER,
	IID		    INTEGER NOT NULL,
 	quantity        VARCHAR(10) NOT NULL,
 	s_price       VARCHAR(50)  ,
	PRIMARY KEY (OID,IID),
    CONSTRAINT fk_Ordc_Ord FOREIGN KEY (OID)
			      REFERENCES Ord(OID)
			      ON DELETE CASCADE
			      ON UPDATE CASCADE,
    CONSTRAINT fk_Ordc_Item FOREIGN KEY (IID)
			      REFERENCES Item(IID)
			      ON DELETE CASCADE
			      ON UPDATE CASCADE

     )  TABLESPACE ezdata ;


 CREATE TABLE  IF NOT EXISTS Payment (
	PID	            INTEGER    NOT NULL,
	OID	            INTEGER    NOT NULL,
 	gift_num        INTEGER     , 
 	card_num        INTEGER     , 
	card_expire     INTEGER     , 
 	card_security   INTEGER     , 
 	check_number    INTEGER     , 
 	check_route     INTEGER     , 
 	check_acc       INTEGER     ,  
 	amount          INTEGER    NOT NULL,  
	-- table constraints
	CONSTRAINT pk_Payment PRIMARY KEY (PID),
	CONSTRAINT fk_Payment_Ord FOREIGN KEY (OID)
				      REFERENCES Ord(OID)
				      ON DELETE CASCADE
				      ON UPDATE CASCADE
     )  TABLESPACE ezdata ;
CREATE TABLE  IF NOT EXISTS Supplier (
	SPID	            INTEGER	 NOT NULL,
	name	        VARCHAR(20)	 NOT NULL,
 	street          VARCHAR(10)   NOT NULL,
 	num             SMALLINT NOT NULL,
 	city	        VARCHAR(10) NOT NULL,
 	state           CHAR(2) NOT NULL, -- oracle NUMBER((3,0)
    zip             SMALLINT NOT NULL,
	CONSTRAINT pk_Supplier PRIMARY KEY (SPID)

     )  TABLESPACE ezdata ;

CREATE TABLE  IF NOT EXISTS Supply_Ord (
	SID	            INTEGER    NOT NULL,
	EID	            INTEGER    NOT NULL,
 	SPID       INTEGER  NOT NULL   , 
 	WID        INTEGER NOT NULL    , 
	supply_date     INTEGER     ,  
	-- table constraints
	CONSTRAINT pk_supplyOrd PRIMARY KEY (SID),
    CONSTRAINT fk_supplyo_supplier FOREIGN KEY (SPID)
				      REFERENCES Supplier(SPID)
				      ON DELETE CASCADE
				      ON UPDATE CASCADE,                 
    CONSTRAINT fk_supplyo_manager FOREIGN KEY (EID)
				      REFERENCES Employee(EID)
				      ON DELETE CASCADE
				      ON UPDATE CASCADE,
	CONSTRAINT fk_supplyo_warehouse FOREIGN KEY (WID)
				      REFERENCES Warehouse(WID)
				      ON DELETE CASCADE
				      ON UPDATE CASCADE
                      
     )  TABLESPACE ezdata ;


CREATE TABLE  IF NOT EXISTS Supply_contains (
    SID	            INTEGER    NOT NULL,
    IID         INTEGER NOT NULL,
 	quantity        VARCHAR(10) NOT NULL,
 	p_price       VARCHAR(50)  ,
	PRIMARY KEY (SID,IID),
    CONSTRAINT fk_Supplyc_Supply FOREIGN KEY (SID)
			      REFERENCES Supply_Ord(SID)
			      ON DELETE CASCADE
			      ON UPDATE CASCADE,
    CONSTRAINT fk_Supplyc_Item FOREIGN KEY (IID)
			      REFERENCES Item(IID)
			      ON DELETE CASCADE
			      ON UPDATE CASCADE

     )  TABLESPACE ezdata ;
 

CREATE TABLE  IF NOT EXISTS Status (
	OID		 	INTEGER NOT NULL,
	state		VARCHAR(10) DEFAULT 'pending',
	notes		VARCHAR(20),
	CONSTRAINT pk_Status PRIMARY KEY (OID),
	CONSTRAINT fk_Status_Ord FOREIGN KEY (OID)
			    REFERENCES Ord(OID)
			    ON DELETE CASCADE
			    ON UPDATE CASCADE

     )  TABLESPACE ezdata ;
CREATE TABLE  IF NOT EXISTS Package (
	PID		 	INTEGER NOT NULL,
	OID		 	INTEGER NOT NULL,
	EID		 	INTEGER NOT NULL,
	SHID		 	INTEGER NOT NULL,
	weight		 	INTEGER NOT NULL,
	size		 	VARCHAR(10) NOT NULL,

	CONSTRAINT pk_Package PRIMARY KEY (PID)	,
	CONSTRAINT fk_Package_Ord FOREIGN KEY (OID)
			    REFERENCES Ord(OID)
			    ON DELETE CASCADE
			    ON UPDATE CASCADE,
	CONSTRAINT fk_Package_employee FOREIGN KEY (EID)
			    REFERENCES Employee(EID)
			    ON DELETE CASCADE
			    ON UPDATE CASCADE,
	CONSTRAINT fk_Package_shipper FOREIGN KEY (SHID)
			    REFERENCES Shipper(SHID)
			    ON DELETE CASCADE
			    ON UPDATE CASCADE
     )  TABLESPACE ezdata ;
CREATE TABLE  IF NOT EXISTS Package_contains (
	PID	            INTEGER    NOT NULL,
    IID         INTEGER NOT NULL,
 	quantity        VARCHAR(10) NOT NULL,
	PRIMARY KEY (PID,IID),
    CONSTRAINT fk_Packagec_package FOREIGN KEY (PID)
			      REFERENCES Package(PID)
			      ON DELETE CASCADE
			      ON UPDATE CASCADE,
    CONSTRAINT fk_Packagec_Item FOREIGN KEY (IID)
			      REFERENCES Item(IID)
			      ON DELETE CASCADE
			      ON UPDATE CASCADE


     )  TABLESPACE ezdata ;

