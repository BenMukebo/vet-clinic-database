/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered= TRUE AND escape_attempts < 3;
-- SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered= TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
-- SELECT * FROM animals WHERE weight_kg > 10.4 AND weight_kg < 17.3;
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- SELECT COALESCE(species, 'unspecified') FROM animals

-- Adding a new columnn species to type string to the animals
ALTER TABLE animals
ADD COLUMN species VARCHAR(100)

-- Inside a transaction update the animals(species column)
BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

-- Inside a transaction to update animals (species column)
BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'; 
UPDATE animals SET species = 'pokemon' WHERE species IS NULL; 
COMMIT;
SELECT species from animals;

-- Inside a transaction delete all records in the animals;
BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Inside a transaction Delete all animals born after JAN-01-2022;
BEGIN TRANSACTION;
DELETE FROM animals WHERE  date_of_birth > '2022-01-01';
SAVEPOINT SAVEPOINT_1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT_1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 
COMMIT;
SELECT weight_kg FROM animals;

-- Animals number
SELECT COUNT(*) FROM animals;

-- Number of Animals never tried to escaped
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- Avergae weight of animals
SELECT ROUND(AVG(weight_kg), 2) FROM animals;

-- Who escapes the most
SELECT name, escape_attempts from animals WHERE escape_attempts = (select MAX(escape_attempts) from animals);

-- Minimum and maximum weight of each type of animal
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- Average number of escape attempts per animal type of those born between 1990 and 2000
SELECT species, ROUND(AVG(escape_attempts), 2) FROM animals
WHERE date_of_birth BETWEEN DATE '1990-01-01' AND '2000-12-31' GROUP BY species;


-- What animals belong to Melody Pond?
SELECT name FROM animals
JOIN owners ON animals.owner_id = owners.id 
WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.*, species.name AS pokemon_type FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name AS animal_name, owners.fulL_name AS owner_name FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name AS species_name, COUNT(*) FROM animals
JOIN species ON species.id = animals.species_id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name as animal_name, owners.full_name AS owner_name, species.name AS species_name 
from animals
JOIN species ON species.id = animals.species_id
JOIN owners ON owners.id = animals.owner_id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * from animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) AS num_animals
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY num_animals DESC;


/* last Milestone  */

-- Write queries to answer the following:


-- Who was the last animal seen by William Tatcher?
SELECT animals.name, vets.name, visits.date_of_visit FROM vets
JOIN visits ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(*) as num_animals_visited FROM vets
JOIN visits ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name AS specialized_in FROM vets
LEFT JOIN specializations ON specializations.vets_id = vets.id
LEFT JOIN  species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name AS animal_name, visits.date_of_visit FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit >= '2020-04-01' AND visits.date_of_visit <= '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) AS count FROM animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY animals.name
ORDER BY count DESC
LIMIT 1;

-- -- Who was Maisy Smith's first visit?
SELECT vets.name, visits.date_of_visit, animals.name FROM visits 
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit
LIMIT 1;


