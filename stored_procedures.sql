/* ==============================================
   NexaWorks -stored_procedures.sql 
   ============================================== */
-- USE NexaWorks;
-- GO

IF OBJECT_ID('dbo.GetTicketsByStatut', 'P') IS NOT NULL DROP PROCEDURE dbo.GetTicketsByStatut;
GO
CREATE PROCEDURE dbo.GetTicketsByStatut
    @Statut NVARCHAR(20)  -- N'En cours' | N'Résolu'
AS
BEGIN
    SET NOCOUNT ON;
    SELECT t.*, v.NumeroVersion, p.NomProduit
    FROM Ticket t
    JOIN Version v ON t.VersionID = v.VersionID
    JOIN Produit p ON v.ProduitID = p.ProduitID
    WHERE t.Statut = @Statut;
END;
GO

IF OBJECT_ID('dbo.GetTicketsByProduit', 'P') IS NOT NULL DROP PROCEDURE dbo.GetTicketsByProduit;
GO
CREATE PROCEDURE dbo.GetTicketsByProduit
    @Statut NVARCHAR(20),
    @NomProduit NVARCHAR(500),
    @NumeroVersion NVARCHAR(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT t.*, v.NumeroVersion, p.NomProduit
    FROM Ticket t
    JOIN Version v ON t.VersionID = v.VersionID
    JOIN Produit p ON v.ProduitID = p.ProduitID
    WHERE t.Statut = @Statut
      AND p.NomProduit = @NomProduit
      AND (@NumeroVersion IS NULL OR v.NumeroVersion = @NumeroVersion);
END;
GO

IF OBJECT_ID('dbo.GetTicketsByPeriode', 'P') IS NOT NULL DROP PROCEDURE dbo.GetTicketsByPeriode;
GO
CREATE PROCEDURE dbo.GetTicketsByPeriode
    @Statut NVARCHAR(20),
    @NomProduit NVARCHAR(500),
    @NumeroVersion NVARCHAR(10) = NULL,
    @DateDebut DATETIME,
    @DateFin DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    SELECT t.*, v.NumeroVersion, p.NomProduit
    FROM Ticket t
    JOIN Version v ON t.VersionID = v.VersionID
    JOIN Produit p ON v.ProduitID = p.ProduitID
    WHERE t.Statut = @Statut
      AND p.NomProduit = @NomProduit
      AND (@NumeroVersion IS NULL OR v.NumeroVersion = @NumeroVersion)
      AND (
          (t.DateCreation BETWEEN @DateDebut AND @DateFin)
          OR (t.DateResolution BETWEEN @DateDebut AND @DateFin)
      );
END;
GO

IF OBJECT_ID('dbo.GetTicketsByKeywords', 'P') IS NOT NULL DROP PROCEDURE dbo.GetTicketsByKeywords;
GO
CREATE PROCEDURE dbo.GetTicketsByKeywords
    @Statut NVARCHAR(20),
    @NomProduit NVARCHAR(500) = NULL,
    @NumeroVersion NVARCHAR(10) = NULL,
    @DateDebut DATETIME = NULL,
    @DateFin DATETIME = NULL,
    @MotCle NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT t.*, v.NumeroVersion, p.NomProduit
    FROM Ticket t
    JOIN Version v ON t.VersionID = v.VersionID
    JOIN Produit p ON v.ProduitID = p.ProduitID
    WHERE t.Statut = @Statut
      AND (@NomProduit IS NULL OR p.NomProduit = @NomProduit)
      AND (@NumeroVersion IS NULL OR v.NumeroVersion = @NumeroVersion)
      AND (@DateDebut IS NULL OR t.DateCreation >= @DateDebut)
      AND (@DateFin IS NULL OR t.DateCreation <= @DateFin)
      AND t.Probleme LIKE N'%' + @MotCle + N'%';
END;
GO
