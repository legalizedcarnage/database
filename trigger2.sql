CREATE OR REPLACE FUNCTION
	update_employee_wid()
	RETURNS trigger AS
	$$BEGIN

		UPDATE employee SET wid = NEW.wid
		WHERE wid = OLD.wid;

		RETURN NULL;
	END;$$ LANGUAGE plpgsql;

CREATE TRIGGER employee_wid_update
	AFTER UPDATE ON warehouse
	FOR EACH ROW
	EXECUTE PROCEDURE update_employee_wid();
