/* Database schema to keep the structure of entire database. */

-- DAY ONE
CREATE TABLE animals (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL NOT NULL
);


-- DAY TWO
DROP TABLE animals;

CREATE TABLE animals (
id BIGSERIAL PRIMARY KEY NOT NULL,
name VARCHAR(100) NOT NULL,
species VARCHAR(50),
date_of_birth DATE NOT NULL,
weight_kg DECIMAL NOT NULL,
neutered BOOLEAN NOT NULL,
escape_attempts INT NOT NULL);

-- DAY 3
DROP TABLE animals;
DROP TABLE owners;
DROP TABLE species;

CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    full_name VARCHAR(100),
    age INT
);

CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE animals (
id BIGSERIAL PRIMARY KEY NOT NULL,
name VARCHAR(100) NOT NULL,
species_id INT REFERENCES species(id),
owner_id INT REFERENCES owners(id),
date_of_birth DATE NOT NULL,
weight_kg DECIMAL NOT NULL,
neutered BOOLEAN NOT NULL,
escape_attempts INT NOT NULL);


