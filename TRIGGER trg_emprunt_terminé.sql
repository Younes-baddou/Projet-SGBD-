create or replace TRIGGER trg_emprunt_terminé
AFTER UPDATE ON Emprunts
FOR EACH ROW
WHEN (NEW.Statut = 'Terminé')
BEGIN
    UPDATE Livres
    SET Statut = 'Disponible'
    WHERE Id_livre = :NEW.Id_livre;
END;
