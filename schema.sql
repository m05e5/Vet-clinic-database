/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer AUTO_INCREMENT PRIMARY KEY
    name varchar(100)
    date_of_birth date
    escape_attempts integer
    neutered boolean
    weight_kg decimal
    species varchar(100) DEFAULT 
);
