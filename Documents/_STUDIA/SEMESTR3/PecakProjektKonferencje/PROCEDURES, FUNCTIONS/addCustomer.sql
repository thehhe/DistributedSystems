
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE addCustomer
	@IsCompany bit,
	@CompanyName nvarchar(50),
	@Phone nvarchar(20),
	@Name nvarchar(20),
	@Surname nvarchar(30),
	@LoginName nvarchar(30),
	@Passwd nvarchar(30),
	@Email varchar(50),
	@Street nvarchar(20),
	@City nvarchar(20),
	@PostalCode varchar(6),
	@Country varchar(20)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO Customers (IsCompany, CompanyName, Phone, Name, Surname, LoginName, Passwd, Email, Street, City, PostalCode, Country)
	VALUES (@IsCompany, @CompanyName, @Phone, @Name, @Surname, @LoginName, @Passwd, @Email, @Street, @City, @PostalCode, @Country)
END
GO
