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