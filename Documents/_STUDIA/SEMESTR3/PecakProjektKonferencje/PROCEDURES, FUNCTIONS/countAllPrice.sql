USE Conf
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION countAllPrice
(
	@ConferenceSignUpID int
)
RETURNS money
AS
BEGIN
	DECLARE @result money

	DECLARE @conf money, @wshop money
	
	SET @conf = ISNULL(
							(SELECT (dbo.findConferencePrice(dbo.ConferenceSignUps.ConferenceSignUpID)*((0.5*NumberOfStudents) + (NumberOfPpl-NumberOfStudents)))
							 FROM dbo.ConferenceSignUps
							 WHERE dbo.ConferenceSignUps.ConferenceSignUpID=@ConferenceSignUpID),0
	)
	
	SET @wshop = ISNULL(
							(SELECT SUM(dbo.countAmountToPayForWorkshop(WSU.WorkshopSignUpID))
							 FROM dbo.WorkshopSignUps as WSU
							 WHERE WSU.ConferenceSignUpID=@ConferenceSignUpID AND WSU.Cancelled!=1), 0
	)
	SET @result = @conf + @wshop
	RETURN @result

END
GO

