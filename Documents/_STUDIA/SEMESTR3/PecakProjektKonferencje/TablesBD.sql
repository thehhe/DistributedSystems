CREATE TABLE Conferences (
	ConferenceID int not null primary key identity(1,1),
	Name nvarchar(50) null,
	DateFrom date null,
	DateTo date null check(DateTo>DateFrom),
	Street nvarchar(30) null,
	City nvarchar(30) null,
	PostalCode varchar(6) null check(PostalCode like '[0-9][0-9]-[0-9][0-9][0-9]'),
	Country varchar(20) null,
	Cancelled bit null
)

CREATE TABLE ConferenceDays (
	ConferenceDayID int not null primary key identity(1,1),
	ConferenceID int not null foreign key references Conferences(ConferenceID),
	CDay date null,
	Places smallint null
)

CREATE TABLE Prices (
	PriceID int not null primary key identity(1,1),
	ConferenceDayID int not null foreign key references ConferenceDays(ConferenceDayID),
	Price money null check(Price>=0),
	PriceExpireDate date null
)

CREATE TABLE Workshops (
	WorkshopID int not null primary key identity(1,1),
	ConferenceDayID int not null foreign key references ConferenceDays(ConferenceDayID),
	Name varchar(50) null,
	BeginHour time null,
	EndHour time null check(EndHour>BeginHour),
	Places int null check(Places>=0),
	Price money null check(Price>=0),
	Cancelled bit null
)

CREATE TABLE Customers (
	CustomerID int not null primary key identity(1,1),
	IsCompany bit null,
	CompanyName nvarchar(50) null,
	Phone varchar(20) null check(isnumeric(Phone)=1),
	Name nvarchar(20) null,
	Surname nvarchar(30) null,
	LoginName nvarchar(30) unique null,
	Passwd nvarchar(30) not null,
	Email varchar(50) unique not null,
	Street nvarchar(20) null,
	City nvarchar(20) null,
	PostalCode varchar(6) null check(PostalCode like '[0-9][0-9]-[0-9][0-9][0-9]'),
	Country varchar(20) null
)

CREATE TABLE ConferenceSignUps (
	ConferenceSignUpID int not null primary key identity(1,1),
	CustomerID int not null foreign key references Customers(CustomerID),
	ConferenceDayID int not null foreign key references ConferenceDays(ConferenceDayID),
	SignUpDate date null default getdate(),
	Price money null check(Price>=0),
	NumberOfPpl int null default 0 check(NumberOfPpl>=0),
	NumberOfStudents int null default 0 check(NumberOfStudents>=0),
	Cancelled bit null
)

CREATE TABLE People (
	PersonID int not null primary key identity(1,1),
	Name nvarchar(20) null,
	Surname nvarchar(30) null,
	Phone varchar(20) null check(isnumeric(Phone)=1),
	Street nvarchar(20) null,
	City nvarchar(20) null,
	PostalCode varchar(6) null check(PostalCode like '[0-9][0-9]-[0-9][0-9][0-9]'),
	Country varchar(20) null,
	Email varchar(50) UNIQUE not null
)

CREATE TABLE SignedConferences (
	SignedConferenceID int not null primary key identity (1,1),
	PersonID int not null foreign key references People(PersonID),
	ConferenceSignUpID int not null foreign key references ConferenceSignUps(ConferenceSignUpID),
	IDCard int null check(IDCard>=0)
)

CREATE TABLE Payments (
	PaymentID int not null primary key identity(1,1),
	ConferenceSignUpID int not null foreign key references ConferenceSignUps(ConferenceSignUpID),
	Payment money null check(Payment>=0)
)

CREATE TABLE WorkshopSignUps (
	WorkshopSignUpID int not null primary key identity (1,1),
	WorkshopID int not null foreign key references Workshops(WorkshopID),
	ConferenceSignUpID int not null foreign key references ConferenceSignUps(ConferenceSignUpID),
	NumberOfPpl int check(NumberOfPpl>=0),
	NumberOfStudents int check(NumberOfStudents>=0),
	Cancelled bit null
)

CREATE TABLE SignedWorkshops (
	SignedWorkshopID int not null primary key identity (1,1),
	SignedConferenceID int not null foreign key references SignedConferences(SignedConferenceID),
	WorkshopSignUpID int not null foreign key references WorkshopSignUps(WorkshopSignUpID)
)