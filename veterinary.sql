CREATE DATABASE veterinary;

CREATE TABLE  owners (
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),  
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10, 2),
    paymentdate DATE,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);  
    
CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate DATE,
    doctorid INT,
    diagnosis VARCHAR(255),
    prescription VARCHAR(255),
    notes VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email) VALUES
(1, 'Maria', 'Santos', '12 Aguinaldo St, Quezon City', '0917-123-4567', 'maria.santos@email.com'),
(2, 'Jose', 'Dela Cruz', '34 Mabini Ave, Makati', '0918-987-6543', 'jose.dcruz@email.com'),
(3, 'Sofia', 'Reyes', '56 Katipunan Rd, Cebu City', '0922-555-1212', 'sofia.reyes@email.com'),
(4, 'Ricardo', 'Garcia', '78 Rizal Blvd, Davao City', '0999-333-8888', 'ricardo.garcia@email.com'),
(5, 'Luzviminda', 'Mercado', '90 Bonifacio Drive, Manila', '0908-111-2233', 'luzvi.mercado@email.com'),
(6, 'Antonio', 'Lim', '11 P. Burgos St, Baguio', '0919-444-5566', 'antonio.lim@email.com'),
(7, 'Elena', 'Perez', '22 Sikatuna Village, Bohol', '0920-777-9900', 'elena.perez@email.com'),
(8, 'Francisco', 'Lopez', '33 Gen. Luna St, Iloilo', '0925-666-3311', 'francisco.lopez@email.com'),
(9, 'Carmela', 'Navarro', '44 Magallanes St, Zamboanga', '0916-222-4455', 'carmela.navarro@email.com'),
(10, 'Rafael', 'Gonzales', '55 Sampaguita St, Pasig', '0915-888-0099', 'rafael.gonzales@email.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid) VALUES
(1, 'Whiskers', 'Cat', 'Siamese', '2023-01-15', 'Female', 'Cream', 1),
(2, 'Buddy', 'Dog', 'Golden Retriever', '2022-05-20', 'Male', 'Gold', 2),
(3, 'Nemo', 'Fish', 'Clownfish', '2024-03-01', 'Male', 'Orange/White', 3),
(4, 'Feathers', 'Bird', 'Cockatiel', '2023-11-10', 'Female', 'Gray/Yellow', 4),
(5, 'Simba', 'Cat', 'Domestic Shorthair', '2021-09-05', 'Male', 'Black', 5),
(6, 'Lucy', 'Dog', 'Beagle', '2023-07-28', 'Female', 'Tricolor', 6),
(7, 'Spike', 'Reptile', 'Iguana', '2020-04-12', 'Male', 'Green', 7),
(8, 'Hazel', 'Rabbit', 'Holland Lop', '2024-01-22', 'Female', 'Brown', 8),
(9, 'Rocky', 'Dog', 'Bulldog', '2022-12-01', 'Male', 'White/Brindle', 9),
(10, 'Cleo', 'Cat', 'Bengal', '2023-06-18', 'Female', 'Spotted', 10);

INSERT INTO appointments (appointid, animalid, appointdate, reason) VALUES
(101, 5, '2025-11-20', 'Annual Vaccination and Check-up'),
(102, 12, '2025-11-20', 'Spaying/Neutering Procedure'),
(103, 8, '2025-11-21', 'Persistent Cough and Lethargy'),
(104, 3, '2025-11-21', 'Dental Cleaning'),
(105, 15, '2025-11-22', 'Post-Surgery Follow-up'),
(106, 1, '2025-11-22', 'Flea and Tick Treatment'),
(107, 7, '2025-11-23', 'Emergency - Broken Leg'),
(108, 10, '2025-11-23', 'Microchipping'),
(109, 2, '2025-11-24', 'Behavior Consultation for Aggression'),
(110, 4, '2025-11-24', 'Annual Bloodwork and Senior Panel');

INSERT INTO doctors(doctorid, dfirstname, dlastname, specialization, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');
(7, 'Dr.Rafael', 'Cruz', 'Cardiology Specialist', '444-555-6666', 'rafael@example.com'),
(8, 'Dr.Isabel', 'Vargas', 'Exotic Pet Specialist', '777-666-5555', 'isabel@example.com'),
(9, 'Dr.Jose', 'Mendoza', 'Internal Medicine', '888-777-6666', 'jose@example.com'),
(10, 'Dr.Elena', 'Diaz', 'Emergency Medicine', '666-555-4444', 'elena@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD COLUMN registereddate DATE;

ALTER TABLE invoices
RENAME COLUMN paymentdate TO paymenttime;

DELETE FROM appointments
WHERE animalid = 5;

UPDATE doctors
SET dlastname = 'Reyes-Gozales'
WHERE dfirstname = 'Dr.Sofia';

SELECT DISTINCT species
FROM animals;