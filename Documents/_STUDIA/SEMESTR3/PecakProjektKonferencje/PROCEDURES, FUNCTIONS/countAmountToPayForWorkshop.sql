SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION countAmountToPayForWorkshops
(
	@WorkshopSignUpID int
)
RETURNS money
AS
BEGIN
	
	DECLARE @amount money
	SET @amount=ISNULL(
						(SELECT ((0.5*W.Price*WSU.NumberOfStudents) + (W.Price*(WSU.NumberOfPpl-WSU.NumberOfStudents)))
						 FROM dbo.Workshops as W INNER JOIN 
							  dbo.WorkshopSignUps as WSU ON W.WorkshopID=WSU.WorkshopID
						 WHERE WSU.WorkshopSignUpID=@WorkshopSignUpID), 0
	)

	RETURN @amount

END
GO

