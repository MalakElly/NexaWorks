USE [NexaWorks_Test];
GO

-- Supprimer les tables si elles existent déjà (ordre inverse des dépendances)
IF OBJECT_ID('dbo.Ticket', 'U') IS NOT NULL DROP TABLE dbo.Ticket;
IF OBJECT_ID('dbo.Compatibilite', 'U') IS NOT NULL DROP TABLE dbo.Compatibilite;
IF OBJECT_ID('dbo.[Version]', 'U') IS NOT NULL DROP TABLE dbo.[Version];
IF OBJECT_ID('dbo.SystemeExploitation', 'U') IS NOT NULL DROP TABLE dbo.SystemeExploitation;
IF OBJECT_ID('dbo.Produit', 'U') IS NOT NULL DROP TABLE dbo.Produit;
GO

-- PRODUIT
CREATE TABLE dbo.Produit
(
    ProduitID   INT IDENTITY(1,1) CONSTRAINT PK_Produit PRIMARY KEY,
    NomProduit  NVARCHAR(100) NOT NULL,
    CONSTRAINT UQ_Produit_Nom UNIQUE (NomProduit)
);
GO

-- SYSTEME D’EXPLOITATION
CREATE TABLE dbo.SystemeExploitation
(
    SEID   INT IDENTITY(1,1) CONSTRAINT PK_SystemeExploitation PRIMARY KEY,
    NomSE  NVARCHAR(50) NOT NULL,
    CONSTRAINT UQ_SystemeExploitation_Nom UNIQUE (NomSE)
);
GO

-- VERSION
CREATE TABLE dbo.[Version]
(
    VersionID     INT IDENTITY(1,1) CONSTRAINT PK_Version PRIMARY KEY,
    NumeroVersion NVARCHAR(10) NOT NULL,
    ProduitID     INT NOT NULL,
    CONSTRAINT UQ_Version_Produit_Num UNIQUE (ProduitID, NumeroVersion),
    CONSTRAINT FK_Version_Produit
        FOREIGN KEY (ProduitID) REFERENCES dbo.Produit(ProduitID)
);
GO

-- COMPATIBILITE (table de jonction Version ↔ SE)
CREATE TABLE dbo.Compatibilite
(
    VersionID INT NOT NULL,
    SEID      INT NOT NULL,
    CONSTRAINT PK_Compatibilite PRIMARY KEY (VersionID, SEID),
    CONSTRAINT FK_Compatibilite_Version FOREIGN KEY (VersionID) REFERENCES dbo.[Version](VersionID),
    CONSTRAINT FK_Compatibilite_SE FOREIGN KEY (SEID) REFERENCES dbo.SystemeExploitation(SEID)
);
GO

-- TICKET
CREATE TABLE dbo.Ticket
(
    TicketID       INT IDENTITY(1,1) CONSTRAINT PK_Ticket PRIMARY KEY,
    VersionID      INT NOT NULL,
    SEID           INT NOT NULL,
    DateCreation   DATETIME2(0) NOT NULL CONSTRAINT DF_Ticket_DateCreation DEFAULT SYSDATETIME(),
    DateResolution DATETIME2(0) NULL,
    Statut         NVARCHAR(20) NOT NULL,
    Probleme       NVARCHAR(MAX) NOT NULL,
    Resolution     NVARCHAR(MAX) NULL,
    CONSTRAINT FK_Ticket_Version FOREIGN KEY (VersionID) REFERENCES dbo.[Version](VersionID),
    CONSTRAINT FK_Ticket_SE FOREIGN KEY (SEID) REFERENCES dbo.SystemeExploitation(SEID),
    CONSTRAINT CK_Ticket_Statut CHECK (Statut IN (N'Ouvert', N'En cours', N'Résolu'))
);
GO


