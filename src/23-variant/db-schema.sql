DROP DATABASE IF EXISTS asset_track;

CREATE DATABASE asset_track;

USE asset_track;

CREATE TABLE department(
	department_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE responsible_person (
	person_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL
);

CREATE TABLE fixed_asset (
	asset_id INT PRIMARY KEY AUTO_INCREMENT,
	inventory_number VARCHAR(15) NOT NULL UNIQUE,
	original_cost DECIMAL(8,2) NOT NULL,
	department_id INT NOT NULL,
	person_id INT NOT NULL,
	CONSTRAINT CHECK (original_cost > 0),
	CONSTRAINT FOREIGN KEY (department_id) REFERENCES department(department_id),
	CONSTRAINT FOREIGN KEY (person_id) REFERENCES responsible_person(person_id)
);

CREATE TABLE document_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE document (
	document_id INT PRIMARY KEY AUTO_INCREMENT,
	created_at DATE NOT NULL,
	asset_id INT NOT NULL,
	type_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (asset_id) REFERENCES fixed_asset (asset_id),
	CONSTRAINT FOREIGN KEY (type_id) REFERENCES document_type (type_id)
);