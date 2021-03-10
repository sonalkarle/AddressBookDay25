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
alter table AddressBookservice  Add  Country varchar (20);

-







--UC9:Ability to find name and type
ALTER table AddressBookservice ADD Type VARCHAR(20);
SELECT * FROM AddressBookservice;
UPDATE AddressBookservice SET Type = 'FRIENDS';
UPDATE AddressBookservice SET Type = 'FAMILY' WHERE FirstName = 'Sachin' or FirstName = 'sneha';
UPDATE AddressBookservice SET Type = 'PROFESSION' WHERE FirstName = 'Ajinkya';
SELECT * FROM AddressBookservice;


--UC10:Ability to get  number of contact person
SELECT Type, COUNT(*) AS TYPE_COUNT FROM AddressBookservice GROUP BY Type;

--UC11:Ability to add in both family and friend
INSERT INTO  AddressBookservice (FirstName, LastName, Address, City, State, Zip, PhoneNumber, Email , Type)VALUES
('Sachin', 'Shinde', 'Vikroli', 'Mumbai', 'Maharashtra', '40007', '8806184087', 'shinde@gmail.com', 'FRIENDS');

--UC12:Ability to create ER diagram
CREATE table ContactType(
ID		int identity(1, 1),
Type varchar(20),
Constraint TypePrimaryKey PRIMARY KEY(ID)
);

INSERT INTO ContactType select Type from AddressBookservice ;

select * from ContactType;
alter table AddressBookservice drop column Type;

Create table country(
ID int Identity(1,1),
Country varchar(20),
Constraint CountryPrimayKay PRIMARY KEY (ID)
);
Insert into country select Country from AddressBookservice;
select * from country;
alter table AddressBookservice drop column Country;

Create table FullAddress(
ID int Identity (1,1),
Address varchar (20),
City varchar (10),
State Varchar (20),
Zip int 
constraint Company_foreign_Key_EmpID foreign key(ID) references Emppayroll(ID) on delete cascade
);
Insert into FullAddress select Address, City,State,Zip from AddressBookservice;
select * from FullAddress;
alter table AddressBookservice drop column Address,City,State,Zip;


--UC13:Ability to perform the other functionality
SELECT CITY, COUNT(CITY) AS CITY_COUNT FROM FullAddress,AddressBookservice where FullAddress.Id=AddressBookservice.ID GROUP BY City;
SELECT State, COUNT(State) AS State_COUNT FROM FullAddress,AddressBookservice where FullAddress.Id=AddressBookservice.ID GROUP BY State;


SELECT Type, COUNT(*) AS TYPE_COUNT FROM ContactType, AddressBookservice where ContactType.ID = AddressBookservice.ID GROUP BY Type;


select AddressBookservice.ID,firstName,lastName,Email,PhoneNumber,Address,
	   City,State,zip,Country
 from AddressBookservice, ContactType,FullAddress,Country
where AddressBookservice.ID = ContactType.ID and
      AddressBookservice.ID = FullAddress.ID and
	  AddressBookservice.ID = Country.ID; 

use AddressBookservice;
select * from AddressBookservice

select City from FullAddress where ID = (select ID from AddressBookservice where FirstName = 'Ajinkya')
select state from FullAddress where ID = (select ID from AddressBookservice where FirstName = 'Ajinkya')

SELECT * FROM AddressBookservice ORDER BY FirstName;

