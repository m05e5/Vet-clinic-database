/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', TO_DATE('03/02/2020', 'DD/MM/YYYY'), 10.23, true, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', TO_DATE('15/11/2018', 'DD/MM/YYYY'), 8.0, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', TO_DATE('07/01/2021', 'DD/MM/YYYY'), 15.04, false, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', TO_DATE('12/05/2017', 'DD/MM/YYYY'), 11.0, true, 5);
