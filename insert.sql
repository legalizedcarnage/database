INSERT INTO Customer (name,street,num,city,state,zip,phone)
VALUES ('Joe Schmoe','Goldfield Dr.',117,'Schaumburg','IL',60193,5551234),
('John doe','Honey creek lane',97,'wantagh','NY',11793,5554321),
('Jane doe','Water st',51,'Shrewsbury','MA',01545,5551111),
('Lazar Todorov','Eagle st',73,'Longview','TX',75604,5551212),
('Kristian Gunnarsen','Mayfield rd',8647,'Meadville','PA',16335,5552121),
('Nest Kelley','State ave',195,'Kings mountain','NC',28086,5559292),
('Fruzsina Bardsley','Kingston ave',9183,'Louisville','KY',40207,5554523),
('Bertha Bukowski','El Dorado ln',8688,'Fishers','IN',46037,5550192),
('Bertram Cormaic','Arch st',9965,'Trumbull','CT',06611,5551112),
('Heidi Hoover','Parker st',9954,'Sylvania','OH',43560,5556785);




INSERT INTO Item (type,Iname,condition,maker,msrb,console)
VALUES ('game','Minecraft','new','Mojang','E','xbox'), 
('Console','Xbox','new','Microsoft',NULL,'xbox'),
('game','Mario','used','Nintendo','E','switch'),
('game','Sonic','new','Sega','E','switch'),
('game','Pokemon','new','Gamefreak','E','switch'),
('game','Halo','new','Bungie','M','xbox'),
('game','Halo','used','Bungie','M','xbox'),
('game','Zelda','new','Nintendo','E','switch'),
('game','Halo 2','used','Bungie','M','xbox'),
('console','PS4','used','Sony',NULL,'playstation');


INSERT INTO Warehouse (name,street,num,city,state,zip)
VALUES ( 'Warehouse','Goldfield Dr.',117,'Schaumburg','IL',60193), 
('Place','Honey creek lane',97,'wantagh','NY',11793), 
('Store your stuff here','Water st',51,'Shrewsbury','MA',01545), 
('Another warehouse','Eagle st',73,'Longview','TX',75604), 
('Big building for storing stuff','Mayfield rd',8647,'Meadville','PA',16335), 
('Our warehouse','State ave',195,'Kings mountain','NC',28086), 
('Warehouse 2 electric boogaloo','Kingston ave',9183,'Louisville','KY',40207), 
('Werehouse','El Dorado ln',8688,'Fishers','IN',46037), 
('House','Arch st',9965,'Trumbull','CT',06611), 
('Werewolf','Parker st',9954,'Sylvania','OH',43560);


INSERT INTO Warehouse_inventory (WID,IID,quantity)
VALUES (1,1,10),
(2,2,10),
(3,3,10),
(4,4,10),
(5,5,10),
(6,6,10),
(7,7,10),
(8,8,10),
(9,9,10),
(10,10,10);

INSERT INTO Shipper (name)
VALUES ('UPS'), 
('USPS'), 
('Swift'),
('FedEx'), 
('Sterling'), 
('STI'), 
('Werner'), 
('Wilson'), 
('Xpress global'), 
('YRC freight');

INSERT INTO Employee (name,street ,num  ,city,state,zip,phone, WID)
VALUES ('Joe schmoe','Goldfield Dr.',117,'Schaumburg','IL',60193,5551234,3), 
('John doe','Honey creek lane',97,'wantagh','NY',11793,5554321,4), 
('Jane doe','Water st',51,'Shrewsbury','MA',01545,5551111,1), 
('Lazar Todorov','Eagle st',73,'Longview','TX',75604,5551212,2), 
('Kristian Gunnarsen','Mayfield rd',8647,'Meadville','PA',16335,5552121,8), 
('Nest Kelley','State ave',195,'Kings mountain','NC',28086,5559292,5), 
('Fruzsina Bardsley','Kingston ave',9183,'Louisville','KY',40207,5554523,9), 
('Bertha Bukowski','El Dorado ln',8688,'Fishers','IN',46037,5550192,10), 
('Bertram Cormaic','Arch st',9965,'Trumbull','CT',06611,5551112,6), 
('Heidi Hoover','Parker st',9954,'Sylvania','OH',43560,5556785,7);

INSERT INTO  Ord (	CID, 	EID,	date_processed  ,	note, 	order_date)
VALUES (1,1,'2017-10-21',NULL,'2017-10-21'),
(1,3,'2017-10-22',NULL,'2017-10-22'),
(2,5,'2017-10-25',NULL,'2017-10-25'),
(1,2,'2017-11-2',NULL,'2017-11-1'),
(3,4,'2018-1-12',NULL,'2018-1-10'),
(4,6,'2018-2-27',NULL,'2018-2-27'),
(5,7,'2018-4-1',NULL,'2018-4-1'),
(2,8,'2018-5-8','Closest warehouse A out of stock, sending to warehouse B. Ordering stock for warehouse A.','2018-5-8'),
(8,10,'2018-7-18',NULL,'2018-7-16'),
(6,9,'2018-10-23',NULL,'2018-10-23');


