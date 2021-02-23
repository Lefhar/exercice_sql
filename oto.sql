drop DATABASE if exists oto;
CREATE DATABASE oto;
use oto;


CREATE TABLE customer(
   cus_id INT,
   cus_firstname VARCHAR(50),
   cus_lastname VARCHAR(50),
   cus_address VARCHAR(150),
   cus_zipcode int(5),
   cus_city VARCHAR(50),
   cus_phone int(10),
   PRIMARY KEY(cus_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE orders(
   ord_id INT,
   ord_date DATETIME,
   ord_purchase enum('cash','credit') NOT NULL,
   cus_id INT NOT NULL,
   PRIMARY KEY(ord_id),
   FOREIGN KEY(cus_id) REFERENCES customer(cus_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE orders_details(
   ode_id INT,
   ode_quantity INT,
   ord_id INT NOT NULL,
   PRIMARY KEY(ode_id),
   UNIQUE(ord_id),
   FOREIGN KEY(ord_id) REFERENCES orders(ord_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE service(
   ser_id INT,
   ser_name VARCHAR(50),
   PRIMARY KEY(ser_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE cars(
   car_id INT,
   car_marque VARCHAR(50),
   car_condition enum('neufs','occasion') NOT NULL,
   ser_id INT NOT NULL,
   PRIMARY KEY(car_id),
   FOREIGN KEY(ser_id) REFERENCES service(ser_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE garage(
   gar_id VARCHAR(50),
   PRIMARY KEY(gar_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE seller(
   sel_id INT,
   sel_city VARCHAR(50),
   sel_firstname VARCHAR(50),
   sel_lastname VARCHAR(50),
   sel_address VARCHAR(150),
   sel_zipcode INT(5),
   ser_id INT,
   PRIMARY KEY(sel_id),
   FOREIGN KEY(ser_id) REFERENCES service(ser_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE accessory(
   car_id INT,
   acc_name VARCHAR(50),
   ode_id INT NOT NULL,
   PRIMARY KEY(car_id),
   FOREIGN KEY(car_id) REFERENCES cars(car_id),
   FOREIGN KEY(ode_id) REFERENCES orders_details(ode_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE options(
   car_id INT,
   opt_name VARCHAR(50),
   ode_id INT NOT NULL,
   PRIMARY KEY(car_id),
   FOREIGN KEY(car_id) REFERENCES cars(car_id),
   FOREIGN KEY(ode_id) REFERENCES orders_details(ode_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE maintenance(
   car_id INT,
   mai_name VARCHAR(50),
   ode_id INT NOT NULL,
   gar_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(car_id),
   FOREIGN KEY(car_id) REFERENCES cars(car_id),
   FOREIGN KEY(ode_id) REFERENCES orders_details(ode_id),
   FOREIGN KEY(gar_id) REFERENCES garage(gar_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE repair(
   car_id INT,
   rep_name VARCHAR(50),
   gar_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(car_id),
   FOREIGN KEY(car_id) REFERENCES cars(car_id),
   FOREIGN KEY(gar_id) REFERENCES garage(gar_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;