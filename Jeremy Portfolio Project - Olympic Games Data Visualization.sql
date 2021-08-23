-- Olympic Games Analysis
-- Business Problem
-- As a data analyst working at a news company you are asked to visualize a data that will help readers understand how countries have performed historically in the summer Olympic Games
-- You also know that there is an interest in details about the competitors, so if you find anything interesting then don't hesitate to bring that in also
-- The main task is still to show the historical performance for different countries, with the possibility to select your own country

SELECT
		 [ID]
		,[Name] AS 'Competitor Name' --Renamed Column
		,CASE WHEN SEX = 'M' THEN 'Male' ELSE 'Female' END AS Sex --Better name for filters and visualizations
		,[Age]
		,CASE	WHEN [Age] < 18 THEN 'Under 18'
				WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
				WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
				WHEN [Age] > 30 THEN 'Over 30'
		 END AS [Age Grouping]
		,[Height]
		,[Weight]
		,[NOC] AS 'Nation Code' --Explained abbreviation
		--,CHARINDEX(' ', Games)-1 AS 'Example 1'
		--,CHARINDEX(' ', REVERSE(Games))-1 AS 'Example 2'
		,LEFT(Games, CHARINDEX(' ', Games)-1) AS 'Year' --Split column to isolate Year, based on space
		--,RIGHT(Games, CHARINDEX(' ', REVERSE(Games))-1) AS 'Season' --Split column to isolate Season, based on space
		--,[Games]
		--,[City] -- Commented out as it is not necessary for the analysis
		,[Sport]
		,[Event]
		,CASE WHEN Medal = 'NA' THEN 'Not Registered' Else Medal END AS Medal --Replaced NA with Not Registered
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE RIGHT(Games, CHARINDEX(' ', REVERSE(Games))-1) = 'Summer' --Where Clause to isolate Summer Season

  -- Copy the query above to Power BI to load the dataset