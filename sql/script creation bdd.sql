#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
DROP DATABASE IF EXISTS likdle;
CREATE DATABASE IF NOT EXISTS likdle;

#------------------------------------------------------------
# Table: Utilisateur
#------------------------------------------------------------

CREATE TABLE Utilisateur(
        Id           int (11) Auto_increment  NOT NULL ,
        Nom          Varchar (25) NOT NULL ,
        Prenom       Varchar (25) NOT NULL ,
        Pseudo       Varchar (25) NOT NULL ,
        Mail         Varchar (25) NOT NULL ,
        Mdp          Varchar (25) NOT NULL ,
        Age          Int NOT NULL ,
        Sexe         Int ,
        Orientation  Int ,
        Localisation Varchar (25) ,
        Situation    Int ,
        Description  Varchar (25) ,
        Tel          Varchar (25) ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Evenement
#------------------------------------------------------------

CREATE TABLE Evenement(
        Id             int (11) Auto_increment  NOT NULL ,
        Categorie      Int NOT NULL ,
        Nom            Varchar (25) NOT NULL ,
        PersonMax      Int NOT NULL ,
        Public         Bool NOT NULL ,
        Lieu           Varchar (25) NOT NULL ,
        LatLieu        Float ,
        LongLieu       Float ,
        Id_Utilisateur Int NOT NULL ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PhotoEvent
#------------------------------------------------------------

CREATE TABLE PhotoEvent(
        Id           int (11) Auto_increment  NOT NULL ,
        Lien         Varchar (25) NOT NULL ,
        Id_Evenement Int NOT NULL ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PhotoUtilisateur
#------------------------------------------------------------

CREATE TABLE PhotoUtilisateur(
        Id             int (11) Auto_increment  NOT NULL ,
        Lien           Varchar (25) NOT NULL ,
        Id_Utilisateur Int NOT NULL ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Participe
#------------------------------------------------------------

CREATE TABLE Participe(
        Id           Int NOT NULL ,
        Id_Evenement Int NOT NULL ,
        PRIMARY KEY (Id ,Id_Evenement )
)ENGINE=InnoDB;

ALTER TABLE Evenement ADD CONSTRAINT FK_Evenement_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES Utilisateur(Id);
ALTER TABLE PhotoEvent ADD CONSTRAINT FK_PhotoEvent_Id_Evenement FOREIGN KEY (Id_Evenement) REFERENCES Evenement(Id);
ALTER TABLE PhotoUtilisateur ADD CONSTRAINT FK_PhotoUtilisateur_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES Utilisateur(Id);
ALTER TABLE Participe ADD CONSTRAINT FK_Participe_Id FOREIGN KEY (Id) REFERENCES Utilisateur(Id);
ALTER TABLE Participe ADD CONSTRAINT FK_Participe_Id_Evenement FOREIGN KEY (Id_Evenement) REFERENCES Evenement(Id);
