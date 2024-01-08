DROP DATABASE IF EXISTS conference_db;

CREATE DATABASE conference_db;

USE conference_db;

CREATE TABLE address (
	address_id INT PRIMARY KEY AUTO_INCREMENT,
	country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	postal_code INT NOT NULL,
	street VARCHAR(75) NOT NULL,
	house_number INT NOT NULL,
	CONSTRAINT UNIQUE(street, house_number)
);

CREATE TABLE workplace (
	workplace_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE person (
    person_id INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    work_phone VARCHAR(15) NOT NULL,
    home_phone VARCHAR(15),
    email VARCHAR(255) NOT NULL UNIQUE,
    position VARCHAR(100),
    address_id INT NOT NULL,
    workplace_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (address_id) REFERENCES address(address_id),
    CONSTRAINT FOREIGN KEY (workplace_id) REFERENCES workplace(workplace_id)
);

CREATE TABLE participant (
    participant_id INT PRIMARY KEY AUTO_INCREMENT,
    arrival_date DATE NOT NULL,
    departure_date DATE NOT NULL,
    needs_hotel BOOLEAN DEFAULT FALSE,
    person_id INT NOT NULL UNIQUE,
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE scientist (
    scientist_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    academic_degree VARCHAR(50) NOT NULL,
    academic_rank VARCHAR(50) NOT NULL,
    scientific_field VARCHAR(255) NOT NULL,
    person_id INT NOT NULL UNIQUE,
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE invitation (
    invitation_id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    order_number INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    CHECK (order_number BETWEEN 1 AND 2),
    for_person_id INT NOT NULL,
    FOREIGN KEY (for_person_id) REFERENCES person(person_id)
);

CREATE TABLE contribution (
    contribution_id INT PRIMARY KEY AUTO_INCREMENT,
    participant_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
    amount DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (participant_id) REFERENCES participant(participant_id),
    CHECK (amount >= 0)
);

CREATE TABLE presentation (
    presentation_id INT PRIMARY KEY AUTO_INCREMENT,
    topic VARCHAR(255) NOT NULL UNIQUE,
    participant_id INT NOT NULL,
    receival_date DATE NOT NULL,
    FOREIGN KEY (participant_id) REFERENCES participant(participant_id)
);

CREATE TABLE application (
    application_id INT PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW(),
    content TEXT NOT NULL,
    from_person_id INT NOT NULL,
    FOREIGN KEY (from_person_id) REFERENCES person(person_id)
);

CREATE TABLE thesis(
	thesis_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	submission_date TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE participant_thesis(
	participant_id INT NOT NULL,
	thesis_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (participant_id) REFERENCES participant(participant_id),
	CONSTRAINT FOREIGN KEY (thesis_id) REFERENCES thesis(thesis_id),
	CONSTRAINT PRIMARY KEY (participant_id, thesis_id)
);
