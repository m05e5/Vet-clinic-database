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
SET species_id = (SELECT id FROM species WHERE name='digimon') WHERE Name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name='pokemon') WHERE Name NOT LIKE '%mon';


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


INSERT INTO vets (name,age,date_of_graduation) VALUES('Willian Tatcher', 45, (to_date('23/04/2000','DD/MM/YYYY' );
INSERT INTO vets (name,age,date_of_graduation) VALUES('Maisy Smith', 26, (to_date('17/01/2019','DD/MM/YYYY')) );
INSERT INTO vets (name,age,date_of_graduation) VALUES('Stephanie Mendez', 64, (to_date('04/05/1981','DD/MM/YYYY')) );
INSERT INTO vets (name,age,date_of_graduation) VALUES('Jack Harkness', 38, (to_date('08/06/2008','DD/MM/YYYY')) );

INSERT INTO specialization (species_id, vets_id) VALUES(
  (SELECT id FROM species WHERE name = 'pokemon'), 
  (SELECT id FROM vets WHERE name = 'Willian Tatcher') 
);
INSERT INTO specialization (species_id, vets_id) VALUES(
  (SELECT id FROM species WHERE name = 'pokemon'), 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez') 
);  
INSERT INTO specialization (species_id, vets_id) VALUES(
  (SELECT id FROM species WHERE name = 'digimon'), 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez') 
);
INSERT INTO specialization (species_id, vets_id) VALUES(
  (SELECT id FROM species WHERE name = 'digimon'), 
  (SELECT id FROM vets WHERE name = 'Jack Harkness') 
);

INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Agumon'), 
  (SELECT id FROM vets WHERE name = 'Willian Tatcher'), 
  (to_date('24/05/2020','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Agumon'), 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  (to_date('22/07/2020','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Gabumon'), 
  (SELECT id FROM vets WHERE name = 'Jack Harkness'), 
  (to_date('02/02/2021','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Pikachu'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  (to_date('05/01/2020','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Pikachu'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  (to_date('08/03/2020','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Pikachu'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  (to_date('14/05/2020','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Devimon'), 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  (to_date('04/05/2021','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Charmander'), 
  (SELECT id FROM vets WHERE name = 'Jack Harkness'), 
  (to_date('24/02/2021','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Squirtle'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  (to_date('21/12/2019','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Squirtle'), 
  (SELECT id FROM vets WHERE name = 'William Tatcher'), 
  (to_date('10/08/2020','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Squirtle'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  (to_date('07/04/2021','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Squirtle'), 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  (to_date('29/09/2019','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Angemon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  (to_date('03/10/2020','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Angemon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  (to_date('04/11/2020','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  (to_date('24/01/2019','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  (to_date('15/05/2019','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  (to_date('27/02/2020','DD/MM/YYYY')) 
)
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Boarmon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  (to_date('03/08/2020','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Blossom'), 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  (to_date('24/05/2020','DD/MM/YYYY')) 
);
INSERT INTO visits (animals_id, vet_id, date) VALUES (
  (SELECT id FROM animals WHERE name = 'Blossom'), 
  (SELECT id FROM vets WHERE name = 'William Tatcher'), 
  (to_date('11/01/2021','DD/MM/YYYY')) 
);

-- performace_audit

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;