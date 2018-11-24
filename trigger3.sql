CREATE OR REPLACE FUNCTION
	employeeList_tiov()
	RETURNS trigger AS
	$$BEGIN

        if TG_OP = 'INSERT' THEN
            INSERT INTO employee VALUES(NEW.eid, NEW.name, NEW.phone);
            RETURN NEW;
        ELSIF TG_OP = 'UPDATE' THEN
            if NEW.eid <> OLD.eid THEN
            UPDATE employee SET eid = NEW.eid WHERE eid = OLD.eid;
            END IF;
            if NEW.name <> OLD.name THEN
            UPDATE employee SET name = NEW.name WHERE eid = OLD.eid;
            END IF;
            if NEW.phone <> OLD.phone THEN
            UPDATE employee SET phone = NEW.phone WHERE eid = OLD.eid;
            END IF;
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
	EXECUTE PROCEDURE employeeList_tiov();