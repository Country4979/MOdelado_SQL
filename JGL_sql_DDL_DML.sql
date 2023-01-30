--DDL
--Creamos el esquema
create schema jgl_SQL authorization tywwhemj;

--Tabla Grupo Empresarial
create table jgl_sql.g_emp(
	id_g_emp varchar(20) not null, --PK
	Nombre varchar(100) not null
);

--PK
alter table jgl_sql.g_emp
add constraint g_emp_PK primary key (id_g_emp);


--Tabla Marca
create table jgl_sql.marca(
	id_marca varchar(20) not null, --PK
	NombreMarca varchar(100) not null,
	id_g_emp varchar(20) not null --FK
);

--PK
alter table jgl_sql.marca
add constraint marca_PK primary key (id_marca);

--FK
alter table jgl_sql.marca
add constraint g_emp_FK foreign key (id_g_emp)
references jgl_sql.g_emp(id_g_emp);


--Tabla modelo
create table jgl_sql.modelo(
	id_modelo varchar(20) not null, --PK
	id_marca varchar(20) not null, --PK --FK
	NombreModelo varchar(100) not null
);

--PK
alter table jgl_sql.modelo
add constraint modelo_marca_PK primary key (id_modelo);

--FK
alter table jgl_sql.modelo
add constraint marca_FK foreign key (id_marca)
references jgl_sql.marca(id_marca);


--Tabla color
create table jgl_sql.color(
	color_name varchar (20) not null	--PK
);

--PK
alter table jgl_sql.color
add constraint color_name_PK primary key (color_name);



--Tabla Coche
create table jgl_sql.car(
	id_car varchar (10) not null, --PK
	id_modelo varchar (20) not null, --FK
	color_name varchar (20) not null,
	matricula varchar (20) not null,
	total_km integer default '100'
);

--PK
alter table jgl_sql.car
add constraint id_car_PK primary key (id_car);

--FK
alter table jgl_sql.car
add constraint id_modelo_FK foreign key (id_modelo)
references jgl_sql.modelo (id_modelo);

alter table jgl_sql.car
add constraint id_color_name_FK foreign key (color_name)
references jgl_sql.color (color_name);


--Tabla coche-flota
create table jgl_sql.coche_flota(
	id_car varchar (10) not null, --PK --FK
	dt_alta date not null, --PK
	dt_end date null default '4000-01-01'
);

--PK
alter table jgl_sql.coche_flota
add constraint coche_flota_PK primary key (id_car, dt_alta);

--FK
alter table jgl_sql.coche_flota
add constraint id_car_FK foreign key (id_car)
references jgl_sql.car (id_car);



--Tabla Aseguradora
create table jgl_sql.aseguradora(
	id_aseguradora varchar (20) not null, --PK
	name varchar (50) not null
);

--PK
alter table jgl_sql.aseguradora
add constraint id_aseguradora_PK primary key (id_aseguradora);


--Tabla Póliza
create table jgl_sql.poliza(
	id_car varchar (10) not null, --PK --FK
	n_poliza varchar (10) not null, --PK
	id_aseguradora varchar (20) not null, --PK
	dt_start date not null,
	dt_end date null default '4000-01-01'
);

--PK
alter table jgl_sql.poliza
add constraint poliza_PK primary key (id_car, id_aseguradora, n_poliza);

--FK
alter table jgl_sql.poliza
add constraint id_car_FK foreign key (id_car)
references jgl_sql.car (id_car);

alter table jgl_sql.poliza
add constraint poliza_aseguradora_FK foreign key (id_aseguradora)
references jgl_sql.aseguradora (id_aseguradora);



-- Tabla Coin
create table jgl_sql.coin(
	id_type_coin varchar (5) not null, --PK
	nombremoneda varchar (50) not null
);

--PK
alter table jgl_sql.coin
add constraint type_coin_PK primary key (id_type_coin);


--Tabla revisiones
create table jgl_sql.hist_revisiones_coche_flota (
	id_car varchar (10) not null, --PK  --FK
	dt_alta date not null, --PK --FK
	n_revision varchar (50) not null,
	dt_rev date not null,
	km_rev integer not null default 100,
	importe numeric(6,2) not null default 1.00,
	id_type_coin varchar (5) not null
);

