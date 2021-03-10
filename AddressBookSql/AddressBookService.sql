--UC1:Create Addressbook Database
CREATE DATABASE AddressBookservice;
use AddressBookservice;

--UC2:Create addressBook table
CREATE TABLE AddressBookservice
(
ID				int identity(1, 1)  PRIMARY KEY,
FirstName		varchar(55),
LastName		varchar(55),
Address			varchar(100),
City			varchar(40),
State			varchar(40),
Zip				int,
PhoneNumber	    varchar(14),
Email			varchar(50),


)


--UC3:Ability to add new contact
INSERT INTO AddressBookservice(FirstName, LastName, Address, City, State, Zip, PhoneNumber, Email)VALUES
('Ajinkya', 'Patil', 'Ghatkopar', 'Mumbai', 'Maharashtra', '400075', '8806184089', 'patil@gmail.com'),
('Sachin', 'Shinde', 'Vikroli', 'Mumbai', 'Maharashtra', '400087', '8806184087', 'shinde@gmail.com'),
('Priya', 'kale', 'Gokhalenagr', 'Pune', 'Maharashtra', '411016', '8806184085', 'kale@gmail.com'),
('sneha', 'kulkarni', 'Bandra', 'Mumbai', 'Maharashtra', '400154', '8806184082', 'kulkarni@gmail.com'),
('Pratiksha', 'kare', 'Kothrude', 'Pune', 'Maharashtra', '4110343', '9702420754', 'pratiksha@gmail.com');
alter table AddressBookservice ADD Country varchar (10);
update AddressBookservice set Country = 'India';


--UC4:Ability to  edit contact
UPDATE AddressBookservice SET PhoneNumber = '9969818133' WHERE FirstName = 'Ajinkya'
SELECT * FROM AddressBookservice;

--UC5:Ability to delete using name
DELETE FROM AddressBookservice WHERE FirstName = 'Ajinkya';
SELECT * FROM AddressBookservice;

--UC6:Retrive the data from city and state
SELECT * FROM AddressBookservice WHERE City = 'Mumbai';
SELECT * FROM AddressBookservice WHERE State = 'Maharashtra';

--UC7:Ability to understand the size
SELECT CITY, COUNT(CITY) AS CITY_COUNT FROM AddressBookservice GROUP BY City;
SELECT STATE, COUNT(STATE) AS STATE_COUNT FROM AddressBookservice GROUP BY State;
