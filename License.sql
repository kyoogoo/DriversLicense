-- license.sql
--
-- Author(s):   Daniel Choo, Ryan Hagedorn
-- Date:        11/20/20
-- URL:         https://www.github.com/kyoogoo/TBD-491
--
-- Description: This creates a master drivers license table which information such as the 
--              picture, drivers id, first/last name, address, et cetera of the driver can
--              be accessed due to a unique identifier.

#CREATE DATABASE DriversLicense;
USE DriversLicense;

CREATE TABLE License (
	UID VARCHAR(50) NOT NULL,
	Picture VARCHAR(50) NOT NULL,
	DriverID INT UNIQUE NOT NULL,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	State VARCHAR(20) NOT NULL,
	ZipCode MEDIUMINT NOT NULL,
	DOB DATE NOT NULL,
	IssueDate DATE NOT NULL,
	ExpireDate DATE NOT NULL,
	Restriction VARCHAR(1) NOT NULL,
	Classification VARCHAR(1) NOT NULL,
	Endorsement VARCHAR(1),
	OrganDonor BOOLEAN NOT NULL,
	Sex VARCHAR(1) NOT NULL,
	Height VARCHAR(6) NOT NULL,
	Weight SMALLINT NOT NULL,
	
	PRIMARY KEY (UID, DriverID)
) DEFAULT CHARSET=utf8;

CREATE VIEW [IF NOT EXISTS] PublicLicense(UID, Picture, FirstName, State, DOB) AS 
	Select Picture, FirstName, State, DOB 
	FROM License;
	
/*to select from the veiw:
*/
SELECT * FROM PublicLicense
	WHERE UID = "[insert whatever uid you need to access]";

CREATE TABLE PublicLicense (
	Picture VARCHAR(50) NOT NULL,
	FirstName VARCHAR(20) NOT NULL,
	State VARCHAR(20) NOT NULL,
	DOB DATE NOT NULL,

	FOREIGN KEY (Picture) REFERENCES License(Picture)
	FOREIGN KEY (FirstName) REFERENCES License(FirstName)
	FOREIGN KEY (State) REFERENCES License(State)
	FOREIGN KEY (DOB) REFERENCES License(DOB)

) DEFAULT CHARSET=utf8;

SELECT * FROM LICENSE;
DESCRIBE LICENSE;

/* Template for our license table.

	 ("x", 12345678, "Daniel", "Choo", "1234 Hi Road", "Baltimore", "MD", 21250,
	 date('2020-11-21'), date('2020-11-21'), date('2020-11-21'), "C", "B", NULL, TRUE,
	 "M", "5'10", 120),

*/
