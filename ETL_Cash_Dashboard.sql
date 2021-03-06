USE [BDE_Data]
GO
-- select * FROM [dbo].[servicing_cash_summary]
 --drop table #cash_dashboard
 --select * into #cash_dashboard from Cash_dashboard
INSERT INTO cash_dashboard
           ([Process Date]
           ,[Wells Fargo Lockbox]
           ,[Cash Room]
           ,[LoanCare Payments]
           ,[MoneyGram]
           ,[GNMA I P&I]
           ,[GNMA II P&I]
           ,[Unidentified Checks]
           ,[Payment Clearing]
           ,[Lockbox (WF) Units]
           ,[ACH (TX Capital) Units]
	      ,[Lockbox (WF)]
		  ,[ACH (TX Capital)]
           ,[OTD]
           ,[Recurring]
           ,[Suspense]
           ,[Accrued Late Fees]
           ,[Escrow Advance]
           ,[Recov Corp]
           ,[Non-rec]
           ,[Third-party Rec]
           ,[Servicing Fee]
           ,[Late Charges]
           ,[ One Time Draft Fees]
           ,[NSF Fees]
           ,[Misc Fees]
           ,[Total Anc Fee Income]
           ,[OTD Fees (units)]
           ,[NSF Fees (Units)]
           ,[Payoffs Processed]
           ,[LoadDate])
	SELECT [summary_date]
      ,isnull([Lockbox],0.00)
      ,isnull([Cash Room],0.00)
      ,isnull([Loancare],0.00)
      ,isnull([MoneyGram],0.00)
      ,isnull([GNMA I],0.00)
      ,isnull([GNMA II],0.00)
      ,isnull([Unidentified Checks],0.00)
      ,isnull([Payment Clearing],0.00)
      ,isnull([Lockbox return count],0)
      ,isnull([ACH Return Count],0)
      ,isnull([Lockbox return Total],0)
	  ,isnull([ACH Return Total],0)
      ,isnull([OTD],0.00)
      ,isnull([Recurring],0.00)
      ,isnull([Suspense],0.00)
      ,isnull([Accrued Late Fees],0.00)
      ,isnull([Escrow Advance],0.00)
      ,isnull([Recov Corp],0.00)
      ,isnull([Non-rec],0.00)
      ,isnull([Third-party rec],0.00)
      ,isnull([Servicing Fee],0.00)
      ,isnull([Late Charges],0.00)
      ,isnull([One Time Draft Fee],0.00)
      ,isnull([NSF Fees],0.00)
      ,isnull([Misc Fees],0.00)
      ,isnull([Total Anc Fee Income],0.00)
      ,isnull([OTD1],0.00)
      ,isnull([NSF],0.00)
      ,isnull([Payoffs],0.00)
	 ,'12/2/2016'
   FROM [UAT-SQL01].bde_data.[dbo].[servicing_cash_summary]
  WHERE convert(date,summary_date) BETWEEN '9/1/2015' and '12/31/2015'
GO
-- add missing data
UPDATE cash_dashboard
SET [Payment Clearing] = 0.00
WHERE [Payment Clearing] IS Null
UPDATE cash_dashboard
SET [OTD Fees (units)] = 0
WHERE [OTD Fees (units)] IS Null
UPDATE cash_dashboard
SET [NSF Fees (Units)] = 0
WHERE [NSF Fees (Units)] IS Null
UPDATE cash_dashboard
SET [Payoffs Processed] = 0.00
WHERE [Payoffs Processed] IS Null

-- add missing column
UPDATE cash_dashboard 
SET [Payoffs Processed] = s.Payoffs
from cash_dashboard c
join (select PDate = convert(date,summary_date), [payoffs]  FROM [UAT-SQL01].bde_data.[dbo].[servicing_cash_summary] where Payoffs is not NULL) s
ON convert(date,c.[Process Date]) = convert(date,s.PDate)

select * from cash_dashboard order by convert(date,[Process Date])
