SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE addWorkshop
	@ConferenceDayID int,
	@Name nvarchar(50),
	@BeginHour time,
	@EndHour time,
	@Places int,
	@Price money,
	@Cancelled bit
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Workshops (ConferenceDayID, Name, BeginHour, EndHour, Places, Price, Cancelled)
	VALUES (@ConferenceDayID, @Name, @BeginHour, @EndHour, @Places, @Price, @Cancelled)
END
GO
