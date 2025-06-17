DELIMITER $$

CREATE PROCEDURE add_coach(IN coach_name VARCHAR(255), IN coach_nationality VARCHAR(100))
BEGIN
    INSERT INTO coaches(name, nationality)
    VALUES (coach_name, coach_nationality);
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER set_default_position
BEFORE INSERT ON results
FOR EACH ROW
BEGIN
    IF NEW.position IS NULL THEN
        SET NEW.position = 'Unknown';
    END IF;
END$$

DELIMITER ;
