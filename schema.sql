/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL PRMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL NOT NULL
);
