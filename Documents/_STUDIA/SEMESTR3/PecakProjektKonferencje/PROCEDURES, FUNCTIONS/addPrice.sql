SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE addPrice
	@ConferenceDayID int,
	@Price money,
	@PriceExpireDate date
AS
BEGIN
	SET NOCOUNT ON;
	--IF @PriceExpireDate > GETDATE()
	--BEGIN
		INSERT INTO Prices (ConferenceDayID, Price, PriceExpireDate)
		VALUES (@ConferenceDayID, @Price, @PriceExpireDate)
	--END
	--ELSE
		--PRINT 'You can only add date from the future'
END
GO
