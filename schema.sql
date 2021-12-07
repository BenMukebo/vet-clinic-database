/* Database schema to keep the structure of entire database. */

DROP TABLE animals;

CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempt INT,
	neutered BOOLEAN NOT NULL,
	weight_kg DECIMAL(10, 2) NOT NULL,
	species varchar(100)
);

CREATE TABLE owners (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	age INT NOT NULL
);

CREATE TABLE species (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id BIGINT REFERENCES species (id);
ALTER TABLE animals ADD owner_id BIGINT REFERENCES owners (id);

/* last Milestone  */

CREATE TABLE vets (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	age INT NOT NULL,
	date_of_graduation DATE
);

CREATE TABLE specializations (
	species_id BIGINT REFERENCES species (id),
	vets_id BIGINT REFERENCES vets (id)
);

CREATE TABLE visits (
	animals_id BIGINT REFERENCES animals (id),
	vets_id BIGINT REFERENCES vets (id),
	date_of_visit DATE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animals_id_asc on visits (animals_id ASC);
CREATE INDEX vets_id_asc on visits (vets_id);
CREATE INDEX email_id on owners(email ASC); 
