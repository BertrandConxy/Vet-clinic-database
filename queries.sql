/*Queries that provide answers to the questions from all projects.*/
-- querries for all animals which ends with mon
SELECT * FROM animals WHERE name LIKE '%mon';

-- query for all animals born between 2016 and 2019
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

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
