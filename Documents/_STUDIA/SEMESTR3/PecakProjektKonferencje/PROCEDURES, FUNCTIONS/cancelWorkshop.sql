-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE cancelWorkshop
	@WorkshopID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @buffor int
	DECLARE c CURSOR LOCAL FOR
		SELECT WSU.WorkshopSignUpID FROM WorkshopSignUps as WSU
		WHERE WSU.WorkshopID=@WorkshopID

	OPEN c 
	FETCH NEXT FROM c INTO @buffor
	WHILE @@FETCH_STATUS=0
	BEGIN
		EXEC cancelWorkshopReservation @buffor
		FETCH NEXT FROM c INTO @buffor
	END

	CLOSE c
	DEALLOCATE c

	UPDATE dbo.Workshops
	SET Cancelled=1
	WHERE dbo.Workshops.WorkshopID=@WorkshopID
END
GO
