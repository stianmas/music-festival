-- used for password computation
CREATE EXTENSION pgcrypto;

-- ENTITIES --

CREATE TABLE AREA(
	ID INTEGER PRIMARY KEY NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	SIZE INTEGER
	);

CREATE TABLE FACILITY(
	ID INTEGER PRIMARY KEY NOT NULL,
	LOCATION POINT NOT NULL,
	LOCATED_AT INTEGER NOT NULL REFERENCES AREA(ID) 
	);

CREATE TABLE ACCOMODATION(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES FACILITY(ID) ON DELETE CASCADE,
	TYPE CHAR(25) NOT NULL,
	PRICE DECIMAL(5,2) NOT NULL,
	DEPOSIT DECIMAL(5,2) NOT NULL,
	GUESTS_NUMBER INTEGER NOT NULL,
	CONSTRAINT POSITIVE_PRICE CHECK (PRICE >= 0),
	CONSTRAINT POSITIVE_DEPOSIT CHECK (DEPOSIT >= 0),
	CONSTRAINT POSITIVE_GUEST_NUMBER CHECK (GUESTS_NUMBER >= 0)
	);

CREATE TABLE ACCOUNT_TERMINAL(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES FACILITY(ID) ON DELETE CASCADE,
	CASH DECIMAL(10,2) NOT NULL,
	CONSTRAINT POSITIVE_CASH CHECK (CASH >= 0)
	);

CREATE TABLE EXTERNAL_ORGANISATION(
	ID INTEGER PRIMARY KEY NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	E_MAIL VARCHAR(50) NOT NULL,
	STREET VARCHAR (100) NOT NULL,
	STREETNUMBER VARCHAR(10) NOT NULL,
	ZIP_CODE VARCHAR(20) NOT NULL,
	CITY VARCHAR(40) NOT NULL,
	COUNTRY VARCHAR(40) NOT NULL
	);

CREATE TABLE ORGANISATIONAL_TEAM(
	ID INTEGER PRIMARY KEY NOT NULL,
	NAME_OF_TEAM VARCHAR(60) NOT NULL
	);

CREATE TABLE APPLICATION(
	ID INTEGER PRIMARY KEY NOT NULL,
	APPLICATION_TEXT TEXT NOT NULL,
	ACCEPTED BOOLEAN DEFAULT NULL,
	TYPE_OF_CONTRIBUTION VARCHAR(70) NOT NULL,
	E_MAIL VARCHAR(50) NOT NULL,
	STREET VARCHAR (100) NOT NULL,
	STREETNUMBER VARCHAR(10) NOT NULL,
	ZIP_CODE VARCHAR(20) NOT NULL,
	CITY VARCHAR(40) NOT NULL,
	COUNTRY VARCHAR(40) NOT NULL,
	CHECKED_BY INTEGER REFERENCES ORGANISATIONAL_TEAM(ID),
	FROM_EX_ORG INTEGER REFERENCES EXTERNAL_ORGANISATION(ID)
	);

CREATE TABLE BAND(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES EXTERNAL_ORGANISATION(ID) ON DELETE CASCADE,
	NUMBER_OF_MEMBERS INTEGER NOT NULL,
	HEADLINER BOOLEAN NOT NULL,
	GENRE VARCHAR(25),
	HOMEPAGE VARCHAR(25),
	RESP_FOR_BAND INTEGER REFERENCES ORGANISATIONAL_TEAM(ID) NOT NULL,
	CONSTRAINT POSITIVE_BAND_MEMBERS CHECK ( NUMBER_OF_MEMBERS > 0)
	);

CREATE TABLE OPENING_HOURS(
	ID INTEGER NOT NULL REFERENCES FACILITY(ID),
	OPENINGTIME TIMESTAMP NOT NULL,
	CLOSINGTIME TIMESTAMP NOT NULL,
	PRIMARY KEY(OPENINGTIME,ID)
	);

