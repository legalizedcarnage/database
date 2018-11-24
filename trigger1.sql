CREATE OR REPLACE FUNCTION
	delete_employee()
	RETURNS trigger AS
	$$BEGIN

		DELETE FROM ord o
		WHERE o.eid = OLD.eid;
		DELETE FROM supply_ord so
		WHERE so.eid = OLD.eid;
		DELETE FROM package p
		WHERE p.eid = OLD.eid;

		RETURN NULL;
	END;$$ LANGUAGE plpgsql;

CREATE TRIGGER emp_delete
    AFTER DELETE ON employee
    FOR EACH ROW
    EXECUTE PROCEDURE delete_employee();
