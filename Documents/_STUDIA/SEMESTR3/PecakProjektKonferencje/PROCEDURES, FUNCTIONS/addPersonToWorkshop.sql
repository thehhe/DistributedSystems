SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE addPersonToWorkshop
	@SignedConferenceID int,
	@WorkshopSignUpID int
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.SignedWorkshops (SignedConferenceID, WorkshopSignUpID)
	VALUES (@SignedConferenceID, @WorkshopSignUpID)
END
GO
