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


SELECT animals.name,visits.date FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.id = 1
GROUP BY animals.name,visits.date
ORDER BY date DESC LIMIT 1;

SELECT COUNT(DISTINCT visits.animals_id) FROM visits
JOIN vets ON vets.id visits.vet_id
WHERE vets.id = 3;

SELECT vets.name, species.name FROM vets
JOIN specialization ON specialization.vets_id = vets.id
JOIN species ON species.id = specialization.species_id;

SELECT animals.name, visits.date FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Stephanie Mendez'
AND visits.date BETWEEN (to_date('04/01/2020','mm/dd/yyyy')) 
AND (to_date('08/30/2000','mm/dd/yyyy'));

SELECT animals.name, COUNT(visits.animals_id) count_visits FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
GROUP BY animals.name,visits.animals_id
ORDER BY count_visits DESC LIMIT 1;

SELECT animals.name,visits.date AS first_visit FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.id = 2
GROUP BY animals.name,visits.date
ORDER BY first_visit LIMIT 1;

SELECT * FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
ORDER BY visits.date DESC LIMIT 1;

SELECT COUNT(visits.animals_id) FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
JOIN specialization ON specialization.vets_id = vets.id
WHERE specialization.species_id NOT LIKE animals.species_id;

SELECT species.name,COUNT(visits.animals_id) AS count_species FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE vets.id = 2
GROUP BY species.name
ORDER BY count_species DESC LIMIT 1;

SELECT COUNT(*) FROM visits where animal_id = 4;