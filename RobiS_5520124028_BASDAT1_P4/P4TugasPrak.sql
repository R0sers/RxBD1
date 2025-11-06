CREATE TABLE seller(
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(100),
	country CHAR(50),
	comission CHAR(50)
);

CREATE TABLE customer(
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(100),
	country CHAR(50)
);

CREATE TABLE orders(
	id INT PRIMARY KEY NOT NULL,
	date DATE,
	purchase_amount CHAR(100),
	customer_id INT REFERENCES customer(id),
	seller_id INT REFERENCES seller(id)
);

SELECT * FROM seller;
SELECT * FROM customer;
SELECT * FROM Orders;

INSERT INTO customer VALUES
(1, 'Soekarno', 'Indonesia'),
(2, 'John F. Kennedy', 'United State'),
(3, 'Richo Andika', 'United Kingdom'),
(4, 'Moon Jae-in', 'South Korea'),
(5, 'XI Jinping', 'China');

INSERT INTO seller VALUES
(1, 'Amir Made', 'Indonesia', 0.15),
(2, 'Bagus Jusuf', 'Indonesia', 0.17),
(3, 'Putri Wira', 'Indonesia', 0.12),
(4, 'Cahyo Wahyu', 'Indonesia', 0.20),
(5, 'Imran Tirta', 'Indonesia', 0.16);

INSERT INTO orders VALUES
(1, '2020-09-19', 100000,1,4),
(2, '2020-09-19', 200000,4,2),
(3, '2020-09-19', 35000000,3,1),
(4, '2020-09-19', 50000,3,3),
(5, '2020-09-19', 100000,5,3);

SELECT 
	orders.id order_id,
	customer.name customer_name,
	orders.date order_date,
	orders.purchase_amount order_purchase_amount,
	seller.name seller_name
FROM orders
INNER JOIN customer ON orders.customer_id = customer.id
INNER JOIN seller ON orders.seller_id = seller.id;

DROP TABLE customer;
DROP TABLE seller;
DROP TABLE orders;


