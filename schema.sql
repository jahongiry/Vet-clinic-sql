CREATE TABLE animals (
    id integer PRIMARY KEY NOT NULL,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg decimal NOT NULL
);

ALTER TABLE animals ADD COLUMN species varchar;
