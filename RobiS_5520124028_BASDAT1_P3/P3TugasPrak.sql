
CREATE TABLE product(
    no SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100),
    stok INT,
    price NUMERIC
    
);


INSERT INTO product VALUES
(DEFAULT, 'Samsung Galaxy S24 Ultra', 20, 5000000),
(DEFAULT, 'iPhone 15 Pro Max', 10, 15000000),
(DEFAULT, 'Xiaomi 14 Ultra', 5, 4500000),
(DEFAULT, 'Oppo Find X7 Pro', 5, 4000000),
(DEFAULT, 'Vivo X100 Pro', 7, 6500000),
(DEFAULT, 'Asus ROG Phone 8', 15, 10000000)

SELECT * FROM product;


SELECT * FROM product WHERE stok > 10;






SELECT * FROM product
WHERE price BETWEEN 5000000 AND 15000000;

SELECT * FROM product
WHERE name LIKE '%o';

CREATE VIEW produk AS
SELECT * FROM product;

SELECT SPLIT_PART(name, ' ', 1) AS nama_depan
FROM product;

SELECT name, LENGTH(name) AS jumlah_karakter
FROM product;

SELECT price
FROM product
WHERE no IN (1, 6);

