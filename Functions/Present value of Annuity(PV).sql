--Script Name: Present value of Annuity(PV)
--Script Type: Function
--Article: https://raresql.com/2013/02/08/sql-server-present-value-of-annuitypv/
--Developed By: Muhammad Imran
--Date Created: 8 Feb 2013
--Date Modified: 11 Jan 2023


--Script

--Create function
CREATE FUNCTION UDF_PresentValue
(@InterestRate NUMERIC(18,8), 
@Nper          INT,           
--periods in an annuity.
@Pmt           NUMERIC(18,4), 
--it cannot change over the life
--of the annuity.PaymentValue must be
--entered as a negative number.
@Fv            NUMERIC(18,4), 
--amount that a series of future payments
--is worth right now. If Fv is omitted,
--it is assumed to be 0 (zero).
--FV must be entered as a negative number.
@Type          BIT            
)
RETURNS NUMERIC(18,2) --float
AS
BEGIN
DECLARE  @Value NUMERIC(18,2)
SELECT @Value =
Case WHEN @Type=0
THEN @Pmt*(Power(Convert(float,(1 + @InterestRate / 100)),@Nper)
-1) /(((@InterestRate / 100))
* Power((Convert(float,1 + @InterestRate / 100)),@Nper))
+ @Fv *
Power(Convert(float,(1 + @InterestRate / 100)),@Nper)
 
WHEN @Type=1
THEN @Pmt*(Power(Convert(float,(1 + @InterestRate / 100)),@Nper)
-1) /(((@InterestRate / 100))
* Power((Convert(float,1 + @InterestRate / 100)),@Nper))
* (1 + @InterestRate / 100)
+ @Fv
* Power(Convert(float,(1 + @InterestRate / 100)),@Nper)
END
RETURN @Value*-1
END
GO

--Browse function 
SELECT dbo.UDF_PresentValue(0.625,24,250,0,0)

GO
 
SELECT dbo.UDF_PresentValue(0.1153846,208,50,0,1)
GO

SELECT dbo.UDF_PresentValue(5.25,10,100,0,0)
GO

--End of script
