DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE Doctors
(
    id SERIAL PRIMARY KEY,
    doctor_name TEXT NOT NULL,    
    speciality TEXT NOT NULL
);
CREATE TABLE Patients
(
    id SERIAL PRIMARY KEY,
    patient_name TEXT NOT NULL,    
    insurance TEXT NOT NULL,
    birthday TEXT NOT NULL
);

CREATE TABLE Visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES Doctors,
    patient_id INTEGER REFERENCES Patients
);

CREATE TABLE Diseases
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL,
    disease_description TEXT NOT NULL,
);

CREATE TABLE Diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES Visits,
    disease_id INTEGER REFERENCES Diseases,
    notes TEXT
);



