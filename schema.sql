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

-- PROJECT 4

-- Create table named vets
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY (id)
);

-- Create a join table between vets and species tables and name it specializations

ALTER TABLE vets
add UNIQUE (name);
ALTER TABLE species
ADD UNIQUE (name);
CREATE TABLE specializations (
    id int GENERATED ALWAYS AS IDENTITY,
    vet_name varchar(255),
    species_name varchar(100),
    FOREIGN KEY (vet_name) REFERENCES vets (name),
    FOREIGN KEY (species_name) REFERENCES species (name),
    PRIMARY KEY (id)
);

-- Create a join table between vets and animals table and name it visits
ALTER TABLE animals
add UNIQUE (name);
CREATE TABLE visits (
    id int GENERATED ALWAYS AS IDENTITY,
    animal_name varchar(100),
    vet_name varchar(255),
    visit_date DATE,
    FOREIGN KEY (animal_name) REFERENCES animals(name),
    FOREIGN KEY (vet_name) REFERENCES vets (name),
    PRIMARY KEY (id)
);

