/*Queries that provide answers to the questions from all projects.*/
-- querries for all animals which ends with mon
SELECT * FROM animals WHERE name LIKE '%mon';

-- query for all animals born between 2016 and 2019
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';

-- query for all animals which are neutered and have escape attempts less than three
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

-- querry for date of birth for animals named Agumon and Pikachu

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name= 'Pikachu';

-- querry for name and escape attempts of animals that weight more than 10.5kg

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.50;
--  Find all animals that are neutered

SELECT * FROM animals WHERE neutered = true;

-- Find all animals that are not named Gabumon

SELECT * FROM animals WHERE name NOT IN ('Gabumon');

--  Find all animals with weight between 10.4kg and 17.3 kg(extremities included)

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


-- PROJECT 2 QUERRIES

-- transaction to set the species column to unspecified, verify the change and then roll back to undo the instruction made

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- transaction to set species column to digimon and pokemon, commit the changes, delete all the records and then roll back

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE from animals;
ROLLBACK;
SELECT * from animals;

-- transaction to delete and update animals whose weight is negative to positive
BEGIN;
DELETE from animamls
WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO sp1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;


-- Querries to answer various questions