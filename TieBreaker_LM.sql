USE [BDESime]
GO
;WITH L90_973 AS (
				SELECT ls1.[Loan Number]
					  ,[TriggerCode] = ls1.[ls step code]
					  ,[TriggerDate] = max(ls1.[ls actual completion date])
				  FROM bdesime.dbo.loss_mit_steps ls1 (nolock)
				 WHERE ls1.[ls step code] IN ('L90','973')
				 GROUP BY [Loan Number]
						 ,ls1.[ls step code]
			)
   ,Tie AS (
			SELECT [Loan Number]
					  ,[TriggerDate] = max([TriggerDate])
				  FROM L90_973
				 GROUP BY [Loan Number]
			)
	SELECT t.[Loan Number]
		  ,s.TriggerDate
		  -- 1/3/2018 per Ken Ly, 973 is the tie breaker for Short Sale claims 
		  ,TriggerCode = min(s.TriggerCode)  
		  FROM Tie t 
  		  JOIN L90_973 s on t.[Loan Number] = s.[Loan Number] and t.TriggerDate = s.TriggerDate
		 GROUP BY t.[Loan Number]
				 ,s.TriggerDate
		ORDER BY t.[Loan Number]						 

 -- select count(distinct [loan number]) from bdesime.dbo.loss_mit_steps ls1 (nolock) WHERE ls1.[ls step code] IN ('L90','973') and ls1.[ls actual completion date] is not null  --> 68 rows
