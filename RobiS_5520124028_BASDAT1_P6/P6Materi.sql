--membuat tabel
CREATE TABLE rekening (
	id_rekening SERIAL PRIMARY KEY,
	nama VARCHAR(100),
	saldo INT 
);

-- isi data 
INSERT INTO rekening VALUES
(DEFAULT, 'Robi', 500000),
(DEFAULT, 'Septiandi', 750000),
(DEFAULT, 'Rose', 100000);

SELECT * FROM rekening;
-- sayarat saldo minimal 20k
--prosedur tambah rekening

CREATE OR REPLACE PROCEDURE procedur_tambah_rekening(
	IN nama_nasabah VARCHAR(100),
	IN saldo INT 
)
LANGUAGE PLPGSQL
AS 
$$
BEGIN

	IF(saldo >= 20000) THEN
		INSERT INTO rekening VALUES
		(DEFAULT, nama_nasabah, saldo);
		RAISE NOTICE 'Saldo Bertambah ke %, Sejumlah %!' , nama_nasabah, saldo;
	ELSE 
		RAISE NOTICE 'Saldo kurang dari 20k jiierrr';
	END IF;


END
$$

SELECT * FROM rekening
CALL procedur_tambah_rekening('Sore', 10000)
CALL procedur_tambah_rekening('Xore', 5000000)
CALL procedur_tambah_rekening('Xore', 5000000)
CALL procedur_tambah_rekening('Roxe', 1000000)
CALL procedur_tambah_rekening('Sheeva', 10000000)
CALL procedur_tambah_rekening('Nurhanifah', 100000)

--hapus procedur

DROP PROCEDURE procedur_tambah_rekening( VARCHAR,INT );


-- prosedur cek saldo berdasar id
CREATE OR REPLACE PROCEDURE pro_cek_saldo(
	IN id_nasabah INT ,
	OUT saldo_nasabah INT
)
LANGUAGE PLPGSQL
AS 
$$
BEGIN

	SELECT saldo INTO saldo_nasabah FROM  rekening
	WHERE id_rekening = id_nasabah;
	
	IF (id_nasabah = NULL) THEN
		saldo_nasabah := NULL;
		RAISE NOTICE 'ID tidak terdaftar';
	ELSE
		RAISE NOTICE 'Saldo rekening adalah %' , saldo_nasabah;
	END IF;
	
END
$$

DROP PROCEDURE  pro_cek_saldo;
CALL pro_cek_saldo(7, NULL)

















