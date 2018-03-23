CREATE PROCEDURE [dbo].[PricesForConferenceDay]
@param INT --­­ConferenceDayId
AS
BEGIN
	SET NOCOUNT ON
	SELECT dbo.Prices.PriceExpireDate, dbo.Prices.Price
	FROM dbo.Prices INNER JOIN
		 dbo.ConferenceDays ON dbo.Prices.ConferenceDayID = dbo.ConferenceDays.ConferenceDayID
	WHERE dbo.ConferenceDays.ConferenceDayID=@param
END