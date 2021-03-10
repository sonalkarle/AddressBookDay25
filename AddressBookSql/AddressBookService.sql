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
