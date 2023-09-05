USE [Northwind]
GO

/****** Object:  StoredProcedure [dbo].[pr_GetOrderSummary]    Script Date: 2023/09/05 08:04:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Esau Selomane>
-- Create date: <03/09/2023>
-- Description:	<Assessment>
-- =============================================
CREATE OR ALTER     PROCEDURE [dbo].[pr_GetOrderSummary] 
	-- Add the parameters for the stored procedure here
	 @StartDate datetime, 
	 @EndDate datetime,
	 @EmployeeID int = NULL,
	 @CustomerID nchar(5) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select a.[TitleOfCourtesy] + ' '+ a.[FirstName]+ ' ' + a.[LastName] EmployeeFullName, 
	c.CompanyName as 'Shipper CompanyName', e.[CompanyName] as 'Customer CompanyName', Count(b.[OrderID]) NumberOfOders,
	[OrderDate] as [Date], SUM([Freight]) TotalFreightCost, Count(distinct d.ProductID) NumberOfDifferentProducts, 
	Sum(d.UnitPrice*Quantity - (d.UnitPrice*Quantity*[Discount])) TotalOrderValue
	from [Employees] a
	inner join [dbo].[Orders] b on a.EmployeeID = b.EmployeeID
	inner join [dbo].[Shippers] c on c.ShipperID = b.ShipVia
	inner join [dbo].[Order Details] d on d.OrderID = b.OrderID
	inner join [dbo].[Customers] e on e.CustomerID = b.CustomerID
	where ([OrderDate] >= @StartDate and [OrderDate] <= @EndDate)
		and (@EmployeeID is null or a.EmployeeID=@EmployeeID)
		and (@CustomerID is null or e.CustomerID=@CustomerID)
	 
	
group by a.[TitleOfCourtesy] + ' '+ a.[FirstName]+ ' ' + a.[LastName], c.CompanyName,e.[CompanyName], [OrderDate]
END
GO


