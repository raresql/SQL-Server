--Script Name: Data Formats
--Script Type: Function
--Article: https://raresql.com/2012/10/13/sql-server-2012-date-formats/
--Developed By: Muhammad Imran
--Date Created: 13 Oct 2012
--Date Modified: 7 Jan 2023

--Declare variable
Declare @Date as Date =Getdate()

--Browse date formats
Select @Date --2012-10-13
 
Select Format(@Date,'yy.MM.dd') as [yy.MM.dd] --12.10.13
 
Select Format(@Date,'yyyy.MM.dd') as [yyyy.MM.dd] --2012.10.13
 
Select Format(@Date,'dd.MM.yyyy') as [dd.MM.yyyy] --13.10.2012
 
Select Format(@Date,'MM/dd/yy') as [MM/dd/yy] --10/13/12
 
Select Format(@Date,'MM/dd/yyyy') as [MM/dd/yyyy] --10/13/2012
 
Select Format(@Date,'dd/MM/yyyy') as [dd/MM/yyyy] --13/10/2012
 
Select Format(@Date,'dd-MM-yyyy') as [dd-MM-yyyy] --13-10-2012
 
Select Format(@Date,'dd MMM yyyy') as [dd MMM yyyy] --13 Oct 2012
 
Select Format(@Date,'MMM dd, yyyy') as [MMM dd, yyyy] --Oct 13, 2012
 
Select Format(@Date,'MM-dd-yy') as [MM-dd-yy] --10-13-12
 
Select Format(@Date,'MM-dd-yyyy') as [MM-dd-yyyy] --10-13-2012
 
Select Format(@Date,'yy/MM/dd') as [yy/MM/dd] --12/10/13
 
Select Format(@Date,'yyyy/MM/dd') as [yyyy/MM/dd] --2012/10/13
 
Select Format(@Date,'yyMMdd') as [yyMMdd] --121013
 
Select Format(@Date,'yyyyMMdd') as [yyyyMMdd] --20121013
 
Select Format(@Date,'yy-MM-dd') as [yy-MM-dd] --12-10-13
 
Select Format(@Date,'yyyy-MM-dd') as [yyyy-MM-dd] --2012-10-13
 
Select Format(@Date,'MM/yy') as [MM/yy] --10/12
 
Select Format(@Date,'MM/yyyy') as [MM/yyyy] --10/2012
 
Select Format(@Date,'yy/MM') as [yy/MM] --12/10
 
Select Format(@Date,'yyyy/MM') as [yyyy/MM] --2012/10
 
Select Format(@Date,'MMMM dd,yyyy') as [MMMM dd,yyyy] --October 13,2012
 
Select Format(@Date,'MMM yyyy') as [MMM yyyy] --Oct 2012
 
Select Format(@Date,'MMMM yyyy') as [MMMM yyyy] --October 2012
 
Select Format(@Date,'dd MMMM') as [dd MMMM] --13 October
 
Select Format(@Date,'MMMM dd') as [MMMM dd] --October 13
 
Select Format(@Date,'dd MMMM yy') as [dd MMMM yy] --13 October 12
 
Select Format(@Date,'dd MMMM yyyy') as [dd MMMM yyyy] --13 October 2012
 
Select Format(@Date,'MM-yy') as [MM-yy] --10-12
 
Select Format(@Date,'MM-yyyy') as [MM-yyyy] --10-2012
 
Select Format(@Date,'yy-MM') as [yy-MM] --12-10
 
Select Format(@Date,'yyyy-MM') as [yyyy-MM] --2012-10
 
Select Format(@Date,'MMddyy') as [MMddyy] --131012
 
Select Format(@Date,'MMddyyyy') as [MMddyyyy] --10132012
 
Select Format(@Date,'ddMMyy') as [ddMMyy] --131012
 
Select Format(@Date,'ddMMyyyy') as [ddMMyyyy] --13102012
 
Select Format(@Date,'MMM-yy') as [MMM-yy] --Oct-12
 
Select Format(@Date,'MMM-yyyy') as [MMM-yyyy] --Oct-2012
 
Select Format(@Date,'dd-MMM-yy') as [dd-MMM-yy] --13-Oct-12
 
Select Format(@Date,'dd-MMM-yyyy') as [dd-MMM-yyyy] --13-Oct-2012
