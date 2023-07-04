/* 
    RELATIONAL DATABASE CERTIFICATION | PROJECT #2 | FreeCodeCamp
    Relational Database with PostgreSQL: 
    Building a Mario Database
*/

--psql --username=freecodecamp --dbname=postgres
-- Type \l into the prompt to list databases
-- \l

--Create a new database
CREATE DATABASE first_database;

--Create another database
CREATE DATABASE second_database;

--connect to a database by entering \c database_name
-- \c second_database

--enter \d to show relations or tables
-- \d 

-- Create a table named first_table in second_database
CREATE TABLE first_table();

--View the tables in the second database
-- \d

-- Create another new table in this database. Give it a name of second_table.
CREATE TABLE second_table();

-- There should be two tables in this database now. Display them again to make sure.
-- \d 

-- You can view more details about a table by adding the table name after the display 
--command like this: \d table_name. View more details about your second_table
-- \d second_table

--Add a column to second_table named first_column. Give it a data type of INT. INT stands for integer. 
ALTER TABLE second_table 
ADD COLUMN  first_column INTEGER;

-- Display the details of second_table again to see if your new column is there.
-- \d second_table

-- Use ALTER TABLE and ADD COLUMN to add another column to second_table named id that's a type of INT.
ALTER TABLE second_table
ADD COLUMN id INTEGER;

--Add another column to second_table named age. Give it a data type of INT.
ALTER TABLE second_table ADD COLUMN age INTEGER;

-- Drop your age column.
ALTER TABLE second_table DROP COLUMN age;

--Use the ALTER TABLE and DROP COLUMN keywords again to drop first_column.
ALTER TABLE second_table DROP COLUMN first_column;

--Add a new column to second_table, give it a name of name and a data type of VARCHAR(30).
 ALTER TABLE second_table ADD COLUMN name VARCHAR(30);

 --Rename the name column to username.
 ALTER TABLE second_table RENAME COLUMN name TO username;

 --Insert a row into second_table. Give it an id of 1, and a username of Samus. 
 --The username column expects a VARCHAR, so you need to put Samus in single quotes like this: 'Samus'.
INSERT INTO second_table(id, username) VALUES(1, 'Samus');

--Use a SELECT statement to view all the columns in second_table. 
SELECT * FROM second_table;

--Fill in the id and username columns with the values 2 and 'Mario'.
INSERT INTO second_table(id, username) VALUES(2, 'Mario');

--You should now have two rows in the table. Use SELECT again to view all the columns and rows from second_table.
SELECT * FROM second_table;

--Insert another row into second_table. Use 3 as the id, and Luigi as the username this time.
INSERT INTO second_table(id, username) VALUES(3, 'Luigi');

--You should now have three rows. Use SELECT again to see all the data you entered.
SELECT * FROM second_table;

--Remove Luigi from your table. The condition you want to use is username='Luigi'.
DELETE FROM second_table 
WHERE username='Luigi';

--Luigi should be gone. Use SELECT again to see all the data and make sure he's not there.
SELECT * FROM second_table;

--Delete Mario from second_table using the same command as before.
DELETE FROM second_table WHERE username='Mario';

--Delete Samus from second_table.
DELETE FROM second_table WHERE username='Samus';

--Confirm that all rows were deleted
SELECT * FROM second_database;

-- Remind yourself what columns you have in second_table by looking at its details.
-- \d 

--Alter the table second_table and drop the column username.
ALTER TABLE second_table 
DROP COLUMN username;

--Next drop the id column 
ALTER TABLE second_table
DROP COLUMN id;

--review the tables in this database
--\d

-- Drop second_table from your database.
DROP TABLE second_table;

-----   25% CHECKPOINT  -----

-- Next, drop first_table from the database.
DROP TABLE first_table;


-- All the tables are gone now, too. View all the databases using the command to list them.
-- \l

-- Rename first_database to mario_database
ALTER DATABASE first_database RENAME TO mario_database;

-- Connect to your newly named database so you can start adding your characters.
-- \c mario_database

-- Now that you aren't connected to second_database, you can drop it. Use the DROP DATABASE
DROP DATABASE second_database;

