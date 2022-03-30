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
