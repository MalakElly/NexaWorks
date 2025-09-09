# NexaWorks
Projet de conception et création d'une base de données pour NexaWorks pour la gestion des tickets et problèmes rencontrées sur les différents produits de l'entreprise .

Ce dépôt contient tout le nécessaire pour créer, alimenter, interroger et sauvegarder la base de données **NexaWorks**.

## Contenu

- `create_tables.sql` — création des tables (MLD) 
- `seed_data.sql` — insertion des OS, produits, versions, compatibilités et **25 tickets**
- `queries.sql` — les **20 requêtes** demandées (copier/coller)
- `stored_procedures.sql` — **4 procédures stockées** pour regrouper les cas répétitifs

## Ordre d'exécution recommandé (SSMS)

1. Créer la base :  
   ```sql
   CREATE DATABASE NexaWorks;
   GO
   USE NexaWorks; 
   GO
   ```
2. Exécuter `create_tables.sql`
3. Exécuter `seed_data.sql`
4. Vérifier avec `queries.sql`
5. (Optionnel) Exécuter `stored_procedures.sql` pour disposer d'une API SQL plus simple


## Sauvegarde (Dump .bak)

Dans **SQL Server Management Studio** :  
- Clic droit sur la base `NexaWorks` → **Tâches** → **Sauvegarder…**  
- **Type** : *Complète*  
- **Destination** : choisir un chemin, ex. `C:\Backups\NexaWorks.bak`  
- **OK** → le fichier `.bak` est le **dump** (structure + données).

## Modèle entité-association (voir le modèle déposé)

Tables : `Produit`, `Version`, `SystemeExploitation`, `Compatibilite`, `Ticket`  
- 1 Produit ↔ n Versions  
- n Versions ↔ n Systèmes (via Compatibilite)  
- 1 Version ↔ 0..n Tickets 

## Notes
- Les champs textes longs utilisent `NVARCHAR(MAX)`.



