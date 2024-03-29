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

-- how many animals are there?
SELECT COUNT(*) FROM animals;

-- how many animals have never trie to escape?
SELECT COUNT(escape_attempts) FROM animals
WHERE escape_attempts = 0;

-- what is the average weight of animals?
SELECT AVG(weight_kg) from animals;

-- who escapes the most, neutered or non-neutered animals?--it is neutered animals
SELECT neutered, SUM(escape_attempts) from animals
GROUP BY neutered;

-- what is the minimum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) from animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) from animals
WHERE date_of_birth >= '1990-01-01' and date_of_birth <= '2000-12-31'
GROUP BY species;


-- PROJECT 3

-- Querries to answer different questions using JOIN

-- What animals owned by Melody Pond 
SELECT name FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

-- list of animals with animal type = Pokemon
SELECT A.name AS animal_names FROM animals A
JOIN species S ON S.id = A.species_id
WHERE S.name = 'Pokemon';

-- list of all owners and their animals
SELECT O.full_name, A.name from owners O
left JOIN animals A on O.id = A.owner_id;

-- how many animals are there per type
SELECT COUNT(A.name), S.name AS species_name from animals A
JOIN species S ON S.id = A.species_id
GROUP BY S.name;

-- list all digimon owned by Jennifer Orwell
SELECT A.name from animals A
JOIN owners O ON O.id = A.owner_id
WHERE O.full_name = 'Jennifer Orwell' AND A.species_id = (SELECT id FROM species WHERE id = 2);

-- List animals owned by Dean Winchester that haven't trie to escape
SELECT A.name from animals A
JOIN owners O ON O.id = A.owner_id
WHERE O.full_name = 'Dean Winchester' AND A.escape_attempts = 0;

-- who owns many animals?-- Its Melody Pond
SELECT O.full_name, COUNT(A.name) as total_owned from owners O
left JOIN animals A ON A.owner_id = O.id
GROUP BY O.full_name
ORDER BY COUNT(A.name) DESC;

-- PROJECT 4

-- Who was the last name visited by William Tatcher?
SELECT A.name, MAX(visit_date) as last_date_visited from animals A
JOIN visits ON A.name = visits.animal_name
JOIN vets on vets.name = visits.vet_name
WHERE vets.name = 'William Tatcher'
GROUP BY A.name
ORDER BY last_date_visited DESC
limit 1;

-- how many different animals did Stephanie see?
SELECT COUNT(DISTINCT A.name) as sum_visited from animals A
JOIN visits on A.name = visits.animal_name
JOIN vets on vets.name = visits.vet_name
WHERE vets.name = 'Stephanie Mendez';

-- list all vets and their specialities

SELECT V.name, S.name as speciality from vets V
left JOIN specializations C on V.name = C.vet_name
left JOIN species S ON S.name = C.species_name;

-- list of animals visited Stephanie between april 2020 and august 2020
SELECT A.name AS animal_names from animals A
JOIN visits ON A.name = visits.animal_name
JOIN vets ON vets.name = visits.vet_name
WHERE vets.name = 'Stephanie Mendez' AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- animal which has most visits to the vets
SELECT A.name, COUNT(A.name) as visit_times FROM animals A
JOIN visits V ON A.name = V.animal_name
JOIN vets ON vets.name = V.vet_name
GROUP BY A.name
ORDER BY visit_times DESC
limit 1;

-- who was Maisy Smith first visit?
SELECT A.name, MAX(visit_date) as first_visit_date from animals A
JOIN visits V ON A.name = V.animal_name
JOIN vets on vets.name = V.vet_name
WHERE vets.name = 'Maisy Smith'
GROUP BY A.name
ORDER BY first_visit_date ASC
limit 1;

-- details for most recent visit
SELECT A.name AS animal_name, A.date_of_birth, A.neutered, A.escape_attempts,V.name AS vet_name, V.age, V.date_of_graduation, MAX(visit_date) as date_visited FROM animals A
JOIN visits ON A.name = visits.animal_name
JOIN vets V ON V.name = visits.vet_name
GROUP BY A.name, A.date_of_birth, A.neutered, A.escape_attempts,V.name, V.age, V.date_of_graduation
ORDER BY date_visited DESC
limit 1;

-- how many visits made by the vet who didn't specialize in any type
SELECT V.name AS vet_name, COUNT(visits.animal_name) AS number_of_visits from vets V
left JOIN specializations C ON V.name = C.vet_name
left JOIN visits ON visits.vet_name = V.name
WHERE C.species_name IS NULL
GROUP BY V.name, C.species_name;

-- What specialty should Maisy specialise in?
SELECT COUNT(A.name) AS animal_visited, S.name as animal_type FROM animals A
JOIN visits ON A.name = visits.animal_name
JOIN species S ON S.id = A.species_id
WHERE visits.vet_name = 'Maisy Smith'
GROUP BY S.name, visits.vet_name
ORDER BY COUNT(A.name) DESC;