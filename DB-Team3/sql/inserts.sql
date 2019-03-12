-- entities --
INSERT INTO AREA (ID, name, size) VALUES
(1,'stage red',500),
(2,'stage blue',500),
(3,'backstage',50),
(4,'camp site red',1000),
(5,'hotel',250);

INSERT INTO FACILITY (ID, location, located_at) VALUES
(1,'(54.022611 , 9.379952)',1),
(2,'(54.022615 , 9.379992)',1),
(3,'(54.020611 , 9.378952)',1),
(4,'(54.022691 , 9.379852)',1),
(5,'(54.022691 , 9.376952)',1),
(6,'(54.022811 , 9.379852)',1),
(7,'(54.022711 , 9.379852)',1),
(8,'(54.022641 , 9.379942)',1),
(9,'(54.022611 , 9.379952)',1),
(10,'(54.022611 , 9.379952)',1),
(11,'(54.022611 , 9.379952)',1),
(12,'(54.022611 , 9.379952)',1),
(13,'(54.022611 , 9.379952)',2),
(14,'(54.022611 , 9.379952)',2),
(15,'(54.022611 , 9.379952)',2),
(16,'(54.022611 , 9.379952)',2),
(17,'(54.022611 , 9.379952)',1),
(18,'(54.022611 , 9.379952)',1),
(19,'(54.022611 , 9.379952)',2),
(20,'(54.022611 , 9.379952)',2),
(21,'(54.022611 , 9.379952)',4),
(22,'(54.022611 , 9.379952)',4),
(23,'(54.022611 , 9.379952)',5),
(24,'(54.022611 , 9.379952)',5),
(25,'(54.022611 , 9.379952)',5),
(26,'(54.022611 , 9.379952)',5);


INSERT INTO ACCOMODATION (ID, Type, Price, Deposit, Guests_Number) VALUES
(26,'Hotelroom',120.00,200.00,4),
(23,'Hotelroom',120.00,200.00,4),
(24,'Hotelroom',69.00,200.00,2),
(25,'Hotelroom',69.00,200.00,2),
(22,'Campsite',29.00,150.00,2),
(21,'Campsite',49.00,150.00,4);

INSERT INTO ACCOUNT_TERMINAL (ID, cash) VALUES
(2,5000.00),
(13,1100.90),
(14,200.95),
(5,583.21);

INSERT INTO EXTERNAL_ORGANISATION (ID, name, e_mail, street, streetnumber, zip_code, city, country) VALUES
(1,'IRON MAIDEN','mail@ironmaiden.com','rockstreet','666','12345','London','Great Britain'),
(2,'Elvis Presley','elvis@presley.org','1st road','2a','254926','Washington D.C.','USA'),
(3,'Bananfishbones','info@bfb.bayern','Bananenstraße','3','82159','Hintertupfing','Deutschland'),
(4,'Lena','lena@m-l.de','Bahnhofsstraße','15c','23841','Köln','Deutschland'),
(5,'Helene Fischer','fischerhelene@web.de','Schlagerallee','42','28368','Musikantendorf','Deutschland'),
(6,'Coca Cola','cola@cola.com','sugarstreet','1','38476','New York','USA'),
(7,'Oettinger','bier@oettinger.de','Saufweg','123','35746','Brauhausen','Deutschland'),
(8,'Red Bull','redbull@live.com','action way','1','643883','Montreal','Canada'),
(9,'Indotürkische Spezialitäten GmbH','indotürk@gmail.com','Hauptstraße','14','12543','Neuhausen','Österreich'),
(10,'Getränke Maier GbR','maier@trinkmehr.de','Lagerstraße','10','82163','Altstätten','Deutschland'),
(11,'Florian Silbereisen','florian@silbereisen.de','Silberstraße','10','81808','Silberhausen','Deutschland');

INSERT INTO ORGANISATIONAL_TEAM (ID, name_of_team) VALUES
(1,'advertising'),
(2,'vip_management'),
(3,'band_management'),
(4,'sponsor_management'),
(5,'accounting'),
(6,'main_organisation'),
(7,'merchandise');

