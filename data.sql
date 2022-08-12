INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
(1, 'Agumon', '2020-02-03', 0, TRUE, 10.23),
(2, 'Gabumon', '2018-11-15', 2, TRUE, 8),
(3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04),
(4, 'Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES
(5, 'Charmander', '2020-02-08', -11, FALSE, 0),
(6, 'Plantmon', '2021-11-15', -5.7, TRUE, 2),
(7, 'Squirtle', '1993-04-02', -12.13, FALSE, 3),
(8, 'Angemon', '2005-06-12', -45, TRUE, 1),
(9, 'Boarmon', '2005-06-07', 20.4, TRUE, 7),
(10, 'Blossom', '1998-10-13', 17, TRUE, 3),
(11, 'Ditto', '2022-05-14', 22, TRUE, 4);

/* Owner's table data */
INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

/* Species's table data */
INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

/* Update the owner_id in animals */
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN( 'Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN( 'Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN( 'Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN( 'Angemon', 'Boarmon');

-- Insert data for vets:
INSERT INTO vets (name, age, date_of_graduation )
VALUES 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17');
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

-- Insert data for specialties:
INSERT INTO specializations (vets_id, species_id ) 
VALUES 
( 1, 1),
( 3, 1),
( 3, 2),
( 4, 2);

-- Insert data for visits:
INSERT INTO visits (animals_id, vets_id, date_of_visit ) 
VALUES 
( 1, 1, '2020-05-24'),
( 1, 3, '2020-07-22'),
( 2, 4, '2021-02-02'),
( 3, 2, '2020-01-05'),
( 3, 2, '2020-03-08'),
( 3, 2, '2020-05-14'),
( 4, 3, '2021-05-04'),
( 5, 4, '2021-02-24'),
( 6, 2, '2019-12-21'),
( 6, 1, '2020-08-10'),
( 6, 2, '2021-04-07'),
( 7, 3, '2019-09-29'),
( 8, 4, '2020-10-03'),
( 8, 4, '2020-11-04'),
( 9, 2, '2019-01-24'),
( 9, 2, '2019-05-15'),
( 9, 2, '2020-02-27'),
( 9, 2, '2020-08-03'),
( 10, 3, '2020-05-24'),
( 10, 1, '2021-01-11');
