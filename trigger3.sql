CREATE OR REPLACE FUNCTION
	employeeList_tiov()
	RETURNS trigger AS
	$$BEGIN

        if TG_OP = 'INSERT' THEN
            INSERT INTO employee VALUES(NEW.eid, NEW.name, NEW.phone)
            RETURN NEW;
        ELSIF TG_OP = 'UPDATE' THEN
            UPDATE employee SET eid = NEW.eid, name = NEW.name, phone = NEW.phone;
            RETURN NEW;
        ELSIF TG_OP = 'DELETE' THEN
            DELETE FROM employee WHERE eid = OLD.eid;
            RETURN NULL;
        END IF;
        RETURN NEW;
        
	END;$$ LANGUAGE plpgsql;

CREATE TRIGGER tiov_employeeList
	INSTEAD OF INSERT OR UPDATE OR DELETE ON
	employeeList  
    FOR EACH ROW
	EXECUTE PROCEDURE employeeList_tiov;