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

-- 