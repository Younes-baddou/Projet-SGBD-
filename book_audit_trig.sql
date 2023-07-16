create or replace TRIGGER book_audit_trig
AFTER INSERT OR UPDATE OR DELETE ON Livres
FOR EACH ROW
DECLARE 
    v_id_livre Livres.Id_livre%TYPE;
    v_action VARCHAR2(50);
BEGIN
    IF INSERTING THEN
        v_action := 'INSERT';
        v_id_livre := :NEW.Id_livre;
    ELSIF UPDATING THEN
        v_action := 'UPDATE';
        v_id_livre := :NEW.Id_livre;
    ELSIF DELETING THEN
        v_action := 'DELETE';
        v_id_livre := :OLD.Id_livre;
    END IF;
    INSERT INTO book_audit(audit_id, book_id, action, audit_date) 
    VALUES (book_audit_seq.NEXTVAL, v_id_livre, v_action, SYSDATE);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur dans le déclencheur BOOK_AUDIT_TRIG : ' || SQLERRM);
END;
