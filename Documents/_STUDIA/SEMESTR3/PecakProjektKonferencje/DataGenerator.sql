
CREATE PROCEDURE dbo.generator
	@Months int = 36,
	@ConfPerMonth int = 2,
	@nrOfConfDays int = 3,
	@WshopsPerDay int = 4,
	@nrOfPpl int = 600,
	@nrOfCompanies int = 5,
	@nrOfIndivCust int = 10 
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM Payments
	DBCC CHECKIDENT(Payments, RESEED, 0)
	DELETE FROM SignedWorkshops
	DBCC CHECKIDENT(SignedWorkshops, RESEED, 0)
	DELETE FROM SignedConferences
	DBCC CHECKIDENT(SignedConferences, RESEED, 0)
	DELETE FROM WorkshopSignUps
	DBCC CHECKIDENT(WorkshopSignUps, RESEED, 0)
	DELETE FROM ConferenceSignUps
	DBCC CHECKIDENT(ConferenceSignUps, RESEED, 0)
	DELETE FROM People
	DBCC CHECKIDENT(People, RESEED, 0)
	DELETE FROM Workshops
	DBCC CHECKIDENT(Workshops, RESEED, 0)
	DELETE FROM Prices
	DBCC CHECKIDENT(Prices, RESEED, 0)
	DELETE FROM ConferenceDays
	DBCC CHECKIDENT(ConferenceDays, RESEED, 0)
	DELETE FROM Conferences
	DBCC CHECKIDENT(Conferences, RESEED, 0)
	DELETE FROM Customers
	DBCC CHECKIDENT(Customers, RESEED, 0)
	
	CREATE TABLE Names (
		NameID int primary key identity(1,1),
		Name nvarchar(20) not null
	);

	CREATE TABLE Surnames (
		SurnameID int primary key identity(1,1),
		Surname nvarchar(30) not null
	);

	CREATE TABLE Phone (
		PhoneID int primary key identity(1,1),
		Phone varchar(20) not null
	);

	CREATE TABLE Address (
		AddressID int primary key identity(1,1),
		Street nvarchar(20) not null,
		City nvarchar(20) not null,
		PostalCode varchar(6) not null,
		Country varchar(20) not null
	);

	CREATE TABLE Company (
		CompanyID int primary key identity(1,1),
		Email varchar(50) not null,
		Name nvarchar(50) not null
	);

	INSERT INTO Names(Name) VALUES('Ginger');
	INSERT INTO Names(Name) VALUES('Jami');
	INSERT INTO Names(Name) VALUES('Erika');
	INSERT INTO Names(Name) VALUES('Jeffrey');
	INSERT INTO Names(Name) VALUES('Tania');
	INSERT INTO Names(Name) VALUES('Ginger');
	INSERT INTO Names(Name) VALUES('Frank');
	INSERT INTO Names(Name) VALUES('Alan');
	INSERT INTO Names(Name) VALUES('Norma');
	INSERT INTO Names(Name) VALUES('Claudia');
	INSERT INTO Names(Name) VALUES('Esther');
	INSERT INTO Names(Name) VALUES('Alfred');
	INSERT INTO Names(Name) VALUES('Wallace');
	INSERT INTO Names(Name) VALUES('Marla');
	INSERT INTO Names(Name) VALUES('Carolyn');
	INSERT INTO Names(Name) VALUES('Barry');
	INSERT INTO Names(Name) VALUES('Terence');
	INSERT INTO Names(Name) VALUES('Paula');
	INSERT INTO Names(Name) VALUES('Frankie');
	INSERT INTO Names(Name) VALUES('Lara');
	INSERT INTO Names(Name) VALUES('Marisa');
	INSERT INTO Names(Name) VALUES('Dexter');
	INSERT INTO Names(Name) VALUES('Joni');
	INSERT INTO Names(Name) VALUES('Kim');
	INSERT INTO Names(Name) VALUES('Margaret');
	INSERT INTO Names(Name) VALUES('Kyle');
	INSERT INTO Names(Name) VALUES('Willie');
	INSERT INTO Names(Name) VALUES('Valerie');
	INSERT INTO Names(Name) VALUES('Connie');
	INSERT INTO Names(Name) VALUES('Elisa');
	INSERT INTO Names(Name) VALUES('Sabrina');
	INSERT INTO Names(Name) VALUES('Tamika');
	INSERT INTO Names(Name) VALUES('Jasmine');
	INSERT INTO Names(Name) VALUES('Trevor');
	INSERT INTO Names(Name) VALUES('Edgar');
	INSERT INTO Names(Name) VALUES('Cathy');
	INSERT INTO Names(Name) VALUES('Tonia');
	INSERT INTO Names(Name) VALUES('Bryce');
	INSERT INTO Names(Name) VALUES('Darrick');
	INSERT INTO Names(Name) VALUES('Toby');
	INSERT INTO Names(Name) VALUES('Sonja');
	INSERT INTO Names(Name) VALUES('Dwight');
	INSERT INTO Names(Name) VALUES('Suzanne');
	INSERT INTO Names(Name) VALUES('Cari');
	INSERT INTO Names(Name) VALUES('Anthony');
	INSERT INTO Names(Name) VALUES('Shane');
	INSERT INTO Names(Name) VALUES('Jessica');
	INSERT INTO Names(Name) VALUES('Rosemary');
	INSERT INTO Names(Name) VALUES('Quincy');
	INSERT INTO Names(Name) VALUES('Alyssa');
	INSERT INTO Names(Name) VALUES('Irma');
	INSERT INTO Names(Name) VALUES('Adriana');
	INSERT INTO Names(Name) VALUES('Mia');
	INSERT INTO Names(Name) VALUES('Janelle');
	INSERT INTO Names(Name) VALUES('Donovan');
	INSERT INTO Names(Name) VALUES('Owen');
	INSERT INTO Names(Name) VALUES('Monte');
	INSERT INTO Names(Name) VALUES('Colby');
	INSERT INTO Names(Name) VALUES('Dora');
	INSERT INTO Names(Name) VALUES('Louis');
	INSERT INTO Names(Name) VALUES('Rex');
	INSERT INTO Names(Name) VALUES('Anita');
	INSERT INTO Names(Name) VALUES('Kara');
	INSERT INTO Names(Name) VALUES('Brandon');
	INSERT INTO Names(Name) VALUES('Nicole');
	INSERT INTO Names(Name) VALUES('Marcella');
	INSERT INTO Names(Name) VALUES('Jeffrey');
	INSERT INTO Names(Name) VALUES('Ralph');
	INSERT INTO Names(Name) VALUES('Roman');
	INSERT INTO Names(Name) VALUES('Marc');
	INSERT INTO Names(Name) VALUES('Celeste');
	INSERT INTO Names(Name) VALUES('Lance');
	INSERT INTO Names(Name) VALUES('Pamela');
	INSERT INTO Names(Name) VALUES('Chester');
	INSERT INTO Names(Name) VALUES('Eric');
	INSERT INTO Names(Name) VALUES('Gloria');
	INSERT INTO Names(Name) VALUES('Fred');
	INSERT INTO Names(Name) VALUES('Allyson');
	INSERT INTO Names(Name) VALUES('Malcolm');
	INSERT INTO Names(Name) VALUES('Bruce');
	INSERT INTO Names(Name) VALUES('Keri');
	INSERT INTO Names(Name) VALUES('Christa');
	INSERT INTO Names(Name) VALUES('Katherine');
	INSERT INTO Names(Name) VALUES('Doris');
	INSERT INTO Names(Name) VALUES('Rachael');
	INSERT INTO Names(Name) VALUES('Jamal');
	INSERT INTO Names(Name) VALUES('Brock');
	INSERT INTO Names(Name) VALUES('Andrea');
	INSERT INTO Names(Name) VALUES('Jacob');
	INSERT INTO Names(Name) VALUES('Tiffany');
	INSERT INTO Names(Name) VALUES('Cory');
	INSERT INTO Names(Name) VALUES('Dewayne');
	INSERT INTO Names(Name) VALUES('Ivan');
	INSERT INTO Names(Name) VALUES('Marie');
	INSERT INTO Names(Name) VALUES('Brandie');
	INSERT INTO Names(Name) VALUES('Mandi');
	INSERT INTO Names(Name) VALUES('Scott');
	INSERT INTO Names(Name) VALUES('Darrick');
	INSERT INTO Names(Name) VALUES('Joanna');
	INSERT INTO Names(Name) VALUES('Nathan');

	INSERT INTO Surnames(Surname) VALUES('Simmons');
	INSERT INTO Surnames(Surname) VALUES('Andersen');
	INSERT INTO Surnames(Surname) VALUES('Briggs');
	INSERT INTO Surnames(Surname) VALUES('Wright');
	INSERT INTO Surnames(Surname) VALUES('Bird');
	INSERT INTO Surnames(Surname) VALUES('Hester');
	INSERT INTO Surnames(Surname) VALUES('Jefferson');
	INSERT INTO Surnames(Surname) VALUES('Sampson');
	INSERT INTO Surnames(Surname) VALUES('Bean');
	INSERT INTO Surnames(Surname) VALUES('Phillips');
	INSERT INTO Surnames(Surname) VALUES('Eaton');
	INSERT INTO Surnames(Surname) VALUES('Flores');
	INSERT INTO Surnames(Surname) VALUES('Bryant');
	INSERT INTO Surnames(Surname) VALUES('Hatfield');
	INSERT INTO Surnames(Surname) VALUES('Mc Lean');
	INSERT INTO Surnames(Surname) VALUES('English');
	INSERT INTO Surnames(Surname) VALUES('Richardson');
	INSERT INTO Surnames(Surname) VALUES('Alvarez');
	INSERT INTO Surnames(Surname) VALUES('Singleton');
	INSERT INTO Surnames(Surname) VALUES('English');
	INSERT INTO Surnames(Surname) VALUES('Arnold');
	INSERT INTO Surnames(Surname) VALUES('Cuevas');
	INSERT INTO Surnames(Surname) VALUES('Reese');
	INSERT INTO Surnames(Surname) VALUES('Santiago');
	INSERT INTO Surnames(Surname) VALUES('Burke');
	INSERT INTO Surnames(Surname) VALUES('Sawyer');
	INSERT INTO Surnames(Surname) VALUES('Fitzgerald');
	INSERT INTO Surnames(Surname) VALUES('Vargas');
	INSERT INTO Surnames(Surname) VALUES('Hawkins');
	INSERT INTO Surnames(Surname) VALUES('Pitts');
	INSERT INTO Surnames(Surname) VALUES('Yoder');
	INSERT INTO Surnames(Surname) VALUES('Camacho');
	INSERT INTO Surnames(Surname) VALUES('Walls');
	INSERT INTO Surnames(Surname) VALUES('Hurst');
	INSERT INTO Surnames(Surname) VALUES('George');
	INSERT INTO Surnames(Surname) VALUES('Vega');
	INSERT INTO Surnames(Surname) VALUES('Ho');
	INSERT INTO Surnames(Surname) VALUES('Mc Guire');
	INSERT INTO Surnames(Surname) VALUES('Zhang');
	INSERT INTO Surnames(Surname) VALUES('Montgomery');
	INSERT INTO Surnames(Surname) VALUES('Ellison');
	INSERT INTO Surnames(Surname) VALUES('Mc Neil');
	INSERT INTO Surnames(Surname) VALUES('Duncan');
	INSERT INTO Surnames(Surname) VALUES('Mata');
	INSERT INTO Surnames(Surname) VALUES('Cuevas');
	INSERT INTO Surnames(Surname) VALUES('Mcintosh');
	INSERT INTO Surnames(Surname) VALUES('Wheeler');
	INSERT INTO Surnames(Surname) VALUES('Savage');
	INSERT INTO Surnames(Surname) VALUES('Yang');
	INSERT INTO Surnames(Surname) VALUES('Conway');
	INSERT INTO Surnames(Surname) VALUES('Singh');
	INSERT INTO Surnames(Surname) VALUES('Bishop');
	INSERT INTO Surnames(Surname) VALUES('Simpson');
	INSERT INTO Surnames(Surname) VALUES('Hunt');
	INSERT INTO Surnames(Surname) VALUES('Short');
	INSERT INTO Surnames(Surname) VALUES('Gonzales');
	INSERT INTO Surnames(Surname) VALUES('Clayton');
	INSERT INTO Surnames(Surname) VALUES('Lawrence');
	INSERT INTO Surnames(Surname) VALUES('Pineda');
	INSERT INTO Surnames(Surname) VALUES('Beck');
	INSERT INTO Surnames(Surname) VALUES('Roth');
	INSERT INTO Surnames(Surname) VALUES('Cummings');
	INSERT INTO Surnames(Surname) VALUES('Walter');
	INSERT INTO Surnames(Surname) VALUES('Berry');
	INSERT INTO Surnames(Surname) VALUES('Wolfe');
	INSERT INTO Surnames(Surname) VALUES('Carter');
	INSERT INTO Surnames(Surname) VALUES('Burton');
	INSERT INTO Surnames(Surname) VALUES('Molina');
	INSERT INTO Surnames(Surname) VALUES('Odonnell');
	INSERT INTO Surnames(Surname) VALUES('Mejia');
	INSERT INTO Surnames(Surname) VALUES('Mccann');
	INSERT INTO Surnames(Surname) VALUES('Sweeney');
	INSERT INTO Surnames(Surname) VALUES('Moreno');
	INSERT INTO Surnames(Surname) VALUES('Wolfe');
	INSERT INTO Surnames(Surname) VALUES('Zavala');
	INSERT INTO Surnames(Surname) VALUES('George');
	INSERT INTO Surnames(Surname) VALUES('Velazquez');
	INSERT INTO Surnames(Surname) VALUES('Lang');
	INSERT INTO Surnames(Surname) VALUES('Lowe');
	INSERT INTO Surnames(Surname) VALUES('Parsons');
	INSERT INTO Surnames(Surname) VALUES('Todd');
	INSERT INTO Surnames(Surname) VALUES('Stark');
	INSERT INTO Surnames(Surname) VALUES('Raymond');
	INSERT INTO Surnames(Surname) VALUES('Cobb');
	INSERT INTO Surnames(Surname) VALUES('Mendez');
	INSERT INTO Surnames(Surname) VALUES('Hartman');
	INSERT INTO Surnames(Surname) VALUES('Pope');
	INSERT INTO Surnames(Surname) VALUES('Wiggins');
	INSERT INTO Surnames(Surname) VALUES('Fox');
	INSERT INTO Surnames(Surname) VALUES('Hayes');
	INSERT INTO Surnames(Surname) VALUES('Middleton');
	INSERT INTO Surnames(Surname) VALUES('Whitaker');
	INSERT INTO Surnames(Surname) VALUES('Eaton');
	INSERT INTO Surnames(Surname) VALUES('Khan');
	INSERT INTO Surnames(Surname) VALUES('Conway');
	INSERT INTO Surnames(Surname) VALUES('Daniel');
	INSERT INTO Surnames(Surname) VALUES('Craig');
	INSERT INTO Surnames(Surname) VALUES('Key');
	INSERT INTO Surnames(Surname) VALUES('Monroe');
	INSERT INTO Surnames(Surname) VALUES('Joyce');

	INSERT INTO Phone(Phone) VALUES('2168847693');
	INSERT INTO Phone(Phone) VALUES('5038076623');
	INSERT INTO Phone(Phone) VALUES('7865400600');
	INSERT INTO Phone(Phone) VALUES('5293036945');
	INSERT INTO Phone(Phone) VALUES('6269315511');
	INSERT INTO Phone(Phone) VALUES('1897549980');
	INSERT INTO Phone(Phone) VALUES('8957615659');
	INSERT INTO Phone(Phone) VALUES('2287968738');
	INSERT INTO Phone(Phone) VALUES('2716058497');
	INSERT INTO Phone(Phone) VALUES('5357560533');
	INSERT INTO Phone(Phone) VALUES('3003958659');
	INSERT INTO Phone(Phone) VALUES('6667021231');
	INSERT INTO Phone(Phone) VALUES('2220247737');
	INSERT INTO Phone(Phone) VALUES('2303535123');
	INSERT INTO Phone(Phone) VALUES('9332559498');
	INSERT INTO Phone(Phone) VALUES('2596800476');
	INSERT INTO Phone(Phone) VALUES('6038120351');
	INSERT INTO Phone(Phone) VALUES('3101627001');
	INSERT INTO Phone(Phone) VALUES('8556158734');
	INSERT INTO Phone(Phone) VALUES('2759299714');
	INSERT INTO Phone(Phone) VALUES('2764951315');
	INSERT INTO Phone(Phone) VALUES('7872346250');
	INSERT INTO Phone(Phone) VALUES('4401517988');
	INSERT INTO Phone(Phone) VALUES('6861708544');
	INSERT INTO Phone(Phone) VALUES('8368742496');
	INSERT INTO Phone(Phone) VALUES('1217680937');
	INSERT INTO Phone(Phone) VALUES('9451746510');
	INSERT INTO Phone(Phone) VALUES('7632998095');
	INSERT INTO Phone(Phone) VALUES('4918007943');
	INSERT INTO Phone(Phone) VALUES('9488391618');
	INSERT INTO Phone(Phone) VALUES('7725008873');
	INSERT INTO Phone(Phone) VALUES('9407493900');
	INSERT INTO Phone(Phone) VALUES('1276322741');
	INSERT INTO Phone(Phone) VALUES('1512597487');
	INSERT INTO Phone(Phone) VALUES('7178383317');
	INSERT INTO Phone(Phone) VALUES('9152598945');
	INSERT INTO Phone(Phone) VALUES('5927662980');
	INSERT INTO Phone(Phone) VALUES('6998456830');
	INSERT INTO Phone(Phone) VALUES('6089701632');
	INSERT INTO Phone(Phone) VALUES('8119860242');
	INSERT INTO Phone(Phone) VALUES('6413883035');
	INSERT INTO Phone(Phone) VALUES('5646764996');
	INSERT INTO Phone(Phone) VALUES('3152087101');
	INSERT INTO Phone(Phone) VALUES('1735151720');
	INSERT INTO Phone(Phone) VALUES('1156296868');
	INSERT INTO Phone(Phone) VALUES('1415901163');
	INSERT INTO Phone(Phone) VALUES('8033197094');
	INSERT INTO Phone(Phone) VALUES('6106683571');
	INSERT INTO Phone(Phone) VALUES('4628507982');
	INSERT INTO Phone(Phone) VALUES('4380906798');
	INSERT INTO Phone(Phone) VALUES('4614958856');
	INSERT INTO Phone(Phone) VALUES('7525084921');
	INSERT INTO Phone(Phone) VALUES('9527785905');
	INSERT INTO Phone(Phone) VALUES('5072207264');
	INSERT INTO Phone(Phone) VALUES('5500968564');
	INSERT INTO Phone(Phone) VALUES('4952237113');
	INSERT INTO Phone(Phone) VALUES('2478720736');
	INSERT INTO Phone(Phone) VALUES('2064811548');
	INSERT INTO Phone(Phone) VALUES('6926073769');
	INSERT INTO Phone(Phone) VALUES('6316511402');
	INSERT INTO Phone(Phone) VALUES('1203742263');
	INSERT INTO Phone(Phone) VALUES('1635031792');
	INSERT INTO Phone(Phone) VALUES('7569499286');
	INSERT INTO Phone(Phone) VALUES('2023553531');
	INSERT INTO Phone(Phone) VALUES('7467252308');
	INSERT INTO Phone(Phone) VALUES('4904668497');
	INSERT INTO Phone(Phone) VALUES('6610441557');
	INSERT INTO Phone(Phone) VALUES('2046335038');
	INSERT INTO Phone(Phone) VALUES('5026822323');
	INSERT INTO Phone(Phone) VALUES('1551140906');
	INSERT INTO Phone(Phone) VALUES('6312324250');
	INSERT INTO Phone(Phone) VALUES('9780834131');
	INSERT INTO Phone(Phone) VALUES('6718482033');
	INSERT INTO Phone(Phone) VALUES('1786155125');
	INSERT INTO Phone(Phone) VALUES('6386140449');
	INSERT INTO Phone(Phone) VALUES('6488822738');
	INSERT INTO Phone(Phone) VALUES('4959373267');
	INSERT INTO Phone(Phone) VALUES('3606919828');
	INSERT INTO Phone(Phone) VALUES('5193491889');
	INSERT INTO Phone(Phone) VALUES('8059482625');
	INSERT INTO Phone(Phone) VALUES('2349756350');
	INSERT INTO Phone(Phone) VALUES('4426290681');
	INSERT INTO Phone(Phone) VALUES('4165387994');
	INSERT INTO Phone(Phone) VALUES('9608448993');
	INSERT INTO Phone(Phone) VALUES('5535247077');
	INSERT INTO Phone(Phone) VALUES('9670701406');
	INSERT INTO Phone(Phone) VALUES('9892149844');
	INSERT INTO Phone(Phone) VALUES('5012925953');
	INSERT INTO Phone(Phone) VALUES('5050135293');
	INSERT INTO Phone(Phone) VALUES('3426676333');
	INSERT INTO Phone(Phone) VALUES('8500580914');
	INSERT INTO Phone(Phone) VALUES('4414887625');
	INSERT INTO Phone(Phone) VALUES('1830994819');
	INSERT INTO Phone(Phone) VALUES('1499828535');
	INSERT INTO Phone(Phone) VALUES('7799468285');
	INSERT INTO Phone(Phone) VALUES('6262415222');
	INSERT INTO Phone(Phone) VALUES('7875180823');
	INSERT INTO Phone(Phone) VALUES('2978986217');
	INSERT INTO Phone(Phone) VALUES('3182294982');
	INSERT INTO Phone(Phone) VALUES('7957366544');
	INSERT INTO Phone(Phone) VALUES('4632158629');
	INSERT INTO Phone(Phone) VALUES('7710310178');
	INSERT INTO Phone(Phone) VALUES('1207520475');
	INSERT INTO Phone(Phone) VALUES('3720988377');
	INSERT INTO Phone(Phone) VALUES('7863542403');
	INSERT INTO Phone(Phone) VALUES('4231958180');
	INSERT INTO Phone(Phone) VALUES('1746368185');
	INSERT INTO Phone(Phone) VALUES('9893338957');
	INSERT INTO Phone(Phone) VALUES('9731680391');
	INSERT INTO Phone(Phone) VALUES('8905298279');
	INSERT INTO Phone(Phone) VALUES('9710786357');
	INSERT INTO Phone(Phone) VALUES('8001949202');
	INSERT INTO Phone(Phone) VALUES('7772475140');
	INSERT INTO Phone(Phone) VALUES('7788721427');
	INSERT INTO Phone(Phone) VALUES('4977533329');
	INSERT INTO Phone(Phone) VALUES('6553613189');
	INSERT INTO Phone(Phone) VALUES('6239906339');
	INSERT INTO Phone(Phone) VALUES('8781232571');
	INSERT INTO Phone(Phone) VALUES('7979313908');
	INSERT INTO Phone(Phone) VALUES('8036791175');
	INSERT INTO Phone(Phone) VALUES('4348043118');
	INSERT INTO Phone(Phone) VALUES('1308753417');
	INSERT INTO Phone(Phone) VALUES('6303531664');
	INSERT INTO Phone(Phone) VALUES('3404983427');
	INSERT INTO Phone(Phone) VALUES('3960241416');
	INSERT INTO Phone(Phone) VALUES('3214989283');
	INSERT INTO Phone(Phone) VALUES('9100923862');
	INSERT INTO Phone(Phone) VALUES('6378281203');
	INSERT INTO Phone(Phone) VALUES('3123927363');
	INSERT INTO Phone(Phone) VALUES('9866170048');
	INSERT INTO Phone(Phone) VALUES('9041532626');
	INSERT INTO Phone(Phone) VALUES('3079067261');
	INSERT INTO Phone(Phone) VALUES('1552421669');
	INSERT INTO Phone(Phone) VALUES('7053631931');
	INSERT INTO Phone(Phone) VALUES('5617599578');
	INSERT INTO Phone(Phone) VALUES('5738813344');
	INSERT INTO Phone(Phone) VALUES('4645132795');
	INSERT INTO Phone(Phone) VALUES('1289238982');
	INSERT INTO Phone(Phone) VALUES('3320627817');
	INSERT INTO Phone(Phone) VALUES('1172743290');
	INSERT INTO Phone(Phone) VALUES('8074797812');
	INSERT INTO Phone(Phone) VALUES('1788649115');
	INSERT INTO Phone(Phone) VALUES('5803213282');
	INSERT INTO Phone(Phone) VALUES('7235797609');
	INSERT INTO Phone(Phone) VALUES('4250571798');
	INSERT INTO Phone(Phone) VALUES('9726276719');
	INSERT INTO Phone(Phone) VALUES('6990428748');
	INSERT INTO Phone(Phone) VALUES('3051981359');
	INSERT INTO Phone(Phone) VALUES('6899445327');
	INSERT INTO Phone(Phone) VALUES('1899566136');
	INSERT INTO Phone(Phone) VALUES('9236956251');
	INSERT INTO Phone(Phone) VALUES('9317526382');
	INSERT INTO Phone(Phone) VALUES('4218232830');
	INSERT INTO Phone(Phone) VALUES('4387446505');
	INSERT INTO Phone(Phone) VALUES('4615979465');
	INSERT INTO Phone(Phone) VALUES('3720030370');
	INSERT INTO Phone(Phone) VALUES('1938507424');
	INSERT INTO Phone(Phone) VALUES('8856632866');
	INSERT INTO Phone(Phone) VALUES('1823075631');
	INSERT INTO Phone(Phone) VALUES('5175003168');
	INSERT INTO Phone(Phone) VALUES('5022774575');
	INSERT INTO Phone(Phone) VALUES('4561781388');
	INSERT INTO Phone(Phone) VALUES('6914025306');
	INSERT INTO Phone(Phone) VALUES('1824937025');
	INSERT INTO Phone(Phone) VALUES('8214095208');
	INSERT INTO Phone(Phone) VALUES('6600789592');
	INSERT INTO Phone(Phone) VALUES('7066817473');
	INSERT INTO Phone(Phone) VALUES('9378343329');
	INSERT INTO Phone(Phone) VALUES('3553116390');
	INSERT INTO Phone(Phone) VALUES('9956993529');
	INSERT INTO Phone(Phone) VALUES('3496452757');
	INSERT INTO Phone(Phone) VALUES('6972916957');
	INSERT INTO Phone(Phone) VALUES('6657579402');
	INSERT INTO Phone(Phone) VALUES('6528683839');
	INSERT INTO Phone(Phone) VALUES('9366451114');
	INSERT INTO Phone(Phone) VALUES('4218466908');
	INSERT INTO Phone(Phone) VALUES('6484439708');
	INSERT INTO Phone(Phone) VALUES('9368960620');
	INSERT INTO Phone(Phone) VALUES('8541621169');
	INSERT INTO Phone(Phone) VALUES('3469240597');
	INSERT INTO Phone(Phone) VALUES('6050412556');
	INSERT INTO Phone(Phone) VALUES('6417560192');
	INSERT INTO Phone(Phone) VALUES('1690861915');
	INSERT INTO Phone(Phone) VALUES('2910553529');
	INSERT INTO Phone(Phone) VALUES('1018489963');
	INSERT INTO Phone(Phone) VALUES('1365513651');
	INSERT INTO Phone(Phone) VALUES('9908159951');
	INSERT INTO Phone(Phone) VALUES('6596071575');
	INSERT INTO Phone(Phone) VALUES('4366952877');
	INSERT INTO Phone(Phone) VALUES('2141211350');
	INSERT INTO Phone(Phone) VALUES('4802678030');
	INSERT INTO Phone(Phone) VALUES('5107191864');
	INSERT INTO Phone(Phone) VALUES('1391867761');
	INSERT INTO Phone(Phone) VALUES('7230945862');
	INSERT INTO Phone(Phone) VALUES('6305809743');
	INSERT INTO Phone(Phone) VALUES('5495239465');
	INSERT INTO Phone(Phone) VALUES('5127533518');
	INSERT INTO Phone(Phone) VALUES('5735214516');
	INSERT INTO Phone(Phone) VALUES('8970347610');
	INSERT INTO Phone(Phone) VALUES('7248212318');


	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Shreveport', '68-512', 'Somalia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Pittsburgh', '33-860', 'Zambia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Milwaukee', '91-742', 'Mauritius');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'Fort Wayne', '40-455', 'Iran');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'San Jose', '42-506', 'Algeria');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Kansas', '54-685', 'Australia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Des Moines', '64-354', 'Panama');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Honolulu', '70-077', 'Jordan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Cleveland', '72-675', 'Kyrgyzstan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Los Angeles', '02-631', 'Russia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Shreveport', '69-667', 'Ecuador');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Chicago', '55-017', 'Monaco');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'New York', '24-296', 'Honduras');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Buffalo', '27-199', 'Malvinas');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Albuquerque', '21-122', 'Senegal');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Fort Worth', '07-193', 'Madagascar');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Anchorage', '60-581', 'Malta');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'New Orleans', '89-346', 'Kyrgyzstan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Baton Rouge', '21-673', 'Senegal');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Phoenix', '43-856', 'Sweden');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Phoenix', '79-035', 'Guam');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'St. Louis', '73-186', 'South Georgia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Tucson', '23-755', 'Niue');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Baton Rouge', '58-198', 'Italy');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'Dayton', '68-247', 'Belarus');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Lincoln', '92-119', 'Belize');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'St. Petersburg', '70-869', 'Guyana');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Columbus', '00-903', 'Chile');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'San Antonio', '16-473', 'Nicaragua');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Sanger Str', 'Riverside', '57-493', 'Gambia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Columbus', '14-463', 'Nigeria');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Fort Wayne', '89-280', 'Lithuania');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'San Antonio', '76-339', 'Tonga');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Houston', '55-453', 'Belarus');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'St. Louis', '26-768', 'Argentina');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'Hialeah', '54-493', 'Ukraine');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Riverside', '75-834', 'Guadeloupe');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Stockton', '15-544', 'Bermuda');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Riverside', '99-195', 'Angola');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'San Antonio', '28-217', 'Djibouti');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Houston', '18-365', 'Mexico');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Austin', '95-294', 'South Georgia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Denver', '03-142', 'Indonesia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Toledo', '44-077', 'Portugal');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Bakersfield', '66-275', 'American Samoa');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Tampa', '71-798', 'Ghana');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Los Angeles', '44-003', 'Panama');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Omaha', '43-755', 'Macedonia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'St. Louis', '36-872', 'Malaysia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Omaha', '80-192', 'Russia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Las Vegas', '19-436', 'Taiwan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Arlington', '03-643', 'Macedonia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Dallas', '24-292', 'Madagascar');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Dayton', '58-166', 'Gambia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Anaheim', '48-117', 'Zimbabwe');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Tulsa', '36-196', 'Yemen');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Dallas', '22-381', 'Gibraltar');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Tulsa', '55-990', 'Bulgaria');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Phoenix', '15-705', 'Ghana');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Portland', '41-259', 'Tunisia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'St. Petersburg', '72-069', 'Oman');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Lubbock', '56-759', 'Malawi');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'St. Louis', '38-176', 'Sierra Leone');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Mesa', '19-817', 'Chile');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Phoenix', '07-327', 'Barbados');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Jackson', '28-304', 'Puerto Rico');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Columbus', '84-557', 'Pakistan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Bakersfield', '33-726', 'French Guiana');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Milwaukee', '27-524', 'Luxembourg');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Sanger Str', 'Mesa', '88-320', 'Sudan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'Anaheim', '02-727', 'Congo');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Little Rock', '53-506', 'Jamaica');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Colorado', '49-901', 'Jordan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Las Vegas', '07-790', 'Martinique');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Philadelphia', '56-370', 'France');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Lincoln', '03-083', 'Macedonia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Dallas', '48-286', 'Isle of Man');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'Grand Rapids', '98-181', 'United States');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Shreveport', '59-263', 'Iraq');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'St. Louis', '71-265', 'San Marino');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Mobile', '55-282', 'India');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Milwaukee', '98-134', 'Suriname');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Louisville', '78-893', 'Nauru');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Arlington', '30-197', 'Togo');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Philadelphia', '67-111', 'Italy');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Portland', '35-082', 'Burundi');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Garland', '13-382', 'Virgin Islands');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Seattle', '30-728', 'Montserrat');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'Honolulu', '40-849', 'Belgium');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Glendale', '16-133', 'Aruba');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Shreveport', '22-008', 'Mozambique');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'Nashville', '67-157', 'Cuba');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'St. Petersburg', '65-921', 'Serbia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Oakland', '59-333', 'Bhutan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Sanger Str', 'Honolulu', '71-494', 'Malta');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Milwaukee', '85-290', 'Armenia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Columbus', '21-919', 'Anguilla');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Baton Rouge', '05-026', 'Dominica');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Sacramento', '26-641', 'New Caledonia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Memphis', '56-521', 'Finland');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Norfolk', '98-300', 'Nepal');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Philadelphia', '74-135', 'Indonesia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Long Beach', '69-684', 'Albania');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Lincoln', '99-488', 'Palau');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Dayton', '40-986', 'Mauritius');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Jersey', '75-154', 'Japan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Detroit', '23-062', 'Bahrain');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Tulsa', '71-472', 'Venezuela');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Hialeah', '91-225', 'American Samoa');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Jackson', '30-595', 'Kyrgyzstan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'Charlotte', '37-300', 'Mauritius');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'New Orleans', '50-267', 'Honduras');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Rochester', '84-130', 'Poland');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Raleigh', '39-282', 'Malta');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Buffalo', '33-660', 'Luxembourg');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Omaha', '44-623', 'South Georgia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Oklahoma', '14-675', 'Tonga');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Baton Rouge', '57-641', 'Timor-Leste');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Omaha', '85-178', 'Réunion');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Jackson', '68-973', 'United States');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Greensboro', '03-074', 'Russia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Aurora', '49-173', 'Bangladesh');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Santa Ana', '51-183', 'Côte dIvoire');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Denver', '80-550', 'Kenya');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Richmond', '54-920', 'Djibouti');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'St. Louis', '39-768', 'Vietnam');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Portland', '64-044', 'New Zealand');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Columbus', '65-997', 'Greenland');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Boston', '28-237', 'Albania');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Greensboro', '40-433', 'Egypt');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Greensboro', '23-253', 'Liberia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Sanger Str', 'St. Louis', '66-063', 'Comoros');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Sacramento', '88-332', 'Gabon');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Anaheim', '01-303', 'Brazil');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Akron', '37-109', 'Burundi');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Raleigh', '23-331', 'Zimbabwe');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Yonkers', '29-730', 'Sri Lanka');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Shreveport', '11-910', 'Ukraine');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Sanger Str', 'Aurora', '18-599', 'Grenada');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Atlanta', '89-534', 'Yemen');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'New Orleans', '43-914', 'Bahamas');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Fresno', '24-625', 'Algeria');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Atlanta', '53-992', 'Monaco');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'St. Petersburg', '57-313', 'Myanmar');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Tampa', '91-060', 'Lesotho');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Mesa', '81-064', 'Djibouti');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Louisville', '43-730', 'Lesotho');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Garland', '58-414', 'Ecuador');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Dayton', '51-904', 'Montserrat');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'Little Rock', '24-654', 'Poland');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Lubbock', '20-382', 'Burkina Faso');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Washington', '40-830', 'Bulgaria');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'Nashville', '35-458', 'Libya');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'Las Vegas', '04-595', 'Panama');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Portland', '81-756', 'Malawi');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'Garland', '76-329', 'Malvinas');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Santa Ana', '19-749', 'Côte dIvoire');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'San Diego', '80-064', 'Malvinas');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'San Diego', '68-867', 'Kenya');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Tampa', '85-739', 'Monaco');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Albuquerque', '94-292', 'Serbia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Glendale', '59-563', 'Réunion');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'New Orleans', '19-921', 'Vanuatu');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Bakersfield', '73-614', 'Samoa');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Garland', '30-093', 'Western Sahara');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Los Angeles', '50-713', 'Honduras');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Grand Rapids', '89-946', 'Bangladesh');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Dallas', '53-184', 'Monaco');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Houston', '15-785', 'Indonesia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Raleigh', '98-690', 'Macao');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Las Vegas', '99-079', 'Western Sahara');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Wichita', '33-686', 'Venezuela');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Los Angeles', '61-188', 'Mauritania');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'Baltimore', '41-389', 'Russia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Colorado', '17-551', 'Taiwan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Pittsburgh', '46-051', 'Réunion');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'Atlanta', '29-982', 'Liberia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Montgomery', '66-011', 'Micronesia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Akron', '71-890', 'Venezuela');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Cleveland', '62-252', 'Afghanistan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Raleigh', '48-366', 'Lebanon');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Sanger Str', 'Pittsburgh', '28-976', 'Iran');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Austin', '08-490', 'Puerto Rico');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Nashville', '43-516', 'France');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'New York', '60-390', 'Benin');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Riverside', '74-542', 'Guernsey');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'San Antonio', '33-246', 'Pakistan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Jackson', '46-516', 'Montenegro');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Oklahoma', '58-406', 'Montenegro');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Des Moines', '76-753', 'Monaco');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'El Paso', '46-481', 'Seychelles');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Mobile', '92-790', 'French Guiana');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Aurora', '39-842', 'Latvia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Milwaukee', '59-458', 'Romania');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Sanger Str', 'Fort Wayne', '73-831', 'Côte dIvoire');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Long Beach', '99-248', 'Greece');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'New Orleans', '54-054', 'Aruba');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Oakland', '67-101', 'Somalia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Richmond', '78-325', 'Nepal');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Mesa', '98-682', 'Bermuda');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Anchorage', '97-945', 'Cameroon');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Wichita', '53-941', 'Togo');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Lubbock', '55-200', 'Spain');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'San Francisco', '00-134', 'Belarus');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Kansas', '68-710', 'Qatar');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Atlanta', '03-659', 'China');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Memphis', '56-841', 'Mexico');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Indianapolis', '21-820', 'Romania');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Phoenix', '75-013', 'South Africa');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Dayton', '59-303', 'Serbia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'Colorado', '26-400', 'Australia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'St. Petersburg', '35-832', 'Namibia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Charlotte', '60-807', 'Micronesia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Grand Rapids', '83-463', 'Kenya');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Des Moines', '71-379', 'Benin');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Fort Wayne', '57-293', 'Honduras');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Las Vegas', '04-803', 'Algeria');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Arlington', '93-051', 'North Korea');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Little Rock', '20-475', 'Niue');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Seattle', '48-534', 'Nauru');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Glendale', '35-049', 'Palau');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Philadelphia', '83-590', 'Latvia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Jackson', '70-176', 'Zambia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Cleveland', '62-277', 'Slovenia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Mesa', '66-798', 'Poland');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Hialeah', '88-126', 'Palau');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Mobile', '74-757', 'Lesotho');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Yonkers', '71-588', 'Slovenia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Sanger Str', 'Indianapolis', '28-711', 'Malvinas');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'El Paso', '62-022', 'Malvinas');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Milwaukee', '13-508', 'Palau');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Bakersfield', '89-200', 'Norway');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'San Jose', '58-098', 'Uruguay');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Milwaukee', '02-142', 'Sweden');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Santa Ana', '19-256', 'Sudan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'New Orleans', '74-897', 'Moldova');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Mesa', '82-113', 'Mayotte');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Sanger Str', 'San Francisco', '47-233', 'New Caledonia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Spokane', '15-568', 'Martinique');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Corpus Christi', '98-432', 'Uganda');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Wichita', '40-011', 'Saudi Arabia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Fremont', '09-289', 'United States');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Anchorage', '27-134', 'Saudi Arabia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Pittsburgh', '86-398', 'Slovakia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'Denver', '34-803', 'Malawi');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Newark', '67-220', 'China');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Tulsa', '53-788', 'Philippines');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Dayton', '10-081', 'American Samoa');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Atlanta', '39-231', 'Netherlands');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'New York', '43-868', 'South Africa');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Riverside', '06-134', 'Germany');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'New Orleans', '39-092', 'Honduras');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'Honolulu', '43-113', 'Cambodia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Tampa', '76-885', 'Albania');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Norfolk', '08-201', 'Iraq');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'St. Petersburg', '32-563', 'North Korea');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Stockton', '09-393', 'Tonga');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Las Vegas', '06-552', 'Angola');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Truman Str', 'Anaheim', '00-491', 'Guinea-Bissau');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Cincinnati', '18-901', 'Armenia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Newark', '09-492', 'Oman');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Tucson', '68-910', 'Saint Helena');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Sanger Str', 'Arlington', '11-597', 'Cook Islands');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Lubbock', '26-717', 'Falklands');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Aurora', '13-918', 'Belize');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'St. Paul', '71-595', 'Haiti');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Colorado', '26-703', 'North Korea');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Memphis', '61-138', 'Pitcairn');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Portland', '25-758', 'Morocco');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Newark', '41-020', 'Macedonia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Einstein Str', 'Cincinnati', '06-929', 'Slovakia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Toledo', '05-048', 'Guyana');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'San Diego', '19-790', 'Bhutan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Portland', '52-468', 'Qatar');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Riverside', '45-825', 'Sudan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Tacoma', '45-198', 'Romania');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Charlotte', '08-100', 'Paraguay');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Virginia Beach', '22-209', 'Congo');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Anthony Str', 'Fremont', '41-513', 'Fiji');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Bakersfield', '91-138', 'Malvinas');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Minneapolis', '44-922', 'Virgin Islands');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'Garland', '41-674', 'Kyrgyzstan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Omaha', '24-251', 'China');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Indianapolis', '37-856', 'Puerto Rico');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Mesa', '64-616', 'Dominica');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Columbus', '77-779', 'Germany');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Wilson Str', 'Santa Ana', '01-382', 'Malawi');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Franklin Str', 'Tampa', '66-876', 'United Kingdom');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Washington Str', 'Mesa', '78-765', 'Jordan');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Roosevelt Str', 'Montgomery', '74-684', 'Colombia');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Marshall Str', 'Toledo', '72-820', 'Norway');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'Dayton', '68-633', 'Malta');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Mesa', '79-397', 'Falklands');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Omaha', '81-142', 'Lithuania');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Lincoln Str', 'Phoenix', '78-081', 'Eire');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Hamilton Str', 'Memphis', '45-567', 'Andorra');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Madison Str', 'Fremont', '05-218', 'Rwanda');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Edison Str', 'Madison', '41-874', 'Liechtenstein');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Jefferson Str', 'Riverside', '04-770', 'Peru');
	INSERT INTO Address(Street, City, PostalCode, Country) VALUES('Foster Str', 'Jersey', '08-520', 'Canada');

	INSERT INTO Company(Name, Email) VALUES('Survenentor WorldWide ', 'ofizher.lshtlesml@ifceufuro.llrndb.net');
