DROP DATABASE IF EXISTS transport;

CREATE DATABASE transport;

USE transport;

CREATE TABLE stop(
	stop_id INT PRIMARY KEY AUTO_INCREMENT,
	location VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE route(
	route_id INT PRIMARY KEY AUTO_INCREMENT,
	route_number VARCHAR(20) NOT NULL UNIQUE,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL
);

CREATE TABLE route_stop (
	route_id INT NOT NULL,
	stop_id INT NOT NULL,
	is_start_stop BOOLEAN NOT NULL DEFAULT FALSE,
	is_end_stop BOOLEAN NOT NULL DEFAULT FALSE,
	CONSTRAINT PRIMARY KEY (route_id, stop_id),
	CONSTRAINT CHECK (is_start_stop OR is_end_stop OR (!is_start_stop AND !is_end_stop)),
	CONSTRAINT FOREIGN KEY (route_id) REFERENCES route(route_id),
	CONSTRAINT FOREIGN KEY (stop_id) REFERENCES stop(stop_id)
);

CREATE TABLE driver (
	driver_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
	service_number VARCHAR(20) NOT NULL UNIQUE,
	route_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (route_id) REFERENCES route(route_id)
);

CREATE TABLE vehicle (
	vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
	vehicle_number VARCHAR(20) NOT NULL UNIQUE,
	brand VARCHAR(20) NOT NULL,
	passenger_seats INT NOT NULL,
	date_of_last_inspection TIMESTAMP NOT NULL,
	CONSTRAINT CHECK (passenger_seats > 1)
);

CREATE TABLE schedule (
	schedule_id INT PRIMARY KEY AUTO_INCREMENT,
	time_start_work TIMESTAMP NOT NULL,
	time_end_work TIMESTAMP NOT NULL,
	driver_id INT NOT NULL,
	vehicle_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (driver_id) REFERENCES driver(driver_id),
	CONSTRAINT FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id)
);