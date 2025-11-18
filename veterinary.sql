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
    amount DECIMAL(10, 2),
    invoicedate DATE,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);  
    
CREATE TABLE medical_records (
    recordid INT PRIMARY KEY,
    animalid INT,
    visitdate DATE,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    doctorid INT,
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
(5, 'Shadow', 'Cat', 'Domestic Shorthair', '2021-09-05', 'Male', 'Black', 5),
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

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
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