INSERT INTO APPLICATION (ID, application_text, accepted, type_of_contribution, e_mail, street, streetnumber, zip_code, city, country, checked_by, from_ex_org) VALUES
(1,'Sup, i m lena..',true,'band','lena@m-l.de','Bahnhofsstraße','15c','23841','cologne',' germany',3,4),
(2,'red bull, verleiht flügel ',true,'run a shop, advertising','lena@esc.com','satellite','1','643883','montreal',' canada',4,8),
(3,'Coca Cola',true,'supplier','cola@cola.com','sugarstreet','1','38476','new york',' usa',4,6),
(4,'what is dead may never die',true,'band','elvis@presley.org','1st road','2a','254926','Washington D.C.',' usa',3,2),
(5,'Everyone needs kebab, so do you!',true,'run a shop','indotürk@gmail.com','Hauptstraße','14','12543','Neuhausen',' österreich',4,9),
(6,'i m super great',false,'advertising','super@super.com','SuperAwesome','1a','1','Madrid',' spain',4,null);

INSERT INTO BAND (ID, number_of_members, headliner, genre, homepage, resp_for_band) VALUES
(1,5,true,'rock','iron-maiden.com',2),
(2,1,true,'rock-n-roll','null',2),
(3,3,false,'pop','bfb.com',3),
(4,1,false,'pop','lml.de',3),
(5,1,false,'schlager','helene.eu',3),
(11,1,false,'schlager','floriansilbereisen.de',3);

INSERT INTO OPENING_HOURS (ID, openingtime, closingtime) VALUES
(2,'2018-08-01 05:00:00','2018-08-03 22:00:00'),
(13,'2018-08-01 05:00:00','2018-08-04 22:00:00'),
(14,'2018-08-01 05:00:00','2018-08-05 22:00:00'),
(5,'2018-08-01 05:00:00','2018-08-06 22:00:00'),
(12,'2018-08-01 08:00:00','2018-08-06 17:00:00'),
(3,'2018-08-01 09:30:00','2018-08-06 15:00:00'),
(4,'2018-08-01 07:30:00','06.08.2018 16:30:00'),
(15,'2018-08-01 00:00:00','2018-08-06 17:00:00'),
(16,'2018-08-01 08:00:00','2018-08-06 12:00:00'),
(16,'2018-08-06 13:30:00','2018-08-06 17:00:00'),
(10,'2018-08-06 09:30:00','2018-08-01 15:00:00');

INSERT INTO SPONSOR (ID, allowed_to_sell, level, donation, admission_fee, has_paid_admission, resp_for_sponsor) VALUES
(6,true,'standard',0.00,5000,TRUE,4),
(7,false,'standard',10000.00,5000,FALSE,4),
(8,true,'plantinum',150000.00,20000,TRUE,2),
(9,true,'gold',80000.00,10000,TRUE,4),
(10,true,'standard',15000.00,5000,TRUE,4);

INSERT INTO SHOP (ID, type, name, driven_by_orga, driven_by_sponsor) VALUES
(12,'merchandise','Merchman',7,null),
(3,'food & drinks','Curryman',6,null),
(4,'food & drinks','Kebapman',6,null),
(15,'sponsor','Coca Cola',null,6),
(16,'sponsor','Red Bull',null,8);

INSERT INTO STAGE (ID, size, amount_visitors, name) VALUES
(17,20,1000,'main stage A'),
(18,5,200,'side stage A'),
(19,20,1000,'main stage B'),
(20,5,200,'side stage B');

INSERT INTO OTHER_FACILITY (ID, type) VALUES
(1,'headquarter'),
(10,'lost-and-found office'),
(11,'first-aid');

