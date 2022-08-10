CREATE DATABASE hospitals;

USE hospitals;
SHOW TABLES;

-- Table hospital
CREATE TABLE hospital (
hospital_id INTEGER AUTO_INCREMENT,
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
(hospital_name, adress, postal_code, city, country, entry_fee, phone_number)
VALUES 
('Darwin Hospital', 'Victoria Square', '6000', 'Perth', 'Australia', 249.99, '+61889228888'),
('Molchanova Hospital', '4/1 Moo 3 Thepkasatri Road Ratsada', '83000', 'Phuket', 'Thailand', 15, '+6676237220'),
('Paoli Hospital', ' 604 Chemin de Falconaja', '20600', 'Bastia', 'France', 0,  '+33495591111');

SELECT * FROM hospital;

-- Table patient
CREATE TABLE patient (
patient_id INTEGER AUTO_INCREMENT,
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
(first_name, last_name, gender, patient_age, city, country, entry_date, exit_date, pathology_type, pathology_name, hospital_id)
VALUES 
('Maria', 'Delanova', 'F', 45, 'Barcelona', 'Spain', '2021-03-05', '2021-03-07', 'injury', 'Wrist sprain', 3),
('Marc', 'Cassier', 'M', 58, 'Paris', 'France', '2020-10-25', '2021-07-05', 'disease', 'Cerebrovascular accident', 3),
('John', 'Pottier', 'M', 39, 'Perth', 'Australia', '2021-02-12', '2021-02-16', 'injury', 'Foot extensor tendonitis ', 1),
('Bella', 'Sawadee', 'F', 22, 'Phuket', 'Thailand', '2021-04-09', '2021-05-07', 'injury', 'Snake bite', 2),
('Alex', 'Voulti', 'M', 72, 'Bastia', 'France', '2019-12-02', '2021-07-13', 'disease', 'Lung cancer', 3),
('Piers', 'Solo', 'M', 21, 'Sydney', 'Australia', '2021-06-02', '2021-06-28', 'injury', 'Shoulder dislocation', 1),
('Juan', 'Philippe', 'M', 31, 'Koh Tao', 'Thailand', '2021-01-19', '2021-04-02', 'disease', 'Prostate cancer', 2),
('Axelle', 'Portailler', 'F', 35, 'Annecy', 'France', '2021-07-02', '2021-07-15', 'injury', 'Elbow Fracture', 3),
('Paul', 'Carter', 'M', 42, 'Darwin', 'Australia', '2021-11-07', '2021-11-09', 'injury', 'Ankle sprain', 1),
('Maellia', 'Flash', 'F', 62, 'Kuala Lumpour', 'Malaisia', '2021-01-02', '2021-06-03', 'disease', 'Chronic Obstructive Pulmonary Disease', 2),
('Angelina', 'Gabrielli', 'F', 38, 'Bastia', 'France', '2021-04-02', '2021-04-04', 'injury', 'Electrical injury', 3),
('Camille', 'Martelle', 'F', 56, 'Cairns', 'Australia', '2021-02-02', '2021-02-12', 'injury', 'Third-degree burns', 1),
('David', 'Thomas', 'M', 38, 'Bangkok', 'Thailand', '2021-01-22', '2021-03-08', 'disease', 'Esophageal varices', 2),
('Simon', 'Baudet', 'M', 57, 'Bordeaux', 'France', '2021-04-11', '2021-04-17', 'injury', 'Knee strain', 3),
('Marcel', 'Flauchet', 'M', 33, 'Adelaïde', 'Australia', '2021-05-02', '2021-06-13', 'disease', 'Drug use disorder', 1),
('Rattana', 'Noy', 'F', 52, 'Vientiane', 'Laos', '2020-12-02', '2021-04-13', 'disease', 'Breast cancer', 2),
('Valérie', 'Francini', 'F', 42, 'Ajaccio', 'France', '2021-07-02', '2021-07-05', 'injury', 'Knee sprain', 3),
('Jenny', 'Smith', 'F', 39, 'Freemantle', 'Australia', '2021-06-18', '2021-07-16', 'disease', 'covid-19', 1),
('Mayliz', 'Sporty', 'F', 54, 'Koh Samui', 'Thailand', '2021-07-02', '2021-07-31', 'disease', 'covid-19', 2),
('Diego', 'Esposito', 'M', 68, 'Portoferraio', 'Italy', '2021-05-02', '2021-05-03', 'injury', 'Knee dislocation', 3),
('Frederic', 'Loutchy', 'M', 64, 'Rockingham', 'Australia', '2021-05-17', '2021-07-23', 'disease', 'covid-19', 1),
('Enzo', 'Mazerti', 'M', 40, 'Rawai', 'Thailand', '2021-04-12', '2021-05-12', 'injury', 'Open Fracture of Leg', 2),
('Chloe', 'Darton', 'F', 57, 'Marseille', 'France', '2021-06-10', '2021-07-05', 'disease', 'covid-19', 3)
;


-- Table doctor
CREATE TABLE doctor (
doctor_id INTEGER AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
medical_speciality VARCHAR(50),
hospital_id INTEGER,
CONSTRAINT PK_doctor PRIMARY KEY (doctor_id),
CONSTRAINT FK_hospital_doc FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);

INSERT INTO
doctor
(first_name, last_name, medical_speciality, hospital_id)
VALUES 
('Phillip', 'Lacey', 'disease', 1),
('Eira', 'Davie', 'injury', 1),
('Gracie', 'Nelson', 'disease', 2),
('Gary', 'Markham', 'injury', 2),
('Korben', 'Jackson', 'disease', 3),
('Luci', 'Ahmad', 'injury', 3)
;


-- Table room
CREATE TABLE room (
room_id INTEGER AUTO_INCREMENT,
room_name VARCHAR(50),
price_per_night DECIMAL(10,2),
patient_id INTEGER,
CONSTRAINT PK_room PRIMARY KEY (room_id),
CONSTRAINT FK_room FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

INSERT INTO
room
(room_name, price_per_night, patient_id)
VALUES 
('Room PH-A', 15.50, 1),
('Room PH-B', 15.50, 2),
('Room PH-C', 25.50, 5),
('Room PH-D', 25.50, 8),
('Room PH-E', 32.50, 11),
('Room PH-F', 32.50, 14),
('Room PH-G', 44.50, 17),
('Room PH-H', 60.50, 20),
('Room PH-I', 121.50, 23),
('Room DH-A', 15.50, 3),
('Room DH-B', 15.50, 6),
('Room DH-C', 25.50, 9),
('Room DH-D', 25.50, 12),
('Room DH-E', 32.50, 15),
('Room DH-F', 132.50, 18),
('Room DH-', 99.50, 21),
('Room MH-A', 15.50, 4),
('Room MH-B', 15.50, 7),
('Room MH-C', 25.50, 10),
('Room MH-D', 25.50, 13),
('Room MH-E', 32.50, 16),
('Room MH-F', 112.50, 19),
('Room MH-G', 39.50, 22)
;


-- Table special_meal
CREATE TABLE special_meal (
special_meal_id INTEGER AUTO_INCREMENT,
special_meal_name VARCHAR(50),
price DECIMAL(10,2),
CONSTRAINT PK_special_meal PRIMARY KEY (special_meal_id)
);

INSERT INTO
special_meal
(special_meal_name, price)
VALUES 
('Imperial Burger', 10.60),
('Blue Burger', 10.60),
('Pizza', 9.50),
('Cranberry Cocktail Meatballs', 22.50),
('Marsala Stuffed Mushrooms', 17.90),
('Deep-Fried Camembert With Cranberry Sauce', 15.50),
('Lasagna', 11.50),
('Bacon-Wrapped Filets with Cowboy Butter', 10.60),
('Champagne', 50.50)
;


-- Table special_meal_order
CREATE TABLE special_meal_order (
purchase_id INTEGER AUTO_INCREMENT,
special_meal_id INTEGER,
purchase_date DATE,
patient_id INTEGER,
CONSTRAINT PK_special_meal PRIMARY KEY (purchase_id),
CONSTRAINT FK_special_meal FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
CONSTRAINT FK_special_meal_info FOREIGN KEY (special_meal_id) REFERENCES special_meal(special_meal_id)
);

INSERT INTO
special_meal_order
(special_meal_id, purchase_date, patient_id)
VALUES 
(1, '2021-03-06', 1),
(1, '2020-10-30', 2),
(2, '2020-11-15', 2),
(3, '2020-11-30', 2),
(7, '2020-12-15', 2),
(5, '2020-12-24', 2),
(9, '2020-12-25', 2),
(5, '2020-12-31', 2),
(1, '2021-01-30', 2),
(8, '2021-02-15', 2),
(2, '2021-02-28', 2),
(7, '2021-03-14', 2),
(1, '2021-03-30', 2),
(4, '2021-04-15', 2),
(5, '2021-04-30', 2),
(1, '2021-05-15', 2),
(6, '2021-05-30', 2),
(2, '2021-06-15', 2),
(3, '2021-06-30', 2),
(3, '2021-02-14', 3),
(2, '2021-04-14', 4),
(7, '2021-04-30', 4),
(6, '2021-05-06', 4),
(2, '2019-12-15', 5),
(4, '2019-12-25', 5),
(5, '2019-12-31', 5),
(1, '2020-01-25', 5),
(2, '2020-02-25', 5),
(3, '2020-03-25', 5),
(2, '2020-04-25', 5),
(3, '2020-05-25', 5),
(2, '2020-06-25', 5),
(3, '2020-07-25', 5),
(2, '2020-08-25', 5),
(3, '2020-09-25', 5),
(2, '2020-10-25', 5),
(3, '2020-11-25', 5),
(4, '2020-12-25', 5),
(5, '2020-12-31', 5),
(2, '2021-01-25', 5),
(1, '2021-02-25', 5),
(3, '2021-03-25', 5),
(2, '2021-04-25', 5),
(7, '2021-05-25', 5),
(8, '2021-06-25', 5),
(2, '2021-06-16', 6),
(4, '2021-04-01', 7),
(1, '2021-07-03', 8),
(8, '2021-07-06', 8),
(3, '2021-07-09', 8),
(1, '2021-07-13', 8),
(8, '2021-11-08', 9),
(1, '2021-02-02', 10),
(2, '2021-03-02', 10),
(4, '2021-05-02', 10),
(7, '2021-04-03', 11),
(5, '2021-02-08', 12),
(6, '2021-02-22', 13),
(1, '2021-04-15', 14),
(4, '2021-05-15', 15),
(5, '2021-12-25', 16),
(7, '2021-12-31', 16),
(4, '2021-02-14', 16),
(6, '2021-07-04', 17),
(1, '2021-06-21', 18),
(2, '2021-07-15', 19),
(1, '2021-05-02', 20),
(3, '2021-05-30', 21),
(1, '2021-06-21', 21),
(8, '2021-07-21', 21),
(4, '2021-04-21', 22),
(3, '2021-05-10', 22),
(7, '2021-06-12', 23),
(6, '2021-06-28', 23),
(1, '2021-07-04', 23)
;



-- Table medical_bill
CREATE TABLE medical_bill (
medical_bill_id INTEGER AUTO_INCREMENT,
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
(medical_bill_name, price, date_of_issue, doctor_id, patient_id)
VALUES 
('Anti-inflammatory painkillers', 5.60, '2021-03-05', 6, 1),
('Tissue plasminogen activator', 89.60, '2020-10-25', 5, 2),
('Surgical AVM removal', 2500, '2020-10-28', 5, 2),
('Rehabilitation program', 12000, '2020-11-01', 5, 2),
('Non-Steroidal Anti-Inflammatory medications', 7.5, '2021-02-12', 2, 3),
('Anti-venom treatment', 249.5, '2021-04-09', 4, 4),
('Chest X-ray', 25, '2019-12-02', 5, 5),
('CT scan', 79, '2019-12-07', 5, 5),
('PET-CT scan', 150, '2019-12-15', 5, 5),
('Bronchoscopy', 260, '2019-12-21', 5, 5),
('Chemotherapy for 18 months', 15000, '2020-01-05', 5, 5),
('Shoulder X-ray', 25, '2021-06-02', 2, 6),
('Muscle relaxant', 4.5, '2021-06-02', 2, 6),
('Shoulder surgery', 1400, '2021-06-04', 2, 6),
('Pain reliever', 6.5, '2021-06-05', 2, 6),
('Digital rectal exam', 2.5, '2021-01-19', 3, 7),
('Prostate biopsy', 65, '2021-01-20', 3, 7),
('Transrectal ultrasound (TRUS)', 20, '2021-01-25', 3, 7),
('Magnetic resonance imaging (MRI)', 65, '2021-01-26', 3, 7),
('Bone scan', 160, '2021-01-20', 3, 7),
('Radiation Therapy for Prostate Cancer for 2 months', 1450, '2021-02-03', 3, 7),
('Anti-inflammatory medication', 4.50, '2021-07-02', 6, 8),
('Elbow X-ray', 24.50, '2021-07-02', 6, 8),
('Elbow Fracture Surgery', 4.50, '2021-07-03', 6, 8),
('X-ray X-ray', 24.50, '2021-11-07', 2, 9),
('Pain relievers', 6.50, '2021-11-07', 2, 9),
('Spirometry', 36.50, '2021-01-03', 3, 9),
('Chest X-ray', 36.50, '2021-01-04', 3, 9),
('Short-acting bronchodilator inhalers', 13.50, '2021-01-04', 3, 10),
('Long-acting bronchodilator inhalers', 23.50, '2021-01-09', 3, 10),
('Steroid inhalers', 18.50, '2021-01-20', 3, 10),
('Theophylline tablets', 25.50, '2021-01-30', 3, 10),
('Mucolytic medicines', 37.50, '2021-01-30', 3, 10),
('Antibiotics', 13.50, '2021-01-30', 3, 10),
('Pulmonary rehabilitation for 5 months', 1790.50, '2021-02-03', 3, 10),
('Tetanus shot', 19.50, '2021-04-02', 6, 11),
('Pain killer', 7.50, '2021-04-02', 6, 11),
('Early cleaning and debriding', 450, '2021-02-02', 2, 12),
('Intravenous (IV) fluids containing electrolytes', 57.90, '2021-02-03', 2, 12),
('Antibiotic ointments', 57.90, '2021-02-03', 2, 12),
('Tetanus shot', 19.50, '2021-02-04', 2, 12),
('Endoscopic exam', 49.50, '2021-01-22', 3, 13),
('Abdominal CT scans', 49.50, '2021-01-24', 3, 13),
('Doppler ultrasounds - splenic and portal veins', 39.50, '2021-01-25', 3, 13),
('Blood pressure drug called a beta blocker', 9.50, '2021-01-26', 3, 13),
('Endoscopic band ligation', 229.50, '2021-01-26', 3, 13),
('Anti-inflammatory medications', 229.50, '2021-04-11', 6, 14),
('Physical therapy', 79.90, '2021-04-15', 6, 14),
('Lofexidine, a non-opioid medicine', 29.90, '2021-05-02', 1, 15),
('Behavioral therapies for 1 month', 549.90, '2021-05-13', 1, 15),
('Mammogram', 49.90, '2020-12-02', 3, 16),
('Breast ultrasound', 29.90, '2020-12-05', 3, 16),
('Biopsy', 79.90, '2020-12-08', 3, 16),
('Breast magnetic resonance imaging', 69.90, '2020-12-10', 3, 16),
('Hormonal therapy for 4 months', 69.90, '2020-12-12', 3, 16),
('Knee X-rays ', 49.90, '2021-07-02', 6, 17),
('Anti-inflammatory painkillers', 6.90, '2021-07-02', 6, 17),
('Testing for SARS-CoV-2 (COVID-19)', 12.90, '2021-06-18', 1, 18),
('Dexamethasone', 19.90, '2021-06-18', 1, 18),
('Anticoagulation drugs', 9.90, '2021-06-18', 1, 18),
('Tocilizumab', 15.90, '2021-06-19', 1, 18),
('Remdesivir', 13.90, '2021-06-20', 1, 18),
('Remdesivir', 13.90, '2021-06-20', 1, 18),
('Dexamethasone', 19.90, '2021-07-02', 1, 19),
('Anticoagulation drugs', 9.90, '2021-07-02', 1, 19),
('Tocilizumab', 15.90, '2021-07-03', 1, 19),
('Remdesivir', 13.90, '2021-07-05', 1, 19),
('Remdesivir', 13.90, '2021-07-12', 1, 19),
('Remdesivir', 13.90, '2021-07-19', 1, 19),
('Remdesivir', 13.90, '2021-07-26', 1, 19),
('Shoulder X-ray', 25, '2021-05-02', 6, 20),
('Muscle relaxant', 4.5, '2021-05-02', 6, 20),
('Shoulder surgery', 1400, '2021-05-04', 6, 20),
('Pain reliever', 6.5, '2021-05-04', 6, 20),
('Dexamethasone', 19.90, '2021-05-17', 1, 21),
('Anticoagulation drugs', 9.90, '2021-05-17', 1, 21),
('Tocilizumab', 15.90, '2021-05-19', 1, 21),
('Remdesivir', 13.90, '2021-05-25', 1, 21),
('Remdesivir', 13.90, '2021-05-30', 1, 21),
('Remdesivir', 13.90, '2021-06-12', 1, 21),
('Remdesivir', 13.90, '2021-06-19', 1, 21),
('Remdesivir', 13.90, '2021-06-26', 1, 21),
('Remdesivir', 13.90, '2021-07-04', 1, 21),
('Remdesivir', 13.90, '2021-07-11', 1, 21),
('Remdesivir', 13.90, '2021-07-18', 1, 21),
('Antibiotics', 17.90, '2021-04-12', 4, 22),
('Surgical procedure 1', 290.90, '2021-04-13', 4, 22),
('Surgical procedure 2', 290.90, '2021-04-21', 4, 22),
('Physical therapy forthe next 3 months', 1490.90, '2021-05-10', 4, 22),
('Testing for SARS-CoV-2 (COVID-19)', 12.90, '2021-06-10', 5, 23),
('Dexamethasone', 19.90, '2021-06-10', 5, 23),
('Anticoagulation drugs', 9.90, '2021-06-10', 5, 23),
('Tocilizumab', 15.90, '2021-06-15', 5, 23),
('Remdesivir', 13.90, '2021-06-20', 5, 23),
('Remdesivir', 13.90, '2021-06-27', 5, 23),
('Remdesivir', 13.90, '2021-07-03', 5, 23)
;


-- Check all the tables names from the database "hospitals"
SHOW TABLES;


-- 1/ Which dotors have the most patient ? Give the TOP 3, the name of their hospital and their specility.
# Drop PROCEDURE if needed
DROP PROCEDURE IF EXISTS get_details_of_top3_busiest_doctors;

#Create Stored Procedure  procedure that add the long_term_patients names in a row
DELIMITER //
CREATE PROCEDURE get_details_of_top3_busiest_doctors()
BEGIN
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

END//
DELIMITER ;

call get_details_of_top3_busiest_doctors();



-- 2/ Which top 5 patients have the most fees (all including) ? display relevant information.

# Drop PROCEDURE if needed
DROP PROCEDURE IF EXISTS get_details_of_top5_most_expensive_patients;

#Create Stored Procedure  procedure that add the long_term_patients names in a row
DELIMITER //
CREATE PROCEDURE get_details_of_top5_most_expensive_patients()
BEGIN
	
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
        
END//
DELIMITER ;

call get_details_of_top5_most_expensive_patients();


-- 3/ Group in the same table 3 informations :  
		-- What are the three special meals that patients buy the most?  
		-- What are the three most expensive special meals ? 
        -- What are the top 3 most lucrative special meals? 


# Drop PROCEDURE if needed
DROP PROCEDURE IF EXISTS get_strategic_details_related_to_special_meals;

#Create Stored Procedure  procedure that add the long_term_patients names in a row
DELIMITER //
CREATE PROCEDURE get_strategic_details_related_to_special_meals()
BEGIN

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
    
    -- Main query to get all the info in the same table
SELECT 
	tfm.three_favorite_meals AS three_favorite_meals,
    tme.three_most_expensive_meals AS three_most_expensive_meals,
    tbt.tree_best_turnover AS three_best_turnover
FROM three_favorite_meals tfm
LEFT JOIN three_most_expensive_meals tme ON tme.id_line = tfm.id_line
LEFT JOIN three_best_turnover_meals tbt ON tbt.id_line = tfm.id_line;

END//
DELIMITER ;

call get_strategic_details_related_to_special_meals();




-- 4/ PROCEDURE: Add a new patient without all information
DROP PROCEDURE NewPatient;

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

SELECT * FROM patient;

#Call Stored Procedure
CALL NewPatient(24, 'Carla', 'Delaye', 'F', 55, 'Perth', 'Australia', '2021-07-29', 'injury', 1);

#Check if the new patient has been added to the list of patients in the table "patient".
SELECT * FROM patient;



-- 5/ TRIGGER: Display a message if a patient age is lower than 18
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
# before activating the trigger (drop the trigger if already activated)
CALL NewPatient(25, 'Lola', 'Marvin', 'F', 14, 'Bastia', 'France', '2021-07-16', 'injury', 3);
INSERT INTO patient VALUES (26, 'Max', 'Carlton', 'M', 12, 'Bangkok', 'Thailand', '2021-07-16', '2021-07-17', 'injury', 'wrist sprain', 2);
SELECT * FROM patient;

# after activating the trigger with a/INSERT TO and b/PROCEDURE
INSERT INTO patient VALUES (27, 'Ally', 'Bravo', 'F', 12, 'Darwin', 'Australia', '2021-07-16', '2021-07-19', 'injury', 'shoulder dislocation', 1);
CALL NewPatient(27, 'Ally', 'Bravo', 'F', 12, 'Darwin', 'Australia', '2021-07-16', 'injury', 1);
SELECT * FROM patient;


-- 6/ EVENT 
-- Every month, a show is organized for the long-term patients. The idea is to create an event that publish the list of the long_term patients on a monthly basis.

-- STEP A -FUNCTION: create a function that determine if the patient is considered as a long-term patient or not.
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



-- STEP B : VIEW that lists of long-term patients
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




-- STEP C: PROCEDURE : that store the long-term patient in a table

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




-- STEP D - EVENT : that publish the table of the long-term patients every month 
#Turn ON Event Scheduler 
SET GLOBAL event_scheduler = ON;
SET GLOBAL event_scheduler = OFF;

#Select Data to see that our table is empty
SELECT * FROM long_term_patient_list;

#Create an event that list the names of the long-term partient every month to know who can get a special show (for the example CHOOSE 1 SECOND)
DROP EVENT IF EXISTS long_term_patient_show;

DELIMITER //
CREATE EVENT long_term_patient_show
ON SCHEDULE EVERY 1 MONTH
DO BEGIN
    CALL long_term_patient_list(); 
END//
DELIMITER ;

#Check the tables with the list of long-term patients' name.
SELECT * FROM long_term_patient_list;

