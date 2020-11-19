DROP DATABASE IF EXISTS `hotel`;

CREATE DATABASE `hotel`; 

USE `hotel`; 

/*prefix sta_*/
CREATE TABLE station(
    sta_num     Int NOT NULL ,
    sta_nom     Varchar (50) NOT NULL 
    ,CONSTRAINT station_PK PRIMARY KEY (sta_num)
);
/*prefix h_*/
CREATE TABLE hotel(
        h_capacite Varchar (50) NOT NULL ,
        h_categorie Int NOT NULL ,
        h_nom      Varchar (50) NOT NULL ,
        h_adresse  Varchar (50) NOT NULL,
        h_num   Int NOT NULL ,
        sta_num  Int NOT NULL 

    ,CONSTRAINT hotel_PK PRIMARY KEY (h_num)
     ,CONSTRAINT hotel_station_FK FOREIGN KEY (sta_num) REFERENCES station(sta_num)
);
/*prefix ch_*/
CREATE TABLE chambre(
        ch_capacite        Varchar (50) NOT NULL ,
        ch_degre_confort Int NOT NULL ,
        ch_exposition      Varchar (50) NOT NULL ,
        ch_type  Varchar (50) NOT NULL,
        ch_num   Int NOT NULL ,
        h_num  Int NOT NULL 

    ,CONSTRAINT chambre_PK PRIMARY KEY (ch_num)
      ,CONSTRAINT chambre_hotel_FK FOREIGN KEY (h_num) REFERENCES hotel(h_num)
);
/*prefix cl_*/
CREATE TABLE client(
        cl_adresse        Varchar (50) NOT NULL ,
        cl_nom      Varchar (50) NOT NULL ,
        cl_prenom      Varchar (50) NOT NULL ,
        cl_num   Int NOT NULL 

    ,CONSTRAINT client_PK PRIMARY KEY (cl_num)
 
);

/*prefix re_*/
CREATE TABLE  reservation(
        ch_num Int NOT NULL ,
        cl_num    Int NOT NULL,
        re_date_debut datetime ,
        re_date_fin datetime ,
        re_date_reservation datetime ,
        cl_montant_arhes    Int NOT NULL,
        re_prix_total DECIMAL NOT NULL
    ,CONSTRAINT reservation_chambre_FK FOREIGN KEY (ch_num) REFERENCES chambre(ch_num)
    ,CONSTRAINT reservation_client_FK FOREIGN KEY (cl_num) REFERENCES client(cl_num)
    
);