CREATE DATABASE FMS1;
USE FMS1;

CREATE TABLE Passenger2 (
	passenger_id	VARCHAR(15)	 NOT NULL UNIQUE,
	passenger_name	VARCHAR(15)	 NOT NULL,
	passenger_email	VARCHAR(35)	 NOT NULL,
	Passenger_dob	DATE	 NOT NULL
);

INSERT INTO Passenger2( passenger_id, passenger_name, passenger_email, Passenger_dob)
VALUES
('P0001',	'Ram', 'Ram@gmail.com',	'1980-12-01'),
('P0002',	'Rajan',	'Rajan@gmail.com',	'1939-11-11'),
('P0003',	'Smita',	'Smita@gmail.com',	'1988-02-06'),
('P0004',	'Bhavan',	'Bhavan@gmail.com',	'1973-09-18'),
('P0005',	'Sheela',	'Sheela@gmail.com',	'1976-05-09'),
('P0006',	'Nethra',	'Nethra@gmail.com',	'1955-10-08');

CREATE TABLE Flight2(
	flightid	VARCHAR(25)	 unique  not null,
	flightsource	VARCHAR(25)	 not null,
	flightdest	VARCHAR(25)	 not null,
	flightdate	VARCHAR(25)	 not null,
	flightseat	VARCHAR(25)	 not null,
	ticketcost	VARCHAR(15)	 not null
);

INSERT INTO Flight2 ( flightid, flightsource, flightdest,flightdate,flightseat, ticketcost)
VALUES 
('F0001',	'Kolkatta',	'Hyderabad',	'01-dec-12',	100,	2000),
('F0002',	'Chennai',	'Hyderabad',	'02-dec-12',	100,	3000),
('F0003',	'Pune',	'Kolkatta',	'02-dec-12',	100,	2500),
('F0004',	'Bangalore',	'Pune',	'18-nov-12',	100,	2300),
('F0005',	'Hyderabad',	'Bangalore',	'09-apr-12',	100,	2600),
('F0006',	'Pune',	'Hyderabad',	'08-aug-12',	100,	3500),
('F0007',	'Pune',	'Kolkatta',	'04-dec-12',	100,	2900),
('F0008',	'Kolkatta',	'Hyderabad',	'06-dec-12',	100,	3500);

CREATE TABLE Booking2 (
	booking_id	Varchar(15)	 unique  not null,
	flight_id	Varchar(15)	,
	bookdate	DATE	 not null

);
ALTER TABLE Booking2
ADD FOREIGN KEY (flight_id) REFERENCES Flight2(flightid);

INSERT INTO Booking2(booking_id, flight_id, bookdate)
VALUES
('B0001',	'F0001',	'2012-12-01'),
('B0002',	'F0004',	'2012-12-02'),
('B0003',	'F0005',	'2012-12-03'),
('B0004',	'F0003',    '2012-12-04'),
('B0005',	'F0001',	'2012-12-02'),
('B0006',	'F0004',	'2012-12-02'),
('B0007',	'F0003',	'2016-12-02');

CREATE TABLE booking_details2(
	booking_id	Varchar(15)	,
    passenger_id	Varchar(15)	

);

ALTER TABLE booking_details2
ADD FOREIGN KEY (booking_id) REFERENCES Booking2(booking_id);

ALTER TABLE booking_details2
ADD FOREIGN KEY (passenger_id) REFERENCES Passenger2(passenger_id);

INSERT INTO booking_details2(booking_id, passenger_id)
VALUES
('B0001',	'P0001'),
('B0001',	'P0002'),
('B0001',	'P0003'),
('B0002',	'P0004'),
('B0002',	'P0005'),
('B0003',	'P0006'),
('B0003',	'P0001'),
('B0004',	'P0002'),
('B0005',	'P0003');

-- 1

SELECT passenger_name 
FROM Passenger2
WHERE passenger_name LIKE '_e%';

-- 2

SELECT passenger_name 
FROM Passenger2
WHERE Passenger_dob = 
(SELECT MAX(Passenger_dob)
FROM Passenger2);

-- 3

SELECT COUNT(*) flightid
FROM Flight2
WHERE
flightsource ='Kolkatta';

-- 4

SELECT passenger_name 
FROM Passenger2 
WHERE passenger_id =(
SELECT passenger_id
FROM booking_details2
GROUP BY passenger_id
HAVING count(*) > 1
);