--PK
alter table jgl_sql.hist_revisiones_coche_flota
add constraint hist_revisiones_coche_flota_PK primary key (id_car, dt_alta, n_revision);

--FK
alter table jgl_sql.hist_revisiones_coche_flota
add constraint hist_revisiones_coche_flota_FK foreign key (id_car, dt_alta)
references jgl_sql.coche_flota(id_car, dt_alta);

alter table jgl_sql.hist_revisiones_coche_flota
add constraint type_coin_FK foreign key (id_type_coin)
references jgl_sql.coin(id_type_coin);

--DML

--- Metemos los datos de las tablas
---Datos Grupo empresarial
insert into jgl_sql.g_emp values ('01','BMW Group');
insert into jgl_sql.g_emp values ('02','Ford');
insert into jgl_sql.g_emp values ('03','Honda');
insert into jgl_sql.g_emp values ('04','Hyundai');
insert into jgl_sql.g_emp values ('05','Suzuki');
insert into jgl_sql.g_emp values ('06','General Motors');
insert into jgl_sql.g_emp values ('07','Tata');
insert into jgl_sql.g_emp values ('08','Toyota');
insert into jgl_sql.g_emp values ('09','Renault Nissan-Mitsubishi');
insert into jgl_sql.g_emp values ('10','Van');
insert into jgl_sql.g_emp values ('11','Stellantis');

--Datos marca
insert into jgl_sql.marca values ('VA-01','Audi','10');
insert into jgl_sql.marca values ('VA-02','Seat','10');
insert into jgl_sql.marca values ('VA-03','Skoda','10');
insert into jgl_sql.marca values ('ST-01','Opel','11');
insert into jgl_sql.marca values ('VA-04','Volkswagen ','10');
insert into jgl_sql.marca values ('RE-01','Alpine','09');
insert into jgl_sql.marca values ('RE-02','Dacia','09');
insert into jgl_sql.marca values ('RE-03','Renault','09');
insert into jgl_sql.marca values ('TA-02','Land Rover','07');
insert into jgl_sql.marca values ('RE-04','Nissan','09');
insert into jgl_sql.marca values ('RE-05','Mitsubishi','09');
insert into jgl_sql.marca values ('ST-02','Alfa Romeo','11');
insert into jgl_sql.marca values ('ST-03','Fiat','11');
insert into jgl_sql.marca values ('ST-04','Lancia','11');
insert into jgl_sql.marca values ('ST-05','Peugeot','11');
insert into jgl_sql.marca values ('ST-06','Citröen','11');
insert into jgl_sql.marca values ('BM-01','BMW','01');
insert into jgl_sql.marca values ('SU-01','Suzuki','05');
insert into jgl_sql.marca values ('TO-01','Lexus','08');
insert into jgl_sql.marca values ('TO-02','Toyota','08');
insert into jgl_sql.marca values ('GM-01','Chevrolet','06');
insert into jgl_sql.marca values ('TA-01','Tata','07');
insert into jgl_sql.marca values ('HY-01','Hyundai','04');
insert into jgl_sql.marca values ('FD-01','Ford','02');
insert into jgl_sql.marca values ('HO-01','Honda','03');