INSERT INTO PERSON (ID, lastname, firstname, e_mail, password, SUBSCRIBES_NEWSLETTER, rfid, balance, street, streetnumber, zip_code, city, country, emergency_info) VALUES
(1,'Baughen','Nadeen','nbaughen0@arstechnica.com','$1$0qvlvKCO$rjCeVrg8XJQ2OF0iGnUp90',true,32,43.12,'Lindbergh','32','8080','Dresden','Germany','Diabetes type 1'),
(2,'Danilowicz','Korry','kdanilowicz1@ifeng.com','$1$erXZsI6M$vdg/8fy2EVliBh1ylEKLL.',false,44,32.3,'Fair Oaks','13','8908','Berlin','Germany','Kols'),
(3,'Oggers','Nils','voggers2@zimbio.com','$1$zXGBbHrN$Xsie/3aPU8L1b/KE6VOA10',true,43,5556.13,'Jenna','25','342','London','England','Call dad bitte'),
(4,'Kave','Truls','tkave3@bizjournals.com','$1$ZP4ePbqH$/zKsHZ6ekFMHh90C6LjlS/',true,67,12,'Westend','36654','3252','Oslo','Norway','Afraid of cancer'),
(5,'Downage','Sven','ndownage4@nhs.uk','$1$zlcZI9SA$79ckGl1hqYoNjzYRF03Pn1',false,89,124.54,'New Castle','353','3456','Kiev','Ukraine',''),
(6,'Gytesham','Nina','jgytesham5@mapquest.com','$1$Z/973GV5$SrDAwv./q2kkljv06OVaJ.',false,1,120.50,'Debra','52','3556','New York','US',''),
(7,'Keedy','Max','kkeedy6@comsenz.com','$1$yYY7bsan$a43yzxZgLVKfT2mTYMM9Q.',false,46,0.00,'Blue Bill Park','76','8755','Copenhagen','Denmark',''),
(8,'Mitchelson','Fernanda','zmitchelson7@geocities.jp','$1$MaW9yOIq$mgZVQenMT3YbBu3/8sH90.',true,666,100.00,'Amoth','43','6786','Lisbon','Portugal','ALS'),
(9,'Reiser','Angelika','ebarford8@gnu.org','$1$22hW6.dE$Np0dS/mIwlzBMkD2H3MTs0',false,342,160.57,'Prairie Rose','54','5786','Berlin','Germany',''),
(10,'Leven','Agel','tleven9@state.tx.us','$1$9KdT4nsS$HfHQYBLG6vWY6Gyf79jlN1',true,543,0,'7th','680','5843','Paris','France','ME'),
(11,'St. Clair','Olivia','ostclair0@nasa.gov','$1$GmAiX2I1$Oe4it0t3SR9jqzLljMS3l1',true,689,0,'Trailsway','8','2344','Paris','France',''),
(12,'Symes','Lina','tsymes1@networksolutions.com','$1$fB/irMtt$iVH8SmTHumlFLAx8A4UjL0',false,432,588,'Farragut','45','1234','Sydney','Australia',''),
(13,'Kays','Sophie','mkays2@archive.org','$1$oeAnZvcu$T0RRSeX7YZsEVRz5xr6.P0',false,222,234.22,'Artisan','21','3543','Melbourne','Australia','Alcoholic'),
(14,'Hixley','Stefan','rhixley3@people.com','$1$T3jZ01N3$L171UU27Ar2HqY3KiwLBu.',false,111,15.75,'Blue Bill Park','212','23432','Firenze','Italy',''),
(15,'Scotford','Elias','wscotford4@nyu.edu','$1$wG9uGXWz$ZcCqeOM2go61bEw1JvFre0',false,11134,0,'Ilene','12','12','Turin','Italy','Diabetes type 2'),
(16,'Onraet','Sebi','jonraet5@auda.org.au','$1$hA68CIwG$KwDmZZ77TV0bELVlt5tJK/',false,45454,0,'Victoria','2','243','Moscow','Russia',''),
(17,'Yakubovics','Schris','eyakubovics6@cdbaby.com','$1$LAkRVW1g$L18utlz4lCWbYNPosAZjf.',true,541,0,'Heath','3','2453','Misk','Belarus','Heart condition'),
(18,'Gawkroge','Ols','kgawkroge7@redcross.org','$1$T.BksKM6$11KUmwOuD9MmgjTR/GniC/',false,985,13.37,'Burning Wood','4','1244','Ankara','Turkey','Broken leg'),
(19,'Coan','Trans','tcoan8@pinterest.com','$1$wiEmWDnf$LNkbcHbbHxMmcMTnHDzTV.',false,3221,40.40,'Grasskamp','1','123','Bagdad','Iraq',''),
(20,'Jachtym','Apple','mjachtym9@mozilla.com','$1$.LLpFMqY$SxisPvrr7zsFiPjgvtBlc1',true,5468944,6.66,'Maximilanstrase','21','43','Malmo','Sweden','');

INSERT INTO VISITOR (ID) VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10),
  (11),
  (12),
  (13),
  (14),
  (15),
  (16),
  (17),
  (18),
  (19),
  (20);

INSERT INTO ITEM (barcode, shop, name, price, description, quantity, supplied_by) VALUES
(756235,4,'Red Bull',2.99,'can 0.33l',28,10),
(14354376,4,'Döner Dürüm',4.50,'',30,9),
(345634,3,'Red Curry',6.50,'vegetarian',0,9),
(756235,16,'Red Bull',2.99,'can 0.33l',5,8),
(35627510,12,'IRON MAIDEN T-Shirt',19.00,'size: M',4,1),
(75623534,15,'Coca Cola',1.99,'bottle 0.5l',98,6);

