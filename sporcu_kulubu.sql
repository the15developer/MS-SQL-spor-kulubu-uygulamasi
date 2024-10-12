create database SporKulubu

use SporKulubu

create table ANTRENMAN_YERLERI
(
  antrenman_yeri_adi varchar(30) NOT NULL PRIMARY KEY,
  adres varchar(40) NOT NULL,
  acilma_saati char(5),
  kapatma_saati char(5)
)

create table SPORCU_LISANSLARI
(
  s_lisans_no int NOT NULL PRIMARY KEY,
  baslangic_tarihi varchar(12) NOT NULL,
  bitis_tarihi varchar(12) NOT NULL,
  saglik_raporu_no int NOT NULL

)


create table ANTRENOR_LISANSLARI
(
  a_lisans_no int NOT NULL PRIMARY KEY,
  baslangic_tarihi varchar(12) NOT NULL,
  bitis_tarihi varchar(12) NOT NULL,
  saglik_raporu_no int NOT NULL
)

create table SPORCULAR
(
    sporcu_id int NOT NULL PRIMARY KEY,
	takim_id int NOT NULL,
	s_ad varchar(20) NOT NULL,
	s_soyad varchar(20) NOT NULL,
	dogum_tarihi varchar(12) NOT NULL,
	cinsiyet varchar(1) NOT NULL,
	s_lisans_no int NOT NULL,
	baba_adi varchar(40),
    anne_adi varchar(40),
	FOREIGN KEY (s_lisans_no) REFERENCES SPORCU_LISANSLARI(s_lisans_no)
)


create table ANTRENORLER
(
    antrenor_id int NOT NULL PRIMARY KEY,
    antrenor_ad varchar(20) NOT NULL,
    antrenor_soyad varchar(20) NOT NULL,
    maas int,
    ise_baslangic_tarihi varchar(12),
    a_lisans_no int NOT NULL,
	FOREIGN KEY (a_lisans_no) REFERENCES ANTRENOR_LISANSLARI(a_lisans_no)

)

create table TAKIMLAR
(  
   takim_id int NOT NULL PRIMARY KEY,
   antrenor_id int NOT NULL,
   sporcu_id int NOT NULL,
   takim_ismi varchar(20) NOT NULL,
   kurulus_tarihi date,
   antrenman_yeri_adi varchar(30),
   FOREIGN KEY (antrenor_id) REFERENCES ANTRENORLER(antrenor_id),
   FOREIGN KEY (sporcu_id) REFERENCES SPORCULAR(sporcu_id),
   FOREIGN KEY (antrenman_yeri_adi) REFERENCES ANTRENMAN_YERLERI(antrenman_yeri_adi)  	
)


create table YARISMALAR
(
    yarisma_id int NOT NULL PRIMARY KEY,
    tarih varchar(12) NOT NULL,
    duzenlenme_yeri varchar(40) NOT NULL,
    yarisma_ismi varchar(30) NOT NULL
)

create table USTUN_PERFORMANS_KAYDI
(
  sporcu_id int NOT NULL,
  yarisma_id int NOT NULL,
  basari varchar(20) NOT NULL,
  deger int,
  PRIMARY KEY (sporcu_id, yarisma_id),
  FOREIGN KEY (sporcu_id) REFERENCES SPORCULAR(sporcu_id),
  FOREIGN KEY (yarisma_id) REFERENCES YARISMALAR(yarisma_id)
)

create table YARISMA_KAYDI
(
   yarisma_id int NOT NULL,
   takim_id int NOT NULL,
   PRIMARY KEY (yarisma_id, takim_id),
   FOREIGN KEY (yarisma_id) REFERENCES YARISMALAR(yarisma_id),
   FOREIGN KEY (takim_id) REFERENCES TAKIMLAR(takim_id),
   note varchar(20)
)

create table ODULLER
(
  yarisma_id int NOT NULL,
  odul_derecesi int NOT NULL,
  takim_id int NOT NULL,
  PRIMARY KEY (yarisma_id, odul_derecesi),
  FOREIGN KEY (yarisma_id) REFERENCES YARISMALAR(yarisma_id),
  FOREIGN KEY (takim_id) REFERENCES TAKIMLAR(takim_id)

)

