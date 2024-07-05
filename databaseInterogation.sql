-- 1. Création d'un nouveau livre
INSERT INTO Livre (titre, auteur, edition, date_publication, genre, categorie, extrait, exemplaire, id_auteur)
VALUES ('Les Voyageurs du Temps', 'Amadou Sow', '1ère édition', '2024-06-01', 'Science-fiction', 'Roman', 'Extrait du livre...', 10, (SELECT id_auteur FROM Auteur WHERE nom = 'Sow'));

-- 2. Afficher tous les livres d'un auteur spécifique
SELECT titre, edition, genre
FROM Livre
WHERE id_auteur = (SELECT id_auteur FROM Auteur WHERE nom = 'Sow');

-- 3. Afficher tous les utilisateurs actifs
SELECT nom, prenom, mail
FROM Utilisateur
WHERE statut = 'Actif';

-- 4. Vérifier si un livre spécifique est emprunté
SELECT *
FROM Emprunt
WHERE id_livre = (SELECT id_livre FROM Livre WHERE titre = 'Le Cœur de Mariama');

-- 5. Modifier le statut d'un livre (ex. mettre à jour le nombre d'exemplaires)
UPDATE Livre
SET exemplaire = exemplaire - 1
WHERE titre = 'Le Ventre de l''Afrique';

-- 6. Afficher tous les utilisateurs en ligne

SELECT *  FROM Utilisateur WHERE statut = 'Actif';


-- 7. Afficher tous les livres d'une catégorie donnée

SELECT * FROM livre WHERE categorie = 'Fiction'

--  8. Mettre à jour le nombre d'exemplaires d'un livre
UPDATE livre 
SET exemplaire = exemplaire - 1
WHERE id_livre = 2;


-- 9. Changer nom d'utilisateur
UPDATE utilisateur
SET nom_utilsateur = 'Big Ouzz'
WHERE nom_utilsateur = 'Ouze';

-- 10. Annulation d'une réservation

DELETE FROM reservation WHERE id_utilisateur = 2