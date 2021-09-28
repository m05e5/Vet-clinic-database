/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where date > '2016-01-01' AND date < '2019-12-30';
select name from animals where neutered = true AND escape_attempts < 3;
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';
select name, escape_attempts from animal where weight_kg > 10.5;