INSERT INTO SPORCU_LISANSLARI VALUES(150,'18.01.2024','18.01.2025', 100)
INSERT INTO SPORCU_LISANSLARI VALUES(151, '18.01.2024','18.01.2025', 101)
INSERT INTO SPORCU_LISANSLARI VALUES(152, '18.01.2024','18.01.2025', 102)
INSERT INTO SPORCU_LISANSLARI VALUES(153, '18.01.2024','18.01.2025', 103)
INSERT INTO SPORCU_LISANSLARI VALUES(154, '18.01.2024','18.01.2025', 104)
INSERT INTO SPORCU_LISANSLARI VALUES(155, '18.01.2024','18.01.2025', 105)
INSERT INTO SPORCU_LISANSLARI VALUES(156, '18.01.2024','18.01.2025', 106)
INSERT INTO SPORCU_LISANSLARI VALUES(157, '18.01.2024','18.01.2025', 107)
INSERT INTO SPORCU_LISANSLARI VALUES(158, '18.01.2024','18.01.2025', 108)


INSERT INTO SPORCULAR(sporcu_id, takim_id, s_ad, s_soyad, dogum_tarihi, cinsiyet, s_lisans_no) VALUES(1,3,'Mete', 'Ozturk','18.03.2000', 'E', 150)
INSERT INTO SPORCULAR(sporcu_id, takim_id, s_ad, s_soyad, dogum_tarihi, cinsiyet, s_lisans_no) VALUES(2,3,'Ayse','Soydere','12.07.1999', 'K', 151)
INSERT INTO SPORCULAR(sporcu_id, takim_id, s_ad, s_soyad, dogum_tarihi, cinsiyet, s_lisans_no) VALUES(3,1,'Sude', 'Koc', '31.05.2001', 'K', 152)
INSERT INTO SPORCULAR(sporcu_id, takim_id, s_ad, s_soyad, dogum_tarihi, cinsiyet, s_lisans_no) VALUES(4,2,'Mustafa', 'Guven', '06.12.2001', 'E', 153)
INSERT INTO SPORCULAR(sporcu_id, takim_id, s_ad, s_soyad, dogum_tarihi, cinsiyet, s_lisans_no) VALUES(5,2,'Emre', 'Demirez', '27.11.2000', 'E', 154)
INSERT INTO SPORCULAR(sporcu_id, takim_id, s_ad, s_soyad, dogum_tarihi, cinsiyet, s_lisans_no) VALUES(6,1,'Halil', 'Eken', '13.08.1999', 'E', 155)
INSERT INTO SPORCULAR(sporcu_id, takim_id, s_ad, s_soyad, dogum_tarihi, cinsiyet, s_lisans_no) VALUES(7,1,'Harun', 'Kaya', '11.12.2000', 'E', 156)
INSERT INTO SPORCULAR(sporcu_id, takim_id, s_ad, s_soyad, dogum_tarihi, cinsiyet, s_lisans_no) VALUES(8,2,'Gizem', 'Soydan', '08.02.2001', 'K', 157)
INSERT INTO SPORCULAR(sporcu_id, takim_id, s_ad, s_soyad, dogum_tarihi, cinsiyet, s_lisans_no) VALUES(9,3,'Betul', 'Uye', '23.01.2001', 'K', 158)


INSERT INTO ANTRENOR_LISANSLARI VALUES(160, '18.01.2024','18.01.2025', 110)
INSERT INTO ANTRENOR_LISANSLARI VALUES(161, '18.01.2024','18.01.2025', 111)
INSERT INTO ANTRENOR_LISANSLARI VALUES(162, '18.01.2024','18.01.2025', 112)


INSERT INTO ANTRENORLER VALUES(1,'Gokhan', 'Kaya', 3400, '18.01.2024', 160)
INSERT INTO ANTRENORLER VALUES(2,'Ahmet', 'Nuray', 4300, '18.01.2024', 161)
INSERT INTO ANTRENORLER VALUES(3,'Sinan', 'Tarkan', 3700, '18.01.2024', 162)

