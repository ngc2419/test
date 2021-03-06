--sp_helptext 'sp_udpate_snapshot_proper_status'

USE BDESime
--USE BDE_Data
GO
/* 
Date created:	20160302 Susan Delaney 
Description:	Gets all database tables with wildcard query string:
*/ 
--select top 3 *  from original_loan where [NEW LOAN SETUP DATE] > '10/1/2016'
SELECT distinct [schema] = SCHEMA_NAME(schema_id) 
,[table] = t.name 
,[column] = c.name 
FROM sys.tables AS t
INNER JOIN sys.columns c
ON t.OBJECT_ID = c.OBJECT_ID
WHERE c.name LIKE '%20%pos%'
--and t.name like 'loan%'
ORDER BY t.name, c.name

/*
select top 10 * from [Foreclosure]
select * from payment_tran
select count(*) from servicing_fee where [loan number] = '0014131718' --	4010858713'

Select * from [dbo].[datadictionary] where tablename like '%property%'
select top 100 bkr_filing_dt,bkr_removal_dt, * from bankruptcy
select * from foreclosure

select top 100 [Loan Number],[IMMINENT DEFAULT FICO DATE], [IMMINENT DEFAULT FICO SCORE] from bdesime.dbo.delinquency where [IMMINENT DEFAULT FICO DATE] is not null and convert(date,[IMMINENT DEFAULT FICO DATE]) > '7/1/2016'
select * from tbl_fico_bands
select co_im_dflt_fico_dt, co_im_dflt_fico_xx from delinquency where co_im_dflt_fico_dt is not null and convert(date,co_im_dflt_fico_dt) > '7/1/2016'
select top 100 [ln], fico from bdesime.sime.five9_results where convert(date,date_added) > '7/1/2016'
select top 100 ficoScore from sime.advantageCreditImport
select ln_no, usr_6_pos1_xx, load_date from user_defined where usr_6_pos1_xx = 'evb001'

SELECT * FROM sys.sysobjects where xtype ='p' order by name -- alpha listing of stored procs in the active db
 
select * from loan where ln_1st_prin_ba > 0 and ln_no = '0012028262'

select * from promise_to_pay

select distinct disposition from bde_data.dbo.five9_activity

RPC - External Online Pmt
RPC - Loan Brought Current
RPC - No Promise to Pay
RPC - One Time Draft Obtained
RPC - Promise to Pay
RPC - Promise to Pay - Other Than One Time Draft
RPC - PTP Bill Pay
RPC - PTP CCN Pmt
RPC - PTP Mailed Pmt
RPC - PTP Phone Pmt

*/

/*
use BDEsime

SELECT o.name, o.id, c.text, o.type 
from sysobjects o 
right join syscomments c 
on o.id = c.id 
where c.text like '%office%code%'

select top 10 * from bdesime.dbo.payee where [ca hist transaction date] = '2016-07-19 00:00:00.000'
SELEct top 100 * from property

*/


---- @parm   1 = include REO's , 0 = exclude REO's
--declare @parm int = 1
--select distinct proper_status 
--from bdesime.dbo.delinquency_snapshot
--WHERE proper_status LIKE 
--		CASE WHEN @parm = 0 THEN '[^reo]%'
--		ELSE '%' 
--		END

--declare @parm char(3) = 'REO'
--select top 3 * from bdesime.dbo.delinquency_snapshot
--WHERE proper_status LIKE '%' + @parm  + '%'



-- verify data has been loaded for the prior calendar day, if none, use the previous Process Date
DECLARE @localEndDate date = '3/30/2017'
SET @localEndDate = (Select max(convert(date,[loanDate])) from bde_data.dbo.portfolio_summary (nolock) where convert(date,[loandate]) <= @localEndDate)
print @localEndDate
