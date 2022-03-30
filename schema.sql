/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);


-- Add the species column which is a string data type tp the animals table
ALTER TABLE animals
ADD species VARCHAR(255);

-- PROJECT 3

-- Create the owners table
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age INT,
    PRIMARY KEY(id)
);

-- Create the species table
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    PRIMARY KEY(id)
);

-- Removing column species in the animals table
ALTER TABLE animals
DROP COLUMN species;

-- Add species_id as foreign key in animals table
ALTER TABLE animals
ADD species_id INT;
ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species(id);

-- add owner_id as foreign key in animals table
ALTER TABLE animals
ADD owner_id INT;
ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