--Datos modelo
insert into jgl_sql.modelo values ('VA-VK-01','VA-04','Golf');
insert into jgl_sql.modelo values ('VA-VK-02','VA-04','Jetta');
insert into jgl_sql.modelo values ('RE-DA-01','RE-02','Duster');
insert into jgl_sql.modelo values ('RE-DA-02','RE-02','Sandero');
insert into jgl_sql.modelo values ('VA-SE-01','VA-02','Leon');
insert into jgl_sql.modelo values ('VA-SE-02','VA-02','Ibiza');
insert into jgl_sql.modelo values ('RE-RE-01','RE-03','Scenic');
insert into jgl_sql.modelo values ('RE-RE-02','RE-03','Megane');
insert into jgl_sql.modelo values ('SU-SU-01','SU-01','Ignis');
insert into jgl_sql.modelo values ('TA-TA-01','TA-01','Indigo');
insert into jgl_sql.modelo values ('VA-SK-01','VA-03','Octavia');
insert into jgl_sql.modelo values ('VA-SK-02','VA-03','Yetti');
insert into jgl_sql.modelo values ('TA-LR-01','TA-02','Discovery');
insert into jgl_sql.modelo values ('TA-LR-02','TA-02','Defender');
insert into jgl_sql.modelo values ('VA-AU-01','VA-01','A1');
insert into jgl_sql.modelo values ('VA-AU-02','VA-01','A2');
insert into jgl_sql.modelo values ('ST-OP-01','ST-01','Vectra');
insert into jgl_sql.modelo values ('ST-OP-02','ST-01','Astra');
insert into jgl_sql.modelo values ('RE-NI-01','RE-04','Patrol');
insert into jgl_sql.modelo values ('RE-NI-02','RE-04','Almera');
insert into jgl_sql.modelo values ('RE-MI-01','RE-05','Nativa');
insert into jgl_sql.modelo values ('RE-MI-02','RE-05','Eclipse');
insert into jgl_sql.modelo values ('ST-AR-01','ST-02','Giulietta');
insert into jgl_sql.modelo values ('ST-AR-02','ST-02','156');
insert into jgl_sql.modelo values ('ST-FI-01','ST-03','Uno');
insert into jgl_sql.modelo values ('ST-FI-02','ST-03','Panda');
insert into jgl_sql.modelo values ('ST-LA-01','ST-04','Delta');
insert into jgl_sql.modelo values ('ST-LA-02','ST-04','Ypsilon');
insert into jgl_sql.modelo values ('ST-CI-01','ST-06','C1');
insert into jgl_sql.modelo values ('ST-CI-02','ST-06','C2');
insert into jgl_sql.modelo values ('RE-AL-01','RE-01','A610');
insert into jgl_sql.modelo values ('RE-AL-02','RE-01','A110');
insert into jgl_sql.modelo values ('BM-BM-01','BM-01','M5');
insert into jgl_sql.modelo values ('BM-BM-02','BM-01','M6');
insert into jgl_sql.modelo values ('HO-HO-01','HO-01','Civic');
insert into jgl_sql.modelo values ('HO-HO-02','HO-01','Legend');
insert into jgl_sql.modelo values ('FD-FD-01','FD-01','Fiesta');
insert into jgl_sql.modelo values ('FD-FD-02','FD-01','Focus');
insert into jgl_sql.modelo values ('HY-HY-01','HY-01','Tucson');
insert into jgl_sql.modelo values ('HY-HY-02','HY-01','Creta');
insert into jgl_sql.modelo values ('TA-TA-02','TA-01','Aria');
insert into jgl_sql.modelo values ('SU-SU-02','SU-01','Swift');
insert into jgl_sql.modelo values ('GM-CH-01','GM-01','Silverado');
insert into jgl_sql.modelo values ('GM-CH-02','GM-01','Astro');
insert into jgl_sql.modelo values ('TO-TO-01','TO-02','Celica');
insert into jgl_sql.modelo values ('TO-TO-02','TO-02','Corolla');
insert into jgl_sql.modelo values ('TO-LE-01','TO-01','SC');
insert into jgl_sql.modelo values ('TO-LE-02','TO-01','Is');
insert into jgl_sql.modelo values ('ST-PE-01','ST-05','306');
insert into jgl_sql.modelo values ('ST-PE-02','ST-05','508');


--Datos Color
insert into jgl_sql.color values ('Negro');
insert into jgl_sql.color values ('Blanco');
insert into jgl_sql.color values ('Naranja');
insert into jgl_sql.color values ('Rojo');