INSERT INTO TIMETABLE (ID, start_build, start_play, end_play, gone, stage, band_assigned_to) VALUES
(1,'01.08.2018 22:50:00','01.08.2018 23:00:00','01.08.2018 23:15:00','01.08.2018 23:20:00',17,5),
(2,'01.08.2018 21:40:00','01.08.2018 22:00:00','01.08.2018 22:15:00','01.08.2018 22:20:00',19,1),
(3,'01.08.2018 21:10:00','01.08.2018 21:30:00','01.08.2018 22:45:00','01.08.2018 22:55:00',17,2),
(5,'01.08.2018 22:25:00','01.08.2018 22:35:00','01.08.2018 23:00:00','01.08.2018 23:10:00',19,4),
(6,'02.08.2018 20:25:00','02.08.2018 20:45:00','02.08.2018 22:00:00','02.08.2018 22:30:00',18,3),
(7,'02.08.2018 21:00:00','02.08.2018 21:20:00','02.08.2018 23:00:00','02.08.2018 23:30:00',19,4),
(8,'02.08.2018 22:00:00','02.08.2018 22:15:00','02.08.2018 23:00:00','02.08.2018 23:15:00',19,11);

INSERT INTO TICKET_UNIT (day, current_price, area) VALUES
('01.08.2018',50.00,1),
('01.08.2018',50.00,2),
('01.08.2018',null,3),
('01.08.2018',null,4),
('01.08.2018',null,5);

INSERT INTO EMPLOYEE (ID, role, salary, part_of) VALUES
(8,'cleaner',12.50,null),
(9,'cleaner',12.50,null),
(10,'pr',200.21,1),
(11,'manager',450.50,3),
(12,'accountant',101.34,5),
(13,'butler',60.75,2);

INSERT INTO ACCREDITATION (ID, place_of_work) VALUES
(5,'BILD');

INSERT INTO EXTERNAL (ID, works_at) VALUES
(14,1),
(15,2),
(16,3),
(17,4),
(18,5),
(19,6),
(20,7);

INSERT INTO NEWSLETTER (ID, date_posted, released_by) VALUES
(1,'2017-12-01 10:00:00',1),
(2,'2018-01-23 15:00:00',1),
(3,'2018-02-01 20:00:00',1);

INSERT INTO POST (ID, included_in, headline, content, tags) VALUES
(1,1,'Prakt Festival 2018','The date for the next festival is fixed!!! ...','2018'),
(1,2,'First Line Up','Hello folks, we have some exciting news for you. ...','bands, line-up'),
(1,3,'Ticket Sale ','Hello guys, the ticket sale for the prakt festival 2018 starts next week!','tickets'),
(2,3,'More bands','We are excited to announce some more bands for ...','iron maiden, ...');

INSERT INTO SHIFT (ID, start_shift, end_shift, kind_of_work, shift_at_facility) VALUES
(1,'2018-08-02 08:00:00','2018-08-02 16:00:00','Cleaner',1),
(2,'2018-08-02 08:30:00','2018-08-02 16:30:00','Medic',2),
(3,'2018-08-03 15:00:00','2018-08-03 23:00:00','Security',3),
(4,'2018-08-02 23:00:00','2018-08-03 08:00:00','Tech',4),
(5,'2018-08-02 00:00:00','2018-08-02 07:45:00','Tech',4);

INSERT INTO NOTIFICATION (ID, content, posted, approved, handled_by, still_active, linked_shift, emitted_by_band, emitted_by_orga) VALUES
(1,'Go to the stage area and support the other medics','2018-06-01 18:00:00',true,6,true,2,null,6),
(2,'We need more technicans on stage','2018-06-01 15:00:00',false,6,true,5,2,null),
(3,'Support the securities in the stage area','2018-06-01 18:00:00',true,6,true,3,null,6);

INSERT INTO GEMA (ID, song_title, song_writer, length, date_published, time_played, entered_from) VALUES
(1,'Atemlos durch die Nacht','Kristina Bach','03:20','2015-09-28','2018-08-01 23:00',5),
(2,'Wind of change','Klaus Meine','04:20','1990-09-29','2018-08-01 22:00',1),
(3,'Eye the tiger','Jim Peterik','05:20','1982-09-30','2018-08-01 22:30',2),
(4,'Satellite','Julie Frost, John Gordon','06:20','2010-10-01','2018-08-01 22:45',4);

