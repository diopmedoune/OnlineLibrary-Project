-- On supprimer les tables si elles existes déjà
DROP TABLE IF EXISTS Emprunt, Reservation, Acceder, Avoir_des_droits, peut_etre_vu, Administrateur, Ecran, Livre, Auteur, Utilisateur;

-- Table Utilisateur
CREATE TABLE Utilisateur (
    id_utilisateur BIGINT AUTO_INCREMENT NOT NULL,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    mail VARCHAR(100),
    mot_de_passe VARCHAR(50),
    numero_telephone VARCHAR(20),
    statut VARCHAR(20),
    PRIMARY KEY (id_utilisateur)
);

-- Table Auteur
CREATE TABLE Auteur (
    id_auteur BIGINT AUTO_INCREMENT NOT NULL,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    date_naissance DATE,
    pays_origine VARCHAR(50),
    PRIMARY KEY (id_auteur)
);

-- Table Livre
CREATE TABLE Livre (
    id_livre BIGINT AUTO_INCREMENT NOT NULL,
    titre VARCHAR(100),
    auteur VARCHAR(100),
    edition VARCHAR(50),
    date_publication DATE,
    genre VARCHAR(50),
    categorie VARCHAR(50),
    extrait TEXT,
    exemplaire INT,
    id_auteur BIGINT,
    PRIMARY KEY (id_livre),
    FOREIGN KEY (id_auteur) REFERENCES Auteur(id_auteur)
);

-- Table Emprunt
CREATE TABLE Emprunt (
    id_emprunt BIGINT AUTO_INCREMENT NOT NULL,
    date_emprunt DATE,
    date_retour DATE,
    id_utilisateur BIGINT,
    id_livre BIGINT,
    PRIMARY KEY (id_emprunt),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur),
    FOREIGN KEY (id_livre) REFERENCES Livre(id_livre)
);

-- Table Reservation
CREATE TABLE Reservation (
    id_reservation BIGINT AUTO_INCREMENT NOT NULL,
    date_reservation DATE,
    heure_reservation TIME,
    id_utilisateur BIGINT,
    id_livre BIGINT,
    PRIMARY KEY (id_reservation),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur),
    FOREIGN KEY (id_livre) REFERENCES Livre(id_livre)
);

-- Table Administrateur
CREATE TABLE Administrateur (
    id_admin BIGINT AUTO_INCREMENT NOT NULL,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    mail VARCHAR(100),
    mot_de_passe VARCHAR(50),
    PRIMARY KEY (id_admin)
);

-- Table Ecran
CREATE TABLE Ecran (
    id_ecran BIGINT AUTO_INCREMENT NOT NULL,
    nom VARCHAR(100),
    PRIMARY KEY (id_ecran)
);

-- Table Acceder
CREATE TABLE Acceder (
    id_utilisateur BIGINT NOT NULL,
    id_ecran BIGINT NOT NULL,
    PRIMARY KEY (id_utilisateur, id_ecran),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur),
    FOREIGN KEY (id_ecran) REFERENCES Ecran(id_ecran)
);

-- Table peut_etre_vu
CREATE TABLE peut_etre_vu (
    id_utilisateur BIGINT NOT NULL,
    id_livre BIGINT NOT NULL,
    PRIMARY KEY (id_utilisateur, id_livre),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur),
    FOREIGN KEY (id_livre) REFERENCES Livre(id_livre)
);

-- Table Avoir_des_droits
CREATE TABLE Avoir_des_droits (
    id_ecran BIGINT NOT NULL,
    id_admin BIGINT NOT NULL,
    modification CHAR(1),
    suppression CHAR(1),
    insertion CHAR(1),
    PRIMARY KEY (id_ecran, id_admin),
    FOREIGN KEY (id_ecran) REFERENCES Ecran(id_ecran),
    FOREIGN KEY (id_admin) REFERENCES Administrateur(id_admin)
);


-- Insertions (pour remplir les tables)

