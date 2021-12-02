/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
-- SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
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
SELECT species FROM animals; -- check the change was made
ROLLBACK;
SELECT species FROM animals; -- check species columns went back

-- Inside a transaction to update animals (species column)
BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'; 
UPDATE animals SET species = 'pokemon' WHERE species IS NULL; 
SELECT * FROM animals; -- Check
COMMIT;
SELECT species from animals; -- check the change persists
END;

-- Inside a transaction delete all records in the animals;
BEGIN TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals; -- Check
ROLLBACK;
SELECT * FROM animals; -- check if all records still exist

-- Inside a transaction Delete all animals born after JAN-01-2022;
BEGIN TRANSACTION;
DELETE FROM animals WHERE  date_of_birth > '2022-01-01';

SAVEPOINT SAVEPOINT_1;

UPDATE animals SET weight_kg = weight_kg * -1;
SELECT weight_kg FROM animals; -- check