--Datos Coche
insert into jgl_sql.car values ('001','VA-VK-01','Negro','2535-ZZZ','120000');
insert into jgl_sql.car values ('002','VA-VK-02','Blanco','2536-ZZZ','120001');
insert into jgl_sql.car values ('003','RE-DA-01','Naranja','2537-ZZZ','120002');
insert into jgl_sql.car values ('004','RE-DA-02','Rojo','2538-ZZZ','120003');
insert into jgl_sql.car values ('005','VA-SE-01','Negro','2539-ZZZ','120004');
insert into jgl_sql.car values ('006','VA-SE-02','Blanco','2540-ZZZ','120005');
insert into jgl_sql.car values ('007','RE-RE-01','Naranja','2541-ZZZ','120006');
insert into jgl_sql.car values ('008','RE-RE-02','Rojo','2542-ZZZ','120007');
insert into jgl_sql.car values ('009','SU-SU-01','Negro','2543-ZZZ','120008');
insert into jgl_sql.car values ('010','TA-TA-01','Blanco','2544-ZZZ','120009');
insert into jgl_sql.car values ('011','VA-SK-01','Naranja','2545-ZZZ','120010');
insert into jgl_sql.car values ('012','VA-SK-02','Rojo','2546-ZZZ','120011');
insert into jgl_sql.car values ('013','TA-LR-01','Negro','2547-ZZZ','120012');
insert into jgl_sql.car values ('014','TA-LR-02','Blanco','2548-ZZZ','120013');
insert into jgl_sql.car values ('015','VA-AU-01','Naranja','2549-ZZZ','120014');
insert into jgl_sql.car values ('016','VA-AU-02','Rojo','2550-ZZZ','120015');
insert into jgl_sql.car values ('017','ST-OP-01','Negro','2551-ZZZ','120016');
insert into jgl_sql.car values ('018','ST-OP-02','Blanco','2552-ZZZ','120017');
insert into jgl_sql.car values ('019','RE-NI-01','Naranja','2553-ZZZ','120018');
insert into jgl_sql.car values ('020','RE-NI-02','Rojo','2554-ZZZ','120019');
insert into jgl_sql.car values ('021','RE-MI-01','Negro','2555-ZZZ','120020');
insert into jgl_sql.car values ('022','RE-MI-02','Blanco','2556-ZZZ','120021');
insert into jgl_sql.car values ('023','ST-AR-01','Naranja','2557-ZZZ','120022');
insert into jgl_sql.car values ('024','ST-AR-02','Rojo','2558-ZZZ','120023');
insert into jgl_sql.car values ('025','ST-FI-01','Negro','2559-ZZZ','120024');
insert into jgl_sql.car values ('026','ST-FI-02','Blanco','2560-ZZZ','120025');
insert into jgl_sql.car values ('027','ST-LA-01','Naranja','2561-ZZZ','120026');
insert into jgl_sql.car values ('028','ST-LA-02','Rojo','2562-ZZZ','120027');
insert into jgl_sql.car values ('029','ST-CI-01','Negro','2563-ZZZ','120028');
insert into jgl_sql.car values ('030','ST-CI-02','Blanco','2564-ZZZ','120029');
insert into jgl_sql.car values ('031','RE-AL-01','Naranja','2565-ZZZ','120030');
insert into jgl_sql.car values ('032','RE-AL-02','Rojo','2566-ZZZ','120031');
insert into jgl_sql.car values ('033','BM-BM-01','Negro','2567-ZZZ','120032');
insert into jgl_sql.car values ('034','BM-BM-02','Blanco','2568-ZZZ','120033');
insert into jgl_sql.car values ('035','HO-HO-01','Naranja','2569-ZZZ','120034');
insert into jgl_sql.car values ('036','HO-HO-02','Rojo','2570-ZZZ','120035');
insert into jgl_sql.car values ('037','FD-FD-01','Negro','2571-ZZZ','120036');
insert into jgl_sql.car values ('038','FD-FD-02','Blanco','2572-ZZZ','120037');
insert into jgl_sql.car values ('039','HY-HY-01','Naranja','2573-ZZZ','120038');
insert into jgl_sql.car values ('040','HY-HY-02','Rojo','2574-ZZZ','120039');
insert into jgl_sql.car values ('041','TA-TA-02','Negro','2575-ZZZ','120040');
insert into jgl_sql.car values ('042','SU-SU-02','Blanco','2576-ZZZ','120041');
insert into jgl_sql.car values ('043','GM-CH-01','Naranja','2577-ZZZ','120042');
insert into jgl_sql.car values ('044','GM-CH-02','Rojo','2578-ZZZ','120043');
insert into jgl_sql.car values ('045','TO-TO-01','Negro','2579-ZZZ','120044');
insert into jgl_sql.car values ('046','TO-TO-02','Blanco','2580-ZZZ','120045');
insert into jgl_sql.car values ('047','TO-LE-01','Naranja','2581-ZZZ','120046');
insert into jgl_sql.car values ('048','TO-LE-02','Rojo','2582-ZZZ','120047');
insert into jgl_sql.car values ('049','ST-PE-01','Negro','2583-ZZZ','120048');
insert into jgl_sql.car values ('050','ST-PE-02','Rojo','2584-ZZZ','120049');


