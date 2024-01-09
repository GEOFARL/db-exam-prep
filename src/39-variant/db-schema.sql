DROP DATABASE IF EXISTS technical_archive;

CREATE DATABASE technical_archive;

USE technical_archive;

CREATE TABLE document_theme(
	document_theme_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE document(
	document_id INT PRIMARY KEY AUTO_INCREMENT,
	document_name VARCHAR(50) NOT NULL,
	cell_number INT NOT NULL,
	shelf_number INT NOT NULL,
	quantity INT NOT NULL,
	arrival_date DATE NOT NULL,
	document_theme_id INT NOT NULL,
	CONSTRAINT CHECK (cell_number > 0),
	CONSTRAINT CHECK (shelf_number > 0),
	CONSTRAINT CHECK (quantity > 0),
	CONSTRAINT FOREIGN KEY (document_theme_id) REFERENCES document_theme(document_theme_id)
);

CREATE TABLE document_change(
	change_id INT PRIMARY KEY AUTO_INCREMENT,
	change_date DATE NOT NULL,
	change_type ENUM('Місце зберігання', 'Інвентарний номер') NOT NULL,
	new_value VARCHAR(50) NOT NULL,
	document_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (document_id) REFERENCES document(document_id)
);

CREATE TABLE department(
	department_id INT PRIMARY KEY AUTO_INCREMENT,
	department_name VARCHAR(50) NOT NULL
);

CREATE TABLE rack(
	rack_id INT PRIMARY KEY AUTO_INCREMENT,
	serial_number VARCHAR(30) NOT NULL,
	department_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE rack_document(
	rack_id INT NOT NULL,
	document_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY (rack_id, document_id),
	CONSTRAINT FOREIGN KEY (rack_id) REFERENCES rack(rack_id),
	CONSTRAINT FOREIGN KEY (document_id) REFERENCES document(document_id)
);

CREATE TABLE subscriber(
	subscriber_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	middle_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone VARCHAR(20) NOT NULL UNIQUE,
	department_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE records(
	record_id INT PRIMARY KEY AUTO_INCREMENT,
	issue_date DATE NOT NULL,
	document_id INT NOT NULL,
	subscriber_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (document_id) REFERENCES document(document_id),
	CONSTRAINT FOREIGN KEY (subscriber_id) REFERENCES subscriber(subscriber_id)
)