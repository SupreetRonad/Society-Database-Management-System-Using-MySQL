-- SUPREET RONAD PES2201800705
CREATE DATABASE Society;
USE Society;


CREATE TABLE Society(
	S_id int not null,
	Society_Name varchar(24),
    Address varchar(100),
    No_of_Houses int,
    PRIMARY KEY (S_id)
);
CREATE TABLE House(
	H_id int not null,
    Society_id int not null,
    Block_no int,
    Rent_price int,
    PRIMARY KEY (H_id)
);
CREATE TABLE Users(
	U_id int not null,
    User_Name varchar(24),
    House_no int,
    Phone_no character(13),
    PRIMARY KEY (U_id)
);
CREATE TABLE Complain(
	C_id int not null,
    User_id int not null,
    Subject varchar(24),
    Complain varchar(200),
    Reply varchar(200),
    PRIMARY KEY (C_id)
);
CREATE TABLE Visitor(
	V_id int not null,
    U_id int not null,
    Visitor_name varchar(24) not null,
    Purpose varchar(24),
    Visitor_Phone_no character(13),
    Visit_date DATE not null,
    PRIMARY KEY (V_id)
);



ALTER TABLE House ADD CONSTRAINT soc_id FOREIGN KEY (Society_id) references Society (S_id)
	on delete cascade on update cascade;

ALTER TABLE Users ADD CONSTRAINT house_id FOREIGN KEY (House_no) references House (H_id)
	on delete cascade on update cascade;
    
ALTER TABLE Complain ADD CONSTRAINT use_comp_id FOREIGN KEY (User_id) references Users (U_id)
	on delete cascade on update cascade;
    
ALTER TABLE Visitor ADD CONSTRAINT use_visit_id FOREIGN KEY (U_id) references Users (U_id)
	on delete cascade on update cascade;



ALTER TABLE Society
ADD CONSTRAINT CHECK (S_ID > 0 AND No_of_Houses > 0);

ALTER TABLE House
ADD CONSTRAINT CHECK (H_ID > 0 AND Block_no > 0);

ALTER TABLE Users
MODIFY Phone_no character(13) not null;



INSERT INTO Society VALUES (1,'Galaxy','HSR Layout,Banglore','75');
INSERT INTO Society VALUES (2,'Home Palace','Electronic city,Banglore','83');
INSERT INTO Society VALUES (3,'EcoStay','HSR Layout,Banglore','50');
INSERT INTO Society VALUES (4,'The Den','Banashankari,Banglore','115');

INSERT INTO House VALUES (123,1,3,20000);
INSERT INTO House VALUES (255,2,1,25000);
INSERT INTO House VALUES (144,3,12,18000);
INSERT INTO House VALUES (729,4,9,31000);
INSERT INTO House VALUES (216,3,6,15000);
INSERT INTO House VALUES (512,2,8,19000);
INSERT INTO House VALUES (811,1,5,17500);
INSERT INTO House VALUES (205,2,3,16000);
INSERT INTO House VALUES (329,3,11,32000);
INSERT INTO House VALUES (239,4,4,27000);
INSERT INTO House VALUES (513,4,11,23000);
INSERT INTO House VALUES (722,1,10,14000);
INSERT INTO House VALUES (128,1,7,17000);
INSERT INTO House VALUES (259,2,1,23000);
INSERT INTO House VALUES (134,2,12,36000);
INSERT INTO House VALUES (799,4,9,18500);
INSERT INTO House VALUES (506,1,6,20000);
INSERT INTO House VALUES (442,3,8,21000);

