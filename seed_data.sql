/* ==============================================
   NexaWorks - seed_data.sql 
   ============================================== */
-- USE NexaWorks;
-- GO

----------------------------------------------------
-- 1. Systèmes d'exploitation
----------------------------------------------------
INSERT INTO SystemeExploitation (NomSE) VALUES (N'Windows');
INSERT INTO SystemeExploitation (NomSE) VALUES (N'MacOS');
INSERT INTO SystemeExploitation (NomSE) VALUES (N'Linux');
INSERT INTO SystemeExploitation (NomSE) VALUES (N'Android');
INSERT INTO SystemeExploitation (NomSE) VALUES (N'iOS');
INSERT INTO SystemeExploitation (NomSE) VALUES (N'Windows Mobile');

----------------------------------------------------
-- 2. Produits
----------------------------------------------------
INSERT INTO Produit (NomProduit) VALUES (N'Trader en Herbe');              -- ID 1
INSERT INTO Produit (NomProduit) VALUES (N'Maître des Investissements');   -- ID 2
INSERT INTO Produit (NomProduit) VALUES (N'Planificateur d’Entraînement'); -- ID 3
INSERT INTO Produit (NomProduit) VALUES (N'Planificateur d’Anxiété Sociale'); -- ID 4

----------------------------------------------------
-- 3. Versions
----------------------------------------------------
-- Trader en Herbe
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'1.0', 1); -- ID 1
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'1.1', 1); -- ID 2
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'1.2', 1); -- ID 3
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'1.3', 1); -- ID 4

-- Maître des Investissements
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'1.0', 2); -- ID 5
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'2.0', 2); -- ID 6
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'2.1', 2); -- ID 7

-- Planificateur d’Entraînement
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'1.0', 3); -- ID 8
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'1.1', 3); -- ID 9
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'2.0', 3); -- ID 10

-- Planificateur d’Anxiété Sociale
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'1.0', 4); -- ID 11
INSERT INTO Version (NumeroVersion, ProduitID) VALUES (N'1.1', 4); -- ID 12

----------------------------------------------------
-- 4. Compatibilités (VersionID, SEID)
----------------------------------------------------
-- Trader en Herbe
INSERT INTO Compatibilite VALUES (1,1),(1,2);
INSERT INTO Compatibilite VALUES (2,1),(2,2),(2,3);
INSERT INTO Compatibilite VALUES (3,1),(3,2),(3,3),(3,4),(3,5),(3,6);
INSERT INTO Compatibilite VALUES (4,1),(4,2),(4,4),(4,5);

-- Maître des Investissements
INSERT INTO Compatibilite VALUES (5,2),(5,3);
INSERT INTO Compatibilite VALUES (6,1),(6,2),(6,3);
INSERT INTO Compatibilite VALUES (7,1),(7,2),(7,3),(7,4);

-- Planificateur d’Entraînement
INSERT INTO Compatibilite VALUES (8,1),(8,4);
INSERT INTO Compatibilite VALUES (9,1),(9,2),(9,3),(9,4),(9,5),(9,6);
INSERT INTO Compatibilite VALUES (10,1),(10,2),(10,3),(10,4);

-- Planificateur d’Anxiété Sociale
INSERT INTO Compatibilite VALUES (11,1),(11,2),(11,3),(11,4);
INSERT INTO Compatibilite VALUES (12,1),(12,2),(12,3),(12,4);

