/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', TO_DATE('03/02/2020', 'DD/MM/YYYY'), 10.23, true, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', TO_DATE('15/11/2018', 'DD/MM/YYYY'), 8.0, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', TO_DATE('07/01/2021', 'DD/MM/YYYY'), 15.04, false, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', TO_DATE('12/05/2017', 'DD/MM/YYYY'), 11.0, true, 5);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander', TO_DATE('08/02/2020', 'DD/MM/YYYY'), -11.0, false, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantmon', TO_DATE('15/11/2022', 'DD/MM/YYYY'), -5.7, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle', TO_DATE('02/04/1993', 'DD/MM/YYYY'), -12.0, false, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon', TO_DATE('12/06/2005', 'DD/MM/YYYY'), -45.0, true, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Boarmon', TO_DATE('07/06/2005', 'DD/MM/YYYY'), 20.4, true, 7);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom', TO_DATE('13/10/1998', 'DD/MM/YYYY'), 17.0, true, 3);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('pokemon'), ('digimon');

UPDATE animals
  SET owner_id=(SELECT id FROM owners WHERE full_name='Sam Smith') WHERE name='Agumon';

UPDATE animals
  SET owner_id=(SELECT id FROM owners WHERE full_name='Jennifer Orwell') WHERE name IN('Gabumon', 'Pikachu');

UPDATE animals
  SET owner_id=(SELECT id FROM owners WHERE full_name='Bob') WHERE name IN('Devimon', 'Plantmon');

UPDATE animals
  SET owner_id=(SELECT id FROM owners WHERE full_name='Melody Pond') WHERE name IN('Charmander', 'Squirtle', 'Blossom');
  
UPDATE animals
  SET owner_id=(SELECT id FROM owners WHERE full_name='Dean Winchester') WHERE name IN('Angemon', 'Boarmon');