INSERT INTO Users VALUES (705,'Supreet Ronad',123,'9686023454');
INSERT INTO Users VALUES (706,'Shashank G S',255,'7844023474');
INSERT INTO Users VALUES (368,'Nitish S',144,'8888888444');
INSERT INTO Users VALUES (632,'Sandeep Bhat',729,'7786023456');
INSERT INTO Users VALUES (684,'Sathvik Saya',216,'6366023478');
INSERT INTO Users VALUES (344,'Jasmine Tased',512,'9456783454');
INSERT INTO Users VALUES (711,'Sanket Hiredesai',811,'9681234564');
INSERT INTO Users VALUES (554,'Manjunath Hakki',205,'6789023457');
INSERT INTO Users VALUES (068,'Anirudh Rajamouli',329,'7777023488');
INSERT INTO Users VALUES (333,'Veeresh Panchaxari',239,'8787873454');
INSERT INTO Users VALUES (603,'Shashi Rao',513,'6996023454');
INSERT INTO Users VALUES (725,'Guruprasad Hegde',722,'7171713454');
INSERT INTO Users VALUES (522,'Sathvik Nayaka',128,'9688989894');
INSERT INTO Users VALUES (852,'Mayur Biradar',259,'7886023499');
INSERT INTO Users VALUES (168,'Sneha Betageri',134,'9211023478');
INSERT INTO Users VALUES (707,'Sneha Chincholli',799,'7786023884');
INSERT INTO Users VALUES (666,'Pratyusha Jalabengi',506,'8888023422');
INSERT INTO Users VALUES (552,'Ayushi Agarwal',442,'6666023414');

INSERT INTO Complain VALUES (1024,705,'Water Problem','No Water available',null);
INSERT INTO Complain VALUES (1156,168,'Water Problem','Water not sufficient','Will be dealt with soon');
INSERT INTO Complain VALUES (1002,554,'Network Problem','No network coverage in my appartment','Network has been reset');
INSERT INTO Complain VALUES (1516,068,'Electricity Problem','Daily an hour of power is being cut, causing problems','Nothing can be done about that');
INSERT INTO Complain VALUES (1333,705,'Noise Issue','Contruction is causing too much noise','Will look into that');
INSERT INTO Complain VALUES (1114,168,'Network Problem','No network, please help','Done!');
INSERT INTO Complain VALUES (1578,852,'Water Problem','No Water available',null);
INSERT INTO Complain VALUES (1234,554,'Lift issue','Lift not working, please fix',null);
INSERT INTO Complain VALUES (1224,705,'Electricity Problem','No power since yesterday, please help','Will do');
INSERT INTO Complain VALUES (1227,068,'Lift issue','No lights in lift, please fix',null);
INSERT INTO Complain VALUES (1523,554,'Water Problem','No Water available',null);

INSERT INTO Visitor VALUES (445,068,'Anand Joshi','Just to meet',7089663467,'2020-08-02');
INSERT INTO Visitor VALUES (446,705,'Raam Kalyan','Chit-chat',6723663897,'2020-08-02');
INSERT INTO Visitor VALUES (547,554,'Jake Peralta','Food Delivery',6942069420,'2020-03-21');
INSERT INTO Visitor VALUES (785,705,'Amy Santiago','Courier Service',7822367842,'2020-04-13');
INSERT INTO Visitor VALUES (550,852,'Jimbo Mckenzie','Birthday Party',7768970097,'2020-03-21');
INSERT INTO Visitor VALUES (885,705,'Pam Beesly','Just to meet',8893453467,'2020-03-21');
INSERT INTO Visitor VALUES (405,852,'Anand Joshi','Birthday Party',8888663469,'2020-03-21');
INSERT INTO Visitor VALUES (345,705,'Prem Chopra','Food Delivery',888967860,'2020-11-13');
INSERT INTO Visitor VALUES (487,554,'Rahul J','Food Delivery',8888666666,'2020-10-10');
INSERT INTO Visitor VALUES (689,552,'Tahir T','Office meeting',8873456666,'2020-04-15');



-- QUERIES --

-- Retrieve Names and Phone numbers of all visitors who visited Society 'Galaxy'
SELECT Visitor_name, Visitor_Phone_no
FROM Visitor as V, Users as U, House as H
WHERE V.U_id = U.U_id AND U.House_no = H.H_id AND H.Society_id in ( SELECT S_id
																	FROM Society as S
                                                                    WHERE Society_Name = 'Galaxy');

