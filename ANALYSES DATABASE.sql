--1. creer la base de donnees ANALYSES.
CREATE DATABASE ANALYSES;
USE ANALYSES;
--2. Creer la table CLIENT en precisant la cle primaire.
CREATE TABLE CLIENT(
codeclient INT PRIMARY KEY,
nom VARCHAR(20),
cpclient VARCHAR(20),
villeclient VARCHAR(20),
tel VARCHAR(20)
);
--3. Modifier les colonnes cpclient et villeclient pour qu'elles n'acceptent pas une valeur nulle.
ALTER TABLE CLIENT ALTER COLUMN cpclient VARCHAR NOT NULL;
ALTER TABLE CLIENT ALTER COLUMN villeclient VARCHAR NOT NULL;
--4. Modifier les colonnes Nom pour qu'elle prend la valeur  'Anonyme' par defaut.
ALTER TABLE CLIENT ADD CONSTRAINT default_nom DEFAULT 'Anonyme' FOR nom;
--5. Creer la table Echantillon en precisant la cle primaire qui commence de 10 et s'incremente
--auomatiquement de 1 ,condeclient est la cle etrangere vers la table Client.
CREATE TABLE Echantillon (
codeEchantillon INT PRIMARY KEY IDENTITY(10,1),
dateEntree DATE,
codeclient INT ,
CONSTRAINT key_vers_client FOREIGN KEY(codeclient) REFERENCES CLIENT(codeclient)
);
--6. Creer la table Typeanalyse en precisant de cle primaire.
CREATE TABLE Typeanalyse(
RefTypeAnalyse INT PRIMARY KEY,
designation VARCHAR(20),
TypeAnalyse VARCHAR(20),
prixTypeAnalyse INT
);
--7. Creer une contrainte ck_prixTypeAnalyse qui impose de saisair un prixTypeAnalyse dans
--la table Typeanalyse qui doit etre entre 100 et 1000 .
ALTER TABLE Typeanalyse ADD CONSTRAINT ck_prixTypeAnalyse CHECK(prixTypeAnalyse BETWEEN 100 AND 1000)
--8. Creer la table Realiser en precisant que le couple (codeEchantillon,refTypeAnalyse) 
--est une cle primaire, en meme temps, codeEchantillon est une cle etrangere vers la table
--Echantillon et refTypeAnalyse est cle etrangere vers la table TypeAnalyse.
CREATE TABLE Realiser(
codeEchantillon INT ,
refTypeAnalyse INT,
dateRealisation DATE,
PRIMARY KEY(codeEchantillon,refTypeAnalyse),
FOREIGN KEY(codeEchantillon) REFERENCES Echantillon(codeEchantillon),
FOREIGN KEY(refTypeAnalyse) REFERENCES Typeanalyse(RefTypeAnalyse) 
);
--9.Creer une contrainte ck_dateRealisation qui verifie que la date de dateRealisation est 
--entre la date du jour meme et 3 jours apres.
ALTER TABLE Realiser ADD CONSTRAINT ck_dateRealisation CHECK (dateRealisation BETWEEN GETDATE() AND DATEADD(DD,3,GETDATE()))
--10.Supprimer la colonne rue de la table Client.
--Mon Remarque! il'ya pas de colonne rue dans la table client mais c'est le code de le suprrimer:
ALTER TABLE CLIENT DROP COLUMN rue;



