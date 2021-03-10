--UC7:Ability to understand the size
SELECT CITY, COUNT(CITY) AS CITY_COUNT FROM AddressBookservice GROUP BY City;
SELECT STATE, COUNT(STATE) AS STATE_COUNT FROM AddressBookservice GROUP BY State;



