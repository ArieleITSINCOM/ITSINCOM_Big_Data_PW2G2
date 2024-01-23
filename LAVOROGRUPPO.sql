-- Tabella predict castata 

SELECT 
    CAST([measure]  AS NVARCHAR(20)) AS [measure],
    CAST([location] AS NVARCHAR(10)) AS [location],
    CAST([sex] AS NVARCHAR(10)) AS [sex],
    CAST([age] AS NVARCHAR(25)) AS [age],
    CAST([cause] AS NVARCHAR(20)) AS [cause],
    CAST([metric] AS NVARCHAR(15)) AS [metric],
    CAST([year] AS NVARCHAR(10)) AS [year],
    CAST(CAST([val] AS float) as DECIMAL(15, 7)) AS [val],
    CAST(CAST([Upper] AS float) as DECIMAL(15,7)) AS [upper],
    CAST(CAST([lower] AS float) as DECIMAL(15,7)) AS [lower]
FROM [stg].[BC_predict1]

SELECT MAX(LEN(year)) 
    FROM [stg].[BC_predict1]

-- cast tabella Percent 

SELECT
    CASE 
        WHEN CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) > 0 THEN 
            SUBSTRING(CAST([measure] AS NVARCHAR(40)), 1, CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) - 1)
        ELSE 
            CAST([measure] AS NVARCHAR(40))
    END AS [measure],
    CAST([location] AS NVARCHAR(5)) AS [year],
    CAST([sex] AS NVARCHAR(10)) AS [sex],
    CAST([age] AS NVARCHAR(15)) AS [age],
    CAST([cause] AS NVARCHAR(30)) AS [cause],
    CAST([metric] AS NVARCHAR(13)) AS [metric],
	CAST(
	CASE 

		when year = 'G' then 'Global'

		when year = 'L' then 'Low'

		when year = 'LM' then 'Low-Middle'

		when year = 'M' then 'Middle'

		when year = 'H' then 'High'

		when year = 'HM' then 'High-Middle'

	ELSE 'Other'

	END  as varchar(11)) as Location,
    CAST(CAST([val] AS FLOAT) AS DECIMAL(15, 7)) AS [val],
    CAST(CAST([upper] AS FLOAT) AS DECIMAL(15, 7)) AS [upper],
    CAST(CAST([lower] AS FLOAT) AS DECIMAL(15, 7)) AS [lower]
FROM [stg].[BC_Percent1];


SELECT location --MAX(LEN([sex])) 
FROM [stg].[BC_Percent1] AS max_length


-- cast nation 
SELECT 
    CAST([measure]  AS NVARCHAR(15)) AS [measure],
    CAST([location] AS NVARCHAR(45)) AS [location],
    CAST([sex] AS NVARCHAR(10)) AS [sex],
    CAST([age] AS NVARCHAR(25)) AS [age],
    CAST([cause] AS NVARCHAR(20)) AS [cause],
    CAST([metric] AS NVARCHAR(20)) AS [metric],
    CAST([year] AS NVARCHAR(10)) AS [year],
    CAST(CAST([val] AS FLOAT) AS DECIMAL(15, 7)) AS [val],
    CAST(CAST([upper] AS FLOAT) AS DECIMAL(15, 7)) AS [upper],
    CAST(CAST([lower] AS FLOAT) AS DECIMAL(15, 7)) AS [lower]
FROM [stg].[BC_nation1]

SELECT MAX(LEN(year)) 
    FROM [stg].[BC_nation1]

-- Cast HDI_1990

SELECT 
   CASE 
        WHEN CHARINDEX('(', CAST([Country] AS NVARCHAR(48))) > 0 THEN 
            SUBSTRING(CAST([Country] AS NVARCHAR(48)), 1, CHARINDEX('(', CAST([Country] AS NVARCHAR(48))) - 1)
        ELSE 
            CAST([Country] AS NVARCHAR(48))
    END AS [Country],
    CAST(CAST([HDI] AS FLOAT) AS DECIMAL(4,3)) AS [HDI]
FROM [stg].[HDI_1990]


-- cast [stg].[IHME_POP_2017_2100_POP_REFERENC]