----------------------------------------------------
-- 5. Tickets (25 exemples réalistes)
-- NB: dates en DATETIME, libellés en NVARCHAR (N'...')
----------------------------------------------------
INSERT INTO Ticket (VersionID, SEID, DateCreation, DateResolution, Statut, Probleme, Resolution) VALUES
(3, 5, '2023-03-02T10:15:00', '2023-04-16T09:00:00', N'Résolu', N'Achats en double lors de transactions sur iOS.', N'Ajout d''une animation et désactivation du bouton après clic.'),
(2, 3, '2023-07-14T08:30:00', NULL, N'En cours', N'Bouton de validation inactif sur Linux.', NULL),
(6, 1, '2023-02-20T14:00:00', '2023-02-28T16:45:00', N'Résolu', N'Erreur 500 lors de la connexion au compte.', N'Correction du module d''authentification.'),
(7, 4, '2023-05-10T11:20:00', NULL, N'En cours', N'Application lente lors du chargement des portefeuilles.', NULL),
(9, 2, '2023-06-12T07:45:00', '2023-06-20T10:00:00', N'Résolu', N'Crash pendant l''enregistrement d''un entraînement.', N'Optimisation de la gestion mémoire.'),
(10, 1, '2023-08-01T13:10:00', NULL, N'En cours', N'Les vidéos d''exercices ne se lancent pas sur Windows.', NULL),
(11, 3, '2023-03-18T09:30:00', '2023-03-25T15:00:00', N'Résolu', N'Problème d''affichage du calendrier d''exposition sociale.', N'Correction du format de date pour compatibilité Linux.'),
(12, 4, '2023-07-05T10:00:00', NULL, N'En cours', N'Rappel de tâche ne s''affiche pas sur Android.', NULL),
(4, 1, '2023-09-10T12:00:00', '2023-09-15T09:15:00', N'Résolu', N'Graphiques financiers incorrects après mise à jour.', N'Mise à jour de la librairie de calcul.'),
(5, 2, '2023-01-22T08:00:00', NULL, N'En cours', N'Synchronisation des données impossible sur MacOS.', NULL),
(8, 4, '2023-04-14T16:00:00', '2023-04-18T10:30:00', N'Résolu', N'Plan d''entraînement non sauvegardé.', N'Réparation de la fonction de sauvegarde locale.'),
(1, 1, '2023-02-10T08:45:00', NULL, N'En cours', N'Impossible de démarrer sans connexion internet.', NULL),
(6, 3, '2023-03-30T14:20:00', '2023-04-02T09:05:00', N'Résolu', N'Erreur lors de l''export CSV.', N'Ajout d''un gestionnaire d''erreurs.'),
(7, 1, '2023-05-21T07:25:00', NULL, N'En cours', N'Notification push absente sur Windows.', NULL),
(9, 5, '2023-07-25T18:00:00', '2023-07-30T10:10:00', N'Résolu', N'Mauvais calcul des calories.', N'Correction de la formule dans l''API.'),
(10, 2, '2023-06-03T06:30:00', NULL, N'En cours', N'Musique de fond absente pendant les séances.', NULL),
(12, 1, '2023-08-12T11:50:00', '2023-08-15T14:00:00', N'Résolu', N'Mauvaise traduction des menus.', N'Mise à jour du fichier de langue.'),
(11, 4, '2023-09-05T09:40:00', NULL, N'En cours', N'App crash lors du partage de résultats.', NULL),
(3, 6, '2023-04-22T10:10:00', '2023-04-25T13:30:00', N'Résolu', N'Incompatibilité avec Windows Mobile.', N'Ajout d''un patch de compatibilité.'),
(4, 5, '2023-06-14T12:20:00', NULL, N'En cours', N'Données de marché non rafraîchies.', NULL),
(5, 3, '2023-02-27T08:10:00', '2023-03-02T17:00:00', N'Résolu', N'Graphiques non mis à jour en temps réel.', N'Optimisation du WebSocket.'),
(8, 1, '2023-05-07T16:40:00', NULL, N'En cours', N'Erreur lors de l''ajout d''exercices personnalisés.', NULL),
(9, 6, '2023-07-18T15:00:00', '2023-07-21T08:30:00', N'Résolu', N'Problème de connexion au cloud.', N'Mise à jour du certificat SSL.'),
(10, 3, '2023-08-22T07:55:00', NULL, N'En cours', N'Planification impossible avec certains fuseaux horaires.', NULL),
(12, 2, '2023-09-28T10:05:00', '2023-10-01T09:00:00', N'Résolu', N'Crash après 1h d''utilisation.', N'Correction d''une fuite mémoire.');
GO