CREATE TABLE SPONSOR(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES EXTERNAL_ORGANISATION(ID) ON DELETE CASCADE,
	ALLOWED_TO_SELL BOOLEAN NOT NULL,
	LEVEL VARCHAR(50) NOT NULL,
	DONATION DECIMAL(8,2) NOT NULL,
	ADMISSION_FEE DECIMAL(8,2) NOT NULL,
	HAS_PAID_ADMISSION BOOLEAN NOT NULL DEFAULT FALSE,
	RESP_FOR_SPONSOR INTEGER NOT NULL REFERENCES ORGANISATIONAL_TEAM(ID)
	);

CREATE TABLE SHOP(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES FACILITY(ID) ON DELETE CASCADE,
	TYPE VARCHAR(25) NOT NULL,
	NAME VARCHAR(25) NOT NULL,
	DRIVEN_BY_ORGA INTEGER REFERENCES ORGANISATIONAL_TEAM(ID),
	DRIVEN_BY_SPONSOR INTEGER REFERENCES SPONSOR(ID)
	);

CREATE TABLE STAGE(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES FACILITY(ID) ON DELETE CASCADE,
	SIZE INTEGER NOT NULL,
	AMOUNT_VISITORS INTEGER NOT NULL,
	NAME VARCHAR(25) NOT NULL
	);

CREATE TABLE OTHER_FACILITY(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES FACILITY(ID) ON DELETE CASCADE,
	TYPE VARCHAR(40) NOT NULL
	);

CREATE TABLE PERSON(
	ID INTEGER PRIMARY KEY NOT NULL,
	LASTNAME VARCHAR(50) NOT NULL,
	FIRSTNAME VARCHAR(50) NOT NULL,
	E_MAIL VARCHAR(50) NOT NULL,
	PASSWORD VARCHAR(100) NOT NULL,
	-- SALT VARCHAR(20) NOT NULL, -- not needed, stored in password
	SUBSCRIBES_NEWSLETTER BOOLEAN NOT NULL DEFAULT FALSE,
	RFID INTEGER,
	BALANCE DECIMAL(6,2) NOT NULL DEFAULT 0.00,
	STREET VARCHAR (100) NOT NULL,
	STREETNUMBER VARCHAR(10) NOT NULL,
	ZIP_CODE VARCHAR(20) NOT NULL,
	CITY VARCHAR(40) NOT NULL,
	COUNTRY VARCHAR(40) NOT NULL,
	EMERGENCY_INFO TEXT,
	CONSTRAINT POSITIVE_BALANCE CHECK (balance >= 0)
	);

CREATE TABLE VISITOR(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES PERSON(ID) ON DELETE CASCADE
	);

CREATE TABLE ITEM(
	BARCODE INTEGER NOT NULL,
	SHOP INTEGER REFERENCES SHOP(ID) NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	PRICE DECIMAL(6,2) NOT NULL,
	DESCRIPTION TEXT,
	QUANTITY INTEGER NOT NULL DEFAULT 0,
	SUPPLIED_BY INTEGER REFERENCES EXTERNAL_ORGANISATION(ID),
	CONSTRAINT POSITIVE_PRICE CHECK ( PRICE >= 0),
	CONSTRAINT POSITIVE_QTY CHECK ( QUANTITY >= 0),
	PRIMARY KEY(BARCODE, SHOP)
	);

CREATE TABLE TIMETABLE(
	ID INTEGER PRIMARY KEY NOT NULL,
	START_BUILD TIMESTAMP NOT NULL,
	START_PLAY TIMESTAMP NOT NULL,
	END_PLAY TIMESTAMP NOT NULL,
	GONE TIMESTAMP NOT NULL,
	STAGE INTEGER NOT NULL REFERENCES STAGE (ID),
	BAND_ASSIGNED_TO INTEGER NOT NULL REFERENCES BAND (ID),
	CONSTRAINT START_PLAY_GREATER_THAN_START_BUILD CHECK ( START_PLAY > START_BUILD),
	CONSTRAINT END_PLAY_GREATER_THAN_START_PLAY CHECK ( END_PLAY > START_PLAY),
	CONSTRAINT GONE_GREATER_THAN_END_PLAY CHECK ( GONE > END_PLAY)
	);

