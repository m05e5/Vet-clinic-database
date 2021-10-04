/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    ID integer GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY (ID)
);

CREATE TABLE owners (
  ID integer GENERATED ALWAYS AS IDENTITY,
  full_name varchar(255),
  age integer,
  PRIMARY KEY (ID)
);

CREATE TABLE species (
ID integer GENERATED ALWAYS AS IDENTITY,
name varchar(255),
PRIMARY KEY (ID)
);

ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id); 
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    ID integer GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    age integer,
    date_of_graduation date;
    PRIMARY KEY (ID)
);

CREATE TABLE specialization(
    ID integer GENERATED ALWAYS AS IDENTITY,
    species_id integer,
    vets_id integer,
    FOREIGN KEY(species_id) REFERENCES species (id),
    FOREIGN KEY(vets_id) REFERENCES vets (id),
    PRIMARY KEY(ID)
);

CREATE TABLE visits(
    id integer GENERATED ALWAYS AS IDENTITY,
    animals_id integer,
    vet_id integer,
    date date,
    FOREIGN KEY(animals_id) REFERENCES animals (id),
    FOREIGN KEY(vet_id) REFERENCES vets (id),
    PRIMARY KEY(id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- optimise table visits by creating an index column with animal id

CREATE INDEX animals_id_asc ON visits (
  animals_id ASC
);

-- optimise table visits by creating an index column with vets_id

CREATE INDEX vets_id_asc ON visits (
  vet_id ASC
);

CREATE INDEX owners_email_asc ON owners (
  email ASC
);
