/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = 't';
SELECT * from animals WHERE name <> 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Update the animals table by setting the species column to unspecified then Rollback.
BEGIN;

UPDATE animals SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;

-- Start transaction
BEGIN;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals SET species ='digimon' WHERE name LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species ='pokemon' WHERE species IS NULL;

-- Commit the transaction.
COMMIT;

-- Delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;

SELECT * FROM animals


-- Start transaction
BEGIN;

-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction.
SAVEPOINT delete;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals
UPDATE animals SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint
ROLLBACK TO delete;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

-- Commit transaction
COMMIT;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals
SELECT COUNT(escape_attempts), neutered  FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT MAX(weight_kg) AS maximum_weight, MIN(weight_kg) AS minimum_weight, species FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts), species FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- JOIN queries one to many ralationship

-- What animals belong to Melody Pond?
SELECT name,full_name FROM animals JOIN owners ON owners.id = owner_id and owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon)
SELECT animals.name as Pokemons FROM animals JOIN species ON species.id = species_id and species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name as Owners,animals.name as Animals FROM owners FULL OUTER JOIN animals ON owners.id = owner_id;

-- How many animals are there per species?
SELECT species.name AS species,count(species_id) FROM species JOIN animals ON species.id = species_idGROUP BY species;

-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name as Owners,animals.name as Animals FROM owners
  INNER JOIN  species ON  owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon'
  INNER JOIN  animals ON owners.id = owner_id AND species.id = species_id;
  
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT owners.full_name as Owners,animals.name as Animals FROM owners 
JOIN  animals ON   Owners.id = owner_id 
                AND owners.full_name = 'Dean Winchester' 
                AND animals.escape_attempts = 0;
                
-- Who owns the most animals?
SELECT owners.full_name AS Owners,count(*) FROM owners
  JOIN  animals ON  owners.id = owner_id
  GROUP BY Owners ORDER BY count DESC LIMIT 1;