-- Utilisateurs
INSERT INTO Utilisateur (nom, prenom, mail, mot_de_passe, numero_telephone, statut)
VALUES ('Diop', 'Ousmane', 'ousmane.diop@example.com', 'motdepasse123', '+22177889900', 'Actif'),
       ('Ndiaye', 'Aminata', 'aminata.ndiaye@example.com', 'abcd1234', '+22177665544', 'Inactif'),
       ('Sow', 'Fatou', 'fatou.sow@example.com', 'password456', '+22178332211', 'Actif');

-- Auteurs
INSERT INTO Auteur (nom, prenom, date_naissance, pays_origine)
VALUES ('Sow', 'Ousmane', '1975-05-20', 'Sénégal'),
       ('Diagne', 'Mariama', '1980-09-15', 'Sénégal'),
       ('Gueye', 'Moussa', '1988-03-10', 'Sénégal');

-- Livres
INSERT INTO Livre (titre, auteur, edition, date_publication, genre, categorie, extrait, exemplaire, id_auteur)
VALUES ('Les Chemins de l''ombre', 'Ousmane Sow', '1ère édition', '2023-01-15', 'Roman', 'Fiction', 'Extrait du livre...', 5, (SELECT id_auteur FROM Auteur WHERE nom = 'Sow')),
       ('Le Cœur de Mariama', 'Mariama Diagne', '2ème édition', '2022-07-20', 'Poésie', 'Littérature', 'Extrait du livre...', 3, (SELECT id_auteur FROM Auteur WHERE nom = 'Diagne'))
       
-- Administrateurs
INSERT INTO Administrateur (nom, prenom, mail, mot_de_passe)
VALUES ('Diouf', 'Mamadou', 'mamadou.diouf@admin.com', 'admin123'),
       ('Fall', 'Aïssatou', 'aissatou.fall@admin.com', 'securepwd');



-- Écrans
INSERT INTO Ecran (nom)
VALUES ('Gestion des Utilisateurs'),
       ('Gestion des Livres'),
       ('Tableau de Bord');

-- Accès des administrateurs aux écrans
INSERT INTO Acceder (id_utilisateur, id_ecran)
VALUES ((SELECT id_admin FROM Administrateur WHERE nom = 'Diouf'), 1),
       ((SELECT id_admin FROM Administrateur WHERE nom = 'Diouf'), 3);

-- Peut être vu
INSERT INTO peut_etre_vu (id_utilisateur, id_livre)
VALUES ((SELECT id_utilisateur FROM Utilisateur WHERE nom = 'Diop'), (SELECT id_livre FROM Livre WHERE titre = 'Les Chemins de l''ombre')),
       ((SELECT id_utilisateur FROM Utilisateur WHERE nom = 'Ndiaye'), (SELECT id_livre FROM Livre WHERE titre = 'Le Cœur de Mariama')),
       ((SELECT id_utilisateur FROM Utilisateur WHERE nom = 'Sow'), (SELECT id_livre FROM Livre WHERE titre = 'La Vie à Dakar')),
       ((SELECT id_utilisateur FROM Utilisateur WHERE nom = 'Diop'), (SELECT id_livre FROM Livre WHERE titre = 'Le Ventre de l''Afrique')),
       ((SELECT id_utilisateur FROM Utilisateur WHERE nom = 'Ndiaye'), (SELECT id_livre FROM Livre WHERE titre = 'Au-delà des Collines'));

-- Avoir des droits
INSERT INTO Avoir_des_droits (id_ecran, id_admin, modification, suppression, insertion)
VALUES (1, (SELECT id_admin FROM Administrateur WHERE nom = 'Diouf'), 'O', 'N', 'N'),
       (2, (SELECT id_admin FROM Administrateur WHERE nom = 'Diouf'), 'O', 'N', 'N'),
       (3, (SELECT id_admin FROM Administrateur WHERE nom = 'Diouf'), 'N', 'N', 'O');
