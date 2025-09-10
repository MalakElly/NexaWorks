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
BEGIN
    SET NOCOUNT ON;

    SELECT 
        t.TicketID,
        p.NomProduit,
        v.NumeroVersion,
        se.NomSE AS SystemeExploitation,
        t.DateCreation,
        t.DateResolution,
        t.Statut,
        t.Probleme,
        t.Resolution
    FROM dbo.Ticket t
    JOIN dbo.[Version] v ON t.VersionID = v.VersionID
    JOIN dbo.Produit     p ON v.ProduitID = p.ProduitID
    JOIN dbo.SystemeExploitation se ON se.SEID = t.SEID
    WHERE t.Statut = @Statut
      AND p.NomProduit = @NomProduit
      AND (@NumeroVersion IS NULL OR v.NumeroVersion = @NumeroVersion)
    ORDER BY v.NumeroVersion, t.DateCreation DESC, t.TicketID DESC;
END;
GO

IF OBJECT_ID('dbo.GetTicketsByPeriode', 'P') IS NOT NULL DROP PROCEDURE dbo.GetTicketsByPeriode;
GO
CREATE PROCEDURE dbo.GetTicketsByPeriode
   @Statut         NVARCHAR(20),          -- N'En cours' | N'Résolu'
    @NomProduit     NVARCHAR(100),         -- produit OBLIGATOIRE
    @NumeroVersion  NVARCHAR(10) = NULL,   -- optionnel : NULL = toutes versions
    @DateDebut      DATETIME2(0),
    @DateFin        DATETIME2(0)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        t.TicketID,
        p.NomProduit,
        v.NumeroVersion,
        se.NomSE AS SystemeExploitation,
        t.DateCreation,
        t.DateResolution,
        t.Statut,
        t.Probleme,
        t.Resolution
    FROM dbo.Ticket t
    JOIN dbo.[Version] v ON t.VersionID = v.VersionID
    JOIN dbo.Produit     p ON v.ProduitID = p.ProduitID
    JOIN dbo.SystemeExploitation se ON se.SEID = t.SEID
    WHERE t.Statut = @Statut
      AND p.NomProduit LIKE  N'%' + @NomProduit + N'%'
      AND (@NumeroVersion IS NULL OR v.NumeroVersion = @NumeroVersion)
      AND (
             (@Statut = N'En cours' AND t.DateCreation   BETWEEN @DateDebut AND @DateFin)
          OR (@Statut = N'Résolu'   AND t.DateResolution BETWEEN @DateDebut AND @DateFin)
          )
    ORDER BY t.DateCreation DESC, t.TicketID DESC;
END;
GO

IF OBJECT_ID('dbo.GetTicketsByKeywords', 'P') IS NOT NULL DROP PROCEDURE dbo.GetTicketsByKeywords;
GO
CREATE PROCEDURE dbo.GetTicketsByKeywords
    @Statut NVARCHAR(20),
    @NomProduit NVARCHAR(100) = NULL,
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