SELECT 
    CAST([location_id] AS NVARCHAR(5)) AS [location_id],
   CASE 
        WHEN CHARINDEX('(', CAST([location_name] AS NVARCHAR(48))) > 0 THEN 
            SUBSTRING(CAST([location_name] AS NVARCHAR(48)), 1, CHARINDEX('(', CAST([location_name] AS NVARCHAR(48))) - 1)
        ELSE 
            CAST([location_name] AS NVARCHAR(48))
            END AS [location_name],
    CAST([sex_id] AS NVARCHAR(2)) AS [sex_id],
    CAST([sex] AS NVARCHAR(7)) AS [sex],
    CAST([age_group_id] AS NVARCHAR(5)) AS [age_group_id],
    CAST([age_group_name] AS NVARCHAR(30)) AS [age_group_name],
    CAST([year_id] AS NVARCHAR(5)) AS [year_id],
    CAST([measure_id] AS NVARCHAR(4)) AS [measure_id],
    CAST([measure_name] AS NVARCHAR(20)) AS [measure_name],
    CAST([metric_id] AS NVARCHAR(2)) AS [metric_id],
    CAST([metric_name] AS NVARCHAR(10)) AS [metric_name],
    CAST([scenario] AS NVARCHAR(2)) AS [scenario],
    CAST([scenario_name] AS NVARCHAR(15)) AS [scenario_name],
    CAST([val] AS FLOAT) AS [val],
    CAST([upper] AS FLOAT)  AS [upper],
    CAST([lower] AS FLOAT)  AS [lower]
FROM [stg].[IHME_POP_2017_2100_POP_REFERENC]


select distinct(location_name) FROM [stg].[IHME_POP_2017_2100_POP_REFERENC]


SELECT DISTINCT
        CASE 
            WHEN CHARINDEX('(', CAST([location_name] AS NVARCHAR(48))) > 0 THEN 
                SUBSTRING(CAST([location_name] AS NVARCHAR(48)), 1, CHARINDEX('(', CAST([location_name] AS NVARCHAR(48))) - 1)
            ELSE 
                CAST([location_name] AS NVARCHAR(48))
        END AS [location_name]
    FROM [stg].[IHME_POP_2017_2100_POP_REFERENC]


-- cast world population
select 
        cast([age] as nvarchar(20))  as age,
        CAST(CAST([std_population] AS FLOAT) AS DECIMAL(11, 9)) AS [std_population]
        
        from [stg].[World_population_age_standard]


SELECT [std_population] 
    FROM [stg].[World_population_age_standard]

-- cast region 
SELECT 
    CAST([measure]  AS NVARCHAR(15)) AS [measure],
    CAST([location] AS NVARCHAR(35)) AS [location],
    CAST([sex] AS NVARCHAR(8)) AS [sex],
    CAST([age] AS NVARCHAR(25)) AS [age],
    CAST([cause] AS NVARCHAR(20)) AS [cause],
    CAST([metric] AS NVARCHAR(15)) AS [metric],
    CAST([year] AS NVARCHAR(10)) AS [year],
    CAST(CAST([val] AS FLOAT) AS DECIMAL(15, 7)) AS [val],
    CAST(CAST([upper] AS FLOAT) AS DECIMAL(15, 7)) AS [upper],
    CAST(CAST([lower] AS FLOAT) AS DECIMAL(15, 7)) AS [lower]
FROM [stg].[BC_region1]


SELECT MAX(LEN(year)) 
    FROM [stg].[BC_region1]


-- cast region_SDI
SELECT 
    CAST([measure]  AS NVARCHAR(15)) AS [measure],
    CAST([location] AS NVARCHAR(35)) AS [location],
    CAST([sex] AS NVARCHAR(8)) AS [sex],
    CAST([age] AS NVARCHAR(25)) AS [age],
    CAST([cause] AS NVARCHAR(20)) AS [cause],
    CAST([metric] AS NVARCHAR(15)) AS [metric],
    CAST([year] AS NVARCHAR(10)) AS [year],
    CAST(CAST([val] AS FLOAT) AS DECIMAL(15, 7)) AS [val],
    CAST(CAST([upper] AS FLOAT) AS DECIMAL(15, 7)) AS [upper],
    CAST(CAST([lower] AS FLOAT) AS DECIMAL(15, 7)) AS [lower]
FROM [stg].[BC_region_SDI1]
select * from [stg].[BC_region_SDI1]


-- cast region_sex
SELECT 
    CAST([measure]  AS NVARCHAR(15)) AS [measure],
    CAST([sex] AS NVARCHAR(8)) AS [sex],
    CAST([age] AS NVARCHAR(25)) AS [age],
    CAST([cause] AS NVARCHAR(20)) AS [cause],
    CAST([metric] AS NVARCHAR(15)) AS [metric],
    CAST([year] AS NVARCHAR(10)) AS [year],
    CAST(CAST([val] AS FLOAT) AS DECIMAL(15, 7)) AS [val],
    CAST(CAST([upper] AS FLOAT) AS DECIMAL(15, 7)) AS [upper],
    CAST(CAST([lower] AS FLOAT) AS DECIMAL(15, 7)) AS [lower]
FROM [stg].[BC_region_SEX1]