-- Retrieve Names of Societies which have complaint about 'Water problem'
SELECT DISTINCT Society_Name
FROM Society as S, House as H
WHERE S.S_id = H.Society_id AND H.H_id in ( SELECT House_no
											FROM Users as U, Complain as C
                                            WHERE U.U_id = C.User_id AND C.Subject = 'Water Problem');
                                            
-- Retrieve Names and Phone numbers of all users who dont live in Society 'Home Palace' and have no complaints
SELECT User_Name, Phone_no
FROM Users  
WHERE U_id not in ( SELECT U1.U_id
					FROM Users as U1, House as H
                    WHERE U1.House_no = H.H_id AND H.Society_id in (  SELECT S_id
																	  FROM Society 
																	  WHERE Society_Name = 'Home Palace' ))
				AND U_id not in ( SELECT User_id
								  FROM Complain );



-- AGGREAGATE FUNCTIONS --

-- Retrieve Average, Maximum and Sum of Rent paid by all the residents of Society 'The Den' 
SELECT avg(Rent_price), MAX(Rent_price), SUM(Rent_price)
FROM House as H
WHERE H.Society_id in (SELECT S_id 
					   FROM Society 
                       WHERE Society_Name = 'The Den') ;
                       
-- Retrieve Complaint subjects whose complaints are more than once
SELECT C.Subject,COUNT(*)
FROM Complain as C
GROUP BY C.Subject
HAVING COUNT(*) > 1;

-- Find Names of all Rent payers whose rent is more than 30000
SELECT User_Name,Rent_price
FROM Users as U, House as H
WHERE U.House_no = H.H_id AND Rent_price >= 30000;



-- OUTER JOIN --

-- Retrieve all User names and their Phone numbers who have made atleast one Complain
SELECT Distinct User_Name, Phone_no
FROM Users LEFT OUTER JOIN Complain ON U_id = User_id 
ORDER BY 1;

-- Retrieve the Count of all the Users stored in the database living in each Society 
SELECT S_id, Society_Name, COUNT(1) as No_of_Users
FROM (Users LEFT OUTER JOIN House ON House_no = H_id) LEFT OUTER JOIN Society ON (S_id = Society_id)
GROUP BY S_id;



-- TRIGGERS

DROP table Users_Update_info;
DROP Trigger Before_Update;
CREATE TABLE Users_Update_info (
	User_id int not null,
    User_Name varchar(20) not null,
    House_id int not null,
	Action VARCHAR(50) ,
    Update_Date DATETIME
);

--  Trigger to store any update made to the Users Table
CREATE TRIGGER Before_Update 
BEFORE UPDATE ON Users
FOR EACH ROW 
	INSERT INTO Users_Update_info
	SET action = 'UPDATE',
		User_id = OLD.U_id,
		User_Name = OLD.User_Name,
        House_id = OLD.House_no,
		Update_Date = NOW();
        

USE Society;

UPDATE Users
SET User_Name='Manoj Kori', Phone_no='9775833644'
WHERE House_no=259;

UPDATE Users
SET User_Name='Manohar', Phone_no='9977833644'
WHERE House_no=259;

SELECT * FROM Users_Update_info;


-- Trigger to check the Validity of Visitor's phone number
delimiter $$
CREATE TRIGGER Vistor_Entry 
BEFORE INSERT ON Visitor
FOR EACH ROW
	BEGIN
		IF NEW.Visitor_Phone_no not rlike '^[0-9]{10}$'
			THEN
				signal sqlstate '45000' set message_text = 'INVALID PHONE NUMBER !!!' ;
		END IF;
	END;
    
DROP TRIGGER Vistor_Entry;

INSERT INTO Visitor VALUES (6809,552,'Tahir T','Office meeting',56666,'2020-04-15');