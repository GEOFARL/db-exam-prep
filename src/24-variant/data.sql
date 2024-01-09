INSERT INTO school (school_number, school_name, school_address, principal_full_name) 
VALUES (12345, 'Example School', '123 Main Street, Cityville', 'John Doe');

INSERT INTO subject (subject_name) VALUES
('Mathematics'),
('Physics'),
('Chemistry'),
('History'),
('Literature'),
('Biology'),
('польська мова');

INSERT INTO class (class_name, school_id) VALUES
('4-А', 1),
('5-А', 1),
('6-А', 1),
('7-А', 1),
('8-Б', 1),
('4-Б', 1),
('4-В', 1),
('4-Г', 1);

INSERT INTO study_room (room_number, room_name, school_id) VALUES
(101, 'Study Room A', 1),
(102, 'Study Room B', 1),
(103, 'Study Room C', 1),
(104, 'Study Room D', 1);

INSERT INTO teacher (first_name, last_name, school_id) VALUES
('John', 'Doe', 1),
('Jane', 'Smith', 1),
('Robert', 'Johnson', 1),
('Emily', 'Jones', 1),
('Michael', 'Brown', 1);

INSERT INTO schedule_item (number_of_hours, teacher_id, class_id, room_id, subject_id) VALUES
(3, 1, 3, 1, 1),
(2, 2, 4, 2, 2),
(4, 3, 2, 3, 3),
(18, 4, 4, 4, 3),
(2, 5, 5, 1, 5),
(3, 1, 1, 2, 6),
(4, 2, 2, 3, 7),
(3, 3, 3, 4, 1),
(2, 4, 4, 1, 2),
(3, 5, 5, 2, 3),
(4, 1, 1, 3, 4),
(3, 2, 2, 4, 5),
(2, 3, 4, 1, 6),
(3, 4, 4, 2, 7),
(4, 5, 5, 3, 1),
(3, 1, 1, 1, 2),
(2, 2, 2, 2, 3),
(4, 3, 3, 3, 4),
(3, 4, 4, 4, 5),
(2, 5, 4, 1, 6);