--Script Name: Future value of Annuity(FV)
--Script Type: Function
--Article: https://raresql.com/2013/02/07/sql-server-future-value-of-annuityfv/
--Developed By: Muhammad Imran
--Date Created: 7 Feb 2013
--Date Modified: 11 Jan 2023

--Script

--Create function
Create FUNCTION UDF_FutureValue
(@InterestRate NUMERIC(18,8),
@Nper INT                 ,  
@Pmt  NUMERIC(18,4)       ,  
@Pv   NUMERIC(18,4)       , 
@Type  BIT        
) RETURNS NUMERIC(18,2)
AS
BEGIN
DECLARE  @Value NUMERIC(18,2)
SELECT @Value =
Case WHEN @Type=0 THEN
@Pmt* ((Power(Convert(float,(1 + @InterestRate / 100)),@Nper)-1)
/Convert(float,(@InterestRate / 100)))
+ @Pv * Power((1 + @InterestRate / 100),@Nper)
 
WHEN @Type=1 THEN
@Pmt*((Power(Convert(float,(1 + @InterestRate / 100)),@Nper)-1)
/Convert(float,(@InterestRate / 100))) *
Convert(float,(1 + @InterestRate / 100))+ @Pv *
Power(Convert(float,(1 + @InterestRate / 100)),@Nper)
END
RETURN @Value*-1
END
GO

--Browse function 
SELECT dbo.UDF_FutureValue(0.625,24,-250,-5000,0)
GO
SELECT dbo.UDF_FutureValue(6,30,0,-5000,1)
GO

SELECT dbo.UDF_FutureValue(6,30,-1200,0,1)
GO

SELECT dbo.UDF_FutureValue(6,30,-1200,-5000,1)
GO
SELECT dbo.UDF_FutureValue(0.50,360,-100,0,1)

--End of script
