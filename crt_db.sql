CREATE USER games SUPERUSER PASSWORD '1234';  -- create a role.

CREATE TABLESPACE ezdata 
	 OWNER games
	 LOCATION 'D:\code\psql\data2'  -- The folder cannot be used to hold my tablespace
 --      [ WITH ( tablespace_option = value [, ... ] ) ]
	 ;
/*
CREATE TABLESPACE GBidx 
	 OWNER gradebook
	 LOCATION '/code/psql/idx'  -- The folder cannot be used to hold my tablespace
 --      [ WITH ( tablespace_option = value [, ... ] ) ]
	 ;
*/
CREATE DATABASE games WITH OWNER = games  TABLESPACE = ezdata; 
