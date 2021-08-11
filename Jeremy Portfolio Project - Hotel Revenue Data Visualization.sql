-- Combine dataset from 2018, 2019 and 2020
-- Creating temporary table to have the combined table

with hotels as (
select* from dbo.['2018$']
union
select* from dbo.['2019$']
union
select* from dbo.['2020$'])

select * from hotels


-- Question 1
-- Is the hotel revenue growing by year?
-- We have two hotel types so it would be good to segment revenue by hotel type

with hotels as (
select* from dbo.['2018$']
union
select* from dbo.['2019$']
union
select* from dbo.['2020$'])

select arrival_date_year, hotel, round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as revenue 
from hotels
group by arrival_date_year, hotel

-- Conclusion: We see a dip in revenue from 2019 to 2020

-- Now we want to join market segment and meal cost tables to hotels dataset since there is common column that is market_segment
-- This result in having market segment data (Discount, market_segment); meal_cost data (Cost, meal)
select * from dbo.market_segment$ -- To check the data
select * from dbo.meal_cost$ -- To check the data

-- Copy the query to Power BI starting from here
with hotels as (
select* from dbo.['2018$']
union
select* from dbo.['2019$']
union
select* from dbo.['2020$'])

select * from hotels
left join dbo.market_segment$
on hotels.market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on hotels.meal = meal_cost$.meal --Copy the query to Power BI ending here


-- Question 2 - To refer to Power BI Visual
-- Should the hotel increase the parking lot size?
-- We want to understand if there is a trend for guest with personal cars


-- Question 3 - To refer to Power BI Visual
-- What trends can we see from these data?
-- Focus on average daily rate and guests to explore seasonality

