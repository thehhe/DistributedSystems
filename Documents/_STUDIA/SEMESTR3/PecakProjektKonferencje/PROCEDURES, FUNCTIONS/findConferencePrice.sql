SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION findConferencePrice
(
	@ConferenceSignUpID int
)
RETURNS money
AS
BEGIN
	DECLARE @amount money 

	SET @amount=ISNULL(
						(SELECT TOP 1 P.Price
						 FROM Prices as P INNER JOIN
							  dbo.ConferenceDays as CD ON P.ConferenceDayID=CD.ConferenceDayID INNER JOIN
							  dbo.ConferenceSignUps as CSU ON CD.ConferenceDayID=CSU.ConferenceDayID
						 WHERE CSU.ConferenceSignUpID=@ConferenceSignUpID
						   AND CSU.SignUpDate<=P.PriceExpireDate
						 ORDER BY P.Price DESC),
						 ISNULL(
							(SELECT TOP 1 P.Price
							 FROM Prices as P INNER JOIN
								  dbo.ConferenceDays as CD ON P.ConferenceDayID=CD.ConferenceDayID INNER JOIN
								  dbo.ConferenceSignUps as CSU ON CD.ConferenceDayID=CSU.ConferenceDayID
							 WHERE CSU.ConferenceSignUpID=@ConferenceSignUpID
							 ORDER BY P.Price DESC), 0)
	)
	RETURN @amount
	
END
GO
