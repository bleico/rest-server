CREATE TABLE AMD
(
	Nro_Order            VARCHAR(10) NOT NULL,
	Prov_Serv_ID         INTEGER NULL,
	Date_Time            TIMESTAMP NULL,
	Service_Type         VARCHAR(30) NULL,
	Patient_Name         VARCHAR(50) NULL,
	Patient_Document     VARCHAR(15) NULL,
	Patient_Phone        INTEGER NULL,
	Patient_Address      VARCHAR(150) NULL,
	Diagnostic_Impression VARCHAR(200) NULL,
	Status               VARCHAR(11) NULL
);



ALTER TABLE AMD
ADD PRIMARY KEY (Nro_Order);



CREATE TABLE Coordinates
(
	Trace_ID             INTEGER NOT NULL,
	Nro_Order            VARCHAR(10) NOT NULL,
	Latitude             FLOAT NULL,
	Longitude            FLOAT NULL,
	Date_Time            TIMESTAMP NULL,
	Length               INTEGER NULL,
	Duration             INTEGER NULL
);



ALTER TABLE Coordinates
ADD PRIMARY KEY (Trace_ID,Nro_Order);



CREATE TABLE Prov_Serv
(
	Prov_Serv_ID         INTEGER NOT NULL,
	Provider_ID          INTEGER NULL,
	Service_ID           INTEGER NULL
);



ALTER TABLE Prov_Serv
ADD PRIMARY KEY (Prov_Serv_ID);



CREATE TABLE Provider
(
	Provider_ID          INTEGER NOT NULL,
	Provider_Name        VARCHAR(20) NULL
);



ALTER TABLE Provider
ADD PRIMARY KEY (Provider_ID);



CREATE TABLE Service
(
	Service_ID           INTEGER NOT NULL,
	Service_Name         VARCHAR(20) NULL
);



ALTER TABLE Service
ADD PRIMARY KEY (Service_ID);



CREATE TABLE Unit
(
	Unit_ID              INTEGER NOT NULL,
	Provider_ID          INTEGER NULL,
	Unit_Name            VARCHAR(25) NULL
);



ALTER TABLE Unit
ADD PRIMARY KEY (Unit_ID);



CREATE TABLE Users
(
	Users_ID             INTEGER NOT NULL,
	Provider_ID          INTEGER NULL,
	Username             VARCHAR(25) NULL,
	Password             VARCHAR(25) NULL,
	Name                 VARCHAR(50) NULL,
	Phone                BIGINT NULL
);



ALTER TABLE Users
ADD PRIMARY KEY (Users_ID);

ALTER TABLE public.users
    ALTER COLUMN users_id ADD GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 );

ALTER TABLE AMD
ADD FOREIGN KEY (Prov_Serv_ID) REFERENCES Prov_Serv (Prov_Serv_ID);



ALTER TABLE Coordinates
ADD FOREIGN KEY (Nro_Order) REFERENCES AMD (Nro_Order);



ALTER TABLE Prov_Serv
ADD FOREIGN KEY (Service_ID) REFERENCES Service (Service_ID);



ALTER TABLE Prov_Serv
ADD FOREIGN KEY (Provider_ID) REFERENCES Provider (Provider_ID);



ALTER TABLE Unit
ADD FOREIGN KEY (Provider_ID) REFERENCES Provider (Provider_ID);



ALTER TABLE Users
ADD FOREIGN KEY (Provider_ID) REFERENCES Provider (Provider_ID);

ALTER TABLE public.provider
    ALTER COLUMN provider_id ADD GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 );

INSERT INTO public.provider(
	provider_name)
	VALUES ('AloJose');
INSERT INTO public.provider(
	provider_name)
	VALUES ('Tu Buen Doctor');
INSERT INTO public.provider(
	provider_name)
	VALUES ('Metromed');

INSERT INTO public.Users(
	provider_id, username, password, name, phone)
	VALUES (1, 'Jmurga', '12345', 'Jose Murga', 1111111111);
