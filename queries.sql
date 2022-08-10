SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = 't';
SELECT * from animals WHERE name <> 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species ='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species ='pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

SELECT * FROM animals

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO delete;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(escape_attempts), neutered  FROM animals GROUP BY neutered;
SELECT MAX(weight_kg) AS maximum_weight, MIN(weight_kg) AS minimum_weight, species FROM animals GROUP BY species;
SELECT AVG(escape_attempts), species FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
