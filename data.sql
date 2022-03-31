/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11.00);

-- PROJECT 2

-- Inserting more data in the animals table as in second project
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, -5.70);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.40);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22.00);

-- PROJECT 3

-- Inserting data into owners table
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- Inserting data into species table
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');


-- modify animals table to include species_id
UPDATE animamls
SET species_id = (
    SELECT id from species WHERE id = 2
)
WHERE name LIKE '%mon';

-- modify animals table to include species_ for remaining animals
UPDATE animamls
SET species_id = (
    SELECT id from species WHERE id = 1
)
WHERE species_id IS NULL;

-- modify animals table to include owner_id from the owners table's id column
update animals
set owner_id = (
    SELECT id from owners WHERE full_name = 'Sam Smith'
)
WHERE name = 'Agumon';

update animals
set owner_id = (
    SELECT id from owners WHERE full_name = 'Jennifer Orwell'
)
WHERE name IN ('Gabumon', 'Pikachu');

update animals
set owner_id = (
    SELECT id from owners WHERE full_name = 'Bob'
)
WHERE name IN ('Devimon', 'Plantmon');

update animals
set owner_id = (
    SELECT id from owners WHERE full_name = 'Melody Pond'
)
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

update animals
set owner_id = (
    SELECT id from owners WHERE full_name = 'Dean Winchester'
)
WHERE name IN ('Angemon', 'Boarmon');

-- PROJECT 4

-- Insert data into the vets table

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

-- Insert data into specializations table
INSERT INTO specializations (vet_name, species_name) VALUES ('William Tatcher', 'Pokemon');
INSERT INTO specializations (vet_name, species_name) VALUES ('Stephanie Mendez', 'Digimon');
INSERT INTO specializations (vet_name, species_name) VALUES ('Stephanie Mendez', 'Pokemon');
INSERT INTO specializations (vet_name, species_name) VALUES ('Jack Harkness', 'Digimon');

-- Insert data into visits table
INSERT INTO visits (animal_name, vet_name, visit_date) VALUES ('Agumon', 'William Tatcher', '2020-05-24'), ('Agumon', 'Stephanie Mendez', '2020-07-22'), ('Gabumon', 'Jack Harkness', '2021-02-02'), ('Pikachu', 'Maisy Smith', '2020-01-05'), ('Pikachu', 'Maisy Smith', '2020-03-08'), ('Pikachu', 'Maisy Smith', '2020-05-14');
INSERT INTO visits (animal_name, vet_name, visit_date) VALUES ('Devimon', 'Stephanie Mendez', '2021-05-04'), ('Charmander', 'Jack Harkness', '2021-02-24'), ('Plantmon', 'Maisy Smith', '2019-21-12'), ('Plantmon', 'William Tatcher', '2020-08-10'), ('Plantmon', 'Maisy Smith', '2021-04-07'), ('Squirtle', 'Stephanie Mendez', '2019-09-21');
INSERT INTO visits (animal_name, vet_name, visit_date) VALUES ('Angemon', 'Jack Harkness', '2020-10-03'), ('Angemon', 'Jack Harkness', '2020-11-04'), ('Boarmon', 'Maisy Smith', '2019-01-24'), ('Boarmon', 'Maisy Smith', '2019-05-15'), ('Boarmon', 'Maisy Smith', '2020-02-27'), ('Boarmon', 'Maisy Smith', '2020-08-03');
INSERT INTO visits (animal_name, vet_name, visit_date) VALUES ('Blossom', 'Stephanie Mendez', '2020-05-24'), ('Blossom', 'William Tatcher', '2021-01-11');





