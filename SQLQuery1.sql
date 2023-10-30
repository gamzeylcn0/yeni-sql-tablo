CREATE TABLE TBLUYELER(
	UyeNO INT IDENTITY(1,1),
	UyeAdi VARCHAR(20),
	UyeSoyadi VARCHAR(20),
	Cinsiyet VARCHAR(5),
	Telefon VARCHAR(15),
	Eposta VARCHAR(40),
	AdresNo INT,
	PRIMARY KEY("UyeNo")
);

CREATE TABLE TBLADRESLER(
	AdresNo INT IDENTITY(1,1),
	Cadde VARCHAR(20),
	Mahalle VARCHAR(20),
	BinaNo VARCHAR(20),
	Sehir VARCHAR(20),
	PostaKodu INT, 
	Ulke VARCHAR(20),
	PRIMARY KEY ("AdresNo")
);

ALTER TABLE TBLUYELER ADD CONSTRAINT "TBLADRESLER_UYELER" 
FOREIGN KEY (AdresNo) REFERENCES TBLADRESLER(AdresNo);

CREATE TABLE TBLEMANET(
	EmanetNo INT IDENTITY(1,1),
	ISBN VARCHAR(20) NOT NULL,
	UyeNo INT NOT NULL,
	KutuphaneNo INT NOT NULL,
	EmanetTarihi DATETIME,
	TeslimTarihi DATETIME,
	PRIMARY KEY ("EmanetNo")
);

CREATE TABLE TBLKITAPLAR(
	ISBN VARCHAR(20),
	KitapAdi VARCHAR(20),
	YayinTarihi VARCHAR(20),
	SayfaSayisi INT,
	PRIMARY KEY ("ISBN")
);

CREATE TABLE TBLYAZARLAR(
	YazarNo INT IDENTITY(1,1),
	YazarAdi VARCHAR(20),
	YazarSoyadi VARCHAR(20),
	PRIMARY KEY ("YazarNo")
);

CREATE TABLE TBLKATEGORILER(
	KategoriNo INT IDENTITY(1,1),
	KategoriAdi VARCHAR(20),
	PRIMARY KEY ("KategoriNo")
);

CREATE TABLE TBLKUTUPHANE(
	KutuphaneNo INT IDENTITY(1,1),
	KutuphaneAdi VARCHAR(20),
	Aciklama VARCHAR(20),
	AdresNo INT,
	PRIMARY KEY ("KutuphaneNO")
);

CREATE TABLE TBLKITAP_KUTUPHANE(
	KUTUPHANE_NO INT NOT NULL,
	ISBN VARCHAR(20) NOT NULL,
	Miktar INT,
	CONSTRAINT "KITAP_KUTUPHANE_PK" PRIMARY KEY ("KUTUPHANE_NO", "ISBN"),
	CONSTRAINT "KITAP_KUTUPHANE_FK" FOREIGN KEY ("KUTUPHANE_NO") REFERENCES TBLKATEGORILER(KategoriNo)

);

CREATE TABLE TBLKITAP_KATEGORI(
	ISBN VARCHAR(20) NOT NULL,
	KategoriNo INT NOT NULL,
	CONSTRAINT "KITAP_KATEGORI_PK" PRIMARY KEY ("KategoriNo", "ISBN")
);

CREATE TABLE TBLKITAP_YAZAR(
	ISBN VARCHAR(20) NOT NULL,
	YazarNo INT NOT NULL,
	CONSTRAINT "KITAP_YAZAR_PK" PRIMARY KEY ("YazarNo", "ISBN")
);


Select * From TBLADRESLER Where AdresNo ='1' 

INSERT INTO TBLADRESLER 
VALUES ('Istasyon','Seyhan','7','Hatay','3502','Turkey');

INSERT INTO TBLADRESLER (Cadde,Mahalle,Sehir,Ulke)
VALUES ('Guler','Fenerbahce','Istanbul','Turkey');

INSERT INTO TBLADRESLER 
VALUES ('Istasyon','Seyhan','7','Hatay','3502','Turkey');

--TBLADRESLER tablosundaki AdresNo 1 olan satýrdaki mahalle ismini gazi ve sehir ismimi muðla olarak güncelleme kodu
UPDATE TBLADRESLER
SET Mahalle = 'Gazi', Sehir= 'Muðla'
WHERE AdresNo = 1;

--TBLADRESLER tablosundaki AdresNo 3 olan satýrý silme kodu
Delete From TBLADRESLER Where AdresNo =3;


