/*Queries that provide answers to the questions from all projects.*/

-- DAY ONE
SELECT * from animals WHERE name iLIKE '%mon';
SELECT name from animals WHERE EXTRACT(year from date_of_birth) BETWEEN 2016 AND 2019;
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- DAY TWO

--transanction 1
BEGIN;
UPDATE animals
SET species='unspecified';
ROLLBACK;

--transanction 2
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE = '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

--transanction 2
BEGIN;
DELETE FROM animals;
ROLLBACK;

--transanction 2
BEGIN;
DELETE FROM animals
WHERE date_of_birth > DATE '2022-01-01';
SAVEPOINT all_animals_from_jan2022;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK to all_animals_from_jan2022;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

-- Queries to answe questions
SELECT COUNT(*) AS total_animals FROM animals;
SELECT COUNT(*) AS never_escaped FROM animals 
WHERE escape_attempts = 0;
SELECT AVG(weight_kg) AS average_weight FROM animals;
SELECT neutered, MAX(escape_attempts) AS most_escaped FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) AS minimum_wight, MAX(weight_kg) AS max_weight from animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS average_escape FROM animals
WHERE date_of_birth BETWEEN DATE '1990-01-01' AND '2000-12-31' GROUP BY species;

-- DAY 3
SELECT * FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

SELECT * FROM animals
JOIN species ON species.id = animals.species_id
WHERE species.name = 'Pokemon';

SELECT name, full_name AS Owners FROM animals
LEFT JOIN owners ON animals.owner_id = owners.id;

SELECT species.name AS Species, COUNT(animals.name) AS Numb FROM animals
LEFT JOIN species ON animals.species_id = species.id
GROUP BY species;

SELECT * FROM animals
LEFT JOIN species ON animals.species_id = species.id
WHERE species.name = 'Digimon';

SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = '0';

SELECT full_name, COUNT(full_name) FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY full_name
ORDER BY count DESC LIMIT 1;