INSERT INTO  Ord_contains (OID,	IID, 	quantity, 	s_price)
VALUES(1,1,2,59),
(1,5,1,59),
(2,2,1,300),
(3,2,1,300),
(4,10,1,400),
(5,3,1,59),
(6,4,1,55),
(7,6,3,35),
(8,1,1,59),
(9,3,1,59),
(10,7,3,29);


INSERT INTO Payment (OID	 , 	gift_num,  	card_num, 	card_expire,  	card_security,check_number,  	check_route,  	check_acc,amount)
VALUES(1,NULL,'1111 2222 3333 4444',3/3/20,010,NULL,NULL,NULL,59),
(2,'1111 1111 1111 1111',NULL,NULL,NULL,NULL,NULL,NULL,50),
(2,NULL,'1234 1234 1234 1234',4/4/20,111,NULL,NULL,NULL,250),
(3,NULL,NULL,NULL,NULL,1234,74123,623467234,300),
(4,NULL,'4321 4321 4321 4321',7/6/21,791,NULL,NULL,NULL,400),
(5,NULL,'1212 1212 1212 1212',4/20/19,123,NULL,NULL,NULL,59),
(6,NULL,NULL,NULL,NULL,4321,14363,462346723,55),
(7,'1121 1121 1121 1121',NULL,NULL,NULL,NULL,NULL,NULL,35),
(8,NULL,NULL,NULL,NULL,1235,12345,562345234,59),
(9,NULL,NULL,NULL,NULL,1236,31435,123456789,59),
(10,NULL,'2222 2222 2222 2222',5/18/19,234,NULL,NULL,NULL,29);

INSERT INTO Supplier (name, 	street, 	num, 	city, 	state,     zip	)
VALUES (
'Microsoft','Goldfield Dr.',117,'Schaumburg','IL',60193),
('Sony','Honey creek lane',97,'wantagh','NY',11793),
('Nintendo','Water st',51,'Shrewsbury','MA',01545),
('Sega','Eagle st',73,'Longview','TX',75604),
('Company','Mayfield rd',8647,'Meadville','PA',16335),
('Blizzard ','State ave',195,'Kings mountain','NC',28086),
('Other company','Kingston ave',9183,'Louisville','KY',40207),
('Gamestor','Goldfield Dr.',117,'Schaumburg','IL',60193),
('walmart','Honey creek lane',97,'wantagh','NY',11793),
('target','Water st',51,'Shrewsbury','MA',01545);


INSERT INTO Supply_Ord (EID, 	SPID,  	WID, 	supply_date)
VALUES (1,1,1,'2017-10-25'),
(2,2,1,'2017-10-25'),
(3,3,2,'2017-10-25'),
(4,4,2,'2017-10-26'),
(5,5,2,'2018-1-2'),
(6,6,1,'2018-5-3'),
(7,7,2,'2018-6-5'),
(8,8,1,'2018-6-17'),
(9,9,1,'2018-8-21'),
(10,10,1,'2018-10-25');


INSERT INTO Status (	OID,	state,	notes)
VALUES (1,'Shipped',NULL),
(2,'Shipped',NULL),
(3,'Pending',NULL),
(4,'Shipped',NULL),
(5,'Shipped',NULL),
(6,'Shipped',NULL),
(7,'Shipped',NULL),
(8,'Shipped',NULL),
(9,'Shipped',NULL),
(10,'Shipped',NULL);

INSERT INTO Package (	OID,	EID,	SHID,	weight,	size)
VALUES(1,1,1,5,'small'),
(2,2,2,5,'small'),
(3,3,3,5,'small'),
(4,4,4,10,'medium'),
(5,5,5,8,'medium'),
(6,6,6,5,'small'),
(7,7,7,5,'small'),
(8,8,8,15,'large'),
(9,9,9,5,'small'),
(10,10,10,5,'small'),
(1,1,1,5,'small');

INSERT INTO Package_contains (	PID,    IID, 	quantity )
VALUES(1,2,2),
(11,5,1),
(2,1,2),
(3,2,1),
(4,2,1),
(5,10,1),
(6,3,1),
(7,6,3),
(8,1,1),
(9,3,1),
(10,7,3);

INSERT INTO Supply_contains (sid, iid, quantity, p_price )
VALUES (1,1,10,20),
(1,3,10,20),
(1,4,10,20),
(1,5,10,20),
(2,3,5,200),
(3,1,2,30),
(3,2,2,20),
(4,6,10,30),
(5,8,10,20),
(6,10,5,200),
(7,4,4,20),
(8,7,1,20),
(9,5,5,20),
(10,2,1,20);
