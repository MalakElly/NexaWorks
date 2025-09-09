/* ==============================================
   NexaWorks - queries.sql 
   ============================================== */
-- USE NexaWorks;
-- GO

-- 1
SELECT * FROM Ticket WHERE Statut = N'En cours';

-- 2
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'En cours' AND p.NomProduit = N'NomDuProduit';

-- 3
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'En cours' AND p.NomProduit = N'NomDuProduit' AND v.NumeroVersion = N'1.0';

-- 4
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.DateCreation BETWEEN '2023-01-01' AND '2023-12-31' AND p.NomProduit = N'NomDuProduit';

-- 5
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.DateCreation BETWEEN '2023-01-01' AND '2023-12-31' AND p.NomProduit = N'NomDuProduit' AND v.NumeroVersion = N'1.0';

-- 6
SELECT * FROM Ticket WHERE Statut = N'En cours' AND Probleme LIKE N'%motclé%';

-- 7
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'En cours' AND p.NomProduit = N'NomDuProduit' AND t.Probleme LIKE N'%motclé%';

-- 8
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'En cours' AND p.NomProduit = N'NomDuProduit' AND v.NumeroVersion = N'1.0' AND t.Probleme LIKE N'%motclé%';

-- 9
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.DateCreation BETWEEN '2023-01-01' AND '2023-12-31' AND p.NomProduit = N'NomDuProduit' AND t.Probleme LIKE N'%motclé%';

-- 10
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.DateCreation BETWEEN '2023-01-01' AND '2023-12-31' AND p.NomProduit = N'NomDuProduit' AND v.NumeroVersion = N'1.0' AND t.Probleme LIKE N'%motclé%';

-- 11
SELECT * FROM Ticket WHERE Statut = N'Résolu';

-- 12
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'Résolu' AND p.NomProduit = N'NomDuProduit';

-- 13
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'Résolu' AND p.NomProduit = N'NomDuProduit' AND v.NumeroVersion = N'1.0';

-- 14
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'Résolu' AND p.NomProduit = N'NomDuProduit' AND t.DateResolution BETWEEN '2023-01-01' AND '2023-12-31';

-- 15
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'Résolu' AND p.NomProduit = N'NomDuProduit' AND v.NumeroVersion = N'1.0' AND t.DateResolution BETWEEN '2023-01-01' AND '2023-12-31';

-- 16
SELECT * FROM Ticket WHERE Statut = N'Résolu' AND Probleme LIKE N'%motclé%';

-- 17
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'Résolu' AND p.NomProduit = N'NomDuProduit' AND t.Probleme LIKE N'%motclé%';

-- 18
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'Résolu' AND p.NomProduit = N'NomDuProduit' AND v.NumeroVersion = N'1.0' AND t.Probleme LIKE N'%motclé%';

-- 19
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'Résolu' AND p.NomProduit = N'NomDuProduit' AND t.DateResolution BETWEEN '2023-01-01' AND '2023-12-31' AND t.Probleme LIKE N'%motclé%';

-- 20
SELECT t.* 
FROM Ticket t
JOIN Version v ON t.VersionID = v.VersionID
JOIN Produit p ON v.ProduitID = p.ProduitID
WHERE t.Statut = N'Résolu' AND p.NomProduit = N'NomDuProduit' AND v.NumeroVersion = N'1.0' AND t.DateResolution BETWEEN '2023-01-01' AND '2023-12-31' AND t.Probleme LIKE N'%motclé%';
GO
