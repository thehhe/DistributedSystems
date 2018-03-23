SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE changePersonDetails
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
	IF @Name IS NOT NULL
	BEGIN
		UPDATE dbo.People
		SET Name = @Name
		WHERE People.Email=@Email
	END

	IF @Surname IS NOT NULL
	BEGIN
		UPDATE dbo.People
		SET Surname = @Surname
		WHERE People.Email=@Email
	END

	IF @Phone IS NOT NULL
	BEGIN
		UPDATE dbo.People
		SET Phone = @Phone
		WHERE People.Email=@Email
	END

	IF @Street IS NOT NULL
	BEGIN
		UPDATE dbo.People
		SET Street = @Street
		WHERE People.Email=@Email
	END

	IF @City IS NOT NULL
	BEGIN
		UPDATE dbo.People
		SET City = @City
		WHERE People.Email=@Email
	END

	IF @PostalCode IS NOT NULL
	BEGIN
		UPDATE dbo.People
		SET PostalCode = @PostalCode
		WHERE People.Email=@Email
	END

	IF @Country IS NOT NULL
	BEGIN
		UPDATE dbo.People
		SET Country = @Country
		WHERE People.Email=@Email
	END

END
GO
