CREATE TABLE animals (
    id integer PRIMARY KEY NOT NULL,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg decimal NOT NULL
);

ALTER TABLE animals ADD COLUMN species varchar;

CREATE TABLE owners (
    id integer PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100) NOT NULL,
    age integer
);

CREATE TABLE species (
    id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(100) NOT NULL
);

ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE animals DROP COLUMN IF EXISTS species;

ALTER TABLE animals 
ADD COLUMN species_id integer,
ADD COLUMN owner_id  integer;

ALTER TABLE animals
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals
ADD CONSTRAINT fk_owner FOREIGN KEY(owner_id) REFERENCES owners(id);

-- Create a table named vets
CREATE TABLE vets (
    id            INT GENERATED ALWAYS AS IDENTITY,
    name          VARCHAR(100),
    age           INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

-- Create a join table named specializations
CREATE TABLE specializations (
    vets_id        INT,
    species_id     INT, 
    PRIMARY KEY(vets_id, species_id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id)
);

-- Create a join table named visits
CREATE TABLE visits (
    animals_id    INT,
    vets_id       INT,
    date_of_visit DATE, 
    PRIMARY KEY(animals_id, vets_id, date_of_visit),
    CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);