--Datos coche_flota
insert into jgl_sql.coche_flota values ('001','2023-01-01');
insert into jgl_sql.coche_flota values ('002','2023-01-01');
insert into jgl_sql.coche_flota values ('003','2023-01-01');
insert into jgl_sql.coche_flota values ('004','2023-01-01');
insert into jgl_sql.coche_flota values ('005','2023-01-01');
insert into jgl_sql.coche_flota values ('006','2023-01-01');
insert into jgl_sql.coche_flota values ('007','2023-01-01');
insert into jgl_sql.coche_flota values ('008','2023-01-01');
insert into jgl_sql.coche_flota values ('009','2023-01-01');
insert into jgl_sql.coche_flota values ('010','2023-01-01');
insert into jgl_sql.coche_flota values ('011','2023-01-01');
insert into jgl_sql.coche_flota values ('012','2023-01-01');
insert into jgl_sql.coche_flota values ('013','2023-01-01');
insert into jgl_sql.coche_flota values ('014','2023-01-01');
insert into jgl_sql.coche_flota values ('015','2023-01-01');
insert into jgl_sql.coche_flota values ('016','2023-01-01');
insert into jgl_sql.coche_flota values ('017','2023-01-01');
insert into jgl_sql.coche_flota values ('018','2023-01-01','2023-02-01');
insert into jgl_sql.coche_flota values ('019','2023-01-01');
insert into jgl_sql.coche_flota values ('020','2023-01-01');
insert into jgl_sql.coche_flota values ('021','2023-01-01');
insert into jgl_sql.coche_flota values ('022','2023-01-01');
insert into jgl_sql.coche_flota values ('023','2023-01-01');
insert into jgl_sql.coche_flota values ('024','2023-01-01');
insert into jgl_sql.coche_flota values ('025','2023-01-01');
insert into jgl_sql.coche_flota values ('026','2023-01-01');
insert into jgl_sql.coche_flota values ('027','2023-01-01');
insert into jgl_sql.coche_flota values ('028','2023-01-01');
insert into jgl_sql.coche_flota values ('029','2023-01-01');
insert into jgl_sql.coche_flota values ('030','2023-01-01');
insert into jgl_sql.coche_flota values ('031','2023-01-01');
insert into jgl_sql.coche_flota values ('032','2023-01-01');
insert into jgl_sql.coche_flota values ('033','2023-01-01');
insert into jgl_sql.coche_flota values ('034','2023-01-01');
insert into jgl_sql.coche_flota values ('035','2023-01-01');
insert into jgl_sql.coche_flota values ('036','2023-01-01');
insert into jgl_sql.coche_flota values ('037','2023-01-01');
insert into jgl_sql.coche_flota values ('038','2023-01-01');
insert into jgl_sql.coche_flota values ('039','2023-01-01');
insert into jgl_sql.coche_flota values ('040','2023-01-01','2023-01-15');
insert into jgl_sql.coche_flota values ('041','2023-01-01');
insert into jgl_sql.coche_flota values ('042','2023-01-01');
insert into jgl_sql.coche_flota values ('043','2023-01-01');
insert into jgl_sql.coche_flota values ('044','2023-01-01');
insert into jgl_sql.coche_flota values ('045','2023-01-01');
insert into jgl_sql.coche_flota values ('046','2023-01-01');
insert into jgl_sql.coche_flota values ('047','2023-01-01');
insert into jgl_sql.coche_flota values ('048','2023-01-01');
insert into jgl_sql.coche_flota values ('049','2023-01-01');
insert into jgl_sql.coche_flota values ('050','2023-01-01');

