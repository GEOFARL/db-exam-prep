DROP DATABASE IF EXISTS phone_calls;

CREATE DATABASE phone_calls;

USE phone_calls;

CREATE TABLE city (
	city_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE cost (
	cost_id INT PRIMARY KEY AUTO_INCREMENT,
	duration INT NOT NULL,
	cost DECIMAL(6, 2) NOT NULL
);

CREATE TABLE city_rate (
	origin_city_id INT NOT NULL,
	destination_city_id INT NOT NULL,
	cost_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY (origin_city_id, destination_city_id),
	CONSTRAINT FOREIGN KEY (origin_city_id) REFERENCES city(city_id),
	CONSTRAINT FOREIGN KEY (cost_id) REFERENCES cost(cost_id),
	CONSTRAINT FOREIGN KEY (destination_city_id) REFERENCES city(city_id)
);

CREATE TABLE client (
	client_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone_number VARCHAR(20) NOT NULL UNIQUE,
	city_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE phone_call (
	phone_call_id INT PRIMARY KEY AUTO_INCREMENT,
	start_time TIMESTAMP NOT NULL DEFAULT NOW(),
	end_time TIMESTAMP,
	caller_id INT NOT NULL,
	receiver_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (caller_id) REFERENCES client(client_id),
	CONSTRAINT FOREIGN KEY (receiver_id) REFERENCES client(client_id)
);

CREATE TABLE discount (
	discount_id INT PRIMARY KEY AUTO_INCREMENT,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL,
	percent DECIMAL (2, 2) NOT NULL
);	