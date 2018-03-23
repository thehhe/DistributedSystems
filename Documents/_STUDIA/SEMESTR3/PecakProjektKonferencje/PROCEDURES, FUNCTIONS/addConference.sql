SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE addConference
	@Name nvarchar(50),
	@DateFrom date,
	@DateTo date,
	@Street nvarchar(30),
	@City nvarchar(30),
	@PostalCode varchar(10),
	@Country varchar(20),
	@Cancelled bit
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.Conferences (Name, DateFrom, DateTo, Street, City, PostalCode, Country, Cancelled)
	VALUES (@Name, @DateFrom, @DateTo, @Street, @City, @PostalCode, @Country, @Cancelled)
END
GO
