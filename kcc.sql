-- Insert Regular Package
use swim;
INSERT INTO kcc_packages (package_name, price, description, sessions_per_month, is_trial)
VALUES ('Reguler', 450000, '3x per minggu (Senin, Rabu, Jumat)', 12, FALSE);

-- Insert Trial Package
INSERT INTO kcc_packages (package_name, price, description, sessions_per_month, is_trial)
VALUES ('Trial', 90000, '1x Trial Session', 1, TRUE);

-- Assuming AUTO_INCREMENT IDs, get the inserted IDs
SET @regular_package_id = LAST_INSERT_ID();

-- Insert Trial Package and get its ID
INSERT INTO KCCPool (package_name, price, description, sessions_per_month, is_trial)
VALUES ('Trial', 90000, '1x Trial Session', 1, TRUE);
SET @trial_package_id = LAST_INSERT_ID();

-- Insert Schedules for both packages
INSERT INTO kcc_schedules (package_id, day_name, start_time, end_time)
VALUES 
(1, 'SENIN', '15:30:00', '17:00:00'),
(1,'RABU', '16:00:00', '17:30:00'),
(1, 'JUMAT', '16:00:00', '17:30:00'),
(2, 'SENIN', '15:30:00', '17:00:00'),
(2,'RABU', '16:00:00', '17:30:00'),
(2, 'JUMAT', '16:00:00', '17:30:00')
