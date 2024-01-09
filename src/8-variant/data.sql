INSERT INTO stop (location) VALUES
('Central Station'),
('City Park'),
('Market Square'),
('University Campus'),
('Tech Park'),
('Downtown Mall'),
('Riverfront Plaza'),
('Hilltop Gardens'),
('Sports Arena'),
('Business District'),
('Cultural Center'),
('Lakeview Park'),
('Shopping Complex'),
('Suburban Station'),
('Harborfront Square'),
('Botanical Gardens'),
('Financial District'),
('Greenwood Park'),
('Skyline View'),
('Entertainment Zone'),
('Medical Center'),
('Industrial Area'),
('Tech Hub'),
('Mountain View'),
('Seaside Promenade');

INSERT INTO route (route_number, start_time, end_time) VALUES
('R101', '08:30:00', '17:00:00'),
('R202', '09:00:00', '18:00:00'),
('R303', '09:30:00', '17:30:00'),
('R404', '10:00:00', '18:30:00'),
('R505', '10:30:00', '19:00:00'),
('R606', '11:00:00', '19:30:00');

-- Route 1 Stops
-- Start Stop
INSERT INTO route_stop (route_id, stop_id, is_start_stop) VALUES
(1, 1, TRUE);

-- Intermediate Stops
INSERT INTO route_stop (route_id, stop_id) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15);

-- End Stop
INSERT INTO route_stop (route_id, stop_id, is_end_stop) VALUES
(1, 16, TRUE);

INSERT INTO route_stop (route_id, stop_id, is_start_stop) VALUES
(2, 17, TRUE);

-- Intermediate Stops (Picked randomly from available stops)
INSERT INTO route_stop (route_id, stop_id) VALUES
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23);

-- End Stop
INSERT INTO route_stop (route_id, stop_id, is_end_stop) VALUES
(2, 24, TRUE);


-- Route 3 Stops
-- Start Stop
INSERT INTO route_stop (route_id, stop_id, is_start_stop) VALUES
(3, 25, TRUE);

-- Intermediate Stops (Picked randomly from available stops)
INSERT INTO route_stop (route_id, stop_id) VALUES
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8);

-- End Stop
INSERT INTO route_stop (route_id, stop_id, is_end_stop) VALUES
(3, 9, TRUE);

INSERT INTO route_stop (route_id, stop_id, is_start_stop) VALUES
(4, 10, TRUE);

-- Intermediate Stops (Picked randomly from available stops)
INSERT INTO route_stop (route_id, stop_id) VALUES
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(4, 21),
(4, 22),
(4, 23),
(4, 24);

-- End Stop
INSERT INTO route_stop (route_id, stop_id, is_end_stop) VALUES
(4, 25, TRUE);


-- Route 5 Stops
-- Start Stop
INSERT INTO route_stop (route_id, stop_id, is_start_stop) VALUES
(5, 1, TRUE);

-- Intermediate Stops (Picked randomly from available stops)
INSERT INTO route_stop (route_id, stop_id) VALUES
(5, 2),
(5, 3),
(5, 4),
(5, 5);

-- End Stop
INSERT INTO route_stop (route_id, stop_id, is_end_stop) VALUES
(5, 6, TRUE);


-- Route 6 Stops
-- Start Stop
INSERT INTO route_stop (route_id, stop_id, is_start_stop) VALUES
(6, 7, TRUE);

-- Intermediate Stops (Picked randomly from available stops)
INSERT INTO route_stop (route_id, stop_id) VALUES
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17);

-- End Stop
INSERT INTO route_stop (route_id, stop_id, is_end_stop) VALUES
(6, 18, TRUE);

-- Drivers
INSERT INTO driver (first_name, last_name, middle_name, service_number, route_id) VALUES
('John', 'Smith', 'A', 'D123', 1),
('Alice', 'Johnson', 'B', 'D456', 2),
('Robert', 'Davis', 'C', 'D789', 3),
('Emily', 'Miller', 'D', 'D101', 4),
('Michael', 'Wilson', 'E', 'D202', 5),
('Sophia', 'Taylor', 'F', 'D303', 6),
('David', 'Anderson', 'G', 'D404', 1),
('Emma', 'Brown', 'H', 'D505', 2),
('William', 'White', 'I', 'D606', 3),
('Olivia', 'Thomas', 'J', 'D707', 4),
('Аким', 'Ivanov', 'K', 'D808', 5),
('Аксен', 'Akimov', 'L', 'D909', 6),
('Акіла', 'Aksenov', 'M', 'D1010', 1);

INSERT INTO vehicle (vehicle_number, brand, passenger_seats, date_of_last_inspection) VALUES
('AA123', 'Toyota', 5, '2023-11-20 08:00:00'),
('BB456', 'Ford', 8, '2023-12-15 10:30:00'),
('CC789', 'Honda', 7, '2023-10-25 12:45:00'),
('DD012', 'Chevrolet', 6, '2024-01-05 14:15:00'),
('EE345', 'Volkswagen', 4, '2023-09-12 16:30:00'),
('FF678', 'Mercedes', 9, '2024-02-08 18:00:00'),
('GG901', 'Nissan', 5, '2023-11-02 09:45:00'),
('HH234', 'BMW', 8, '2024-01-20 11:20:00'),
('II567', 'Hyundai', 7, '2023-12-10 13:30:00'),
('JJ890', 'Audi', 6, '2023-10-15 15:45:00');

INSERT INTO schedule (time_start_work, time_end_work, driver_id, vehicle_id) VALUES
('2024-01-01 08:00:00', '2024-01-01 16:00:00', 3, 3),
('2024-01-02 09:30:00', '2024-01-02 17:30:00', 6, 6),
('2024-01-03 12:45:00', '2024-01-03 20:45:00', 9, 9),
('2024-01-04 14:15:00', '2024-01-04 22:15:00', 1, 1),
('2024-01-05 16:30:00', '2024-01-05 19:30:00', 4, 4),
('2024-01-06 18:00:00', '2024-01-06 20:00:00', 7, 7),
('2024-01-07 09:45:00', '2024-01-07 17:45:00', 10, 10),
('2024-01-09 13:30:00', '2024-01-09 21:30:00', 2, 2),
('2024-01-10 15:45:00', '2024-01-10 23:45:00', 5, 5),
('2024-01-11 08:45:00', '2024-01-11 16:45:00', 8, 8),
('2024-01-12 10:30:00', '2024-01-12 18:30:00', 11, 8),
('2023-10-02 11:24:37', '2023-10-02 18:24:37', 1, 4),
('2023-09-03 09:00:00', '2023-09-03 17:00:00', 12, 5),
('2023-09-04 13:30:00', '2023-09-04 20:30:00', 12, 6),
('2023-09-12 08:00:00', '2023-09-12 16:00:00', 12, 7);