--Datos Aseguradora
insert into jgl_sql.aseguradora values ('01','AXA');
insert into jgl_sql.aseguradora values ('02','Line Directa');
insert into jgl_sql.aseguradora values ('03','Mutua Madrileña');

--Datos Poliza
insert into jgl_sql.poliza values ('001','AX-01','01','2023-01-01');
insert into jgl_sql.poliza values ('002','AX-02','01','2023-01-01');
insert into jgl_sql.poliza values ('003','AX-03','01','2023-01-01');
insert into jgl_sql.poliza values ('004','AX-04','01','2023-01-01');
insert into jgl_sql.poliza values ('005','AX-05','01','2023-01-01');
insert into jgl_sql.poliza values ('006','AX-06','01','2023-01-01');
insert into jgl_sql.poliza values ('007','AX-07','01','2023-01-01');
insert into jgl_sql.poliza values ('008','AX-08','01','2023-01-01');
insert into jgl_sql.poliza values ('009','AX-09','01','2023-01-01');
insert into jgl_sql.poliza values ('010','AX-10','01','2023-01-01');
insert into jgl_sql.poliza values ('011','AX-11','01','2023-01-01');
insert into jgl_sql.poliza values ('012','AX-12','01','2023-01-01');
insert into jgl_sql.poliza values ('013','AX-13','01','2023-01-01');
insert into jgl_sql.poliza values ('014','AX-14','01','2023-01-01');
insert into jgl_sql.poliza values ('015','AX-15','01','2023-01-01');
insert into jgl_sql.poliza values ('016','LD-01','02','2023-01-01');
insert into jgl_sql.poliza values ('017','LD-02','02','2023-01-01');
insert into jgl_sql.poliza values ('018','LD-03','02','2023-01-01','2023-02-01');
insert into jgl_sql.poliza values ('019','LD-04','02','2023-01-01');
insert into jgl_sql.poliza values ('020','LD-05','02','2023-01-01');
insert into jgl_sql.poliza values ('021','LD-06','02','2023-01-01');
insert into jgl_sql.poliza values ('022','LD-07','02','2023-01-01');
insert into jgl_sql.poliza values ('023','LD-08','02','2023-01-01');
insert into jgl_sql.poliza values ('024','LD-09','02','2023-01-01');
insert into jgl_sql.poliza values ('025','LD-10','02','2023-01-01');
insert into jgl_sql.poliza values ('026','LD-11','02','2023-01-01');
insert into jgl_sql.poliza values ('027','LD-12','02','2023-01-01');
insert into jgl_sql.poliza values ('028','LD-13','02','2023-01-01');
insert into jgl_sql.poliza values ('029','LD-14','02','2023-01-01');
insert into jgl_sql.poliza values ('030','LD-15','02','2023-01-01');
insert into jgl_sql.poliza values ('031','LD-16','02','2023-01-01');
insert into jgl_sql.poliza values ('032','LD-17','02','2023-01-01');
insert into jgl_sql.poliza values ('033','LD-18','02','2023-01-01');
insert into jgl_sql.poliza values ('034','LD-19','02','2023-01-01');
insert into jgl_sql.poliza values ('035','LD-20','02','2023-01-01');
insert into jgl_sql.poliza values ('036','LD-21','02','2023-01-01');
insert into jgl_sql.poliza values ('037','LD-22','02','2023-01-01');
insert into jgl_sql.poliza values ('038','LD-23','02','2023-01-01');
insert into jgl_sql.poliza values ('039','LD-24','02','2023-01-01');
insert into jgl_sql.poliza values ('040','LD-25','02','2023-01-01','2023-01-15');
insert into jgl_sql.poliza values ('041','LD-26','02','2023-01-01');
insert into jgl_sql.poliza values ('042','LD-27','02','2023-01-01');
insert into jgl_sql.poliza values ('043','LD-28','02','2023-01-01');
insert into jgl_sql.poliza values ('044','MM-01','03','2023-01-01');
insert into jgl_sql.poliza values ('045','MM-02','03','2023-01-01');
insert into jgl_sql.poliza values ('046','MM-03','03','2023-01-01');
insert into jgl_sql.poliza values ('047','MM-04','03','2023-01-01');
insert into jgl_sql.poliza values ('048','MM-05','03','2023-01-01');
insert into jgl_sql.poliza values ('049','MM-06','03','2023-01-01');
insert into jgl_sql.poliza values ('050','MM-07','03','2023-01-01');


