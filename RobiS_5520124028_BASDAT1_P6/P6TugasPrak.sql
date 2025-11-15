CREATE TABLE barang(
	id SERIAL PRIMARY KEY,
	nama_barang VARCHAR(50),
	stok INT
);

CREATE TABLE transaksi(
	id_transaksi SERIAL PRIMARY KEY,
	id_barang INT REFERENCES barang(id),
	qty INT
);

INSERT INTO barang VALUES
(DEFAULT, 'Roti', 17),
(DEFAULT, 'Susu', 11),
(DEFAULT, 'Cookies', 25);

CREATE OR REPLACE FUNCTION fungsi_update_stok()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN

	UPDATE barang
	SET stok = stok - NEW.qty
	WHERE id = NEW.id_barang;

	RAISE NOTICE 'Stok barang ID % berkurang sebanyak %', NEW.id_barang, NEW.qty;

	RETURN NEW;
END
$$;


CREATE TRIGGER trg_update_stok
AFTER INSERT ON transaksi
FOR EACH ROW
EXECUTE PROCEDURE fungsi_update_stok();


CREATE OR REPLACE PROCEDURE prosedur_input_transaksi(
	IN p_id_barang INT,
	IN p_qty INT
)
LANGUAGE PLPGSQL
AS $$
DECLARE
	stok_saat_ini INT;
BEGIN

	SELECT stok INTO stok_saat_ini
	FROM barang
	WHERE id = p_id_barang;

	IF stok_saat_ini IS NULL THEN
		RAISE NOTICE 'ID barang tidak ditemukan!';
		RETURN;
	END IF;

	IF stok_saat_ini < p_qty THEN
		RAISE NOTICE 'Stok kurang bang, stok cuma %, yang diminta %', stok_saat_ini, p_qty;
		RETURN;
	END IF;


	INSERT INTO transaksi VALUES
	(DEFAULT, p_id_barang, p_qty);

	RAISE NOTICE 
		'Transaksi berhasil! barang % terjual %, stok tersisa %', 
		p_id_barang, p_qty, stok_saat_ini - p_qty;
END
$$;

CALL prosedur_input_transaksi(1, 5);  
CALL prosedur_input_transaksi(2, 10);  
CALL prosedur_input_transaksi(3, 26);  

SELECT * FROM barang;
SELECT * FROM transaksi;
