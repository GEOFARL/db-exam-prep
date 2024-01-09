DROP DATABASE IF EXISTS school;

CREATE DATABASE school;

USE school;

CREATE TABLE school(
	school_id INT PRIMARY KEY AUTO_INCREMENT,
	school_number INT NOT NULL,
	school_name VARCHAR(75) NOT NULL,
	school_address VARCHAR(150) NOT NULL,
	principal_full_name VARCHAR(100) NOT NULL
);

CREATE TABLE teacher(
	teacher_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	school_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (school_id) REFERENCES school (school_id)
);

CREATE TABLE class(
	class_id INT PRIMARY KEY AUTO_INCREMENT,
	class_name VARCHAR(50) NOT NULL,
	school_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (school_id) REFERENCES school (school_id)
);

CREATE TABLE study_room(
	room_id INT PRIMARY KEY AUTO_INCREMENT,
	room_number INT NOT NULL,
	room_name VARCHAR(50) NOT NULL,
	school_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (school_id) REFERENCES school (school_id)
);

CREATE TABLE equipment(
	equipment_id INT PRIMARY KEY AUTO_INCREMENT,
	equipment_name VARCHAR(50) NOT NULL
);

CREATE TABLE room_equipment(
	room_id INT NOT NULL,
	equipment_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY (room_id, equipment_id),
	CONSTRAINT FOREIGN KEY (room_id) REFERENCES study_room (room_id),
	CONSTRAINT FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id)
);

CREATE TABLE subject(
	subject_id INT PRIMARY KEY AUTO_INCREMENT,
	subject_name VARCHAR(50) NOT NULL
);

CREATE TABLE schedule_item(
	schedule_item_id INT PRIMARY KEY AUTO_INCREMENT,
	number_of_hours INT NOT NULL,
	teacher_id INT NOT NULL,
	class_id INT NOT NULL,
	room_id INT NOT NULL,
	subject_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (room_id) REFERENCES study_room (room_id),
	CONSTRAINT FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id),
	CONSTRAINT FOREIGN KEY (class_id) REFERENCES class (class_id),
	CONSTRAINT FOREIGN KEY (subject_id) REFERENCES subject (subject_id),
	CONSTRAINT CHECK (number_of_hours > 0)
);

CREATE TABLE textbook(
	textbook_id INT PRIMARY KEY AUTO_INCREMENT,
	textbook_name VARCHAR(50) NOT NULL,
	textbook_author VARCHAR(50) NOT NULL
);

CREATE TABLE subject_textbook(
	subject_id INT NOT NULL,
	textbook_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY (subject_id, textbook_id),
	CONSTRAINT FOREIGN KEY (subject_id) REFERENCES subject (subject_id),
	CONSTRAINT FOREIGN KEY (textbook_id) REFERENCES textbook(textbook_id)
);