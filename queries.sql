/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where date > '2016-01-01' AND date < '2019-12-30';
select name from animals where neutered = true AND escape_attempts < 3;
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';
select name, escape_attempts from animal where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg  BETWEEN 10.4 AND 17.3;

BEGIN;
  update animals
  set species = 'unspecified';
  ROLLBACK;

BEGIN;
  update animals
  set species = 'digimon' where name like '%mon';
  update animals
  set species = 'pokemon' where name not like '%mon';
  COMMIT;

BEGIN;
  DELETE from animals
  ROLLBACK;

BEGIN;
  DELETE FROM animals WHERE date_of_birth > '2022-01-01';
  SAVEPOINT delete_2022;
  UPDATE animals
  SET weight_kg = weight_kg * -1;
  ROLLBACK TO SAVEPOINT delete_2022;
  UPDATE animals
  SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
  COMMIT;

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts > 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) from animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-30' GROUP BY species;

SELECT animals.name,owner_id,full_name FROM animals
JOIN owners ON owners.id = anmals.owner_id
WHERE owners.id = 4;

SELECT animals.name,species_id,species.name FROM animals
JOIN species ON species.id = animals.species_id
WHERE species.id = 1;

SELECT animals.name,owner_id,full_name FROM animals
JOIN owners ON owners.id = animals.owner_id;

SELECT animals.name,species_id,species.name FROM animals
JOIN species ON species.id = animals.species_id;

SELECT animals.name,owner_id,full_name FROM animals
JOIN owners ON owners.id = animals.owner_id
where name LIKE '%mon' AND owners.id = 2;

SELECT animals.name,owner_id,full_name FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE Escape_attempts = 0 AND owners.id = 5;

SELECT animals.name,COUNT(owner_id),full_name FROM animals
JOIN owners ON owners.id = animals.owner_id;
