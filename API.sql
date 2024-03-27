-- Crea la base de datos para la API, establece el CHARSET que utiliza y el formato de cotejamiento de las entradas
CREATE DATABASE IF NOT EXISTS hondaAPI DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

-- Crea las tablas que conforman la base de datos

CREATE TABLE IF NOT EXISTS Motores ( -- Tabla de Motores: Contiene todos los datos relacionados con un motor concreto
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    CodigoMotor VARCHAR(15) NOT NULL,
    Combustible VARCHAR(15),
    TipoMotor VARCHAR(255),
    Cilindrada INT,
    RelacionCompresion VARCHAR(40),
    DiametroCarrera VARCHAR(50),
    PotenciaMaxima VARCHAR(255),
    ParMaximo VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Modelos ( -- Tabla de Modelos: Contiene los datos generales como medida y peso de cada modelo (con cada modelo se refiere a cada una de las generaciones de cada modelo)
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NombreModelo VARCHAR(50) NOT NULL,
    LongitudChasis VARCHAR(150),
    Peso VARCHAR(255),
    Transmision VARCHAR(255),
    datosExtra VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Motorizaciones ( -- Tabla de Motorizaciones: Contiene los datos principales sobre la relacion N:M entre motores y modelos, llamada motorizaciones
    ModeloID INT NOT NULL,
    CodigoMotorID INT NOT NULL,
    PeriodoUso VARCHAR(50)
);

-- IMPORTANTE!! Añadir los FK a la tabla de motorizaciones para que funcione la estructura

ALTER TABLE Motorizaciones ADD FOREIGN KEY (CodigoMotorID) REFERENCES Motores(ID);
ALTER TABLE Motorizaciones ADD FOREIGN KEY (ModeloID) REFERENCES Modelo(ID);

-- INSERTAR VALORES (MODELOS)

-- CIVIC (Modelos)

INSERT INTO Modelos VALUES (DEFAULT ,"Civic primera generación", "3p (Hatchback): 3.4m - 5p (Hatchback): 3.5m", "680 kg (1499 lb)", "4 velocidades manual, 5 velocidades manual, 2 velocidades automática (Hondamatic)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Civic segunda generación", "3p (Hatchback): 3.4m - 5p (Hatchback): 3.5m", "3p: 720-780 kg (1587 - 1719 lb), 4p: 780-835 kg (1719 - 1840 lb), 5p: 750-780 kg (1653 - 1719 lb)", "4 velocidades manual, 5 velocidades manual, 2 velocidades automática (Hondamatic)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Civic tercera generación", "3p (Hatchback): 3.7m, 4p (Sedán): 4m, 5p (Hatchback): 3.8m", "3p (Hatchback): 740 - 780 kg (1631 - 1720 lb), 4p (Sedán): 760 - 790 kg (1676 - 1742 lb)", "4 velocidades manual, 5 velocidades manual, 4WD 5+1 velocidades manual, 3 velocidades automática (Hondamatic)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Civic cuarta generación", "3p (Hatchback): 3.7m, 4p (Sedán): 4m, 5p (Hatchback): 3.8m", "3p (Hatchback): 832 - 1030 kg (1834 - 2271 lb), 4p (Sedán): 883 - 942 kg (1947 - 2077 lb), 5p (Shuttle): 931 - 1050 kg (2053 - 2315 lb)", "4 velocidades manual, 5 velocidades manual, 6 velocidades manual (shuttle), 4 velocidades automática", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Civic quinta generación", "2p (Cupé): 4.4m, 4p (Sedán): 4.4m, 5p (Hatchback): 4m", "3p (Hatchback): 925 - 1083 kg (2039 - 2388 lb), 965 - 1138 kg (2127 - 2509 lb), 2p (Coupé): 998 kg - 1037 kg (2200 - 2286 lb)", "5 velocidades manual, 4 velocidades automático", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Civic sexta generación", "2p (Cupé): 4.3m, 4p (Sedán): 4.4m, 5p (Hatchback): 4m", "1090 - 1210 kg (2403 - 2668 lb), 3p (Hatchback): 940 - 1065 kg (2072 - 2348 lb), 4p (Sedán): 965 - 1090 kg (2127 - 2403 lb), 5p (Hatchback): 1040 - 1160 kg (2293 - 2557 lb), 2p (Cupé): 1000 kg (2205 lb)", "5 velocidades manual, 4 velocidades automática, CVT (Transmisión variable continua, solo en el HX)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Civic séptima generación", "2p (Cupé): 4.4m, 4p (Sedán): 4.4m, 5p (Hatchback): 4.3m", "2p (Cupé): 1073 - 1130 kg (2366 - 2491 lb), 3p (Hatchback): 1067 - 1232 kg (2352 - 2716 lb), 4p (Sedán): 1210 kg (2668 lb), 5p (Hatchback): 1095 - 1259 kg (2414 - 2776 lb)", "5 velocidades manual, 6 velocidades manual, 4 velocidades automática, 5 velocidades automática, CVT (Transmisión variable continua)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Civic octava generación", "4.2m - 4.5m", "3p (Hatchback): 1196 - 1324 kg (2637 - 2919 lb), 4p (Sedán): 1268 kg (2795 lb)", "5 velocidades manual, 6 velocidades manual, 5 velocidades automático, 6 velocidades automático, Transmisión variable continua (CVT)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Civic novena generación", "2p (Cupé): 4.5m, 4p (Sedán): 4.5m", "5p (Hatchback): 1256 - 1438 kg (2769 - 3170 lb), 5p (Tourer): 1355 - 1412 kg (2987 - 3113 lb)", "5 velocidades manual, 6 velocidades manual, 5 velocidades automático, 6 velocidades automático", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Civic décima generación", "2p (Cupé): 4.5m, 4p (Sedán): 4.6m, 5p (Hatchback): 4.7m", "4p (Sedán), 5p (Hatchback): 1354 - 1382 kg (2985 - 3047 lb)", "6 velocidades manual, 9 velocidades automática (ZF 9HP), Transmisión continua variable (CVT)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Civic undécima generación", "4p (Sedán): 4.7m, 5p (Hatchback): 4.5m", "1429 kg (3150 lb)", "6 velocidades manual, Transmisión Continua Variable (CVT), Transmisión Continua Variable Electrónica (eCVT)", NULL);

-- ACCORD (Modelos)

INSERT INTO Modelos VALUES (DEFAULT ,"Accord primera generación", "3p (Hatchback): 4.1m, 4p (Sedán): 4.4m", "905 - 925 kg (1995 - 2039 lb)", "5 velocidades manual, 2 velocidades automática (Hondamatic), 3 velocidades automática (Hondamatic)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Accord segunda generación", "3p (Hatchback): 4.1m, 4p (Sedán): 4.4m", "925 - 1040 kg (2039 - 2293 lb)", "5 velocidades manual, 3 velocidades automática (Hondamatic), 4 velocidades automática (Hondamatic)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Accord tercera generación", "2p (Cupé): 4.4m, 3p (Hatchback, Fastback): 4.4m, 3p (Shooting-brake, AeroDeck): 4.5m, 4p (Sedán): 4.5m", "3p (AeroDeck): 1150 kg (2535 lb), 4p (Sedán): 1024 - 1146 kg (2258 - 2526 lb)", "5 velocidades manual, 4 velocidades automática", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Accord cuarta generación", "2p (Cupé), 4p (Sedán), 5p (Stationwagon): 4.7m", "1191 - 1275 kg (2626 - 2811 lb)", "5 velocidades manual, 4 velocidades automática", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Accord quinta generación", "2p (Cupé): 4.7m, 4p (Sedán): 4.7m (4.8m en la versión V6), 5p (Stationwagon): 4.8m", "1215 - 1330 kg (2679 - 2932 lb)", "5 velocidades manual, 4 velocidades automática", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Accord sexta generación", "2p (Cupé): 4.7m, 4p (Sedán): 4.8m", "2p (Cupé): 1370 - 1430 kg (3020 - 3153 lb), 4p (Sedán): 1230 - 1411 kg (2712 - 3111 lb)", "5 velocidades manual, 4 velocidades automática", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Accord séptima generación", "4p (Sedán): 4.6m, 5p (Stationwagon): 4.7m", "4p (Sedán): 1426 - 1552 kg (3144 - 3422 lb), 5p (Stationwagon): 1480 - 1667 kg (3263 - 3675 lb)", "5 velocidades manual, 6 velocidades manual, 5 velocidades automática", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Accord octava generación", "4p (Sedán), 5p (Tourer): 4.7m", "4p (Sedán): 1489 - 1668 kg (3283 - 3677 lb), 5p (Tourer): 1507 - 1708 kg (3322 - 3765 lb)", "5 velocidades manual, 6 velocidades manual, 5 velocidades automática", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Accord novena generación", "2p (Cupé): 4.8m, 4p (Sedan): 4.9m", "2p (Cupé): 1445 - 1600 kg (3186 - 3527 lb), Sedán 4p: 1448 - 1723 kg (3192 - 3799 lb)", "6 velocidades manual, 5 velocidades automática, 6 velocidades automática, CVT (Transmisión continua variable)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Accord décima generación", "4.9m", "1431 - 1525 kg (3155 - 3362 lb)", "CVT (Transmisión continua variable), eCVT", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Accord undécima generación", "5m", "1582-1606 kg (3487 lb - 3540 lb)", "eCVT (Transmisión continua variable electrónica)", NULL);

-- CRX (Modelos)

INSERT INTO Modelos VALUES (DEFAULT ,"CRX primera generación", "3.7m", "825 - 881 kg (1819 - 1942 lb)", "5 velocidades manual, 3 velocidades automática (Hondamatic)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"CRX segunda generación", "3.7m", "909 - 1010 kg (2004 - 2227 lb)", "5 velocidades manual, 4 velocidades automática", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"CRX tercera generación", "4m", "1030 - 1100 kg (2271 - 2425 lb)", "5 velocidades manual, 4 velocidades automática", NULL);

-- Prelude (Modelos)

INSERT INTO Modelos VALUES (DEFAULT ,"Prelude primera generación", "4m", "880 - 910 kg (1940 - 2006 lb)", "5 velocidades manual, 2 velocidades automática (Hondamatic), 3 velocidades automática (Hondamatic)", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Prelude segunda generación", "4.3m", "965 - 1050 kg (2127 - 2315 lb)", "5 velocidades manual, 4 velocidades automática", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Prelude tercera generación", "4.4m (1988-89), 4.5m (1990-91)", "1050 - 1110 kg (2315 - 2447 lb)", "5 velocidades manual, 4 velocidades automática", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Prelude cuarta generación", "4.4m", "1193 - 1305 kg (2630 - 2877 lb)", "5 velocidades manual, 4 velocidades automática", NULL);
INSERT INTO Modelos VALUES (DEFAULT ,"Prelude quinta generación", "4.5m", "1190 - 1310 kg (2624 - 2888 lb)", "5 velocidades manual, 4 velocidades automática", NULL);

-- S2K (Modelos)

INSERT INTO Modelos VALUES (DEFAULT ,"S2000", "4.1m (1999-2009), 4.2m (2008-2009)", "1260 - 1320 kg (2778 - 2910 lb)", "6 velocidades manual", NULL);

-- NSX (Modelos)

INSERT INTO Modelos VALUES (DEFAULT ,"NSX primera generación", "4.4m", "NA1: 1365 - 1412 kg (3009 - 3113 lb), NA1-T: 1425 - 1455 kg (3142 - 3208 lb), NA2: 1450 kg (3197 lb)", "5 velocidades manual, 6 velocidades manual, 4 velocidades automática", "NA1: NSX 1992: 11.500.000 ptas (66.000€), NSX Targa 1992: 12.931.000 ptas (77.716€), NA2: NSX Targa 2001: 95.000€");
INSERT INTO Modelos VALUES (DEFAULT ,"NSX segunda generación", "4.4m (2016-2018), 4.5m (2019-2021), 4.5m (Type S)", "1725 kg (3803 lb)", "9 velocidades semiautomática (Levas) de doble embrague", NULL);

-- INSERTAR VALORES (MOTORES)

-- SERIE A

INSERT INTO Motores VALUES (DEFAULT, "A16A1", "Gasolina", "L4, SOHC, 12v, PGM-CARB, monocarburador", 1829, "9:1", "80 mm x 79.5 mm (3.15 in x 3.13 in)", "100CV (74 kW) @ 5800 rpm", "110 lb/ft (149 Nm) @ 3500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "A18A", "Gasolina", "L4, SOHC, 12v, PGM-CARB, monocarburador", 1598, "9.4:1", "80 mm x 91 mm (3.15 in x 3.58 in)", "89CV (65 kW) @ 6000 rpm", "90 lb/ft (123 Nm) @ 3500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "A20A1", "Gasolina", "L4, SOHC, 12v, PGM-CARB, monocarburador", 1955, "9.2:1", "82.7 mm x 91 mm (3.26 in x 3.58 in)", "99CV (73 kW) @ 5500 rpm", "109 lb/ft (148 Nm) @ 3500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "A20A2", "Gasolina", "L4, SOHC, 12v, PGM-CARB, monocarburador", 1955, "9.2:1", "82.7 mm x 91 mm (3.26 in x 3.58 in)", "108CV (79 kW) @ 5500 rpm", "117 lb/ft (159 Nm) @ 3500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "A20A3", "Gasolina", "L4, SOHC, 12v, PGM-FI, Inyección monopunto", 1955, "8.8:1", "82.7 mm x 91 mm (3.26 in x 3.58 in)", "99CV (73 kW) @ 5500 rpm", "102 lb/ft (138 Nm) @ 4500 rpm");

-- SERIE B

INSERT INTO Motores VALUES (DEFAULT, "B16A DOHC", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1595, "10.2:1", "74 mm x 86.5 mm (2.91 in x 3.41 in)", "126CV (93 kW) @ 6800 rpm", "105 lb/ft (143 Nm) @ 5700 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B16A", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1595, "10.4:1", "81 mm × 77.4 mm (3.19 in × 3.05 in)", "170CV (125 kW) @ 7400 rpm", "116 lb/ft (157 Nm) @ 7000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B16A SiR-II JDM", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1595, "10.4:1", "81 mm × 77.4 mm (3.19 in × 3.05 in)", "170CV (125 kW) @ 7400 rpm", "116 lb/ft (157 Nm) @ 7000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B16A1", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1595, "10.2:1", "81 mm × 77.4 mm (3.19 in × 3.05 in)", "150CV (112 kW) @ 7600 rpm", "111 lb/ft (150 Nm) @ 7100 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B16A2", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1595, "10.2:1", "81 mm × 77.4 mm (3.19 in × 3.05 in)", "160CV (119 kW) @ 7600 rpm", "111 lb/ft (150 Nm) @ 6500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B16A3", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1595, "10.2:1", "81 mm × 77.4 mm (3.19 in × 3.05 in)", "160CV (119 kW) @ 7600 rpm", "111 lb/ft (150 Nm) @ 6700 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B16B", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1595, "10.8:1", "81 mm × 77.4 mm (3.19 in × 3.05 in)", "185CV (138KW) @ 8200 rpm", "118 lb/ft (160 Nm) @ 7500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B18A", "Gasolina", "L4, DOHC, 16v, PGM-CARB, carburador doble", 1834, "9.4:1", "81 mm x 89 mm (3.19 in x 3.50 in)", "100CV (74 kW) @ 6100 rpm", "128 lb/ft (174 Nm) @ 4700 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B20A1", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1958, "9.4:1", "81 mm x 95 mm (3.18 in x 3.74 in)", "137CV (102 kW) @ 6000 rpm", "127 lb/ft (172 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B20A3", "Gasolina", "L4, SOHC, 12v, PGM-CARB, carburador doble", 1958, "8.8:1", "81 mm x 95 mm (3.18 in x 3.74 in)", "104CV (78 kW) @ 5800 rpm (Manual con catalizador), 115CV (86 kW) @ 5800 rpm (Sin catalizador)", "111 lb/ft (150 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B20A5", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1958, "9:1", "81 mm x 95 mm (3.18 in x 3.74 in)", "135CV (101 kW) @ 6200 rpm", "127 lb/ft (172 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B20A6", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1958, "10.5:1", "81 mm x 95 mm (3.18 in x 3.74 in)", "142CV (106 kW) @ 6000 rpm", "130 lb/ft (174 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B20A7", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1958, "10.5:1", "81 mm x 95 mm (3.18 in x 3.74 in)", "150CV (112 kW) @ 6000 rpm", "133 lb/ft (180 Nm) @ 5500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B20A8", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1958, "9.2:1", "81 mm x 95 mm (3.18 in x 3.74 in)", "133CV (98 kW) @ 6000 rpm", "133 lb/ft (180 Nm) @ 5500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B20A9", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1958, "9.3:1", "81 mm x 95 mm (3.18 in x 3.74 in)", "139CV (104 kW) @ 6000 rpm", "129 lb/ft (175 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B21A", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 2056, "9.4:1", "83 mm x 95 mm (3.26 in x 3.74 in)", "140CV (104 kW) @ 5800 rpm", "135 lb/ft (183 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "B21A1", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 2056, "9.3:1", "83 mm x 95 mm (3.26 in x 3.74 in)", "140CV (104 kW) @ 5800 rpm", "135 lb/ft (183 Nm) @ 5000 rpm");

-- SERIE C

INSERT INTO Motores VALUES (DEFAULT, "C27A4", "Gasolina", "V6, SOHC, 24v, PGM-FI, Inyección multipunto", 2675, "9:1", "87 mm x 75 mm (3.43 in x 2.95 in)", "172CV (128 kW) @ 6100 rpm", "166 lb/ft (225 Nm) @ 5200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "C30A", "Gasolina", "V6, DOHC, 24v, VTEC + VVIS, PGM-FI, Inyección multipunto", 2977, "10.2:1", "90 mm x 78 mm (3.54 in x 3.07 in)", "275CV (201 kW) @ 7300 rpm", "210 lb/ft (284 Nm) @ 6500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "C32B", "Gasolina", "V6, DOHC, 24v, VTEC + VVIS, PGM-FI, Inyección multipunto", 3179, "10.2:1", "93 mm x 78 mm (3.66 in x 3.07 in)", "280CV (206 kW) @ 7300 rpm (NSX-R), 290CV (216 kW) @ 7100 rpm (Acura)", "224 lb/ft (304 Nm) @ 5500 rpm (NSX-R y Acura)");

-- SERIE D

INSERT INTO Motores VALUES (DEFAULT, "D12B1", "Gasolina", "L4, SOHC, 16v, PGM-CARB, monocarburador", 1193, "8.6:1", "75 mm × 67.5 mm (2.95 in x 2.66 in)", "74CV (54 kW) @ 6300 rpm", "65 lb/ft (88 Nm) @ 3500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D13B1", "Gasolina", "L4, SOHC, 16v, PGM-CARB, monocarburador", 1343, "9.5:1", "75 mm × 76 mm (2.95 in x 2.99 in)", "76CV (56   kW) @ 6300 rpm", "75 lb/ft (102 Nm) @ 3100 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D13B2", "Gasolina", "L4, SOHC, 16v, PGM-CARB, monocarburador", 1343, "9:1", "75 mm × 76 mm (2.95 in x 2.99 in)", "75CV (55 kW) @ 6300 rpm", "75 lb/ft (102 Nm) @ 3100 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D13B4", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1343, "9.75:1", "75 mm × 76 mm (2.95 in x 2.99 in)", "91CV (67KW) @ 6300 rpm", "84 lb/ft (114 Nm) @ 4800 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D14A1", "Gasolina", "L4, SOHC, 16v, PGM-CARB, carburador doble", 1396, "9.3:1", "75 mm × 79 mm (2.95 in x 3.11 in)", "90CV (66 kW) @ 6300 rpm", "82 lb/ft (112 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D14A3", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto SFI (Los inyectores se abastecen por parejas; 1+3 y 2+4)", 1396, "9.1:1", "75 mm × 79 mm (2.95 in x 3.11 in)", "75CV (55KW) @ 6000 rpm", "80 lb/ft (109 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D14A4", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto SFI (Los inyectores se abastecen por parejas; 1+3 y 2+4)", 1396, "9.2:1", "75 mm × 79 mm (2.95 in x 3.11 in)", "90CV (66KW) @ 6300 rpm", "91 lb/ft (124 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D14A7", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto SFI (Los inyectores se abastecen por parejas; 1+3 y 2+4)", 1396, "9:1", "75 mm × 79 mm (2.95 in x 3.11 in)", "75CV (55KW) @ 6000 rpm", "83 lb/ft (112 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D14A8", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto SFI (Los inyectores se abastecen por parejas; 1+3 y 2+4)", 1396, "9:1", "75 mm × 79 mm (2.95 in x 3.11 in)", "90CV (66KW) @ 6400 rpm", "88 lb/ft (120 Nm) @ 4800 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D14Z6", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1396, "10.4:1", "75 mm × 79 mm (2.95 in x 3.11 in)", "90CV (66KW) @ 5600 rpm", "96 lb/ft (130 Nm) @ 4300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15A1", "Gasolina", "L4, SOHC, 12v, CVCC, PGM-CARB, carburador triple", 1488, "9.2:1", "74 mm x 86.5 mm (2.91 in x 3.41 in)", "76CV (57 kW) @ 5500 rpm", "84 lb/ft (114 Nm) at 3500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15A2", "Gasolina", "L4, SOHC, 12v, CVCC, PGM-CARB, carburador triple", 1488, "10:1", "74 mm x 86.5 mm (2.91 in x 3.41 in)", "60CV (45 kW) @ 5550 rpm", "73 lb/ft (99 Nm) @ 3500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15A3", "Gasolina", "L4, SOHC, 12v, PGM-FI, Inyección monopunto", 1488, "8.7:1", "74 mm x 86.5 mm (2.91 in x 3.41 in)", "100CV (74 kW) @ 5750 rpm", "93 lb/ft (126 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15A4", "Gasolina", "L4, SOHC, 12v, PGM-FI, Inyección monopunto", 1508, "8.7:1", "74 mm x 86.5 mm (2.91 in x 3.41 in)", "100CV (74 kW) @ 5750 rpm", "93 lb/ft (126 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15A5", "Gasolina", NULL, 1508, NULL, NULL, NULL, NULL);
INSERT INTO Motores VALUES (DEFAULT, "D15B", "Gasolina", "L4, SOHC, 16v, PGM-CARB, carburador doble", 1493, "9.2:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "105CV (77 kW) @ 6800 rpm", "102 lb/ft (138 Nm) @ 5200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15B1", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto DPFI", 1493, "9.2:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "71CV (52 kW) @ 5500 rpm", "73 lb/ft (112 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15B2", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto DPFI", 1493, "9.2:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "71CV (52 kW) @ 5500 rpm", "73 lb/ft (112 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15B3", "Gasolina", "L4, SOHC, 16v, PGM-CARB, monocarburador", 1493, "9.2:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "90CV (66 kW) @ 6000 rpm", "88 lb/ft (119 Nm) @ 4700 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15B5", "Gasolina", "L4, SOHC, 12v - 16v, VTEC-E, PGM-FI, Inyección multipunto", 1493, "9.2:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "106CV (78 kW) @ 6000 rpm", "98 lb/ft (133 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15B6", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1493, "9.1:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "63CV (46 kW) @ 4400 rpm (1988-1989), 73CV (54 kW) @ 4500 rpm (1990-1991)", "83 lb/ft (113 Nm) @ 2200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15B7", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1493, "9.2:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "103CV (76 kW) @ 5900 rpm", "98 lb/ft (133 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15B8", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1493, "9.1:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "71CV (52 kW) @ 4500 rpm", "83 lb/ft (113 Nm) @ 2800 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15Y3", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1493, "9.2:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "112CV (82KW) @ 5800 rpm", "100 lb/ft (135 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15Z1", "Gasolina", "L4, SOHC, 12v o 16v, VTEC-E, PGM-FI, Inyección multipunto", 1493, "9.3:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "91CV (67 kW) @ 5500 rpm", "98 lb/ft (133 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15Z3", "Gasolina", "L4, SOHC, 12v o 16v, VTEC-E, PGM-FI, Inyección multipunto", 1493, "9.3:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "91CV (67 kW) @ 5500 rpm", "98 lb/ft (133 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15Z4", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto SFI (Los inyectores se abastecen por parejas; 1+3 y 2+4)", 1493, "9.3:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "91CV (67 kW) @ 5800 rpm", "103 lb/ft (140 Nm) @ 4200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D15Z6", "Gasolina", "L4, SOHC, 12v o 16v, VTEC-E, PGM-FI, Inyección Multipunto", 1493, "9.6:1", "75 mm × 84.5 mm (2.95 in x 3.33 in)", "114CV (84 kW) @ 6500 rpm", "99 lb/ft (134 Nm) @ 5400 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16A6", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1590, "9.2:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "110CV (81 kW) @ 5600 rpm", "100 lb/ft (136 Nm) @ 4800 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16A8", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1590, "9.5:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "122CV (90 kW) @ 6800 rpm", "108 lb/ft (146 Nm) @ 5900 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16A9", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1590, "9.5:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "130CV (96 kW) @ 6600 rpm", "107 lb/ft (145 Nm) @ 5200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16V1", "Gasolina", "L4, SOHC, 12v o 16v, VTEC-E, PGM-FI, Inyección monopunto", 1590, "10.4:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "110CV (81KW) @ 5600 rpm", "112 lb/ft (152 Nm) @ 4300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16W7", "Gasolina", "L4, SOHC, 12v o 16v, VTEC-E, PGM-FI, Inyección monopunto", 1590, "10.9:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "117CV (86KW) @ 5600 rpm", "112 lb/ft (152 Nm) @ 4300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16W9", "Gasolina", "L4, SOHC, VTEC (3 etapas - Primera a 2500rpm - Segunda a 5500rpm), 16v, PGM-FI, Inyección monopunto", 1590, "10.5:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "131CV (96KW) @ 6600 rpm", "108 lb/ft (146 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16Y4", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1590, "9.4:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "120CV (88KW) @ 6400 rpm", "106 lb/ft (144 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16Y5", "Gasolina", "L4, SOHC, 12v o 16v, VTEC-E, PGM-FI, Inyección monopunto", 1590, "9.4:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "117CV (86KW) @ 5600 rpm", "104 lb/ft (141 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16Y7", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección monopunto", 1590, "9.4:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "107CV (79KW) @ 6200 rpm", "103 lb/ft (140 Nm) @ 4600 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16Y8", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1590, "9.6:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "127CV (95KW) @ 6600 rpm", "107 lb/ft (145 Nm) @ 5500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16Z6", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1590, "9.3:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "125CV (92 kW) @ 6600 rpm", "106 lb/ft (144 Nm) @ 5200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16Z9", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1590, "9.3:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "125CV (92 kW) @ 6600 rpm", "106 lb/ft (144 Nm) @ 5200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "D16ZC", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1590, "9.5:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "130CV (96 kW) @ 6800 rpm", "105 lb/ft (143 Nm) @ 5700 rpm");

-- SERIE E

INSERT INTO Motores VALUES (DEFAULT, "EB1", "Gasolina", "L4, SOHC, 8v, PGM-CARB, carburador doble", 1170, "8.6:1", "70 mm × 76 mm (2.76 in × 2.99 in)", "50CV (37 kW) @ 5000 rpm", "59 lb/ft (80 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "EB2", "Gasolina", "L4, SOHC, 8v, PGM-CARB, carburador doble", 1238, "8.6:1", "70 mm × 76 mm (2.76 in × 2.99 in)", "63CV (47 kW) @ 5000 rpm", "77 lb/ft (104 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "ED (CVCC)", "Gasolina", "L4, SOHC, 12v, CVCC, PGM-CARB, carburador triple", 1487, "8.1:1", "74 mm × 86.5 mm (2.91 in × 3.41 in)", "52CV (39 kW) @ 5000 rpm", "68 lb/ft (92 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "EF (CVCC)", "Gasolina", "L4, SOHC, 12v, CVCC, PGM-CARB, carburador doble", 1599, "8:1", "74 mm x 93 mm (2.91 in x 3.66 in)", "82CV (60 kw) @ 5300 rpm", "89 lb/ft (121 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "EJ (CVCC)", "Gasolina", "L4, SOHC, 12v, CVCC, PGM-CARB, carburador triple", 1335, "7.9:1", "72 mm x 82 mm (2.83 in x 3.23 in)", "68CV (50 kW) @ 5000 rpm", "77 lb/ft (104 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "EK1 (CVCC)", "Gasolina", "L4, SOHC, 12v, CVCC, PGM-CARB, carburador triple", 1751, "8.8:1", "77 mm x 94 mm (3.03 in x 3.70 in)", "75CV (55 kW) @ 4500 rpm", "96 lb/pie (130 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "EL", "Gasolina", "L4, SOHC, 8v, PGM-CARB, carburador doble", 1602, "8.4:1", "77 mm x 86 mm (3.03 in x 3.39 in)", "79CV (58 kW) @ 4500 rpm", "97 lb/pie (132 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "EL1", "Gasolina", "L4, SOHC, 8v, PGM-CARB, carburador doble", 1602, "8.4:1", "77 mm x 86 mm (3.03 in x 3.39 in)", "72CV (54 kW) @ 5000 rpm", "90 lb/ft (122 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "EM (CVCC)", "Gasolina", "L4, SOHC, 12v, CVCC, PGM-CARB, carburador triple", 1487, "8.8:1", "74 mm × 86.5 mm (2.91 in × 3.41 in)", "52CV (39 kW) @ 5000 rpm (1980), 63CV (47 kW) @ 5000 rpm (1981 - 1983)", "68 lb/ft (92 Nm) @ 3000 rpm (1980), 77 lb/ft (104 Nm) @ 3000 rpm (1981 - 1983)");
INSERT INTO Motores VALUES (DEFAULT, "EP (CVCC)", "Gasolina", "L4, SOHC, 12v, CVCC, PGM-CARB, carburador triple", 1601, "8.8:1", "77 mm x 86 mm (3.03 in x 3.39 in)", "94CV (70 kw) @ 5300 rpm", "98 lb/ft (132 Nm) @ 3000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "ES1 (CVCC)", "Gasolina", "L4, SOHC, 12v, CVCC, PGM-CARB, carburador doble", 1829, "8.8:1", "77 mm x 94 mm (3.03 in x 3.7 in)", "102CV (75 kW) @ 5500 rpm", "104 lb/ft (141 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "ES2 (CVCC)", "Gasolina", "L4, SOHC, 12v, CVCC, PGM-CARB, carburador triple", 1829, "8.7:1", "80 mm x 91 mm (3.15 in x 3.58 in)", "86CV (64 kw) @ 5800 rpm", "99 lb/ft (134 Nm) @ 3500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "ES3", "Gasolina", "L4, SOHC, 12v, PGM-FI, Inyección multipunto", 1829, "9.1:1", "80 mm x 91 mm (3.15 in x 3.58 in)", "101CV (75 kw) @ 5800 rpm", "108 lb/ft (146 Nm) @ 2500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "ET", "Gasolina", "L4, SOHC, 12v, PGM-CARB, carburador triple", 1829, "8.8:1", "77 mm x 94 mm (3.03 in x 3.7 in)", "112CV (82 kW) @ 5800 rpm", "112 lb/ft (152 Nm) @ 3500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "EV1 (CVCC)", "Gasolina", "L4, SOHC, 12v, CVCC (Solo en la versión JDM), PGM-CARB, carburador triple", 1335, "8.2:1", "74 mm x 78 mm (2.91 in x 3.07 in)", "68CV (50 kW) @ 5000 rpm", "73 lb/ft (99 Nm) @ 3500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "EY (CVCC)", "Gasolina", "L4, SOHC, 12v, CVCC (Solo en la versión JDM), PGM-CARB, monocarburador", 1598, "9:1", "80 mm x 79.5 mm (3.15 in x 3.13 in)", "93CV (69 kW) @ 5800 rpm", "98 lb/ft (133 Nm) @ 3500 rpm");

-- SERIE F

INSERT INTO Motores VALUES (DEFAULT, "F18A", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1849, "9:1", "85 mm x 81.5 mm (3.35 in x 3.21 in)", "105CV (77 kW) @ 6000 rpm", "106 lb/ft (143 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F18B2", "Gasolina", "L4, SOHC, 16v, VTEC-E + sistema IAB (Sistema de bypass de admisión de aire), PGM-FI, Inyección multipunto", 1849, "9.3:1", "85 mm x 81.5 mm (3.35 in x 3.21 in)", "136CV (101 kW) @ 6100 rpm", "124 lb/ft (168 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F20A", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1997, "9.5:1", "85 mm x 88 mm (3.35 in x 3.46 in)", "133CV (99 kW) @ 5300 rpm", "132 lb/ft (179 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F20A4", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1997, "9.5:1", "85 mm x 88 mm (3.35 in x 3.46 in)", "133CV (99 kW) @ 6000 rpm", "132 lb/ft (179 Nm) @ 3700 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F20A DOHC", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1997, "9.5:1", "85 mm x 88 mm (3.35 in x 3.46 in)", "152CV (113 kW) @ 6000 rpm", "136 lb/ft (185 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F20B", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1997, "11.1:1", "85 mm x 88 mm (3.35 in x 3.46 in)", "151CV (111 kW) @ 6500 rpm", "137 lb/ft (186 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F20B3", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1997, "9:1", "85 mm x 88 mm (3.35 in x 3.46 in)", "136CV (100 kW) @ 6500 rpm", "137 lb/ft (186 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F20B5", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1997, "9:1", "85 mm x 88 mm (3.35 in x 3.46 in)", "152CV (110 kW) @ 6000 rpm", "190 lb/ft (258 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F20C", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1997, "11.7:1", "87 mm x 84 mm (3.43 in x 3.31 in)", "250CV (184 kW) @ 8600 rpm (JDM), 240CV (177 kW) @ 8300 rpm (USDM & EUM)", "150 lb/ft (203 Nm) @ 7500 rpm (JDM), 155 lb/ft (210 Nm) @ 7500 rpm (USDM & EUM)");
INSERT INTO Motores VALUES (DEFAULT, "F22A1", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2156, "8.8:1", "85 mm x 95 mm (3.35 in x 3.74 in)", "125CV (93 kW) @ 5200 rpm", "137 lb/ft (186 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F22A3", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 2156, "8.8:1", "85 mm x 95 mm (3.35 in x 3.74 in)", "150CV (112 kW) @ 6000 rpm", "142 lb/ft (193 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F22A4", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2156, "8.8:1", "85 mm x 95 mm (3.35 in x 3.74 in)", "130CV (97 kW) @ 5200 rpm", "142 lb/ft (193 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F22A6", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2156, "8.8:1", "85 mm x 95 mm (3.35 in x 3.74 in)", "140CV (104 kW) @ 5600 rpm", "142 lb/ft (193 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F22A7", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2156, "8.8:1", "85 mm x 95 mm (3.35 in x 3.74 in)", "150CV (112 kW) @ 5600 rpm", "146 lb/ft (198 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F22B", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 2156, "9.3:1", "85 mm x 95 mm (3.35 in x 3.74 in)", "130CV (97 kW) @ 5300 rpm", "139 lb/ft (188 Nm) @ 4200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F22B1", "Gasolina", "L4, SOHC, 16v, VTEC, OBD-I PGM-FI (1994-1995) o OBD-II PGM-FI (1996-1997), Inyección multipunto", 2156, "8.8:1", "85 mm x 95 mm (3.35 in x 3.74 in)", "145CV (108 kW) @ 5500 rpm", "147 lb/ft (199 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F22B2", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 2156, "8.8:1", "85 mm x 95 mm (3.35 in x 3.74 in)", "130CV (97 kW) @ 5300 rpm", "139 lb/ft (188 Nm) @ 4200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F22B5", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 2156, "9.3:1", "85 mm x 95 mm (3.35 in x 3.74 in)", "150CV (112 kW) @ 5600 rpm", "147 lb/ft (199 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F22C1", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2157, "11.1:1", "87 mm x 90.7 mm (3.43 in x 3.57 in)", "240CV (177 kW) @ 7800 rpm (JDM & USDM & EUM)", "163 lb/ft (221 Nm) @ 7500 rpm (JDM), 162 lb/ft (220 Nm) @ 6800 rpm (USDM)");
INSERT INTO Motores VALUES (DEFAULT, "F22Z6", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2156, "9.2:1", "85 mm x 95 mm (3.35 in x 3.74 in)", "160CV (118 kW) @ 6200 rpm", "190 lb/ft (258 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F23A1", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección estratificada multipunto", 2254, "9.3:1", "86 mm x 97 mm (3.39 in x 3.82 in)", "150CV (112 kW) @ 5700 rpm", "152 lb/ft (206 Nm) @ 4900 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F23A4", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección estratificada multipunto", 2254, "8.8:1", "86 mm x 97 mm (3.39 in x 3.82 in)", "148CV (110 kW) @ 5700 rpm", "150 lb/ft (204 Nm) @ 4900 rpm");
INSERT INTO Motores VALUES (DEFAULT, "F23A5", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 2254, "8.8:1", "86 mm x 97 mm (3.39 in x 3.82 in)", "135CV (101 kW) @ 5500 rpm", "152 lb/ft (206 Nm) @ 4500 rpm");

-- SERIE H

INSERT INTO Motores VALUES (DEFAULT, "H22A", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2157, "10.6:1", "87 mm x 90.7 mm (3.43 in x 3.57 in)", "200CV (147 kW) @ 6800 rpm", "161 lb/ft (219 Nm) @ 5500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "H22A1", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2157, "10.6:1", "87 mm x 90.7 mm (3.43 in x 3.57 in)", "190CV (140 kW) @ 6800 rpm", "153 lb/ft (207 Nm) @ 5500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "H22A2", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2157, "10.1:1", "87 mm x 90.7 mm (3.43 in x 3.57 in)", "185CV (136 kW) @ 6500 rpm", "153 lb/ft (207 Nm) @ 5500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "H22A4", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2157, "10.6:1", "87 mm x 90.7 mm (3.43 in x 3.57 in)", "200CV (147 kW) @ 7000 rpm", "156 lb/ft (212 Nm) @ 5250 rpm");
INSERT INTO Motores VALUES (DEFAULT, "H22A5", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2157, "10.1:1", "87 mm x 90.7 mm (3.43 in x 3.57 in)", "185CV (136 kW) @ 6700 rpm", "156 lb/ft (212 Nm) @ 5250 rpm");
INSERT INTO Motores VALUES (DEFAULT, "H22A8", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2157, "11:1", "87 mm x 90.7 mm (3.43 in x 3.57 in)", "200CV (147 kW) @ 7100 rpm", "156 lb/ft (212 Nm) @ 5250 rpm");
INSERT INTO Motores VALUES (DEFAULT, "H22Z1", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2157, "11:1", "87 mm x 90.7 mm (3.43 in x 3.57 in)", "200CV (147 kW) @ 7000 rpm", "156 lb/ft (212 Nm) @ 5250 rpm");
INSERT INTO Motores VALUES (DEFAULT, "H23A1", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2259, "9.8:1", "87 mm x 95 mm (3.43 in x 3.74 in)", "160CV (118 kW) @ 5600 rpm", "156 lb/ft (212 Nm) @ 5700 rpm");
INSERT INTO Motores VALUES (DEFAULT, "H23A2", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2259, "9.8:1", "87 mm x 95 mm (3.43 in x 3.74 in)", "160CV (118 kW) @ 5600 rpm", "156 lb/ft (212 Nm) @ 5700 rpm");

-- SERIE J

INSERT INTO Motores VALUES (DEFAULT, "J30A1", "Gasolina", "V6, SOHC, 24v, VTEC, PGM-FI, Inyección multipunto", 2997, "10.5:1", "86 mm x 86 mm (3.39 in x 3.39 in)", "200CV (149 kW) @ 5500 rpm", "195 lb/ft (264 Nm) @ 5600 rpm");
INSERT INTO Motores VALUES (DEFAULT, "J30A4", "Gasolina", "V6, SOHC, 24v, VTEC, PGM-FI, Inyección multipunto", 2997, "10:1", "86 mm x 86 mm (3.39 in x 3.39 in)", "240CV (179 kW) @ 5800 rpm", "212 lb/ft (287 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "J30A5", "Gasolina", "V6, SOHC, 24v, iVTEC, PGM-FI, Inyección multipunto", 2997, "10:1", "86 mm x 86 mm (3.39 in x 3.39 in)", "244CV (182 kW) @ 6200 rpm", "211 lb/ft (286 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "J35Y1", "Gasolina", "V6, SOHC, 24v, iVTEC, PGM-FI, Inyección multipunto", 3471, "10.5:1", "89 mm x 93 mm (3.50 in x 3.66 in)", "278CV (207 kW) @ 6200 rpm", "252 lb/ft (342 Nm) @ 4900 rpm");
INSERT INTO Motores VALUES (DEFAULT, "J35Y2", "Gasolina", "V6, SOHC, 24v, iVTEC, PGM-FI, Inyección multipunto", 3471, "10.5:1", "89 mm x 93 mm (3.50 in x 3.66 in)", "278CV (207 kW) @ 6200 rpm", "252 lb/ft (342 Nm) @ 5300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "J35Z6 (USDM)", "Gasolina", "V6, SOHC, 24v, VTEC, PGM-FI, Inyección multipunto", 3471, "11.2:1", "89 mm x 93 mm (3.50 in x 3.66 in)", "280CV (209 kW) @ 6200 rpm", "254 lb/ft (344 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "JNC1", "Gasolina", "V6, DOHC, 24v, Twin-turbo, PGM-FI, Inyección multipunto (DI + PI)", 3493, "10:1", "91 mm x 89.5 mm (3.58 in x 3.52 in)", "507CV (373 kW) @ 7500 rpm", "406 lb/ft (550 Nm) @ 6000 rpm");

-- SERIE K

INSERT INTO Motores VALUES (DEFAULT, "K20A (Eco)", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1998, "9.6:1", "86 mm x 86 mm (3.386 in x 3.386 in)", "153CV (114 kW) @ 6000 rpm", "139 lb/ft (188 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20A (High Performance)", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1998, "11.5:1", "86 mm x 86 mm (3.386 in x 3.386 in)", "217CV (162 kW) @ 8000 rpm", "152 lb/ft (206 Nm) @ 6000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20A (Type R - High Performance)", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1998, "11.7:1", "86 mm x 86 mm (3.386 in x 3.386 in)", "225CV (165 kW) @ 8000 rpm", "159 lb/ft (215 Nm) @ 6100 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20A2", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1998, "11:1", "86 mm x 86 mm (3.386 in x 3.386 in)", "200CV (147KW) @ 7400 rpm", "139 lb/ft (188 Nm) @ 5900 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20A3", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1998, "9.8:1", "86 mm x 86 mm (3.386 in x 3.386 in)", "160CV (118KW) @ 6500 rpm", "142 lb/ft (193 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20A6", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1998, "9.8:1", "86 mm x 86 mm (3.386 in x 3.386 in)", "155CV (116 kW) @ 6500 rpm", "140 lb/ft (190 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20A7", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1998, "9.8:1", "86 mm x 86 mm (3.386 in x 3.386 in)", "150CV (112 kW) @ 6000 rpm", "137 lb/ft (186 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20C1", "Gasolina", "L4, DOHC, 16v, i-VTEC + turboalimentado (Earth Dreams), PGM-FI, Inyección multipunto", 1996, "9.8:1", "86 mm x 85.9 mm (3.38 in x 3.38 in)", "306CV (228KW) @ 6500 rpm", "295 lb/ft (400 Nm) @ 2500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20C2", "Gasolina", "L4, DOHC, 16v, i-VTEC, PGM-FI, Inyección multipunto", 1996, "10.8:1", "86 mm x 85.9 mm (3.38 in x 3.38 in)", "158CV (118KW) @ 6500 rpm", "138 lb/ft (187 Nm) @ 4200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20C4", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1998, "9.8:1", "86 mm x 85.9 mm (3.38 in x 3.38 in)", "252CV (188 kW) @ 6500 rpm", "273 lb/ft (370 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20Z2", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1998, "9.8:1", "86 mm x 86 mm (3.386 in x 3.386 in)", "155CV (114 kW) @ 6000 rpm", "139 lb/ft (188 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20Z3", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1998, "11:1", "86 mm x 86 mm (3.386 in x 3.386 in)", "197CV (147 kW) @ 7800 rpm", "139 lb/ft (189 Nm) @ 6200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K20Z4", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1998, "11:1", "86 mm x 86 mm (3.386 in x 3.386 in)", "201CV (150 kW) @ 7800 rpm", "142 lb/ft (193 Nm) @ 6800 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K24A (High Performance)", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2354, "10.5:1", "87 mm x 99 mm (3.42 in x 3.89 in)", "197CV (147 kW) @ 6800 rpm", "171 lb/ft (232 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K24A3", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2354, "10.5:1", "87 mm x 99 mm (3.42 in x 3.89 in)", "190CV (140 kW) @ 6800 rpm", "171 lb/ft (232 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K24A4", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2354, "9.7:1", "87 mm x 99 mm (3.42 in x 3.89 in)", "160CV (119 kW) @ 5500 rpm", "161 lb/ft (218 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K24A8", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2354, "9.7:1", "87 mm x 99 mm (3.42 in x 3.89 in)", "166CV (124 kW) @ 5800 rpm", "160 lb/ft (217 Nm) @ 4000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K24W1", "Gasolina", "L4, DOHC, 16v, i-VTEC, PGM-FI, Inyección multipunto", 2354, "11.1:1", "87 mm x 99 mm (3.42 in x 3.89 in)", "185CV (138 kW) @ 6400 rpm", "181 lb/ft (245 Nm) @ 3900 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K24Z2", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 2354, "10.5:1", "87 mm x 99 mm (3.42 in x 3.89 in)", "205CV (153KW) @ 7000 rpm", "174 lb/ft (236 Nm) @ 4400 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K24Z3", "Gasolina", "L4, DOHC, 16v, i-VTEC, PGM-FI, Inyección multipunto", 2354, "10.5:1", "87 mm x 99 mm (3.42 in x 3.89 in)", "190CV (142 kW) @ 7000 rpm", "162 lb/ft (220 Nm) @ 4400 rpm");
INSERT INTO Motores VALUES (DEFAULT, "K24Z7", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 2354, "11:1", "87 mm x 99 mm (3.42 in x 3.89 in)", "177CV (132 kW) @ 6500 rpm", "161 lb/ft (218 Nm) @ 4300 rpm");

-- SERIE L

INSERT INTO Motores VALUES (DEFAULT, "L13A7", "Gasolina", "L4, SOHC, 8v, PGM-FI, Inyección multipunto", 1339, "10.8:1", "73 mm x 80 mm (2.87 in x 3.15 in)", "95CV (70 kW) @ 5700 rpm", "91 lb/ft (123 Nm) @ 2800 rpm");
INSERT INTO Motores VALUES (DEFAULT, "L15B7", "Gasolina", "L4, DOHC, 16v, VVT + turboalimentado, Inyección multipunto", 1497, "10.6:1", "73 mm x 89.4 mm (2.87 in x 3.52 in)", "173CV (127KW) @ 5500 rpm", "162 lb/ft (220 Nm) @ 5500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "L15BE", "Gasolina", "L4, DOHC, 16v, Turboalimentado, PGM-FI, Inyección multipunto", 1497, "10.3:1", "73 mm x 89.4 mm (2.87 in x 3.52 in)", "192CV (143 kW) @ 5500 rpm", "192 lb/ft (260 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "L15BG", "Gasolina", "L4, DOHC, 16v, VTEC + turboalimentado, Inyección multipunto", 1497, "10.3:1", "73 mm x 89.4 mm (2.87 in x 3.52 in)", "176CV (131 kW) @ 6000 rpm", "180 lb/ft (240 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "L15BJ", "Gasolina", "L4, DOHC, 16v, VTEC + turboalimentado, Inyección multipunto", 1497, "10.3:1", "73 mm x 89.4 mm (2.87 in x 3.52 in)", "127CV (95 kW) @ 6000 rpm", "130 lb/ft (180 Nm) @ 4500 rpm");
INSERT INTO Motores VALUES (DEFAULT, "L15C", "Gasolina", "L4, DOHC, 16v, VTEC + turboalimentado, Inyección multipunto", 1497, "10.3:1", "73 mm x 89.4 mm (2.87 in x 3.52 in)", "182CV (134 kW) @ 6000 rpm", "190 lb/ft (260 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "L15CA", "Gasolina", "L4, DOHC, 16v, VTEC + turboalimentado, Inyección multipunto", 1497, "10.3:1", "73 mm x 89.4 mm (2.87 in x 3.52 in)", "200CV (150 kW) @ 6000 rpm", "190 lb/ft (260 Nm) @ 5000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "LEA2", "Gasolina", "L4, SOHC, 16v, Híbrido (IMA - Integrated Motor Assist), PGM-FI, Inyección multipunto", 1497, "10.8:1", "73 mm x 89.4 mm (2.87 in x 3.52 in)", "Motor Gasolina: 110CV (82 kW) @ 5500 rpm, Motor Eléctrico: 23CV (17 kW) @ 3000 rpm", "Motor Gasolina: 127 lb/ft (172 Nm) @ 3500 rpm, Motor Eléctrico: 78 lb/ft (106 Nm) @ 1550 rpm");
INSERT INTO Motores VALUES (DEFAULT, "LFA", "Gasolina", "L4, DOHC, 16v, Híbrido, iMMD, PGM-FI, Inyección multipunto", 1993, "10.5:1", "81 mm x 96.7 mm (3.19 in x 3.81 in)", "Motor Gasolina: 145CV (107 kW) @ 6200 rpm, Motor eléctrico: 184CV (135 kW) @ 6000 rpm, Potencia (Combinada): 215CV (158 kW) @ 6200 rpm", "Motor Gasolina: 129 lb/ft (175 Nm) @ 3500 rpm, Motor eléctrico: 232 lb/ft (315 Nm) @ 2000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "LFC5", "Gasolina", "L4, DOHC, 16v, Híbrido, iMMD, PGM-FI, Inyección directa multipunto", 1993, "13.9:1", "81 mm x 96.7 mm (3.19 in x 3.81 in)", "205CV (152 kW) @ 6100 rpm", "134 lb/ft (182 Nm) @ 4500 rpm");

-- SERIE N

INSERT INTO Motores VALUES (DEFAULT, "N16A1", "Diesel", "L4, DOHC, 16v, Turboalimentado, i-DTEC", 1598, "16:1", "76 mm x 88 mm (2.99 in x 3.46 in)", "122CV (89KW) @ 4000 rpm", "221 lb/ft (300 Nm) @ 2000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "N22A", "Diesel", "L4, DOHC, 16v, turboalimentado, i-CDTI", 2204, "16.7:1", "85 mm x 97.1 mm (3.35 in x 3.82 in)", "140CV (103 kW) @ 4000 rpm", "251 lb/ft (340 Nm) @ 2000 rpm");
INSERT INTO Motores VALUES (DEFAULT, "N22B", "Diesel", "L4, DOHC, 16v, turboalimentado, i-CDTI", 2199, "16.3:1", "85 mm x 96.9 mm (3.35 in x 3.81 in)", "150CV (110KW) @ 4000 rpm", "258 lb/ft (350 Nm) @ 2000 rpm");

-- SERIE P

INSERT INTO Motores VALUES (DEFAULT, "P10A2", "Gasolina", "L3, DOHC, 12v, VTEC + turboalimentado (Earth Dreams), PGM-FI, Inyección multipunto", 988, "10:1", "73 mm x 78.7 mm (2.87 in x 3.09 in)", "128CV (95KW) @ 5500 rpm", "147 lb/ft (200 Nm) @ 2250 rpm");

-- SERIE R

INSERT INTO Motores VALUES (DEFAULT, "R16A", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1595, "10.5:1", "81 mm x 77.4 mm (3.19 in x 3.05 in)", "125CV (92 kW) @ 6200 rpm", "111 lb/ft (151 Nm) @ 4200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "R16A1", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1595, "10.5:1", "81 mm x 77.4 mm (3.19 in x 3.05 in)", "125CV (92 kW) @ 6200 rpm", "111 lb/ft (151 Nm) @ 4200 rpm");
INSERT INTO Motores VALUES (DEFAULT, "R16B", "Gasolina", "L4, SOHC, 16v, iVTEC, PGM-FI, Inyección multipunto", 1597, "10.7:1", "81 mm x 77.5 mm (3.19 in x 3.05 in)", "125CV (92 kW) @ 6500 rpm", "113 lb/ft (153 Nm) @ 4300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "R18A1", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1799, "10.5:1", "81 mm x 87.3 mm (3.19 in x 3.44 in)", "140CV (103 kW) @ 6300 rpm", "128 lb/ft (174 Nm) @ 4300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "R18Z1", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1799, "10.6:1", "81 mm x 87.3 mm (3.19 in x 3.44 in)", "145CV (107KW) @ 6500 rpm", "129 lb/ft (175 Nm) @ 4300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "R18Z4", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1799, "10.6:1", "81 mm x 87.3 mm (3.19 in x 3.44 in)", "145CV (107KW) @ 6500 rpm", "129 lb/ft (175 Nm) @ 4300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "R20A3", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1997, "10.5:1", "81 mm x 96.9 mm (3.19 in x 3.81 in)", "157CV (115 kW) @ 6300 rpm", "139 lb/ft (188 Nm) @ 4300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "R20A5", "Gasolina", "L4, SOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1997, "10.6:1", "81 mm x 96.9 mm (3.19 in x 3.81 in)", "155CV (114KW) @ 6500 rpm", "140 lb/ft (190 Nm) @ 4300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "R20Z1", "Gasolina", "L4, SOHC, 16v, PGM-FI, Inyección multipunto", 1997, "10.6:1", "81 mm x 96.9 mm (3.19 in x 3.81 in)", "155CV (114KW) @ 6500 rpm", "140 lb/ft (190 Nm) @ 4300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "R20Z2", "Gasolina", "L4, SOHC, 16v, iVTEC, PGM-FI, Inyección multipunto", 1997, "10.6:1", "81 mm x 96.9 mm (3.19 in x 3.81 in)", "153CV (114 kW) @ 6500 rpm", "140 lb/ft (190 Nm) @ 4300 rpm");
INSERT INTO Motores VALUES (DEFAULT, "LFC", "Gasolina", "L4, DOHC, 16v, PGM-FI, Inyección multipunto", 1993, "13.9:1", "81 mm x 96.7 mm (3.19 in x 3.81 in)", "Motor Gasolina: 141CV (104 kW) @ 6000 rpm, Motor Eléctrico: 184CV (135 kW) @ 6000 rpm", "Motor Gasolina: 134 lb/ft (182 Nm) @ 4500 rpm, Motor Eléctrico: 232 lb/ft (315 Nm) @ 2000 rpm");

-- SERIE ZC

INSERT INTO Motores VALUES (DEFAULT, "ZC DOHC", "Gasolina", "L4, DOHC, 16v, VTEC, PGM-FI, Inyección multipunto", 1590, "9.2:1", "75 mm × 90 mm (2.95 in x 3.54 in)", "160CV (118 kW) @ 7600 rpm", "112 lb/ft (152 Nm) @ 4000 rpm");

-- OTROS

INSERT INTO Motores VALUES (DEFAULT, "4EE2", "Diesel", "L4, DOHC, 16v, turboalimentado, i-CDTI", 1686, "18.4:1", "79 mm x 86 mm (3.11 in x 3.39 in)", "74CV (55KW) @ 4400 rpm", "122 lb/ft (165 Nm) @ 1800 rpm");

-- INSERTAR VALORES (MOTORIZACIONES)

-- Motorizaciones primera generación de Civic

INSERT INTO Motorizaciones VALUES ("1", "67", "1973 - 1974");
INSERT INTO Motorizaciones VALUES ("1", "68", "1974 - 1979");
INSERT INTO Motorizaciones VALUES ("1", "69", "1975 - 1979");

-- Motorizaciones segunda generación de Civic

INSERT INTO Motorizaciones VALUES ("2", "71", "1980 - 1983");
INSERT INTO Motorizaciones VALUES ("2", "75", "1980 - 1983");

-- Motorizaciones tercera generación de Civic

INSERT INTO Motorizaciones VALUES ("3", "81", "1984 - 1986");
INSERT INTO Motorizaciones VALUES ("3", "36", "1984 - 1986");
INSERT INTO Motorizaciones VALUES ("3", "38", "1985 - 1987");
INSERT INTO Motorizaciones VALUES ("3", "39", "1985 - 1987");

-- Motorizaciones cuarta generación de Civic

INSERT INTO Motorizaciones VALUES ("4", "26", "1988 - 1990");
INSERT INTO Motorizaciones VALUES ("4", "27", "1988 - 1991");
INSERT INTO Motorizaciones VALUES ("4", "30", "1987 - 1991");
INSERT INTO Motorizaciones VALUES ("4", "42", "1988 - 1991");
INSERT INTO Motorizaciones VALUES ("4", "43", "1988 - 1991");
INSERT INTO Motorizaciones VALUES ("4", "54", "1988 - 1991");
INSERT INTO Motorizaciones VALUES ("4", "56", "1988 - 1991");
INSERT INTO Motorizaciones VALUES ("4", "168", "1989 - 1991");
INSERT INTO Motorizaciones VALUES ("4", "6", "1988 - 1991");

-- Motorizaciones quinta generación de Civic

INSERT INTO Motorizaciones VALUES ("5", "28", "1992 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "41", "1992");
INSERT INTO Motorizaciones VALUES ("5", "43", "1992 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "44", "1992 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "45", "1992 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "47", "1992 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "48", "1992 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "50", "1992 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "51", "1992 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "56", "1992 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "64", "1992 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "65", "1994 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "7", "1991 - 1994");
INSERT INTO Motorizaciones VALUES ("5", "9", "1992");
INSERT INTO Motorizaciones VALUES ("5", "10", "1992 - 1995");
INSERT INTO Motorizaciones VALUES ("5", "11", "1995");

-- Motorizaciones sexta generación de Civic

INSERT INTO Motorizaciones VALUES ("6", "29", "1995 - 2000");
INSERT INTO Motorizaciones VALUES ("6", "31", "1996 - 2000");
INSERT INTO Motorizaciones VALUES ("6", "32", "1995 - 2000");
INSERT INTO Motorizaciones VALUES ("6", "33", "1996 - 1998");
INSERT INTO Motorizaciones VALUES ("6", "34", "1997 - 2000");
INSERT INTO Motorizaciones VALUES ("6", "52", "1997 - 2000");
INSERT INTO Motorizaciones VALUES ("6", "53", "1996 - 2000");
INSERT INTO Motorizaciones VALUES ("6", "60", "1996 - 2000");
INSERT INTO Motorizaciones VALUES ("6", "61", "1996 - 2000");
INSERT INTO Motorizaciones VALUES ("6", "62", "1996 - 2000");
INSERT INTO Motorizaciones VALUES ("6", "63", "1996 - 2000");
INSERT INTO Motorizaciones VALUES ("6", "10", "1996 - 2000");
INSERT INTO Motorizaciones VALUES ("6", "12", "1996 - 2000");

-- Motorizaciones séptima generación de Civic

INSERT INTO Motorizaciones VALUES ("7", "35", "2001 - 2005");
INSERT INTO Motorizaciones VALUES ("7", "49", "2001 - 2006");
INSERT INTO Motorizaciones VALUES ("7", "57", "2001 - 2005");
INSERT INTO Motorizaciones VALUES ("7", "58", "2005 - 2007");
INSERT INTO Motorizaciones VALUES ("7", "59", "2001 - 2005");
INSERT INTO Motorizaciones VALUES ("7", "125", "2001 - 2005");
INSERT INTO Motorizaciones VALUES ("7", "126", "2002 - 2005");
INSERT INTO Motorizaciones VALUES ("7", "169", "2001 - 2005");

-- Motorizaciones octava generación de Civic

INSERT INTO Motorizaciones VALUES ("8", "143", "2006 - 2012");
INSERT INTO Motorizaciones VALUES ("8", "158", "2006 - 2012");
INSERT INTO Motorizaciones VALUES ("8", "160", "2006 - 2011");
INSERT INTO Motorizaciones VALUES ("8", "132", "2006 - 2010");
INSERT INTO Motorizaciones VALUES ("8", "133", "2006 - 2011");
INSERT INTO Motorizaciones VALUES ("8", "134", "2007 - 2010");
INSERT INTO Motorizaciones VALUES ("8", "122", "2007 - 2011");
INSERT INTO Motorizaciones VALUES ("8", "124", "2006 - 2010");
INSERT INTO Motorizaciones VALUES ("8", "154", "2006 - 2011");

-- Motorizaciones novena generación de Civic

INSERT INTO Motorizaciones VALUES ("9", "157", "2012 - 2015");
INSERT INTO Motorizaciones VALUES ("9", "161", "2012 - 2015");
INSERT INTO Motorizaciones VALUES ("9", "162", "2012 - 2015");
INSERT INTO Motorizaciones VALUES ("9", "164", "2012 - 2015");
INSERT INTO Motorizaciones VALUES ("9", "165", "2012 - 2015");
INSERT INTO Motorizaciones VALUES ("9", "142", "2012 - 2015");
INSERT INTO Motorizaciones VALUES ("9", "150", "2012 - 2015");
INSERT INTO Motorizaciones VALUES ("9", "153", "2012 - 2015");
INSERT INTO Motorizaciones VALUES ("9", "154", "2012 - 2015");

-- Motorizaciones décima generación de Civic

INSERT INTO Motorizaciones VALUES ("10", "156", "2016 - 2021");
INSERT INTO Motorizaciones VALUES ("10", "144", "2016 - 2021");
INSERT INTO Motorizaciones VALUES ("10", "159", "2016");
INSERT INTO Motorizaciones VALUES ("10", "161", "2016 - 2020");
INSERT INTO Motorizaciones VALUES ("10", "129", "2016 - 2021");
INSERT INTO Motorizaciones VALUES ("10", "130", "2016 - 2021");
INSERT INTO Motorizaciones VALUES ("10", "153", "2016 - 2021");

-- Motorizaciones undécima generación de Civic

INSERT INTO Motorizaciones VALUES ("11", "144", "2022 - Presente");
INSERT INTO Motorizaciones VALUES ("11", "146", "2022 - Presente");
INSERT INTO Motorizaciones VALUES ("11", "147", "2022 - Presente");
INSERT INTO Motorizaciones VALUES ("11", "148", "2022 - Presente");
INSERT INTO Motorizaciones VALUES ("11", "149", "2022 - Presente");
INSERT INTO Motorizaciones VALUES ("11", "129", "2023 - Presente");
INSERT INTO Motorizaciones VALUES ("11", "130", "2022 - Presente");
INSERT INTO Motorizaciones VALUES ("11", "167", "2023 - Presente");

-- Motorizaciones primera generación Accord

INSERT INTO Motorizaciones VALUES ("12", "70", "1976 - 1978");
INSERT INTO Motorizaciones VALUES ("12", "72", "1979 - 1981");
INSERT INTO Motorizaciones VALUES ("12", "74", "1979 - 1981");
INSERT INTO Motorizaciones VALUES ("12", "76", "1980 - 1981");

-- Motorizaciones segunda generación Accord

INSERT INTO Motorizaciones VALUES ("13", "72", "1982 - 1983");
INSERT INTO Motorizaciones VALUES ("13", "74", "1982 - 1983");
INSERT INTO Motorizaciones VALUES ("13", "82", "1982 - 1983");
INSERT INTO Motorizaciones VALUES ("13", "78", "1984 - 1985");
INSERT INTO Motorizaciones VALUES ("13", "79", "1985");

-- Motorizaciones tercera generación Accord

INSERT INTO Motorizaciones VALUES ("14", "1", "1986 - 1988");
INSERT INTO Motorizaciones VALUES ("14", "2", "1986 - 1989");
INSERT INTO Motorizaciones VALUES ("14", "3", "1986 - 1989");
INSERT INTO Motorizaciones VALUES ("14", "4", "1986 - 1989");
INSERT INTO Motorizaciones VALUES ("14", "13", "1986 - 1989");

-- Motorizaciones cuarta generación Accord

INSERT INTO Motorizaciones VALUES ("15", "83", "1990 - 1993");
INSERT INTO Motorizaciones VALUES ("15", "85", "1990 - 1993");
INSERT INTO Motorizaciones VALUES ("15", "87", "1990 - 1993");
INSERT INTO Motorizaciones VALUES ("15", "92", "1990 - 1993");
INSERT INTO Motorizaciones VALUES ("15", "94", "1990 - 1993");
INSERT INTO Motorizaciones VALUES ("15", "95", "1990 - 1993");
INSERT INTO Motorizaciones VALUES ("15", "96", "1990 - 1993");

-- Motorizaciones quinta generación Accord

INSERT INTO Motorizaciones VALUES ("16", "84", "1994 - 1997");
INSERT INTO Motorizaciones VALUES ("16", "88", "1994 - 1997");
INSERT INTO Motorizaciones VALUES ("16", "89", "1994 - 1997");
INSERT INTO Motorizaciones VALUES ("16", "93", "1994 - 1997");
INSERT INTO Motorizaciones VALUES ("16", "97", "1994 - 1997");
INSERT INTO Motorizaciones VALUES ("16", "98", "1994 - 1997");
INSERT INTO Motorizaciones VALUES ("16", "99", "1994 - 1997");
INSERT INTO Motorizaciones VALUES ("16", "100", "1994 - 1997");
INSERT INTO Motorizaciones VALUES ("16", "106", "1994 - 1997");
INSERT INTO Motorizaciones VALUES ("16", "23", "1994 - 1997");

-- Motorizaciones sexta generación Accord

INSERT INTO Motorizaciones VALUES ("17", "90", "1998 - 2002");
INSERT INTO Motorizaciones VALUES ("17", "103", "1998 - 2002");
INSERT INTO Motorizaciones VALUES ("17", "104", "1998 - 2002");
INSERT INTO Motorizaciones VALUES ("17", "105", "1998 - 2002");
INSERT INTO Motorizaciones VALUES ("17", "115", "1998 - 2002");

-- Motorizaciones séptima generación Accord

INSERT INTO Motorizaciones VALUES ("18", "123", "2003 - 2007");
INSERT INTO Motorizaciones VALUES ("18", "122", "2003 - 2007");
INSERT INTO Motorizaciones VALUES ("18", "127", "2003 - 2006");
INSERT INTO Motorizaciones VALUES ("18", "128", "2003 - 2007");
INSERT INTO Motorizaciones VALUES ("18", "135", "2003 - 2007");
INSERT INTO Motorizaciones VALUES ("18", "136", "2003 - 2007");
INSERT INTO Motorizaciones VALUES ("18", "137", "2003 - 2005");
INSERT INTO Motorizaciones VALUES ("18", "138", "2006 - 2007");
INSERT INTO Motorizaciones VALUES ("18", "116", "2003 - 2005");
INSERT INTO Motorizaciones VALUES ("18", "154", "2003 - 2007");

-- Motorizaciones octava generación Accord

INSERT INTO Motorizaciones VALUES ("19", "163", "2008 - 2012");
INSERT INTO Motorizaciones VALUES ("19", "135", "2008 - 2012");
INSERT INTO Motorizaciones VALUES ("19", "140", "2008 - 2012");
INSERT INTO Motorizaciones VALUES ("19", "141", "2008 - 2012");
INSERT INTO Motorizaciones VALUES ("19", "120", "2010 - 2012");
INSERT INTO Motorizaciones VALUES ("19", "155", "2008 - 2012");

-- Motorizaciones novena generación Accord

INSERT INTO Motorizaciones VALUES ("20", "166", "2013 - 2017");
INSERT INTO Motorizaciones VALUES ("20", "139", "2013 - 2017");
INSERT INTO Motorizaciones VALUES ("20", "117", "2013 - 2016");
INSERT INTO Motorizaciones VALUES ("20", "118", "2013 - 2017");
INSERT INTO Motorizaciones VALUES ("20", "119", "2013 - 2017");
INSERT INTO Motorizaciones VALUES ("20", "151", "2013 - 2017");

-- Motorizaciones décima generación Accord

INSERT INTO Motorizaciones VALUES ("21", "145", "2018 - 2023");
INSERT INTO Motorizaciones VALUES ("21", "146", "2018 - 2023");
INSERT INTO Motorizaciones VALUES ("21", "131", "2018 - 2023");
INSERT INTO Motorizaciones VALUES ("21", "151", "2018 - 2023");

-- Motorizaciones undécima generación Accord

INSERT INTO Motorizaciones VALUES ("22", "145", "2023 - Presente");
INSERT INTO Motorizaciones VALUES ("22", "152", "2023 - Presente");

-- Motorizaciones primera generación CRX

INSERT INTO Motorizaciones VALUES ("23", "81", "1983 - 1986");
INSERT INTO Motorizaciones VALUES ("23", "36", "1984 - 1987");
INSERT INTO Motorizaciones VALUES ("23", "37", "1984 - 1987");
INSERT INTO Motorizaciones VALUES ("23", "38", "1984 - 1987");
INSERT INTO Motorizaciones VALUES ("23", "39", "1985 - 1987");
INSERT INTO Motorizaciones VALUES ("23", "40", "1985 - 1987");

-- Motorizaciones segunda generación CRX

INSERT INTO Motorizaciones VALUES ("24", "30", "1990");
INSERT INTO Motorizaciones VALUES ("24", "43", "1988 – 1991");
INSERT INTO Motorizaciones VALUES ("24", "46", "1988 – 1991");
INSERT INTO Motorizaciones VALUES ("24", "54", "1988 – 1991");
INSERT INTO Motorizaciones VALUES ("24", "55", "1988 – 1991");
INSERT INTO Motorizaciones VALUES ("24", "56", "1988 – 1991");
INSERT INTO Motorizaciones VALUES ("24", "66", "1988 – 1991");
INSERT INTO Motorizaciones VALUES ("24", "9", "1989 - 1991");

-- Motorizaciones tercera generación CRX

INSERT INTO Motorizaciones VALUES ("25", "47", "1996 – 1997");
INSERT INTO Motorizaciones VALUES ("25", "62", "1996 – 1997");
INSERT INTO Motorizaciones VALUES ("25", "63", "1996 – 1997");
INSERT INTO Motorizaciones VALUES ("25", "64", "1993 – 1996");
INSERT INTO Motorizaciones VALUES ("25", "8", "1992 – 1995");
INSERT INTO Motorizaciones VALUES ("25", "10", "1992 - 1997");
INSERT INTO Motorizaciones VALUES ("25", "11", "1994 - 1995");

-- Motorizaciones primera generación Prelude

INSERT INTO Motorizaciones VALUES ("26", "72", "1979 - 1982");
INSERT INTO Motorizaciones VALUES ("26", "73", "1979 - 1982");

-- Motorizaciones segunda generación Prelude

INSERT INTO Motorizaciones VALUES ("27", "77", "1983 - 1984");
INSERT INTO Motorizaciones VALUES ("27", "80", "1984 - 1987");
INSERT INTO Motorizaciones VALUES ("27", "5", "1984 - 1987");
INSERT INTO Motorizaciones VALUES ("27", "15", "1984 - 1987");
INSERT INTO Motorizaciones VALUES ("27", "16", "1984 - 1987");

-- Motorizaciones tercera generación Prelude

INSERT INTO Motorizaciones VALUES ("28", "14", "1988 - 1991");
INSERT INTO Motorizaciones VALUES ("28", "15", "1988 – 1990");
INSERT INTO Motorizaciones VALUES ("28", "16", "1988 - 1991");
INSERT INTO Motorizaciones VALUES ("28", "17", "1988 – 1991");
INSERT INTO Motorizaciones VALUES ("28", "18", "1988 – 1991");
INSERT INTO Motorizaciones VALUES ("28", "19", "1988 – 1991");
INSERT INTO Motorizaciones VALUES ("28", "20", "1990 – 1991");
INSERT INTO Motorizaciones VALUES ("28", "21", "1990 – 1991");
INSERT INTO Motorizaciones VALUES ("28", "22", "1990 – 1991");

-- Motorizaciones cuarta generación Prelude

INSERT INTO Motorizaciones VALUES ("29", "86", "1992 - 1996");
INSERT INTO Motorizaciones VALUES ("29", "92", "1992 - 1996");
INSERT INTO Motorizaciones VALUES ("29", "99", "1993 - 1996");
INSERT INTO Motorizaciones VALUES ("29", "106", "1992 - 1996");
INSERT INTO Motorizaciones VALUES ("29", "107", "1992 - 1996");
INSERT INTO Motorizaciones VALUES ("29", "108", "1992 - 1996");
INSERT INTO Motorizaciones VALUES ("29", "113", "1992 - 1996");
INSERT INTO Motorizaciones VALUES ("29", "114", "1992 - 1996");

-- Motorizaciones quinta generación Prelude

INSERT INTO Motorizaciones VALUES ("30", "86", "1997 - 2001");
INSERT INTO Motorizaciones VALUES ("30", "99", "1997");
INSERT INTO Motorizaciones VALUES ("30", "102", "1997 - 2001");
INSERT INTO Motorizaciones VALUES ("30", "106", "1997 - 2001");
INSERT INTO Motorizaciones VALUES ("30", "109", "1997 - 1998");
INSERT INTO Motorizaciones VALUES ("30", "110", "1997 - 1998");
INSERT INTO Motorizaciones VALUES ("30", "111", "1999 - 2001");
INSERT INTO Motorizaciones VALUES ("30", "112", "1999 - 2001");

-- Motorizaciones S2K

INSERT INTO Motorizaciones VALUES ("31", "91", "1999 - 2009");
INSERT INTO Motorizaciones VALUES ("31", "101", "2004 – 2009");

-- Motorizaciones primera generación de NSX

INSERT INTO Motorizaciones VALUES ("32", "24", "1991 - 2001");
INSERT INTO Motorizaciones VALUES ("32", "25", "1991 - 2005 (USA), 1997 - 2005 (NSX-R)");

-- Motorizaciones segunda generación de NSX

INSERT INTO Motorizaciones VALUES ("33", "121", "2016 - 2022");