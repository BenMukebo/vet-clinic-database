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





-- Adding a new columnn species to type string to the animals table
ALTER TABLE animals
ADD COLUMN species VARCHAR(100)

-- Inside a transaction update the animals table (species column)
BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals; -- Check the change was made
ROLLBACK;
SELECT species FROM animals; -- Check species columns went back

-- Inside a transaction to update animals (species column)
BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'; 
UPDATE animals SET species = 'pokemon' WHERE species IS NULL; 