--Datos Coin
insert into jgl_sql.coin values ('EU','Euro');
insert into jgl_sql.coin values ('DAM','Dolar Americano');
insert into jgl_sql.coin values ('Li','Libra');
insert into jgl_sql.coin values ('DOAU','Dolar Australiano');

--Datos Revisiones
insert into jgl_sql.hist_revisiones_coche_flota values ('001','2023-01-01','23-001','2023-01-05','120010','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('002','2023-01-01','23-002','2023-01-05','120011','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('003','2023-01-01','23-003','2023-01-05','120012','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('004','2023-01-01','23-004','2023-01-05','120013','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('005','2023-01-01','23-005','2023-01-05','120014','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('006','2023-01-01','23-006','2023-01-06','120015','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('007','2023-01-01','23-007','2023-01-06','120016','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('008','2023-01-01','23-008','2023-01-06','120017','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('009','2023-01-01','23-009','2023-01-06','120018','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('011','2023-01-01','23-010','2023-01-06','120019','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('012','2023-01-01','23-011','2023-01-07','120020','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('013','2023-01-01','23-012','2023-01-07','120021','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('014','2023-01-01','23-013','2023-01-07','120022','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('015','2023-01-01','23-014','2023-01-07','120023','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('016','2023-01-01','23-015','2023-01-07','120024','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('017','2023-01-01','23-016','2023-01-08','120025','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('018','2023-01-01','23-017','2023-01-09','120026','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('019','2023-01-01','23-018','2023-01-09','120027','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('020','2023-01-01','23-019','2023-01-09','120028','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('022','2023-01-01','23-020','2023-01-09','120029','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('023','2023-01-01','23-021','2023-01-10','120030','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('024','2023-01-01','23-022','2023-01-10','120031','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('025','2023-01-01','23-023','2023-01-10','120032','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('026','2023-01-01','23-024','2023-01-10','120033','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('027','2023-01-01','23-025','2023-01-11','120034','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('028','2023-01-01','23-026','2023-01-11','120035','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('029','2023-01-01','23-027','2023-01-11','120036','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('030','2023-01-01','23-028','2023-01-11','120037','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('031','2023-01-01','23-029','2023-01-11','120038','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('032','2023-01-01','23-030','2023-01-12','120039','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('033','2023-01-01','23-031','2023-01-12','120040','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('034','2023-01-01','23-032','2023-01-12','120041','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('035','2023-01-01','23-033','2023-01-12','120042','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('036','2023-01-01','23-034','2023-01-12','120043','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('037','2023-01-01','23-035','2023-01-13','120044','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('038','2023-01-01','23-036','2023-01-13','120045','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('039','2023-01-01','23-037','2023-01-13','120046','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('040','2023-01-01','23-038','2023-01-13','120047','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('041','2023-01-01','23-039','2023-01-13','120048','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('042','2023-01-01','23-040','2023-01-14','120049','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('043','2023-01-01','23-041','2023-01-14','120050','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('044','2023-01-01','23-042','2023-01-14','120051','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('045','2023-01-01','23-043','2023-01-14','120052','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('046','2023-01-01','23-044','2023-01-14','120053','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('047','2023-01-01','23-045','2023-01-15','120054','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('048','2023-01-01','23-046','2023-01-15','120055','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('049','2023-01-01','23-047','2023-01-15','120056','100','EU');
insert into jgl_sql.hist_revisiones_coche_flota values ('050','2023-01-01','23-048','2023-01-15','120057','100','EU');
