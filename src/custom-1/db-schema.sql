DROP DATABASE IF EXISTS online_shop;

CREATE DATABASE online_shop;

USE online_shop;

CREATE TABLE product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	manufacturer VARCHAR(50) NOT NULL,
	cost DECIMAL(7,2) NOT NULL,
	is_in_stock BOOLEAN DEFAULT TRUE,
	CONSTRAINT CHECK (cost > 0)
);

CREATE TABLE client(
	client_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	address VARCHAR(150) NOT NULL,
	phone VARCHAR(20) NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE `order` (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	created_at TIMESTAMP DEFAULT NOW(),
	client_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (client_id) REFERENCES client(client_id)
);

CREATE TABLE order_item (
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	CONSTRAINT PRIMARY KEY (order_id, product_id),
	CONSTRAINT FOREIGN KEY (order_id) REFERENCES `order`(order_id),
	CONSTRAINT FOREIGN KEY (product_id) REFERENCES product (product_id)
);