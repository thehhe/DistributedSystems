SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE addPersonToConference
	@Name nvarchar(20),
	@Surname nvarchar(30),
	@Phone varchar(20),
	@Street nvarchar(20),
	@City nvarchar(20),
	@PostalCode varchar(6),
	@Country varchar(20),
	@Email varchar(50),
	@ConferenceSignUpID int,
	@IDCard int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @PersonID AS int
	SET @PersonID = (SELECT PersonID
					FROM dbo.People
					WHERE Name=@Name AND Surname=@Surname AND Email=@Email)
	IF @PersonID IS NULL
	BEGIN
		EXEC dbo.addPerson
		@Name, @Surname, @Phone, @Street, @City, @PostalCode, @Country, @Email
	END

	INSERT INTO SignedConferences(PersonID, ConferenceSignUpID, IDCard)
	VALUES (@PersonID, @ConferenceSignUpID, @IDCard)
END
GO
