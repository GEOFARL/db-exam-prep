INSERT INTO document_theme (name) VALUES
('Financial Reports'),
('Employee Records'),
('Inventory Management'),
('Marketing Campaigns'),
('Operational Procedures'),
('Theme1ав'),
('Theme2ав');

INSERT INTO document (document_name, cell_number, shelf_number, quantity, arrival_date, document_theme_id) VALUES
('Doc1', 10, 2, 100, '2024-01-01', 7),
('Doc2', 5, 3, 50, '2024-01-02', 2),
('Doc3', 8, 1, 80, '2024-01-03', 3),
('Doc4', 15, 4, 120, '2024-01-04', 6),
('Doc5', 12, 2, 90, '2024-01-05', 5),
('Doc6', 7, 1, 70, '2024-01-06', 1),
('Doc7', 9, 3, 110, '2024-01-07', 2),
('Doc8', 6, 4, 60, '2024-01-08', 3),
('Doc9', 11, 2, 130, '2024-01-09', 4),
('Doc10', 14, 1, 80, '2024-01-10', 7),
('Doc11', 13, 3, 95, '2024-01-11', 1),
('Doc12', 7, 4, 45, '2024-01-12', 2),
('Doc13', 10, 1, 75, '2024-01-13', 3),
('Doc14', 8, 2, 110, '2024-01-14', 7),
('Doc15', 15, 3, 85, '2024-01-15', 5),
('Doc16', 6, 1, 120, '2024-01-16', 6),
('Doc17', 9, 4, 60, '2024-01-17', 2),
('Doc18', 11, 2, 100, '2024-01-18', 3),
('Doc19', 14, 1, 130, '2024-01-19', 6),
('Doc20', 12, 3, 75, '2024-01-20', 5);

INSERT INTO department (department_name) VALUES
('Finance'),
('Human Resources'),
('Information Technology'),
('Marketing'),
('Operations');

INSERT INTO subscriber (first_name, middle_name, last_name, phone, department_id) VALUES
('John', 'A.', 'Doe', '+1234567890', 1),
('Jane', 'B.', 'Smith', '+1987654321', 2),
('David', 'C.', 'Johnson', '+1122334455', 3),
('Emily', 'D.', 'Williams', '+1567890123', 4),
('Michael', 'E.', 'Brown', '+1456789012', 5),
('Sarah', 'F.', 'Jones', '+1678901234', 1),
('Christopher', 'G.', 'Davis', '+1345678901', 2),
('Jessica', 'H.', 'Miller', '+1890123456', 3),
('Ryan', 'I.', 'Taylor', '+1789012345', 4),
('Amanda', 'J.', 'Anderson', '+1234908765', 5);

INSERT INTO records (issue_date, document_id, subscriber_id) VALUES
('2018-01-05', 1, 1),
('2018-02-10', 2, 2),
('2018-03-15', 3, 3),
('2018-04-20', 4, 4),
('2018-05-25', 5, 5),
('2019-06-30', 6, 6),
('2019-08-10', 8, 8),
('2019-09-15', 9, 9),
('2019-10-20', 10, 10),
('2020-11-25', 11, 1),
('2021-01-05', 13, 3),
('2021-02-10', 14, 4),
('2021-03-15', 15, 5),
('2022-01-05', 16, 6),
('2022-02-10', 17, 7),
('2022-03-15', 18, 8),
('2022-04-20', 19, 9),
('2022-05-25', 20, 10),
('2019-09-15', 9, 9),
('2019-10-20', 10, 10),
('2020-11-25', 11, 1),
('2021-01-05', 13, 3),
('2021-02-10', 14, 4),
('2021-03-15', 15, 5),
('2022-01-20', 16, 6),
('2022-02-25', 17, 7);


INSERT INTO document_change (change_date, change_type, new_value, document_id) VALUES
('2021-01-05', 'Місце зберігання', 'Storage_A', 1),
('2021-02-10', 'Інвентарний номер', 'INV_1001', 2),
('2021-03-15', 'Місце зберігання', 'Storage_B', 3),
('2021-04-20', 'Інвентарний номер', 'INV_1002', 4),
('2021-05-25', 'Місце зберігання', 'Storage_C', 5),
('2021-06-30', 'Інвентарний номер', 'INV_1003', 6),
('2021-07-05', 'Місце зберігання', 'Storage_A', 7),
('2021-08-10', 'Інвентарний номер', 'INV_1004', 8),
('2021-09-15', 'Місце зберігання', 'Storage_B', 9),
('2021-10-20', 'Інвентарний номер', 'INV_1005', 10),
('2021-06-30', 'Інвентарний номер', 'INV_1003', 6),
('2021-07-05', 'Місце зберігання', 'Storage_A', 7),
('2021-08-10', 'Інвентарний номер', 'INV_1004', 8),
('2021-09-15', 'Місце зберігання', 'Storage_B', 9),
('2021-10-20', 'Інвентарний номер', 'INV_1005', 10),
('2021-11-25', 'Місце зберігання', 'Storage_C', 11),
('2021-10-20', 'Інвентарний номер', 'INV_1005', 10),
('2021-06-30', 'Інвентарний номер', 'INV_1003', 6),
('2021-07-05', 'Місце зберігання', 'Storage_A', 7),
('2021-08-10', 'Інвентарний номер', 'INV_1004', 8),
('2021-09-15', 'Місце зберігання', 'Storage_B', 9),
('2021-10-20', 'Інвентарний номер', 'INV_1005', 10),
('2021-11-25', 'Місце зберігання', 'Storage_C', 11),
('2022-03-15', 'Місце зберігання', 'Storage_B', 15),
('2022-04-20', 'Інвентарний номер', 'INV_1008', 16),
('2022-05-25', 'Місце зберігання', 'Storage_C', 17),
('2022-06-30', 'Інвентарний номер', 'INV_1009', 18),
('2022-07-05', 'Місце зберігання', 'Storage_A', 19),
('2022-08-10', 'Інвентарний номер', 'INV_1010', 20);


INSERT INTO rack (serial_number, department_id) VALUES
('Rack001', 1),
('Rack002', 2),
('Rack003', 3),
('Rack004', 4),
('Rack005', 5),
('Rack006', 1);

INSERT INTO rack_document (rack_id, document_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(1, 7),
(2, 8),
(3, 9),
(4, 10),
(5, 11),
(6, 12),
(1, 13),
(2, 14),
(3, 15),
(4, 16),
(5, 17),
(6, 18),
(1, 19),
(2, 20),
(3, 4),
(2, 5),
(1, 6),
(4, 7),
(6, 8),
(5, 9),
(3, 10),
(2, 11),
(1, 12),
(4, 13),
(6, 14),
(5, 15),
(3, 16),
(2, 17),
(1, 18),
(4, 19),
(6, 20),
(5, 1),
(3, 2),
(2, 3);
