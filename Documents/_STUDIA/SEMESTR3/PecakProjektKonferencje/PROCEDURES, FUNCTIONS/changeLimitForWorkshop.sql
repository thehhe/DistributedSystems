SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE changeLimitForWorkshop
	@WorkshopID int,
	@Places int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Workshops
	SET Places = @Places
	WHERE WorkshopID=@WorkshopID
END
GO
