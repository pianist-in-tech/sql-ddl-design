-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  orbits_around TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_id INTEGER REFERENCES orbits,
  galaxy TEXT NOT NULL,
  moons TEXT[]
);

INSERT INTO orbits
  (orbits_around)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_id, galaxy, moons)
VALUES
  ('Earth', 1.00, '1', 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, '1', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, '1', 'Milky Way', '{}'),
  ('Neptune', 164.8, '1', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, '2', 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23,  '3', 'Milky Way', '{}');