INSERT INTO Company(Name, Email) VALUES('Thruwerar  ', 'ykmo40@rmrnhk.net');
INSERT INTO Company(Name, Email) VALUES('Tupdimedentor Holdings Inc', 'deecjaf.fpeg@qmunt.ussrmz.org');
INSERT INTO Company(Name, Email) VALUES('Grocadexan  ', 'xegr.trva@qifmiaq.abmxcj.org');
INSERT INTO Company(Name, Email) VALUES('Supwerexentor Direct ', 'mlwadt354@yqubkilmg.mijvvq.com');
INSERT INTO Company(Name, Email) VALUES('Trukilan International Corp.', 'lqgfkd821@pnpdl.wtawze.org');
INSERT INTO Company(Name, Email) VALUES('Qwidimefantor WorldWide ', 'rtxhkza.vsfqpem@cnxvusjy.tjtg-h.net');
INSERT INTO Company(Name, Email) VALUES('Trufropegantor International Inc', 'mzyue.bulgbh@qrcnlv.net');
INSERT INTO Company(Name, Email) VALUES('Varvenicator Holdings Company', 'xlmgpsos.vrmh@shu-gc.net');
INSERT INTO Company(Name, Email) VALUES('Rerobicator Direct Group', 'eudpwth.ubirozj@jelxc.cevdax.net');
INSERT INTO Company(Name, Email) VALUES('Unmunicin Holdings ', 'ohcvo.dqxds@geiluout.frtkry.org');
INSERT INTO Company(Name, Email) VALUES('Frowerpentor Holdings ', 'qwhu17@gnou.dyyqvp.org');
INSERT INTO Company(Name, Email) VALUES('Thruerexicator WorldWide ', 'avnvdvn504@kvsdqn.net');
INSERT INTO Company(Name, Email) VALUES('Grovenplentor  Inc', 'ffmhpn.hgmmgzwq@ssba.hnemcx.com');
INSERT INTO Company(Name, Email) VALUES('Thrurobepax Holdings ', 'qrmq82@wfuzjrm.bcsuzm.org');
INSERT INTO Company(Name, Email) VALUES('Tuphupupower International Group', 'dukap3@uipges.net');
INSERT INTO Company(Name, Email) VALUES('Tipdudewazz  Group', 'fvsidna@vszlne.org');
INSERT INTO Company(Name, Email) VALUES('Tipmunower Holdings ', 'awlo581@xzcsh.zvpwzk.com');
INSERT INTO Company(Name, Email) VALUES('Lomhupover International Corp.', 'cacvwbbe.jthgep@u-ofsz.net');
INSERT INTO Company(Name, Email) VALUES('Inrobimax  ', 'okkyalwj402@tbkjo.sq-faq.com');
INSERT INTO Company(Name, Email) VALUES('Winzapefower WorldWide ', 'vhddtm.yryxx@corlgv.org');
INSERT INTO Company(Name, Email) VALUES('Sursipplan  ', 'qdcvtks.huoui@va-csj.com');
INSERT INTO Company(Name, Email) VALUES('Tuphupower WorldWide ', 'voxqkeht.maqr@fsdpbi.org');
INSERT INTO Company(Name, Email) VALUES('Frocadplin International Company', 'rfqf.pgmzzembop@xvvxvd.org');
INSERT INTO Company(Name, Email) VALUES('Tupvenegantor Holdings ', 'xzfba09@bypjgn.rtwddo.com');
INSERT INTO Company(Name, Email) VALUES('Hapdudexazz  ', 'llatjmcd0@mxlc.aycgmo.com');
INSERT INTO Company(Name, Email) VALUES('Hapfropaman WorldWide ', 'mjvtvqmz@vayumsgc.dwkavm.com');
INSERT INTO Company(Name, Email) VALUES('Montinentor WorldWide ', 'eylj733@yzlaix.com');
INSERT INTO Company(Name, Email) VALUES('Wineristor  ', 'zivtihlh69@bwxqv.-ekaxw.org');
INSERT INTO Company(Name, Email) VALUES('Froquestollex WorldWide ', 'svbei5@cctshysv.cyodsa.net');
INSERT INTO Company(Name, Email) VALUES('Adtumedgistor WorldWide ', 'uxtwldsp.nrrdlnsn@hxmibq.org');
INSERT INTO Company(Name, Email) VALUES('Doprobower Holdings Corp.', 'dricm@iry-cp.com');
INSERT INTO Company(Name, Email) VALUES('Ciphupplentor Holdings ', 'eoanblfi.wkktud@z-keef.net');
INSERT INTO Company(Name, Email) VALUES('Tipnipistor Holdings ', 'jvuw81@zgaebt.com');
INSERT INTO Company(Name, Email) VALUES('Dopfropopover Direct ', 'ahfox.rqptzjutdc@dnonfw.drjtyq.net');
INSERT INTO Company(Name, Email) VALUES('Winpebax Holdings Inc', 'flsuyz.rhlxten@sfiglu.org');
INSERT INTO Company(Name, Email) VALUES('Froglibexazz Holdings Group', 'fqjhw.hxpikhlpiz@tyyzel.com');
INSERT INTO Company(Name, Email) VALUES('Varsipedgax Direct Group', 'kjetrsc.lfvrhqvp@whqago.ftgrdv.org');
INSERT INTO Company(Name, Email) VALUES('Wintanar Holdings ', 'sytwrre.xubolhcja@ythxdb.com');
INSERT INTO Company(Name, Email) VALUES('Aderadan WorldWide Group', 'mqgkpgp.snwrpkdmna@dhdxlk.net');
INSERT INTO Company(Name, Email) VALUES('Dopnipan Holdings Inc', 'vsofw6@hwoaqmb.ijekqb.net');
INSERT INTO Company(Name, Email) VALUES('Bartinexower International ', 'hicm@f-zquj.net');
INSERT INTO Company(Name, Email) VALUES('Barwerpan WorldWide ', 'cbsyxe.vjbokk@nayhoxi.eltpmk.org');
INSERT INTO Company(Name, Email) VALUES('Grosipimistor Holdings Company', 'qtip@rjqutb.net');
INSERT INTO Company(Name, Email) VALUES('Parjubopower WorldWide Inc', 'zmdt91@slk-ej.org');
INSERT INTO Company(Name, Email) VALUES('Endvenistor Holdings ', 'yrcmdtcv.gnscsxrah@cvcwb-.com');
INSERT INTO Company(Name, Email) VALUES('Endsapador  ', 'rfgsr753@qwtyf.qsmjdb.com');
INSERT INTO Company(Name, Email) VALUES('Emtinackan International ', 'uwypbt.yyzuaxrddr@xgaeqn.com');
INSERT INTO Company(Name, Email) VALUES('Hapjubupower  ', 'ehaee28@pamyvy.com');
INSERT INTO Company(Name, Email) VALUES('Parkilistor Direct Group', 'tbjfnd.nutznk@qxvpvm.com');

	
	--iterators
	DECLARE @ConfIt int,
			@ConfDayIt int,
			@PriceIt int,
			@PaymentIt int,
			@ConfSUIt int,
			@WshopSUIt int,
			@CustIt int,
			@WshopIt int,
			@SignIt int,
			@i1 int,
			@i2 int,
			@i3 int,
			@i4 int

	--variables
	DECLARE @startDate date = '2012-01-01',
			@buffor1 int,
			@buffor2 int,
			@nrOfSigned int, --reservations(?)
			@nrOfCDays int,
			@CustOnDay int,
			@day date,
			@nrOfWshops int,
			@wshopPrice money,
			@numberOfPpl int,
			@number2OfPpl int,
			@nrOfPrices int,
			@nrOfWshopPpl int,
			@nrOfPayments int,
			@nrOfWshopSigned int,
			@nrOfWshopReserv int,

			@ConfID int,
			@CompanyID int,
			@ConfDayID int,
			@BeginningDate date,
			@EndingDate date,
			@CompanyName nvarchar(50),
			@Name nvarchar(20),
			@Surname nvarchar(30),
			@Street nvarchar(20),
			@City nvarchar(20),
			@PostalCode varchar(6),
			@Country varchar(20),
			@Email varchar(50),
			@Phone varchar(20),
			@Name2 nvarchar(50),
			@Surname2 nvarchar(20),
			@Price money,
			@Time time,
			@check int,
			@ConfSignUpID int,
			@WshopSignUpID int

			SET @ConfIt = 0
			WHILE @ConfIt < @Months*@ConfPerMonth
			BEGIN
				SET @ConfIt = @ConfIt + 1
				SET @BeginningDate = DATEADD(day, @ConfIt * 30 / @ConfPerMonth, @startDate)
				SET @EndingDate = DATEADD(day, cast((RAND()*3) as int), @BeginningDate)
				SET @buffor1 = CAST((RAND()*49 + 1) as int)

				--INSERT INTO Conferences
				DECLARE @CName nvarchar(50) = (SELECT Name+' Conference' FROM Company WHERE CompanyID = CAST((RAND()*49 + 1) as int)),
					    @CDateFrom date = @BeginningDate,
					    @CDateTo date = @EndingDate,
						@CStreet nvarchar(30) = (SELECT Street FROM Address WHERE AddressID=@buffor1),
						@CCity nvarchar(30) = (SELECT City FROM Address WHERE AddressID=@buffor1),
						@CPostalCode varchar(10) = (SELECT PostalCode FROM Address WHERE AddressID=@buffor1),
						@CCountry varchar(20) = (SELECT Country FROM Address WHERE AddressID=@buffor1),
						@CCancelled bit = null
				EXECUTE dbo.addConference
						@CName,
						@CDateFrom,
						@CDateTo,
						@CStreet,
						@CCity,
						@CPostalCode,
						@CCountry,
						@CCancelled
				SET @ConfID = @@IDENTITY

				SET @CustIt = 0
				WHILE @CustIt < @nrOfCompanies + @nrOfIndivCust
				BEGIN
					SET @CustIt = @CustIt + 1

					BEGIN TRY
						IF @CustIt <= @nrOfIndivCust
						BEGIN
							SET @buffor1 = CAST((RAND()*49 + 50) as int)
							DECLARE @IsCompany bit = 0
							SET @CompanyName = null
							SET @Phone = (SELECT Phone FROM Phone WHERE PhoneID = CAST((RAND()*198 + 1) as int))
							SET @Name = (SELECT Name FROM Names WHERE NameID=CAST((RAND()*98 + 1) as int))
							SET @Surname = (SELECT Surname FROM Surnames WHERE SurnameID=CAST((RAND()*98 + 1) as int))
							DECLARE @Login nvarchar(30) = @Name + '_' + @Surname + CAST(CAST((RAND()*15345+1) as int) as nvarchar)
							DECLARE @Passwd nvarchar(30) = CAST((RAND()*144245+12213) as int)
							SET @Street = (SELECT Street FROM Address WHERE AddressID=@buffor1)
							SET @City = (SELECT City FROM Address WHERE AddressID=@buffor1)
							SET @PostalCode = (SELECT PostalCode FROM Address WHERE AddressID=@buffor1)
							SET @Country = (SELECT Country FROM Address WHERE AddressID=@buffor1)
							SET @Email = @Name + '_' + @Surname + CAST(CAST(RAND()*47865+1 as int) as varchar) + '@gmail.com'--(SELECT Email FROM Company WHERE CompanyID=CAST((RAND()*49 + 1) as int))
							
							EXECUTE dbo.addCustomer
								@IsCompany,
								@CompanyName,
								@Phone,
								@Name,
								@Surname,
								@Login,
								@Passwd,
								@Email,
								@Street,
								@City,
								@PostalCode,
								@Country

							SET @nrOfSigned = 1
							SET @SignIt = 0
							WHILE @SignIt < @nrOfSigned
							BEGIN
								SET @SignIt = @SignIt + 1
								BEGIN TRY
									EXECUTE dbo.addPerson
										@Name,
										@Surname,
										@Phone,
										@Street,
										@City,
										@PostalCode,
										@Country,
										@Email
								END TRY
								BEGIN CATCH
									PRINT('This person already exists in DB, try again')
									SET @SignIt = @SignIt - 1
								END CATCH
							END
						END
						ELSE
						BEGIN

							SET @buffor1 = CAST((RAND()*99 + 200) as int)
							SET @CompanyID= CAST((RAND()*48+1) as int)
							SET @CompanyName=(SELECT Name FROM Company WHERE CompanyID=@CompanyID)
							SET @Phone = (SELECT Phone FROM Phone WHERE PhoneID = CAST((RAND()*198 + 1) as int))
							SET @Name = null
							SET @Surname = null
							SET @Login = SUBSTRING(@CompanyName, 0, 4) + CAST(CAST((RAND()*15345+1) as int) as nvarchar)
							SET @Passwd = CAST(CAST((RAND()*144245+12213) as int) as nvarchar)
							SET @Street = (SELECT Street FROM Address WHERE AddressID=@buffor1)
							SET @City = (SELECT City FROM Address WHERE AddressID=@buffor1)
							SET @PostalCode = (SELECT PostalCode FROM Address WHERE AddressID=@buffor1)
							SET @Country = (SELECT Country FROM Address WHERE AddressID=@buffor1)
							SET @Email = SUBSTRING(@CompanyName, 0, 5) + '_' + (SELECT Email FROM Company WHERE CompanyID=CAST((RAND()*48 + 1) as int))
							
							EXECUTE dbo.addCustomer
								@IsCompany,
								@CompanyName,
								@Phone,
								@Name,
								@Surname,
								@Login,
								@Passwd,
								@Email,
								@Street,
								@City,
								@PostalCode,
								@Country

							SET @nrOfSigned = CAST((RAND()*6+8) as int)
							SET @SignIt = 0
							WHILE @SignIt < @nrOfSigned
							BEGIN
								SET @SignIt = @SignIt + 1
								SET @buffor2 = CAST((RAND()*99+200) as int)
								SET @Name2 = (SELECT Name FROM Names WHERE NameID=CAST((RAND()*98 + 1) as int))
								SET @Surname2 = (SELECT Surname FROM Surnames WHERE SurnameID=CAST((RAND()*98 + 1) as int))
								SET @Phone = (SELECT Phone FROM Phone WHERE PhoneID = CAST((RAND()*198 + 1) as int))
								SET @Street = (SELECT Street FROM Address WHERE AddressID=@buffor2)
								SET @City = (SELECT City FROM Address WHERE AddressID=@buffor2)
								SET @PostalCode = (SELECT PostalCode FROM Address WHERE AddressID=@buffor2)
								SET @Country = (SELECT Country FROM Address WHERE AddressID=@buffor2)
								SET @Email = @Name2 + CAST(CAST(RAND()*50 as int) as varchar) + SUBSTRING((SELECT Email FROM Company WHERE CompanyID=CAST((RAND()*48 + 1) as int)), 4, 30)
								
								BEGIN TRY
									EXECUTE dbo.addPerson
										@Name2,
										@Surname2,
										@Phone,
										@Street,
										@City,
										@PostalCode,
										@Country,
										@Email
								END TRY
								BEGIN CATCH
									PRINT('Person(company member) exists in DB, try again.')
									SET @SignIt = @SignIt - 1
								END CATCH
							END
						END
					END TRY
					BEGIN CATCH
						PRINT('Customer exists in DB, try again.')
						SET @CustIt = @CustIt - 1
					END CATCH
				END

				SET @ConfDayIt = 0
				SET @nrOfCDays = CAST(DATEDIFF(day, @BeginningDate, @EndingDate) as int)+1
				SET @CustOnDay = @nrOfPpl/@nrOfCDays
				SET @CName = (SELECT Name FROM Conferences WHERE ConferenceID=@ConfID AND DateFrom=@CDateFrom)

				WHILE @ConfDayIt < @nrOfCDays
				BEGIN
					SET @day = DATEADD(day, @ConfDayIt, @BeginningDate)
					--@ConfID
					EXECUTE dbo.addConferenceDay
						@CName,
						@day,
						@CustOnDay
					
					SET @ConfDayID = @@IDENTITY
					SET @nrOfWshops = CAST((RAND()*@WshopsPerDay+2) as int)

					SET @WshopIt = 0
					WHILE @WshopIT < @nrOfWshops
					BEGIN
						SET @check = CAST((RAND()*(@CustOnDay-10)+10) as int)
						SET @WshopIt = @WshopIt + 1
						SET @Time = CAST(DATEADD(hour, 2*@WshopIt, CONVERT(time, '09:00')) as time)
						DECLARE @ETime time = DATEADD(hour, 3, @Time)
						SET @wshopPrice = ROUND(CAST((RAND()*100 - 20) as money), 2)
						DECLARE @wPrice money = CASE WHEN @wshopPrice<=0 THEN 0 ELSE @wshopPrice END
						DECLARE @WshopName nvarchar(50) = (SELECT Name+' Workshop' FROM Company WHERE CompanyID=CAST((RAND()*49+1) as int))
						DECLARE @cancelled bit  = null
						
						EXECUTE dbo.addWorkshop
							@ConfID,
							@WshopName,
							@Time,
							@ETime,
							@check,
							@wPrice,
							@cancelled
					END

					SET @i1 = 0 --ConferenceSignUpsIterator
					SET @nrOfPrices = CAST((RAND()*3 + 2) as int)
					DECLARE @ActualCustOnDay int = CAST(RAND()*(@CustOnDay-100)+50 as int)
					WHILE @i1 < @ActualCustOnDay
					BEGIN
						SET @numberOfPpl = CAST((RAND()*6 + 8)as int)

						SET @i1 = @i1 + @numberOfPpl
						BEGIN TRY
							IF @i1 < @ActualCustOnDay
							BEGIN
								INSERT INTO ConferenceSignUps(CustomerID, ConferenceDayID, SignUpDate, Price, NumberOfPpl)
								VALUES (
										(SELECT TOP 1 CustomerID FROM Customers ORDER BY NEWID()),
										@ConfDayID,
										DATEADD(day, (-1)*(RAND()*10+5)*(@nrOfPrices), @day),
										null,
										@numberOfPpl
								);
								SET @ConfSignUpID = @@IDENTITY

								IF CAST(RAND()*100 as int) > 70
								BEGIN
									SET @PaymentIt = 0
									SET @nrOfPayments = RAND()*3+1
									WHILE @PaymentIt < @nrOfPayments
									BEGIN
										SET @PaymentIt = @PaymentIt + 1
										DECLARE @PValue money = ROUND(CAST(RAND()*250+1 as money),2)
										EXECUTE addPayment
											@ConfSignUpID,
											@PValue
									END
								END

								SET @i2 = 0 --SignedConferencesIterator
								WHILE @i2 < @numberOfPpl
								BEGIN
									SET @i2 = @i2 + 1
									IF @i2 < CAST(@numberOfPpl/2 as int)
									BEGIN
										INSERT INTO SignedConferences(ConferenceSignUpID, PersonID, IDCard)
										VALUES (
												@ConfSignUpID,
												(SELECT TOP 1 PersonID FROM People ORDER BY NEWID()),
												null
										);
									END
									ELSE
									BEGIN
										INSERT INTO SignedConferences(ConferenceSignUpID, PersonID, IDCard)
										VALUES (
												@ConfSignUpID,
												(SELECT TOP 1 PersonID FROM People ORDER BY NEWID()),
												CAST((RAND()*199999 + 100000) as int)
										);
									END
								END
							END

							SET @i3 = 0 --WorkshopSignUpsIterator
							SET @nrOfWshopPpl = CAST((RAND()*(@numberOfPpl-1)+1) as int)
							SET @nrOfWshopReserv = CAST((RAND()*3+1) as int)
							SET @number2OfPpl = CAST((@nrOfWshopPpl/@nrOfWshopReserv) as int)

							WHILE @i3 < @nrOfWshopReserv
							BEGIN
								SET @i3 = @i3 + 1
								IF @number2OfPpl > 0
								BEGIN
									INSERT INTO dbo.WorkshopSignUps(WorkshopID, ConferenceSignUpID, NumberOfPpl)
									VALUES (
											@ConfSignUpID,
											@number2OfPpl,
											(SELECT TOP 1 WorkshopID FROM Workshops WHERE ConferenceDayID=@ConfDayID ORDER BY NEWID())
									);
									SET @WshopSignUpID = @@IDENTITY
								END

								SET @i4 = 0 --PeopleIteratorInWshopReserv
								WHILE @i4 < @number2OfPpl
								BEGIN
									SET @i4 = @i4 + 1
									BEGIN TRY
										INSERT INTO dbo.SignedWorkshops(SignedConferenceID, WorkshopSignUpID)
										VALUES (
												(SELECT TOP 1 SignedConferenceID FROM SignedConferences as SC INNER JOIN
																					WorkshopSignUps as WSU ON WSU.ConferenceSignUpID=SC.ConferenceSignUpID
																				 WHERE WSU.WorkshopSignUpID=@WshopSignUpID
																				 ORDER BY NEWID()),
												@WshopSignUpID
										);
									END TRY
									BEGIN CATCH
										PRINT('Problems with this signing')
									END CATCH
								END
							END
						END TRY
						BEGIN CATCH
							PRINT('Limit for places has been reached')
						END CATCH
					END

					SET @PriceIt = 0
					SET @Price = ROUND(CAST((RAND()*100+100) as money), 2)
					
					WHILE @PriceIt < @nrOfPrices
					BEGIN
						IF @PriceIt=@nrOfPrices-1
						BEGIN
							SET @PriceIt = @PriceIt + 1
							DECLARE @Pr money = @Price + (@PriceIt*4)
							DECLARE @ExpD date = @day
							EXECUTE addPrice
								@ConfDayID,
								@Pr,
								@ExpD
						END
						ELSE
						BEGIN
							SET @PriceIt = @PriceIt + 1
							DECLARE @Pr1 money = @Price + (@PriceIt*4)
							DECLARE @ExpD1 date = DATEADD(day, (RAND()*20+10)*@PriceIt, @day)
							EXECUTE addPrice
								@ConfDayID,
								@Pr1,
								@ExpD1
						END
					END

					SET @ConfDayIt = @ConfDayIt + 1
				END
			END

			UPDATE ConferenceSignUps 
			SET Price = dbo.countAllPrice(ConferenceSignUpID)

	
END
	DROP TABLE Address
	DROP TABLE Company
	DROP TABLE Names
	DROP TABLE Phone
	DROP TABLE Surnames
GO