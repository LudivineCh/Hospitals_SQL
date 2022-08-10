CREATE DATABASE hospitals;

USE hospitals;

-- Table hospital
CREATE TABLE hospital (
hospital_id INTEGER,
hospital_name VARCHAR(50),
adress VARCHAR(50),
postal_code VARCHAR(50),
city VARCHAR(50),
country VARCHAR(50),
entry_fee DECIMAL(10,2),
phone_number VARCHAR(50),
CONSTRAINT PK_hospital PRIMARY KEY (hospital_id)
);

INSERT INTO
hospital
(hospital_id, hospital_name, adress, postal_code, city, country, entry_fee, phone_number)
VALUES 
(1, 'Darwin Hospital', 'Victoria Square', '6000', 'Perth', 'Australia', 249.99, '+61889228888'),
(2, 'Molchanova Hospital', '4/1 Moo 3 Thepkasatri Road Ratsada', '83000', 'Phuket', 'Thailand', 15, '+6676237220'),
(3, 'Paoli Hospital', ' 604 Chemin de Falconaja', '20600', 'Bastia', 'France', 0,  '+33495591111');


-- Table patient
CREATE TABLE patient (
patient_id INTEGER,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender ENUM('F', 'M'),
patient_age INTEGER,
city VARCHAR(50),
country VARCHAR(50),
entry_date DATE NOT NULL,
exit_date DATE,
pathology_type VARCHAR(50),
pathology_name VARCHAR(50),
hospital_id INTEGER,
CONSTRAINT PK_patient PRIMARY KEY (patient_id),
CONSTRAINT FK_hospital FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);

INSERT INTO
patient
(patient_id, first_name, last_name, gender, patient_age, city, country, entry_date, exit_date, pathology_type, pathology_name, hospital_id)
VALUES 
(1, 'Maria', 'Delanova', 'F', 45, 'Barcelona', 'Spain', '2021-03-05', '2021-03-07', 'injury', 'Wrist sprain', 3),
(2, 'Marc', 'Cassier', 'M', 58, 'Paris', 'France', '2020-10-25', '2021-07-05', 'disease', 'Cerebrovascular accident', 3),
(3, 'John', 'Pottier', 'M', 39, 'Perth', 'Australia', '2021-02-12', '2021-02-16', 'injury', 'Foot extensor tendonitis ', 1),
(4, 'Bella', 'Sawadee', 'F', 22, 'Phuket', 'Thailand', '2021-04-09', '2021-05-07', 'injury', 'Snake bite', 2),
(5, 'Alex', 'Voulti', 'M', 72, 'Bastia', 'France', '2019-12-02', '2021-07-13', 'disease', 'Lung cancer', 3),
(6, 'Piers', 'Solo', 'M', 21, 'Sydney', 'Australia', '2021-06-02', '2021-06-28', 'injury', 'Shoulder dislocation', 1),
(7, 'Juan', 'Philippe', 'M', 31, 'Koh Tao', 'Thailand', '2021-01-19', '2021-04-02', 'disease', 'Prostate cancer', 2),
(8, 'Axelle', 'Portailler', 'F', 35, 'Annecy', 'France', '2021-07-02', '2021-07-15', 'injury', 'Elbow Fracture', 3),
(9, 'Paul', 'Carter', 'M', 42, 'Darwin', 'Australia', '2021-11-07', '2021-11-09', 'injury', 'Ankle sprain', 1),
(10, 'Maellia', 'Flash', 'F', 62, 'Kuala Lumpour', 'Malaisia', '2021-01-02', '2021-06-03', 'disease', 'Chronic Obstructive Pulmonary Disease', 2),
(11, 'Angelina', 'Gabrielli', 'F', 38, 'Bastia', 'France', '2021-04-02', '2021-04-04', 'injury', 'Electrical injury', 3),
(12, 'Camille', 'Martelle', 'F', 56, 'Cairns', 'Australia', '2021-02-02', '2021-02-12', 'injury', 'Third-degree burns', 1),
(13, 'David', 'Thomas', 'M', 38, 'Bangkok', 'Thailand', '2021-01-22', '2021-03-08', 'disease', 'Esophageal varices', 2),
(14, 'Simon', 'Baudet', 'M', 57, 'Bordeaux', 'France', '2021-04-11', '2021-04-17', 'injury', 'Knee strain', 3),
(15, 'Marcel', 'Flauchet', 'M', 33, 'Adelaïde', 'Australia', '2021-05-02', '2021-06-13', 'disease', 'Drug use disorder', 1),
(16, 'Rattana', 'Noy', 'F', 52, 'Vientiane', 'Laos', '2020-12-02', '2021-04-13', 'disease', 'Breast cancer', 2),
(17, 'Valérie', 'Francini', 'F', 42, 'Ajaccio', 'France', '2021-07-02', '2021-07-05', 'injury', 'Knee sprain', 3),
(18, 'Jenny', 'Smith', 'F', 39, 'Freemantle', 'Australia', '2021-06-18', '2021-07-16', 'disease', 'covid-19', 1),
(19, 'Mayliz', 'Sporty', 'F', 54, 'Koh Samui', 'Thailand', '2021-07-02', '2021-07-31', 'disease', 'covid-19', 2),
(20, 'Diego', 'Esposito', 'M', 68, 'Portoferraio', 'Italy', '2021-05-02', '2021-05-03', 'injury', 'Knee dislocation', 3),
(21, 'Frederic', 'Loutchy', 'M', 64, 'Rockingham', 'Australia', '2021-05-17', '2021-07-23', 'disease', 'covid-19', 1),
(22, 'Enzo', 'Mazerti', 'M', 40, 'Rawai', 'Thailand', '2021-04-12', '2021-05-12', 'injury', 'Open Fracture of Leg', 2),
(23, 'Chloe', 'Darton', 'F', 57, 'Marseille', 'France', '2021-06-10', '2021-07-05', 'disease', 'covid-19', 3)
;