-- \l (list databases)
-- \d (show tables/relations)

--Create first table
CREATE TABLE characters();

--Next, you can add some columns to the table. 
--Add a column named character_id to your new table that is a type of SERIAL.
ALTER TABLE characters ADD COLUMN character_id SERIAL;

/*
The SERIAL type will make your column an INT with a NOT NULL constraint, and automatically 
increment the integer when a new row is added. View the details of the characters table to 
see what SERIAL did for you.
*/
-- \d characters 

--Add a column to characters called name. Give it a data type of VARCHAR(30), and a constraint of NOT NULL.
ALTER TABLE characters ADD COLUMN name VARCHAR(30) NOT NULL;

-- You can make another column for where they are from. Add another column named homeland. 
-- Give it a data type of VARCHAR that has a max length of 60.
ALTER TABLE characters ADD COLUMN homeland VARCHAR(60);

--Add one more column named favorite_color. Make it a VARCHAR with a max length of 30.
ALTER TABLE characters ADD COLUMN favorite_color VARCHAR(30);

-- review table
-- \d characters

-- Add a row to your table, give it a name of Mario, a homeland of Mushroom Kingdom, and a favorite_color of Red.
INSERT INTO characters(name, homeland, favorite_color) VALUES('Mario', 'Mushroom Kingdom', 'Red');

-- View all the data in your characters table
SELECT * FROM characters;

--Add another row for Luigi. Give it a name of Luigi, a homeland of Mushroom Kingdom, and a favorite_color of Green.
INSERT INTO characters(name, homeland, favorite_color) VALUES('Luigi', 'Mushroom Kingdom', 'Green');

-- Add another character:
INSERT INTO characters(name, homeland, favorite_color) VALUES('Peach', 'Mushroom Kingdom', 'Pink');

/*Add two more rows. Give the first one the values: Toadstool, Mushroom Kingdom, and Red. Give the 
second one: Bowser, Mushroom Kingdom, and Green. Try to add them with one command.*/
INSERT INTO characters(name, homeland, favorite_color) VALUES('Toadstool', 'Mushroom Kingdom', 'Red'), ('Bowser', 'Mushroom Kingdom', 'Green');

/*Add two more rows. Give the first one the values: Daisy, Sarasaland, and Yellow. The second: Yoshi, Dinosaur Land, and Green.*/
INSERT INTO characters(name, homeland, favorite_color) VALUES('Daisy', 'Sarasaland', 'Yellow'), ('Yoshi', 'Dinosaur Land', 'Green');

-- Take a look at all the data in your table

SELECT * FROM characters;

--SET Daisy's favorite_color to Orange.
UPDATE characters SET favorite_color='Orange' WHERE name='Daisy';

--Change 'Toadstool' to 'Toad'
UPDATE characters SET name='Toad' WHERE favorite_color = 'Red';

--. Use UPDATE to set the name to Mario for the row with the lowest character_id.
UPDATE characters SET name='Mario' WHERE character_id = 1;

--Take a look at all the data in your table again to see if Mario's name got changed back.
SELECT * FROM characters;

-- Toad's favorite color is wrong. He likes blue. Change Toad's favorite color to Blue. 
UPDATE characters SET favorite_color='Blue' WHERE character_id = 4;

-- Bowser's favorite_color is wrong. He likes Yellow.
UPDATE characters SET favorite_color='Yellow' WHERE character_id= 5;

-- Bowser's homeland is wrong as well. He's from the Koopa Kingdom. Why don't you change it to that without changing any other rows?
UPDATE characters SET homeland='Koopa Kingdom' WHERE character_id= 5;

-- Take a look at all the data in your table
SELECT * FROM characters;

--View all the data again, but put it in order by character_id.
SELECT * FROM characters ORDER BY character_id;

-- Next, you are going to add a primary key.
--The name column is pretty unique, why don't you set that as the primary key for this table.
ALTER TABLE characters ADD PRIMARY KEY(name);

--Drop the primary key on the name column
ALTER TABLE characters DROP CONSTRAINT characters_pkey;

-- Set the primary key again, but use the character_id column this time.
ALTER TABLE characters ADD PRIMARY KEY(character_id);