INSERT INTO PRESS_INFORMATION (ID, content, written_by, released_by) VALUES
(1,'Lorem ipsum dolor sit amet',5,1),
(2,'consetetur sadipscing elitr, sed diam nonumy eirmod tempor ',1,1),
(3,'eirmod tempor invidunt ut labore et dolore ',2,1);

INSERT INTO AD_SPACE (ID, size, price, placed_by_orga, placed_by_sponsor) VALUES
(6,1,15000,null,6),
(7,1,15000,1,null),
(8,0.5,5000,null,8);

-- Relationships --
INSERT INTO execute_transaction (person, account_terminal, time_transaction, amount) VALUES
(1,5,'2018-08-02 16:30:00',15.00),
(18,2,'2018-08-02 14:30:00',25.00),
(2,13,'2018-08-02 11:30:00',-15.00),
(3,5,'2018-08-02 16:10:00',12.00);

INSERT INTO personal_timetable (visitor, timetable) VALUES
(1,1),
(4,2),
(5,5),
(6,3),
(3,2),
(2,2),
(4,3),
(5,1),
(6,5),
(7,3),
(1,2),
(5,2),
(6,1),
(3,3),
(2,3);

INSERT INTO works (employee, shift) VALUES
(8,1),
(9,1),
(10,3);

INSERT INTO reserves (visitor, ACCOMODATION, START_DAY, END_DAY, RESERVED_AT) VALUES
(2,23,'2018-08-01 12:00:00','2018-08-08 12:00:00','2018-07-01 12:00:22'),
(5,22,'2018-08-01 12:00:00','2018-08-06 12:00:00','2018-07-23 09:12:25');

INSERT INTO has_admission (person, day, area, price) VALUES
(1,'2018-08-01',1,50.00),
(2,'2018-08-01',1,40.00),
(3,'2018-08-01',1,40.00),
(4,'2018-08-01',1,50.00),
(5,'2018-08-01',1,45.00),
(6,'2018-08-01',1,25.00),
(7,'2018-08-01',1,50.00),
(10,'2018-08-01',1,null),
(11,'2018-08-01',1,null),
(12,'2018-08-01',1,null),
(13,'2018-08-01',2,null),
(14,'2018-08-01',2,null),
(15,'2018-08-01',2,null),
(16,'2018-08-01',2,null),
(17,'2018-08-01',2,null),
(18,'2018-08-01',2,null),
(19,'2018-08-01',2,null),
(20,'2018-08-01',2,null),
(1,'2018-08-01',2,50.00),
(2,'2018-08-01',2,40.00),
(3,'2018-08-01',2,40.00),
(4,'2018-08-01',2,50.00),
(5,'2018-08-01',2,45.00),
(6,'2018-08-01',2,25.00),
(7,'2018-08-01',2,50.00),
(2,'2018-08-01',5,null),
(7,'2018-08-01',3,null),
(10,'2018-08-01',3,null),
(11,'2018-08-01',3,null),
(12,'2018-08-01',3,null),
(13,'2018-08-01',3,null),
(14,'2018-08-01',3,null),
(8,'2018-08-01',1,null),
(8,'2018-08-01',2,null),
(8,'2018-08-01',3,null),
(8,'2018-08-01',4,null),
(8,'2018-08-01',5,null),
(9,'2018-08-01',1,null),
(9,'2018-08-01',2,null),
(9,'2018-08-01',3,null),
(9,'2018-08-01',4,null),
(9,'2018-08-01',5,null);

INSERT INTO buys (barcode, shop, person, time_buy) VALUES
(14354376,4,1,'2018-08-02 12:19:00'),
(345634,3,3,'2018-08-02 11:21:23'),
(756235,16,8,'2018-08-02 17:10:40'),
(35627510,12,19,'2018-08-02 14:11:11');

INSERT INTO visits (area_id, person_id, time_entered, time_left) VALUES
(1,1,'2018-08-02 12:19:00','2018-08-02 12:55:00'),
(3,1,'2018-08-03 11:10:00','2018-08-03 17:45:00'),
(2,17,'2018-08-02 12:19:00','2018-08-02 19:19:00'),
(3,11,'2018-08-02 12:19:00','2018-08-02 18:22:00');