CREATE TABLE TICKET_UNIT(
	DAY DATE NOT NULL,
	CURRENT_PRICE DECIMAL(5,2),
	AREA INTEGER NOT NULL REFERENCES AREA(ID),
	PRIMARY KEY(DAY, AREA),
	CONSTRAINT POSITIVE_CURRENT_PRICE CHECK ( CURRENT_PRICE >= 0)
	);

CREATE TABLE EMPLOYEE(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES PERSON(ID) ON DELETE CASCADE,
	ROLE VARCHAR(30) NOT NULL,	
	SALARY DECIMAL(15,2) NOT NULL DEFAULT 0.00,
	PART_OF INTEGER REFERENCES ORGANISATIONAL_TEAM(ID) ON DELETE CASCADE,
	CONSTRAINT POSITIVE_SALARY CHECK ( SALARY >= 0)
	);

CREATE TABLE ACCREDITATION(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES VISITOR(ID) ON DELETE CASCADE,
	PLACE_OF_WORK VARCHAR(50) NOT NULL
	);

CREATE TABLE EXTERNAL(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES PERSON(ID) ON DELETE CASCADE,
	WORKS_AT INTEGER NOT NULL REFERENCES EXTERNAL_ORGANISATION(ID)
	);

CREATE TABLE NEWSLETTER(
	ID INTEGER PRIMARY KEY NOT NULL,
	DATE_POSTED TIMESTAMP NOT NULL,
	RELEASED_BY INTEGER NOT NULL REFERENCES ORGANISATIONAL_TEAM(ID) ON DELETE CASCADE
	);

CREATE TABLE POST(
	ID INTEGER NOT NULL,
	INCLUDED_IN INTEGER NOT NULL REFERENCES NEWSLETTER(ID) ON DELETE CASCADE,
	HEADLINE VARCHAR(40) NOT NULL,
	CONTENT TEXT NOT NULL,
	TAGS VARCHAR(60),
	PRIMARY KEY(ID, INCLUDED_IN)
);

CREATE TABLE SHIFT(
	ID INTEGER PRIMARY KEY NOT NULL,
	START_SHIFT TIMESTAMP NOT NULL,
	END_SHIFT TIMESTAMP NOT NULL,
	KIND_OF_WORK TEXT,
	SHIFT_AT_FACILITY INTEGER NOT NULL REFERENCES FACILITY(ID) ON DELETE CASCADE,
	CONSTRAINT END_SHIFT_GREATER_THAN_START CHECK ( END_SHIFT > START_SHIFT)
);

CREATE TABLE NOTIFICATION(
	ID INTEGER PRIMARY KEY NOT NULL,
	CONTENT TEXT NOT NULL,
	POSTED TIMESTAMP NOT NULL,
	APPROVED BOOLEAN,
	HANDLED_BY INTEGER REFERENCES ORGANISATIONAL_TEAM(ID) ON DELETE CASCADE,
	STILL_ACTIVE BOOLEAN NOT NULL DEFAULT TRUE,
	LINKED_SHIFT INTEGER NOT NULL REFERENCES SHIFT(ID) ON DELETE CASCADE,
	EMITTED_BY_BAND INTEGER REFERENCES BAND(ID) ON DELETE CASCADE,
	EMITTED_BY_ORGA INTEGER REFERENCES ORGANISATIONAL_TEAM(ID) ON DELETE CASCADE
	);

CREATE TABLE GEMA(
	ID INTEGER PRIMARY KEY NOT NULL,
	SONG_TITLE VARCHAR(50) NOT NULL,
	SONG_WRITER VARCHAR(100) NOT NULL,
	LENGTH TIME,
	DATE_PUBLISHED DATE,
  TIME_PLAYED TIMESTAMP NOT NULL,
  ENTERED_FROM INTEGER NOT NULL REFERENCES BAND(ID) ON DELETE CASCADE
	);

CREATE TABLE PRESS_INFORMATION(
	ID INTEGER PRIMARY KEY NOT NULL,
	CONTENT TEXT NOT NULL,
	WRITTEN_BY INTEGER NOT NULL REFERENCES BAND(ID),
	RELEASED_BY INTEGER NOT NULL REFERENCES ORGANISATIONAL_TEAM(ID)
	);

