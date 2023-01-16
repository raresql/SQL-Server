--Script Name: Excel Financial functions – PMT
--Script Type: Function
--Article: https://raresql.com/2013/05/16/sql-server-excel-financial-functions-pmt/
--Developed By: Muhammad Imran
--Date Created: 16 May 2013
--Date Modified: 11 Jan 2023

--Script

--Create function
CREATE FUNCTION UDF_PMT
(@InterestRate  NUMERIC(18,8), --Rate is the interest rate per period.
@Nper          INT,           --Nper is the total number of payment

--periods in an annuity.
@Pv            NUMERIC(18,4), --Pv is the present value, or the

--lump-sum amount that a series of
--future payments is worth right now.
--If pv is omitted, it is assumed to be
--0 (zero). PV must be entered as a
--negative number.

@Fv            NUMERIC(18,4), --Fv is the future value, or the

--lump-sum amount that a series of
--future payments is worth right now.
--If pv is omitted, it is assumed to
--be 0 (zero). PV must be entered as a
--negative number.

@Type            BIT            --Type is the number 0 or 1 and

--indicates when payments are due.
--If type is omitted, it is assumed
--to be 0 which represents at the end
--of the period.
--If payments are due at the beginning
--of the period, type should be 1.
)
RETURNS NUMERIC(18,2) --float
AS
BEGIN
DECLARE  @Value NUMERIC(18,2)
SELECT @Value = Case
WHEN @Type=0
THEN Convert(float,@InterestRate / 100)
/(Power(Convert(float,(1 + @InterestRate / 100)),@Nper)-1)
* -(@Pv*Power(Convert(float,(1 + @InterestRate / 100)),@Nper)
+@Fv)
 
WHEN @Type=1
THEN Convert(float,@InterestRate / 100) /
(Power(Convert(float,(1 + @InterestRate / 100)),@Nper)-1)
* -(@Pv*Power(Convert(float,(1 + @InterestRate / 100)),@Nper)
+@Fv)
/(1 + Convert(float,(@InterestRate / 100)))
 
END
RETURN @Value
END
GO

--Browse data

SELECT dbo.UDF_PMT(0.625,24,5000,0,0)

GO
SELECT dbo.UDF_PMT(0.11538461,208,8000,0,1)

GO
SELECT dbo.UDF_PMT(5.25,10,6500,0,0)

GO
SELECT dbo.UDF_PMT(0.666666667,36,5000,-1000,1)
GO

--End of script
