SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE addPerson
	@Name nvarchar(20),
	@Surname nvarchar(30),
	@Phone varchar(20),
	@Street nvarchar(20),
	@City nvarchar(20),
	@PostalCode varchar(6),
	@Country varchar(20),
	@Email varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO People (Name, Surname, Phone, Street, City, PostalCode, Country, Email)
	VALUES (@Name, @Surname, @Phone, @Street, @City, @PostalCode, @Country, @Email)
END
GO