INSERT INTO ANTRENMAN_YERLERI(antrenman_yeri_adi, adres) VALUES('Spor Tesisi 1', 'Istanbul, Gungoren')
INSERT INTO ANTRENMAN_YERLERI(antrenman_yeri_adi, adres) VALUES('Spor Tesisi 2', 'Istanbul, Eyup')
INSERT INTO ANTRENMAN_YERLERI(antrenman_yeri_adi, adres) VALUES('Spor Tesisi 3', 'Istanbul, Maltepe')
INSERT INTO ANTRENMAN_YERLERI(antrenman_yeri_adi, adres) VALUES('Spor Tesisi 4', 'Istanbul, Buyukcekmece')
INSERT INTO ANTRENMAN_YERLERI(antrenman_yeri_adi, adres) VALUES('Spor Tesisi 5', 'Istanbul, Fatih')


insert into TAKIMLAR(takim_id, antrenor_id, sporcu_id, takim_ismi, antrenman_yeri_adi) values(1, 3, 7, 'Winners', 'Spor Tesisi 1')
insert into TAKIMLAR(takim_id, antrenor_id, sporcu_id, takim_ismi, antrenman_yeri_adi) values(2, 2, 8, 'The Best Team', 'Spor Tesisi 2')
insert into TAKIMLAR(takim_id, antrenor_id, sporcu_id, takim_ismi, antrenman_yeri_adi) values(3, 1, 1, 'Divide and Conquer', 'Spor Tesisi 3')

insert into YARISMALAR VALUES(1, '12.02.2024', 'Kahire', 'Yarisma 1')
insert into YARISMALAR VALUES(2, '23.05.2024', 'Berlin', 'Yarisma 2')
insert into YARISMALAR VALUES(3, '30.07.2024', 'Hong Kong', 'Yarisma 3')
insert into YARISMALAR VALUES(4, '03.11.2024', 'Moskova', 'Yarisma 4')


insert into USTUN_PERFORMANS_KAYDI VALUES(3, 1, '100 m', 11)
insert into USTUN_PERFORMANS_KAYDI VALUES(6, 1, '200 m', 22)
insert into USTUN_PERFORMANS_KAYDI VALUES(1, 2, 'Disk Atma - 1 kilo', 25)
insert into USTUN_PERFORMANS_KAYDI VALUES(7, 3, 'Yuksek Atlama', 2)
insert into USTUN_PERFORMANS_KAYDI VALUES(3, 3, 'Sirikla Atlama', 5)
insert into USTUN_PERFORMANS_KAYDI VALUES(9, 4, '1500 m', 3)

insert into YARISMA_KAYDI(yarisma_id, takim_id) VALUES(1,1)
insert into YARISMA_KAYDI(yarisma_id, takim_id) VALUES(1,2)
insert into YARISMA_KAYDI(yarisma_id, takim_id) VALUES(1,3)
insert into YARISMA_KAYDI(yarisma_id, takim_id) VALUES(2,1)
insert into YARISMA_KAYDI(yarisma_id, takim_id) VALUES(2,3)
insert into YARISMA_KAYDI(yarisma_id, takim_id) VALUES(3,1)
insert into YARISMA_KAYDI(yarisma_id, takim_id) VALUES(3,2)
insert into YARISMA_KAYDI(yarisma_id, takim_id) VALUES(3,3)
insert into YARISMA_KAYDI(yarisma_id, takim_id) VALUES(4,1)
insert into YARISMA_KAYDI(yarisma_id, takim_id) VALUES(4,2)
insert into YARISMA_KAYDI(yarisma_id, takim_id) VALUES(4,3)

insert into ODULLER values(1, 1, 1)
insert into ODULLER values(1, 2, 1)
insert into ODULLER values(2, 1, 3)
insert into ODULLER values(3, 3, 1)   
insert into ODULLER values(3, 1, 1)
insert into ODULLER values(4, 2, 3)



-- Istanbul, Maltepe' de antrenman yapan sporcularin tum bilgilerini getiriniz

select * from SPORCULAR as S where S.takim_id in ( select T.takim_id from TAKIMLAR as T where T.antrenman_yeri_adi = ( select antrenman_yeri_adi from ANTRENMAN_YERLERI where adres = 'Istanbul, Maltepe'))