CREATE TABLE AD_SPACE(
	ID INTEGER PRIMARY KEY NOT NULL REFERENCES FACILITY(ID) ON DELETE CASCADE,
	SIZE DECIMAL(8,2),
	PRICE DECIMAL(8,2),
	PLACED_BY_ORGA INTEGER REFERENCES ORGANISATIONAL_TEAM(ID),
	PLACED_BY_SPONSOR INTEGER REFERENCES SPONSOR(ID),
	CONSTRAINT SIZE_GREATER_THAN_ZERO CHECK ( SIZE > 0),
	CONSTRAINT POSITIVE_PRICE CHECK (PRICE > 0)
);

-- RELATIONSHIPS --

CREATE TABLE EXECUTE_TRANSACTION(
	PERSON INTEGER NOT NULL REFERENCES PERSON(ID) ON DELETE CASCADE,
	ACCOUNT_TERMINAL INTEGER NOT NULL REFERENCES ACCOUNT_TERMINAL(ID) ON DELETE CASCADE,
	TIME_TRANSACTION TIMESTAMP NOT NULL,
	AMOUNT DECIMAL(8,2) NOT NULL,
	PRIMARY KEY (PERSON, TIME_TRANSACTION),
	CONSTRAINT AMOUNT_NOT_ZERO CHECK ( AMOUNT != 0)
);

CREATE TABLE PERSONAL_TIMETABLE(
	VISITOR INTEGER NOT NULL REFERENCES VISITOR(ID) ON DELETE CASCADE,
	TIMETABLE INTEGER NOT NULL REFERENCES TIMETABLE(ID) ON DELETE CASCADE,
	PRIMARY KEY (VISITOR, TIMETABLE)
);

CREATE TABLE RESERVES(
	VISITOR INTEGER NOT NULL REFERENCES VISITOR(ID) ON DELETE CASCADE,
	ACCOMODATION INTEGER NOT NULL REFERENCES ACCOMODATION(ID) ON DELETE CASCADE,
	START_DAY TIMESTAMP NOT NULL,
	END_DAY TIMESTAMP NOT NULL,
	RESERVED_AT TIMESTAMP NOT NULL,
	PRIMARY KEY (VISITOR, ACCOMODATION)
);

CREATE TABLE HAS_ADMISSION(
	PERSON INTEGER NOT NULL REFERENCES PERSON(ID) ON DELETE CASCADE,
	DAY DATE NOT NULL,
	AREA INTEGER NOT NULL REFERENCES AREA(ID),
	PRICE DECIMAL(8,2),
	PRIMARY KEY (PERSON, DAY, AREA),
	FOREIGN KEY (DAY, AREA) REFERENCES TICKET_UNIT (DAY, AREA) ON DELETE CASCADE,
	CONSTRAINT POSITIVE_PRICE CHECK( PRICE >= 0)
);

CREATE TABLE BUYS(
	BARCODE INTEGER NOT NULL,
	SHOP INTEGER NOT NULL,
	PERSON INTEGER NOT NULL REFERENCES PERSON(ID) ON DELETE CASCADE,
	TIME_BUY TIMESTAMP NOT NULL,
	PRIMARY KEY (PERSON, BARCODE, SHOP),
	FOREIGN KEY (BARCODE, SHOP) REFERENCES ITEM (BARCODE, SHOP) ON DELETE CASCADE
);

CREATE TABLE VISITS (
	  AREA_ID INTEGER REFERENCES AREA(ID) ON DELETE CASCADE,
    PERSON_ID INTEGER REFERENCES PERSON(ID) ON DELETE CASCADE,
    TIME_ENTERED TIMESTAMP,
    TIME_LEFT TIMESTAMP DEFAULT NULL,
    PRIMARY KEY(AREA_ID, PERSON_ID, TIME_ENTERED),
    CONSTRAINT EXIT_AFTER_ENTER CHECK( TIME_LEFT > TIME_ENTERED)
);

CREATE TABLE WORKS (
	SHIFT INTEGER NOT NULL REFERENCES SHIFT(ID),
	EMPLOYEE INTEGER NOT NULL REFERENCES EMPLOYEE(ID),
	PRIMARY KEY(SHIFT, EMPLOYEE)
);