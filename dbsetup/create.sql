DROP DATABASE IF EXISTS projectstarter;
CREATE DATABASE projectstarter;
USE projectstarter;



CREATE TABLE Product (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,
	Description VARCHAR(50) NOT NULL,
	PriceInPence INT NOT NULL,
	CONSTRAINT ck_posPrice CHECK (PriceInPence > 0)
);

CREATE TABLE Basket (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Oid INT NOT NULL,
	ProductId INT,
	Quantity INT NOT NULL,
	CONSTRAINT fk_productId FOREIGN KEY (ProductId) REFERENCES Product(Id),
	CONSTRAINT ck_quantity CHECK (Quantity >= 0)
);


INSERT INTO Product (Name, Description, PriceInPence) VALUES ('Copper Pipe 2m', '15mm copper pipe; 2m length',1000);
INSERT INTO Product (Name, Description, PriceInPence) VALUES ('Steel Pipe 2m','15mm steel pipe; 2m length', 1200);
INSERT INTO Product (Name, Description, PriceInPence) VALUES ('Short Nails','25mm nails; pack of 200',250);
INSERT INTO Product (Name, Description, PriceInPence) VALUES ('Long Nails','50mm nails; pack of 75',475);
INSERT INTO Product (Name, Description, PriceInPence) VALUES ('Glue','Sticky glue',599);
INSERT INTO Product (Name, Description, PriceInPence) VALUES ('Glue gun','A glue gun',1999);

DELIMITER /

CREATE PROCEDURE insertNewProduct(
	IN name VARCHAR(50),
	IN description VARCHAR(50),
	IN price INT,
	OUT keyval INT
)
MODIFIES SQL DATA
BEGIN
	INSERT INTO Product (Name, Description, PriceInPence) 
	    VALUES (name, description, price);
	SELECT last_insert_id() INTO keyval;
END;
/

CALL insertNewProduct("TEST", "DESC", 99, @out)/

SELECT @out/

CREATE PROCEDURE updateExistingProduct(
	IN nname VARCHAR(50),
	IN ndesc VARCHAR(50),
	IN nprice VARCHAR(50),
	IN keyval INT
)
MODIFIES SQL DATA
BEGIN
	UPDATE Product SET
		Name = nname,
		Description = ndesc,
		PriceInPence = nprice 
	WHERE Id = keyval;
END;
/

CREATE PROCEDURE insertItemIntoBasket(
	IN oid INT,
	IN pid INT,
	IN qty INT,
	OUT keyval INT
)
MODIFIES SQL DATA
BEGIN
	INSERT INTO Basket (OId, ProductId, Quantity) 
	    VALUES (oid, pid, qty);
	SELECT last_insert_id() INTO keyval;
	COMMIT;	
END;
/




CREATE PROCEDURE updateExistingBasketItem(
	IN oid INT,
	IN pid INT,
	IN QuantityChange INT
)
MODIFIES SQL DATA
BEGIN
	UPDATE Basket SET
		Quantity = Quantity + QuantityChange
	WHERE OId = oid AND ProductId = pid;
END;
/



CREATE PROCEDURE removeExistingBasketItem(
	IN oid INT,
	IN pid INT
)
MODIFIES SQL DATA
BEGIN
	DELETE FROM Basket 
	WHERE OId = oid AND ProductId = pid;
END;
/


CREATE PROCEDURE readFullProducts()
BEGIN
		SELECT * FROM Product;
END;
/		