-- Yarismalarda ustun performans gosteren sporcularin id, isim, soyisim, hangi takimda olduklarini ve hangi yarismada hangi basariyi elde ettikleri bilgilerini, yarismanin duzenlendigi sehir bilgisi ile birlikte getiriniz

select S.sporcu_id, s_ad, s_soyad, takim_id, Y.yarisma_id, basari, deger, duzenlenme_yeri from SPORCULAR as S join USTUN_PERFORMANS_KAYDI as U on S.sporcu_id = U.sporcu_id join YARISMALAR as Y on Y.yarisma_id = U.yarisma_id

-- Yarismalarda odul alan takimlarin id, isim, antrenor ad, soyad ve aldiklari odulleri bilgilerini getiriniz

select T.takim_id, takim_ismi, antrenor_ad, antrenor_soyad, odul_derecesi from TAKIMLAR as T join ODULLER as O on T.takim_id = O.takim_id join ANTRENORLER as A on A.antrenor_id = T.antrenor_id order by T.takim_id 

-- yeni sporcu ekleyen stored proc, ayni zamanda yeni sporcunun sporcu lisansini da ekliyor


create proc SporcuEkle
(
@takimID int, 
@ad varchar(20),
@soyad varchar(20),
@dogumTarihi varchar(12),
@cinsiyet varchar(1)
)
as
begin
declare @s_id int, @s_lisans int, @saglik_raporu int
declare @basl varchar(12), @bitis varchar(12)
set @basl = '18.01.2024'
set @bitis = '18.01.2025'
set @s_id = (select count(*) from SPORCULAR) + 1
set @s_lisans = (select s_lisans_no from SPORCULAR where sporcu_id = ( select count(*) from SPORCULAR)) + 1
set @saglik_raporu = ( select saglik_raporu_no from SPORCU_LISANSLARI where s_lisans_no = ( select s_lisans_no from SPORCULAR where sporcu_id = ( select count(*) from SPORCULAR) ) ) + 1

insert into SPORCU_LISANSLARI values(@s_lisans, @basl, @bitis, @saglik_raporu)
INSERT INTO SPORCULAR(sporcu_id, takim_id, s_ad, s_soyad, dogum_tarihi, cinsiyet, s_lisans_no) VALUES(@s_id, @takimID, @ad, @soyad, @dogumTarihi, @cinsiyet, @s_lisans )
end


exec SporcuEkle 1, 'Ozan', 'Turan', '15.09.2002', 'E'

-- hangi takimin hangi antrenoru oldugunu cumle seklinde yazdiran fonksiyon

create function FN_Birlestir
(
@takim_isim varchar(20)
)

returns varchar(100)
as
begin

    declare @a_ad varchar(20), @a_soyad varchar(20), @takim_ismi varchar(20)
    set @a_ad = (select antrenor_ad from ANTRENORLER as a where a.antrenor_id = ( select t.antrenor_id from TAKIMLAR as t where t.takim_ismi = @takim_isim))
    set @a_soyad = (select antrenor_soyad from ANTRENORLER as a where a.antrenor_id = ( select t.antrenor_id from TAKIMLAR as t where t.takim_ismi = @takim_isim))
    set  @takim_ismi = @takim_isim
    return (@takim_ismi + space(1) + 'takiminin antrenoru :' + space(1) + @a_ad + space(1) + @a_soyad)
end


select dbo.FN_Birlestir('Winners')

-- yeni bir yarisma eklendiginde otomatik olarak tum takimlar icin o yarismaya kayit olusturan trigger ( isteyen takim daha sonra yarismaya katilmama istegini belirtebilir ) 

create trigger YarismaKayit
on YARISMALAR
after insert 
as
begin
declare @yarismaID int
declare @takimID int
declare @i int = 0
declare @sayi int = (select count(*) from TAKIMLAR)
select @yarismaID = yarisma_id from inserted

while(@i < @sayi)
begin
set @takimID = @i+1
insert into YARISMA_KAYDI(yarisma_id, takim_id) values(@yarismaID, @takimID)
set @i+=1
end

end


insert into YARISMALAR values(5, '20.10.2024', 'Bucharest', 'Yarisma 5')