-- Table doctor
CREATE TABLE doctor (
doctor_id INTEGER,
first_name VARCHAR(50),
last_name VARCHAR(50),
medical_speciality VARCHAR(50),
hospital_id INTEGER,
CONSTRAINT PK_doctor PRIMARY KEY (doctor_id),
CONSTRAINT FK_hospital_doc FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);

INSERT INTO
doctor
(doctor_id, first_name, last_name, medical_speciality, hospital_id)
VALUES 
(1, 'Phillip', 'Lacey', 'disease', 1),
(2, 'Eira', 'Davie', 'injury', 1),
(3, 'Gracie', 'Nelson', 'disease', 2),
(4, 'Gary', 'Markham', 'injury', 2),
(5, 'Korben', 'Jackson', 'disease', 3),
(6, 'Luci', 'Ahmad', 'injury', 3)
;


-- Table room
CREATE TABLE room (
room_id INTEGER,
room_name VARCHAR(50),
price_per_night DECIMAL(10,2),
patient_id INTEGER,
CONSTRAINT PK_room PRIMARY KEY (room_id),
CONSTRAINT FK_room FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

INSERT INTO
room
(room_id, room_name, price_per_night, patient_id)
VALUES 
(1, 'Room PH-A', 15.50, 1),
(2, 'Room PH-B', 15.50, 2),
(3, 'Room PH-C', 25.50, 5),
(4, 'Room PH-D', 25.50, 8),
(5, 'Room PH-E', 32.50, 11),
(6, 'Room PH-F', 32.50, 14),
(7, 'Room PH-G', 44.50, 17),
(8, 'Room PH-H', 60.50, 20),
(23, 'Room PH-I', 121.50, 23),
(9, 'Room DH-A', 15.50, 3),
(10, 'Room DH-B', 15.50, 6),
(11, 'Room DH-C', 25.50, 9),
(12, 'Room DH-D', 25.50, 12),
(13, 'Room DH-E', 32.50, 15),
(14, 'Room DH-F', 132.50, 18),
(15, 'Room DH-', 99.50, 21),
(16, 'Room MH-A', 15.50, 4),
(17, 'Room MH-B', 15.50, 7),
(18, 'Room MH-C', 25.50, 10),
(19, 'Room MH-D', 25.50, 13),
(20, 'Room MH-E', 32.50, 16),
(21, 'Room MH-F', 112.50, 19),
(22, 'Room MH-G', 39.50, 22)
;


-- Table special_meal
CREATE TABLE special_meal (
special_meal_id INTEGER,
special_meal_name VARCHAR(50),
price DECIMAL(10,2),
CONSTRAINT PK_special_meal PRIMARY KEY (special_meal_id)
);

INSERT INTO
special_meal
(special_meal_id, special_meal_name, price)
VALUES 
(1, 'Imperial Burger', 10.60),
(2, 'Blue Burger', 10.60),
(3, 'Pizza', 9.50),
(4, 'Cranberry Cocktail Meatballs', 22.50),
(5, 'Marsala Stuffed Mushrooms', 17.90),
(6, 'Deep-Fried Camembert With Cranberry Sauce', 15.50),
(7, 'Lasagna', 11.50),
(8, 'Bacon-Wrapped Filets with Cowboy Butter', 10.60),
(9, 'Champagne', 50.50)
;


-- Table special_meal_order
CREATE TABLE special_meal_order (
purchase_id INTEGER,
special_meal_id INTEGER,
purchase_date DATE,
patient_id INTEGER,
CONSTRAINT PK_special_meal PRIMARY KEY (purchase_id),
CONSTRAINT FK_special_meal FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
CONSTRAINT FK_special_meal_info FOREIGN KEY (special_meal_id) REFERENCES special_meal(special_meal_id)
);

INSERT INTO
special_meal_order
(purchase_id, special_meal_id, purchase_date, patient_id)
VALUES 
(1, 1, '2021-03-06', 1),
(2, 1, '2020-10-30', 2),
(3, 2, '2020-11-15', 2),
(4, 3, '2020-11-30', 2),
(5, 7, '2020-12-15', 2),
(6, 5, '2020-12-24', 2),
(7, 9, '2020-12-25', 2),
(8, 5, '2020-12-31', 2),
(9, 1, '2021-01-30', 2),
(10, 8, '2021-02-15', 2),
(11, 2, '2021-02-28', 2),
(12, 7, '2021-03-14', 2),
(13, 1, '2021-03-30', 2),
(14, 4, '2021-04-15', 2),
(15, 5, '2021-04-30', 2),
(16, 1, '2021-05-15', 2),
(17, 6, '2021-05-30', 2),
(18, 2, '2021-06-15', 2),
(19, 3, '2021-06-30', 2),
(20, 3, '2021-02-14', 3),
(21, 2, '2021-04-14', 4),
(22, 7, '2021-04-30', 4),
(23, 6, '2021-05-06', 4),
(24, 2, '2019-12-15', 5),
(25, 4, '2019-12-25', 5),
(26, 5, '2019-12-31', 5),
(27, 1, '2020-01-25', 5),
(28, 2, '2020-02-25', 5),
(29, 3, '2020-03-25', 5),
(30, 2, '2020-04-25', 5),
(31, 3, '2020-05-25', 5),
(32, 2, '2020-06-25', 5),
(33, 3, '2020-07-25', 5),
(34, 2, '2020-08-25', 5),
(35, 3, '2020-09-25', 5),
(36, 2, '2020-10-25', 5),
(37, 3, '2020-11-25', 5),
(38, 4, '2020-12-25', 5),
(39, 5, '2020-12-31', 5),
(40, 2, '2021-01-25', 5),
(41, 1, '2021-02-25', 5),
(42, 3, '2021-03-25', 5),
(43, 2, '2021-04-25', 5),
(44, 7, '2021-05-25', 5),
(45, 8, '2021-06-25', 5),
(46, 2, '2021-06-16', 6),
(47, 4, '2021-04-01', 7),
(48, 1, '2021-07-03', 8),
(49, 8, '2021-07-06', 8),
(50, 3, '2021-07-09', 8),
(51, 1, '2021-07-13', 8),
(52, 8, '2021-11-08', 9),
(53, 1, '2021-02-02', 10),
(54, 2, '2021-03-02', 10),
(55, 4, '2021-05-02', 10),
(56, 7, '2021-04-03', 11),
(57, 5, '2021-02-08', 12),
(58, 6, '2021-02-22', 13),
(59, 1, '2021-04-15', 14),
(60, 4, '2021-05-15', 15),
(61, 5, '2021-12-25', 16),
(62, 7, '2021-12-31', 16),
(63, 4, '2021-02-14', 16),
(64, 6, '2021-07-04', 17),
(65, 1, '2021-06-21', 18),
(66, 2, '2021-07-15', 19),
(67, 1, '2021-05-02', 20),
(68, 3, '2021-05-30', 21),
(69, 1, '2021-06-21', 21),
(70, 8, '2021-07-21', 21),
(71, 4, '2021-04-21', 22),
(72, 3, '2021-05-10', 22),
(73, 7, '2021-06-12', 23),
(74, 6, '2021-06-28', 23),
(75, 1, '2021-07-04', 23)
;



-- Table medical_bill
CREATE TABLE medical_bill (
medical_bill_id INTEGER,
medical_bill_name VARCHAR(50),
price DECIMAL(10,2),
date_of_issue DATE,
doctor_id INTEGER,
patient_id INTEGER,
CONSTRAINT PK_medical_bill PRIMARY KEY (medical_bill_id),
CONSTRAINT FK_medical_bill FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
CONSTRAINT FK_prescrition_by FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

INSERT INTO
medical_bill
(medical_bill_id, medical_bill_name, price, date_of_issue, doctor_id, patient_id)
VALUES 
(1, 'Anti-inflammatory painkillers', 5.60, '2021-03-05', 6, 1),
(2, 'Tissue plasminogen activator', 89.60, '2020-10-25', 5, 2),
(3, 'Surgical AVM removal', 2500, '2020-10-28', 5, 2),
(4, 'Rehabilitation program', 12000, '2020-11-01', 5, 2),
(5, 'Non-Steroidal Anti-Inflammatory medications', 7.5, '2021-02-12', 2, 3),
(6, 'Anti-venom treatment', 249.5, '2021-04-09', 4, 4),
(7, 'Chest X-ray', 25, '2019-12-02', 5, 5),
(8, 'CT scan', 79, '2019-12-07', 5, 5),
(9, 'PET-CT scan', 150, '2019-12-15', 5, 5),
(10, 'Bronchoscopy', 260, '2019-12-21', 5, 5),
(11, 'Chemotherapy for 18 months', 15000, '2020-01-05', 5, 5),
(12, 'Shoulder X-ray', 25, '2021-06-02', 2, 6),
(13, 'Muscle relaxant', 4.5, '2021-06-02', 2, 6),
(14, 'Shoulder surgery', 1400, '2021-06-04', 2, 6),
(15, 'Pain reliever', 6.5, '2021-06-05', 2, 6),
(16, 'Digital rectal exam', 2.5, '2021-01-19', 3, 7),
(17, 'Prostate biopsy', 65, '2021-01-20', 3, 7),
(18, 'Transrectal ultrasound (TRUS)', 20, '2021-01-25', 3, 7),
(19, 'Magnetic resonance imaging (MRI)', 65, '2021-01-26', 3, 7),
(20, 'Bone scan', 160, '2021-01-20', 3, 7),
(21, 'Radiation Therapy for Prostate Cancer for 2 months', 1450, '2021-02-03', 3, 7),
(22, 'Anti-inflammatory medication', 4.50, '2021-07-02', 6, 8),
(23, 'Elbow X-ray', 24.50, '2021-07-02', 6, 8),
(24, 'Elbow Fracture Surgery', 4.50, '2021-07-03', 6, 8),
(25, 'X-ray X-ray', 24.50, '2021-11-07', 2, 9),
(26, 'Pain relievers', 6.50, '2021-11-07', 2, 9),
(27, 'Spirometry', 36.50, '2021-01-03', 3, 9),
(28, 'Chest X-ray', 36.50, '2021-01-04', 3, 9),
(29, 'Short-acting bronchodilator inhalers', 13.50, '2021-01-04', 3, 10),
(30, 'Long-acting bronchodilator inhalers', 23.50, '2021-01-09', 3, 10),
(31, 'Steroid inhalers', 18.50, '2021-01-20', 3, 10),
(32, 'Theophylline tablets', 25.50, '2021-01-30', 3, 10),
(33, 'Mucolytic medicines', 37.50, '2021-01-30', 3, 10),
(34, 'Antibiotics', 13.50, '2021-01-30', 3, 10),
(35, 'Pulmonary rehabilitation for 5 months', 1790.50, '2021-02-03', 3, 10),
(36, 'Tetanus shot', 19.50, '2021-04-02', 6, 11),
(37, 'Pain killer', 7.50, '2021-04-02', 6, 11),
(38, 'Early cleaning and debriding', 450, '2021-02-02', 2, 12),
(39, 'Intravenous (IV) fluids containing electrolytes', 57.90, '2021-02-03', 2, 12),
(40, 'Antibiotic ointments', 57.90, '2021-02-03', 2, 12),
(41, 'Tetanus shot', 19.50, '2021-02-04', 2, 12),
(42, 'Endoscopic exam', 49.50, '2021-01-22', 3, 13),
(43, 'Abdominal CT scans', 49.50, '2021-01-24', 3, 13),
(44, 'Doppler ultrasounds - splenic and portal veins', 39.50, '2021-01-25', 3, 13),
(45, 'Blood pressure drug called a beta blocker', 9.50, '2021-01-26', 3, 13),
(46, 'Endoscopic band ligation', 229.50, '2021-01-26', 3, 13),
(47, 'Anti-inflammatory medications', 229.50, '2021-04-11', 6, 14),
(48, 'Physical therapy', 79.90, '2021-04-15', 6, 14),
(49, 'Lofexidine, a non-opioid medicine', 29.90, '2021-05-02', 1, 15),
(50, 'Behavioral therapies for 1 month', 549.90, '2021-05-13', 1, 15),
(51, 'Mammogram', 49.90, '2020-12-02', 3, 16),
(52, 'Breast ultrasound', 29.90, '2020-12-05', 3, 16),
(53, 'Biopsy', 79.90, '2020-12-08', 3, 16),
(54, 'Breast magnetic resonance imaging', 69.90, '2020-12-10', 3, 16),
(55, 'Hormonal therapy for 4 months', 69.90, '2020-12-12', 3, 16),
(56, 'Knee X-rays ', 49.90, '2021-07-02', 6, 17),
(57, 'Anti-inflammatory painkillers', 6.90, '2021-07-02', 6, 17),
(58, 'Testing for SARS-CoV-2 (COVID-19)', 12.90, '2021-06-18', 1, 18),
(59, 'Dexamethasone', 19.90, '2021-06-18', 1, 18),
(60, 'Anticoagulation drugs', 9.90, '2021-06-18', 1, 18),
(61, 'Tocilizumab', 15.90, '2021-06-19', 1, 18),
(62, 'Remdesivir', 13.90, '2021-06-20', 1, 18),
(63, 'Remdesivir', 13.90, '2021-06-20', 1, 18),
(64, 'Dexamethasone', 19.90, '2021-07-02', 1, 19),
(65, 'Anticoagulation drugs', 9.90, '2021-07-02', 1, 19),
(66, 'Tocilizumab', 15.90, '2021-07-03', 1, 19),
(67, 'Remdesivir', 13.90, '2021-07-05', 1, 19),
(68, 'Remdesivir', 13.90, '2021-07-12', 1, 19),
(69, 'Remdesivir', 13.90, '2021-07-19', 1, 19),
(70, 'Remdesivir', 13.90, '2021-07-26', 1, 19),
(71, 'Shoulder X-ray', 25, '2021-05-02', 6, 20),
(72, 'Muscle relaxant', 4.5, '2021-05-02', 6, 20),
(73, 'Shoulder surgery', 1400, '2021-05-04', 6, 20),
(74, 'Pain reliever', 6.5, '2021-05-04', 6, 20),
(75, 'Dexamethasone', 19.90, '2021-05-17', 1, 21),
(76, 'Anticoagulation drugs', 9.90, '2021-05-17', 1, 21),
(77, 'Tocilizumab', 15.90, '2021-05-19', 1, 21),
(78, 'Remdesivir', 13.90, '2021-05-25', 1, 21),
(79, 'Remdesivir', 13.90, '2021-05-30', 1, 21),
(80, 'Remdesivir', 13.90, '2021-06-12', 1, 21),
(81, 'Remdesivir', 13.90, '2021-06-19', 1, 21),
(82, 'Remdesivir', 13.90, '2021-06-26', 1, 21),
(83, 'Remdesivir', 13.90, '2021-07-04', 1, 21),
(84, 'Remdesivir', 13.90, '2021-07-11', 1, 21),
(85, 'Remdesivir', 13.90, '2021-07-18', 1, 21),
(86, 'Antibiotics', 17.90, '2021-04-12', 4, 22),
(87, 'Surgical procedure 1', 290.90, '2021-04-13', 4, 22),
(88, 'Surgical procedure 2', 290.90, '2021-04-21', 4, 22),
(89, 'Physical therapy forthe next 3 months', 1490.90, '2021-05-10', 4, 22),
(90, 'Testing for SARS-CoV-2 (COVID-19)', 12.90, '2021-06-10', 5, 23),
(91, 'Dexamethasone', 19.90, '2021-06-10', 5, 23),
(92, 'Anticoagulation drugs', 9.90, '2021-06-10', 5, 23),
(93, 'Tocilizumab', 15.90, '2021-06-15', 5, 23),
(94, 'Remdesivir', 13.90, '2021-06-20', 5, 23),
(95, 'Remdesivir', 13.90, '2021-06-27', 5, 23),
(96, 'Remdesivir', 13.90, '2021-07-03', 5, 23)
;


-- Check all the tables names from the database "hospitals"
SHOW TABLES;


-- Q1: Which hospital has the highest entry fees ? in which city and country?
SELECT 
	h.hospital_id AS ID_number,
    h.hospital_name,
    h.city,
    h.country,
    MAX(h.entry_fee) as highest_entry_fee
FROM hospital h;


-- Q2: How many doctors in each hospital? which specialities are available ?
SELECT
	h.hospital_name,
	COUNT(d.doctor_id) AS number_of_doctors,
    GROUP_CONCAT(d.medical_speciality SEPARATOR ', ') AS medical_specialities
FROM doctor d
LEFT JOIN hospital h ON h.hospital_id = d.hospital_id
GROUP BY 1;


-- Q3: Which dotors have the most patient ? Give the TOP 3, the name of their hospitaland their specility.
WITH number_patients_per_doctor AS
	(
    SELECT 
		COUNT(p.patient_id) AS patients_number,
		d.doctor_id
	FROM patient p
	INNER JOIN medical_bill mb ON mb.patient_id = p.patient_id
	INNER JOIN doctor d ON d.doctor_id = mb.doctor_id
    GROUP BY 2
	)

SELECT 
	np.doctor_id AS ID_number,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.medical_speciality,
    hospital_name,
    np.patients_number AS number_of_patients 
FROM number_patients_per_doctor np
LEFT JOIN doctor d ON d.doctor_id = np.doctor_id
LEFT JOIN hospital h ON h.hospital_id = d.hospital_id
ORDER BY 5 DESC
LIMIT 3
;

-- Q4: Which patient has the most expensive room ? Give valuable information
SELECT 
	CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
	r.room_name,
    r.price_per_night AS price_per_night,
    h.hospital_name
FROM patient p
LEFT JOIN room r ON r.patient_id = p.patient_id
LEFT JOIN hospital h ON h.hospital_id = p.hospital_id
ORDER BY 3 DESC
LIMIT 1 ;


-- Q5: What are the three special meals that patients buy the most? 

WITH three_favorite_meals AS
	(
    SELECT 
		sm.special_meal_name,
		COUNT(smo.special_meal_id) AS number_of_purchase
	FROM special_meal sm
	LEFT JOIN special_meal_order smo ON smo.special_meal_id = sm.special_meal_id
	GROUP BY 1
	LIMIT 3
    )
    
SELECT 
	GROUP_CONCAT(tfm.special_meal_name, ' bought ', number_of_purchase, ' times' SEPARATOR ', ') AS three_favorite_meals
FROM three_favorite_meals tfm;

-- Q6: What are the three most expensive special meals ? 
WITH three_most_expensive AS
	(
    SELECT 
		sm.special_meal_name,
		sm.price
	FROM special_meal sm
	ORDER BY 2 DESC
	LIMIT 3
    )
    
	SELECT
		1 AS id_line, 
		GROUP_CONCAT(tme.special_meal_name, ' costs ', tme.price, ' euro' SEPARATOR '; ') AS three_most_expensive_meals
	FROM three_most_expensive tme;

-- Q7: What are the top 3 most lucrative special meals?
SELECT
   	sm.special_meal_id AS ID,
	sm.special_meal_name,
    sm.price,
    COUNT(smo.special_meal_id) number_of_purchase,
	ROUND(COUNT(smo.special_meal_id) *  sm.price, 2) AS turnover
FROM special_meal sm
LEFT JOIN special_meal_order smo ON smo.special_meal_id = sm.special_meal_id
GROUP BY 1
ORDER BY 5 DESC
LIMIT 3
;

-- Q8: GROUP ALL this info in a table.
DROP VIEW IF EXISTS three_favorite_meals;
DROP VIEW IF EXISTS three_most_expensive_meals;
DROP VIEW IF EXISTS three_best_turnover_meals;

CREATE VIEW three_favorite_meals AS
	WITH three_favorite_meals AS
		(
		SELECT 
			sm.special_meal_name,
			COUNT(smo.special_meal_id) AS number_of_purchase
		FROM special_meal sm
		LEFT JOIN special_meal_order smo ON smo.special_meal_id = sm.special_meal_id
		GROUP BY 1
		LIMIT 3
		)

	SELECT
		1 AS id_line, 
		GROUP_CONCAT(tfm.special_meal_name SEPARATOR '; ') AS three_favorite_meals
	FROM three_favorite_meals tfm;

CREATE VIEW three_most_expensive_meals AS
	WITH three_most_expensive AS
	(
    SELECT 
		sm.special_meal_name,
		sm.price
	FROM special_meal sm
	ORDER BY 2 DESC
	LIMIT 3
    )
    
	SELECT
		1 AS id_line, 
		GROUP_CONCAT(tme.special_meal_name SEPARATOR '; ') AS three_most_expensive_meals
	FROM three_most_expensive tme;


CREATE VIEW three_best_turnover_meals AS
	WITH three_best_turnover AS
		(
        SELECT
		    sm.special_meal_id AS ID,
			sm.special_meal_name,
			sm.price,
			COUNT(smo.special_meal_id) number_of_purchase,
			ROUND(COUNT(smo.special_meal_id) *  sm.price, 2) AS turnover
		FROM special_meal sm
		LEFT JOIN special_meal_order smo ON smo.special_meal_id = sm.special_meal_id
		GROUP BY 1
		ORDER BY 5 DESC
		LIMIT 3
		)
        
	SELECT
		1 AS id_line, 
		GROUP_CONCAT(tbt.special_meal_name SEPARATOR '; ') AS tree_best_turnover
	FROM three_best_turnover tbt;
    
    -- Main query to get the thre info in the same table
SELECT 
	tfm.three_favorite_meals AS three_favorite_meals,
    tme.three_most_expensive_meals AS three_most_expensive_meals,
    tbt.tree_best_turnover AS three_best_turnover
FROM three_favorite_meals tfm
LEFT JOIN three_most_expensive_meals tme ON tme.id_line = tfm.id_line
LEFT JOIN three_best_turnover_meals tbt ON tbt.id_line = tfm.id_line;


-- Q9: In each hospital, which patients has the most fees related to special meals ? 

# Subquery to get the sum of the food fee per patient
WITH food_fees_patients AS
	(
    SELECT
		p.patient_id,
		CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
		ROUND(SUM(sm.price),2) AS food_fees,
		h.hospital_name
	FROM patient p
	INNER JOIN special_meal_order smo ON smo.patient_id = p.patient_id
	INNER JOIN special_meal sm ON sm.special_meal_id = smo.special_meal_id
	INNER JOIN hospital h ON h.hospital_id = p.hospital_id
	GROUP BY 1
	ORDER BY 3 DESC
    )
    
 # Main query to select the patient who buy the most per hospital
    SELECT 
		ffp.patient_id,
		ffp.patient_name,
        MAX(food_fees) AS Max_food_fees,
		ffp.hospital_name
    FROM food_fees_patients ffp
    GROUP BY 4
    ORDER BY 3 DESC;


-- Q10 :Which top 5 patients have the most fees related to medical bills ? What is their pathology?

SELECT
	p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
	ROUND(SUM(mb.price),2) AS Sum_medical_bill,
    p.pathology_type,
    p.pathology_name,
    h.hospital_name
FROM patient p
INNER JOIN medical_bill mb ON mb.patient_id = p.patient_id
INNER JOIN hospital h ON h.hospital_id = p.hospital_id
GROUP BY 1
ORDER BY 3 DESC
LIMIT 5;


-- Q11: Which top 5 patients have the most fees (all including) in which hospital ? what pathology?

# Create a view (drop it before to use it)
DROP VIEW IF EXISTS hospitals.details_patient_fees;

CREATE VIEW hospitals.details_patient_fees AS
	SELECT
		p.patient_id,
		ROUND(SUM(mb.price),2) AS medical_fees,
		ROUND(SUM(sm.price),2) AS food_fees,
		r.price_per_night AS room_fees,
		h.entry_fee AS entry_fees
    FROM patient p
    INNER JOIN medical_bill mb ON mb.patient_id = p.patient_id
    INNER JOIN special_meal_order smo ON smo.patient_id = p.patient_id
    INNER JOIN special_meal sm ON sm.special_meal_id = smo.special_meal_id
    INNER JOIN room r ON r.patient_id = p.patient_id
    INNER JOIN hospital h ON h.hospital_id = p.hospital_id
    GROUP BY 1
    ORDER BY 1;

# main query that sum up all fees per patient and display the top 5
SELECT
	p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
	dpf.medical_fees + dpf.food_fees + dpf.room_fees + dpf.entry_fees AS total_fees,
    p.pathology_name,
    h.hospital_name
FROM patient p
INNER JOIN medical_bill mb ON mb.patient_id = p.patient_id
INNER JOIN hospital h ON h.hospital_id = p.hospital_id
INNER JOIN details_patient_fees dpf ON dpf.patient_id = p.patient_id
GROUP BY 1
ORDER BY 3 DESC
LIMIT 5;


-- Q12: Which patients have stay in hospital longer than 100 days.

# Subquery that calculate the hospitalisation time per patient
WITH hospitalisation_time AS
	(
    SELECT
		p.patient_id,
		CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
		p.exit_date - p.entry_date AS hospitalization_time,
		p.pathology_name,
		h.hospital_name
	FROM patient p
	INNER JOIN hospital h ON h.hospital_id = p.hospital_id
    )

# Main query that select the patients that have stay in the hospital for 100 days or more
SELECT 
	ht.patient_id,
	ht.patient_name,
	ht.hospitalization_time,
	ht.pathology_name,
	ht.hospital_name
FROM hospitalisation_time ht
WHERE ht.hospitalization_time >= 100
ORDER BY 3 DESC;




-- PROCEDURE: Add a new patient
SELECT * FROM patient;

#Create Stored Procedure  (all columns except exit_date and pathology_name)
DELIMITER //
CREATE PROCEDURE NewPatient(
IN patient_id INT, 
IN first_name VARCHAR(50),
IN last_name VARCHAR(50),
IN gender ENUM('F', 'M'),
IN patient_age INTEGER,
IN city VARCHAR(50),
IN country VARCHAR(50),
IN entry_date DATE,
IN pathology_type VARCHAR(50),
IN hospital_id INTEGER
)
BEGIN

INSERT INTO patient(patient_id, first_name, last_name, gender, patient_age, city, country, entry_date, pathology_type, hospital_id)
VALUES (patient_id, first_name, last_name, gender, patient_age, city, country, entry_date, pathology_type, hospital_id);

END//
DELIMITER ;


#Call Stored Procedure
CALL NewPatient(28, 'Carla', 'Delaye', 'F', 55, 'Perth', 'Australia', '2021-07-29', 'injury', 1);

#Check if the new patient has been added to the list of patients in the table "patient".
SELECT * FROM patient;




-- TRIGGER: Display a message if a patient age is lower than 18
DROP TRIGGER IF EXISTS hospitals.minor_patient;

# create the trigger
delimiter //
CREATE TRIGGER minor_patient BEFORE INSERT
ON patient
FOR EACH ROW
IF NEW.patient_age < 18 THEN
SIGNAL SQLSTATE '77777' SET MESSAGE_TEXT = 'It is urgent to call their parents';
END IF; //
delimiter ;

# Test the trigger
# before activating the trigger
CALL NewPatient(25, 'Lola', 'Marvin', 'F', 14, 'Bastia', 'France', '2021-07-16', 'injury', 3);
INSERT INTO patient VALUES (26, 'Max', 'Carlton', 'M', 12, 'Bangkok', 'Thailand', '2021-07-16', '2021-07-17', 'injury', 'wrist sprain', 2);
SELECT * FROM patient;

# after activating the trigger
INSERT INTO patient VALUES (29, 'Ally', 'Bravo', 'F', 12, 'Darwin', 'Australia', '2021-07-16', '2021-07-19', 'injury', 'shoulder dislocation', 1);
CALL NewPatient(29, 'Ally', 'Bravo', 'F', 12, 'Darwin', 'Australia', '2021-07-16', 'injury', 1);
SELECT * FROM patient;


#Create an event that print a message every day (here every minute to be able to check)
DROP TABLE messages;

CREATE TABLE messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    message VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL
);


-- Every month, a show is organized for the long-term patients. The idea is to create an event that every month, publish the list of the long_term patients.

-- 1/ FUNCTION: create a function that determine if the patient is considered as a long-term patient or not.
# delete function if needed
DROP FUNCTION IF EXISTS is_long_term;

# create function
DELIMITER //
CREATE FUNCTION is_long_term(entry_date DATE, exit_date DATE) 
RETURNS VARCHAR(25)
DETERMINISTIC 
BEGIN
    DECLARE patient_status VARCHAR(25);
	DECLARE hospitalization_time INT;
    
    SET hospitalization_time = exit_date - entry_date;
    IF hospitalization_time >= 100  THEN
        SET patient_status = 'Long-term patient';
    ELSEIF hospitalization_time < 100 THEN
        SET patient_status = 'Not a long-term patient';
    END IF;
    RETURN (patient_status);
END//
DELIMITER ;

# call the function
SELECT is_long_term('2019-05-01', '2020-05-05') AS patient_status;



-- 2/ VIEW that lists of long-term patients
# Drop VIEW before to use it
DROP VIEW IF EXISTS long_term_patient_status;


# create a view that have the list of long_term_patients
CREATE VIEW long_term_patient_status AS
	#subquery
	WITH patient_status AS
	(
    SELECT
		CONCAT(p.patient_id, ': ',p.first_name, ' ', p.last_name) AS patient_ref,
		is_long_term(p.entry_date, p.exit_date) AS patient_status
	FROM patient p
	)
    
	SELECT 
		GROUP_CONCAT(patient_ref SEPARATOR ', ') AS long_term_patients_list
	FROM patient_status
	WHERE patient_status = 'Long-term patient';
    

SELECT long_term_patients_list FROM long_term_patient_status;




-- 3/ PROCEDURE

#Create a table in which the list of the long-term patient will be stored
DROP TABLE long_term_patient_list ;

CREATE TABLE long_term_patient_list (
    id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    patient_ref VARCHAR(255) NOT NULL
    );
    
    SELECT * FROM long_term_patient_list;


# Drop PROCEDURE aftermodifying it
DROP PROCEDURE IF EXISTS long_term_patient_list;

#Create Stored Procedure  procedure that add the long_term_patients names in a row
DELIMITER //
CREATE PROCEDURE long_term_patient_list()
BEGIN
	DECLARE created_at DATETIME;
    DECLARE patient_ref VARCHAR(255);
	DECLARE c1 CURSOR FOR SELECT long_term_patients_list FROM long_term_patient_status;
  
    SET created_at = NOW();
    OPEN c1;
    FETCH c1 INTO patient_ref;
    CLOSE c1;
    
    INSERT INTO long_term_patient_list(created_at, patient_ref)
    VALUES (created_at, patient_ref);
END//
DELIMITER ;


#Call Stored  patient_status

CALL long_term_patient_list();

SELECT * FROM long_term_patient_list;




-- 4/ EVENT : a SHOW for the long-term patients
#Turn ON Event Scheduler 
SET GLOBAL event_scheduler = ON;
SET GLOBAL event_scheduler = OFF;

#Select Data to see that our table is empty
SELECT * FROM long_term_patient_list;

#Create an event that list the names of the long-term partient every month to know who can get a special show (for the example it's every 1 sec instead of every month)
DROP EVENT IF EXISTS long_term_patient_show;

DELIMITER //
CREATE EVENT long_term_patient_show
ON SCHEDULE EVERY 1 SECOND
DO BEGIN
    CALL long_term_patient_list(); 
END//
DELIMITER ;

#Check the tables with the list of long-term patients' name.
SELECT * FROM long_term_patient_list;


