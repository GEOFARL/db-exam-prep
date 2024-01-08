INSERT INTO address (country, city, postal_code, street, house_number)
VALUES
('Ukraine', 'Kyiv', 12345, 'Khreshchatyk Street', 21),
('Ukraine', 'Kyiv', 35432, 'Volodymyrska Street', 18),
('Ukraine', 'Kyiv', 32452, 'Bessarabska Square', 14),
('Ukraine', 'Lviv', 79000, 'Rynok Square', 22),
('Ukraine', 'Lviv', 78238, 'Prospekt Svobody', 15);

INSERT INTO workplace(name) VALUES
('TechCorp'),
('AdAgency'),
('FinanceCo');

INSERT INTO person (last_name, first_name, middle_name, work_phone, home_phone, email, position, workplace_id, address_id)
VALUES
('Smith', 'John', 'A.', '555-1234', '555-5678', 'john.smith@email.com', 'Software Engineer', 1, 1),
('Johnson', 'Alice', 'M.', '555-4321', '555-8765', 'alice.johnson@email.com', 'Marketing Manager', 2, 2),
('Miller', 'Robert', 'C.', '555-5678', '555-1234', 'robert.miller@email.com', 'Financial Analyst', 3, 3),
('Brown', 'Emily', 'J.', '555-8765', '555-4321', 'emily.brown@email.com', 'HR Specialist', 1, 4),
('Jones', 'Michael', 'D.', '555-2345', '555-6789', 'michael.jones@email.com', 'Project Manager', 2, 5),
('Davis', 'Jessica', 'L.', '555-6789', '555-2345', 'jessica.davis@email.com', 'Sales Representative', 3, 1),
('Wilson', 'David', 'K.', '555-3456', '555-7890', 'david.wilson@email.com', 'Operations Manager', 1, 2),
('Moore', 'Sophia', 'E.', '555-7890', '555-3456', 'sophia.moore@email.com', 'Research Scientist', 2, 5);


INSERT INTO participant (arrival_date, departure_date, needs_hotel, person_id)
VALUES
('2023-12-15', '2023-12-19', TRUE, 1),
('2023-12-15', '2023-12-18', TRUE, 2),
('2023-12-16', '2023-12-20', FALSE, 4),
('2023-12-16', '2023-12-20', TRUE, 6),
('2024-12-17', '2024-12-21', FALSE, 8);

INSERT INTO thesis (name, submission_date)
VALUES
('Exploring Quantum Computing', '2023-12-15 08:30:00'),
('Advancements in Artificial Intelligence', '2023-12-18 11:45:00'),
('Understanding Climate Change Impacts', '2023-12-21 14:20:00'),
('Biomedical Innovations in Cancer Research', '2023-12-24 09:15:00'),
('Analyzing Urban Planning Strategies', '2023-12-27 16:30:00'),
('Developing Sustainable Energy Solutions', '2023-12-30 13:00:00'),
('The Impact of Social Media on Society', '2024-01-02 10:45:00'),
('Innovations in Materials Science', '2024-01-05 12:00:00'),
('Exploring Cultural Heritage Preservation', '2024-01-03 15:20:00');

INSERT INTO participant_thesis (participant_id, thesis_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 4),
(5, 2),
(5, 1);


INSERT INTO scientist (department_name, academic_degree, academic_rank, scientific_field, person_id)
VALUES
('Physics Department', 'Ph.D.', 'Associate Professor', 'Quantum Mechanics', 1),
('Biology Department', 'M.D.', 'Professor', 'Genetics', 4),
('Chemistry Department', 'Ph.D.', 'Assistant Professor', 'Organic Chemistry', 6),
('Computer Science Department', 'Ph.D.', 'Professor', 'Artificial Intelligence', 7),
('Mathematics Department', 'Ph.D.', 'Professor', 'Number Theory', 8);


INSERT INTO invitation (content, order_number, for_person_id)
VALUES
('You are invited to the Science Symposium.', 1, 1),
('Join us for the annual Research Conference.', 2, 2),
('Invitation to the Physics Seminar.', 1, 3),
('Attend the Biology Workshop next week.', 2, 4),
('You are invited to the Chemistry Symposium.', 1, 5),
('Join the Computer Science Hackathon.', 2, 6),
('Invitation to the Mathematics Seminar.', 1, 7),
('Attend the Environmental Science Workshop.', 2, 8),
('Invitation to the Data Science Workshop.', 2, 1),
('Join the Robotics Symposium.', 1, 2);

INSERT INTO contribution (participant_id, created_at, amount)
VALUES
(1, '2023-12-08 10:00:00', 100.00),
(2, '2023-12-16 11:30:00', 75.50),
(3, '2023-12-19 09:45:00', 50.00),
(4, '2023-12-10 14:20:00', 120.75),
(5, '2023-12-14 16:30:00', 90.25),
(1, '2023-12-17 14:40:00', 50.00),
(2, '2023-12-05 16:20:00', 110.25);

INSERT INTO presentation (topic, participant_id, receival_date)
VALUES
('Advancements in Quantum Computing', 1, '2023-12-29'),
('Genome Editing Techniques', 2, '2024-01-04'),
('Innovations in Organic Chemistry', 3, '2024-01-05'),
('Artificial Intelligence in Healthcare', 4, '2023-12-12'),
('Exploring Number Theory', 5, '2023-10-15'),
('Impact of Climate Change on Ecosystems', 2, '2023-11-19'),
('Quantum Computing Advances', 2, '2023-10-28'),
('AI in Healthcare', 2, '2023-11-29'),
('Cognitive Psychology: Recent Findings', 3, '2024-01-02');

INSERT INTO application (application_id, created_at, content, from_person_id)
VALUES
(1, '2023-05-15 09:30:00', 'Application for Research Grant', 1),
(2, '2023-05-16 10:15:00', 'Request for Conference Attendance Funding', 2),
(3, '2023-05-17 11:00:00', 'Application for Workshop Participation', 3),
(4, '2023-05-18 13:45:00', 'Request for Travel Grant', 4),
(5, '2023-05-19 14:30:00', 'Application for Project Funding', 5),
(6, '2023-05-20 15:15:00', 'Request for Seminar Funding', 6),
(7, '2023-05-21 16:00:00', 'Application for Scholarship', 7),
(8, '2024-05-22 17:45:00', 'Request for Equipment Funding', 8),
(9, '2024-05-23 18:30:00', 'Application for Training Program', 4),
(10, '2024-05-24 19:15:00', 'Request for Research Collaboration Funding', 5),
(11, '2024-05-25 20:00:00', 'Application for Educational Grant', 3),
(12, '2024-05-26 21:45:00', 'Request for Publication Funding', 2),
(13, '2024-05-27 22:30:00', 'Application for Internship Support', 3),
(14, '2024-05-28 23:15:00', 'Request for Conference Organization Funding', 1);





