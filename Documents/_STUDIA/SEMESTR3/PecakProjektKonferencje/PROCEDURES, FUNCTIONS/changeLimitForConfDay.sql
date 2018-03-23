SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE changeLimitForConfDay
	@ConferenceDayID int,
	@Places int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.ConferenceDays
	SET Places = @Places
	WHERE ConferenceDayID=@ConferenceDayID
END
GO
