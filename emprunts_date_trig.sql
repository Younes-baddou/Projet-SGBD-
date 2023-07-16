create or replace TRIGGER emprunts_date_trig
BEFORE INSERT OR UPDATE ON Emprunts
FOR EACH ROW
BEGIN
    IF :NEW.Date_debut > :NEW.Date_fin THEN
        RAISE_APPLICATION_ERROR(-20001, 'La date de début de l''emprunt ne peut pas être postérieure à la date de retour.');
    END IF;
END;
