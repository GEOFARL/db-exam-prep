INSERT INTO document_type (name) VALUES
('Прибуткова накладна'),
('Акт введення у експлуатацію'),
('Внутрішнє переміщення між підрозділами'),
('Cписання');

INSERT INTO department (name) VALUES
('Finance'),
('Human Resources'),
('IT'),
('Marketing'),
('Operations');

INSERT INTO responsible_person (first_name, last_name) VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('David', 'Johnson'),
('Emily', 'Williams'),
('Michael', 'Brown'),
('Sarah', 'Jones'),
('Christopher', 'Davis'),
('Jessica', 'Miller'),
('Ryan', 'Taylor'),
('Amanda', 'Anderson');

INSERT INTO fixed_asset (inventory_number, original_cost, department_id, person_id) VALUES
('INV001', 1500.00, 1, 1),
('INV002', 2500.00, 2, 2),
('INV003', 1800.00, 3, 3),
('INV004', 2000.00, 4, 4),
('INV005', 3000.00, 5, 5),
('INV006', 1200.00, 1, 6),
('INV007', 3500.00, 2, 7),
('INV008', 2800.00, 3, 8),
('INV009', 2200.00, 4, 9),
('INV010', 4000.00, 5, 10),
('INV011', 1900.00, 1, 1),
('INV012', 2700.00, 2, 2),
('INV013', 1600.00, 3, 3),
('INV014', 2300.00, 4, 4),
('INV015', 3200.00, 5, 5),
('INV016', 2200.00, 1, 3),
('INV017', 1800.00, 2, 3),
('INV018', 2600.00, 3, 4),
('INV019', 1900.00, 4, 4),
('INV020', 3200.00, 5, 4);


INSERT INTO document (created_at, asset_id, type_id) VALUES
('2024-01-01', 1, 1),
('2024-01-02', 2, 2),
('2024-01-03', 3, 3),
('2024-01-04', 4, 4),
('2024-01-05', 5, 1),
('2024-01-06', 6, 2),
('2024-01-07', 7, 3),
('2024-01-08', 8, 4),
('2024-01-09', 9, 1),
('2024-01-10', 10, 2),
('2024-01-11', 11, 3),
('2024-01-12', 12, 4),
('2024-01-13', 13, 1),
('2024-01-14', 14, 2),
('2024-01-15', 15, 3),
('2024-01-16', 16, 4),
('2024-01-17', 17, 1),
('2024-01-18', 18, 2),
('2024-01-19', 19, 3),
('2024-01-20', 20, 4),
('2024-01-21', 1, 1),
('2024-01-22', 2, 2),
('2024-01-23', 3, 3),
('2024-01-24', 4, 4),
('2024-01-25', 5, 1),
('2024-01-26', 6, 2),
('2024-01-27', 7, 3),
('2024-01-28', 8, 4),
('2024-01-29', 9, 1),
('2024-01-30', 10, 2),
('2024-02-01', 11, 3),
('2024-02-02', 12, 4),
('2024-02-03', 13, 1),
('2024-02-04', 14, 2),
('2024-02-05', 15, 3),
('2024-02-06', 16, 4),
('2024-02-07', 17, 1),
('2024-02-08', 18, 2),
('2024-02-09', 19, 3),
('2024-02-10', 20, 4),
('2024-02-11', 11, 1),
('2024-02-12', 12, 2),
('2024-02-13', 13, 3),
('2024-02-14', 14, 4),
('2024-02-15', 15, 1);