INSERT INTO public.Users(
	provider_id, username, password, name, phone)
	VALUES (2, 'BC', '12345', 'Bleider', 2222222222);
INSERT INTO public.Users(
	provider_id, username, password, name, phone)
	VALUES (3, 'DCequea', '12345', 'David', 3333333333);


ALTER TABLE public.unit
    ALTER COLUMN unit_id ADD GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 );

INSERT INTO public.unit(
	provider_id, unit_name)
	VALUES (1, 'Ambulancia-01');
INSERT INTO public.unit(
	provider_id, unit_name)
	VALUES (1, 'Ambulancia-02');
INSERT INTO public.unit(
	provider_id, unit_name)
	VALUES (2, 'Ambulancia-01');
INSERT INTO public.unit(
	provider_id, unit_name)
	VALUES (3, 'Ambulancia-01');
INSERT INTO public.unit(
	provider_id, unit_name)
	VALUES (3, 'Ambulancia-02');
INSERT INTO public.unit(
	provider_id, unit_name)
	VALUES (3, 'Ambulancia-03');

ALTER TABLE public.service
    ALTER COLUMN service_id ADD GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 );

INSERT INTO public.service(
	service_name)
	VALUES ('Ubicame');

ALTER TABLE public.prov_serv
    ALTER COLUMN prov_serv_id ADD GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 );

INSERT INTO public.prov_serv(
	provider_id, service_id)
	VALUES (1, 1);
INSERT INTO public.prov_serv(
	provider_id, service_id)
	VALUES (2, 1);
INSERT INTO public.prov_serv(
	provider_id, service_id)
	VALUES (3, 1);

ALTER TABLE public.amd
    ALTER COLUMN patient_phone TYPE bigint;

INSERT INTO public.amd(
	nro_order, prov_serv_id, date_time, service_type, patient_name, patient_document, patient_phone, patient_address, diagnostic_impression, status)
	VALUES ('MM0000001', 1, '2021-08-09 18:19:59', 'AMD y Ambulancia', 'Pedro Rodriguez', 'V-00000001', 4240000000, 'La California', 'El paciente tiene tos', 'Recibido');
INSERT INTO public.amd(
	nro_order, prov_serv_id, date_time, service_type, patient_name, patient_document, patient_phone, patient_address, diagnostic_impression, status)
	VALUES ('MM0000002', 2, '2021-08-09 19:12:23', 'AMD', 'Alicia Rodriguez', 'V-00000002', 4140000000, 'La California', 'El paciente tiene tos', 'En proceso');
INSERT INTO public.amd(
	nro_order, prov_serv_id, date_time, service_type, patient_name, patient_document, patient_phone, patient_address, diagnostic_impression, status)
	VALUES ('MM0000003', 3, '2021-08-10 09:00:00', 'Ambulancia', 'Jose Rodriguez', 'V-00000003', 4120000000, 'La California', 'El paciente tiene tos', 'Finalizado');

ALTER TABLE public.coordinates
    ALTER COLUMN trace_id ADD GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 );

INSERT INTO public.coordinates(
	nro_order, latitude, longitude, date_time, length, duration)
	VALUES ('MM0000002', 10.47, -66.82, '2021-08-09 19:12:23', 1, 5);
INSERT INTO public.coordinates(
	nro_order, latitude, longitude, date_time, length, duration)
	VALUES ('MM0000002', 10.48, -66.81, '2021-08-09 19:12:28', 0, 0);
INSERT INTO public.coordinates(
	nro_order, latitude, longitude, date_time, length, duration)
	VALUES ('MM0000003', 10.47, -66.82, '2021-08-10 09:00:00', 2, 10);
INSERT INTO public.coordinates(
	nro_order, latitude, longitude, date_time, length, duration)
	VALUES ('MM0000003', 10.48, -66.81, '2021-08-10 09:00:05', 1, 5);
INSERT INTO public.coordinates(
	nro_order, latitude, longitude, date_time, length, duration)
	VALUES ('MM0000003', 10.47, -66.80, '2021-08-10 09:00:05', 0, 0);