create or replace TRIGGER authors_update_delete_check
BEFORE UPDATE OR DELETE ON Auteurs
FOR EACH ROW
DECLARE 
  v_day VARCHAR2(10);
BEGIN 
  SELECT TRIM(TO_CHAR(sysdate, 'DAY')) INTO v_day FROM dual;
  IF UPPER(v_day) IN ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Les opérations de mise à jour ou de suppression sur la table des auteurs ne sont pas autorisées pendant les jours de semaine');
  END IF;
END;
