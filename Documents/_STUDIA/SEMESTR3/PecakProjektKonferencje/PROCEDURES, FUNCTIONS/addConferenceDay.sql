SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE addConferenceDay
	@ConfName nvarchar(50),
	@CDay date,
	@Places smallint
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @ConferenceID AS int
	SET @ConferenceID = (SELECT ConferenceID
						 FROM dbo.Conferences
						 WHERE @ConfName=dbo.Conferences.Name
						   AND (@CDay=dbo.Conferences.DateFrom OR @CDay=DATEADD(day, 1, dbo.Conferences.DateFrom) OR @CDay=DATEADD(day, 2, dbo.Conferences.DateFrom)))
	INSERT INTO dbo.ConferenceDays (ConferenceID, CDay, Places)
	VALUES (@ConferenceID, @CDay, @Places)
END
GO
