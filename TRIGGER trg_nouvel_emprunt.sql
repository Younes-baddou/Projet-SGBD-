create or replace TRIGGER trg_nouvel_emprunt
AFTER INSERT ON Emprunts
FOR EACH ROW
BEGIN
    UPDATE Livres
    SET Statut = 'Non disponible'
    WHERE Id_livre = :NEW.Id_livre;
END;
