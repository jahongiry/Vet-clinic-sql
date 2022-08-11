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





