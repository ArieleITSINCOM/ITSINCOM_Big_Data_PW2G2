SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[refreshdata] 
AS 
BEGIN 
    -- Declaration for dynamic SQL string
    DECLARE @sqlNation NVARCHAR(MAX) = '';

    -- Building dynamic SQL for [dwh].[nation] view
    SELECT @sqlNation +=
        'UNION ALL SELECT '+ 
            'CAST([measure] AS NVARCHAR(15)) AS [measure],'+
            'CASE '+
                'WHEN CHARINDEX(''('', CAST([location] AS NVARCHAR(45))) > 0 THEN '+
                    'SUBSTRING(CAST([location] AS NVARCHAR(45)), 1, CHARINDEX(''('', CAST([location] AS NVARCHAR(45))) - 1)'+
                'ELSE '+
                    'CAST([location] AS NVARCHAR(45))'+
            'END AS [location],'+
            'CAST([sex] AS NVARCHAR(10)) AS [sex],'+
            'CAST([age] AS NVARCHAR(25)) AS [age],'+
            'CAST([cause] AS NVARCHAR(20)) AS [cause],'+
            'CAST([metric] AS NVARCHAR(20)) AS [metric],'+
            'CAST([year] AS NVARCHAR(10)) AS [year],'+
            'CAST(CAST([val] AS FLOAT) AS DECIMAL(15, 7)) AS [val],'+
            'CAST(CAST([upper] AS FLOAT) AS DECIMAL(15, 7)) AS [upper],'+
            'CAST(CAST([lower] AS FLOAT) AS DECIMAL(15, 7)) AS [lower]'+
        ' FROM ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ' '
    FROM sys.tables
    WHERE name LIKE 'BC_nation%';

    -- Remove the first "UNION ALL"
    SET @sqlNation = STUFF(@sqlNation, 1, 10, '');

    -- Add the rest of the ALTER VIEW command
    SET @sqlNation = 'ALTER VIEW [dwh].[nation] AS ' + @sqlNation;

    -- Execute dynamic SQL query
    EXEC sp_executesql @sqlNation;

    -- Dynamic SQL for [dwh].[percent1] view 
    DECLARE @sqlpercent NVARCHAR(MAX) = '';

    SELECT @sqlpercent +=
        'UNION ALL SELECT '+ 
            'CASE ' +
                'WHEN CHARINDEX(''('', CAST([measure] AS NVARCHAR(40))) > 0 THEN '+
                    'SUBSTRING(CAST([measure] AS NVARCHAR(40)), 1, CHARINDEX(''('', CAST([measure] AS NVARCHAR(40))) - 1)'+
                'ELSE '+ 
                    'CAST([measure] AS NVARCHAR(40))'+
            'END AS [measure],'+
            'CAST([location] AS NVARCHAR(5)) AS [year],'+
            'CAST([sex] AS NVARCHAR(10)) AS [sex],'+
            'CAST([age] AS NVARCHAR(15)) AS [age],'+
            'CAST([cause] AS NVARCHAR(30)) AS [cause],'+
            'CAST([metric] AS NVARCHAR(13)) AS [metric],'+
            'CAST('+
                'CASE '+
                    'WHEN [year] = ''G'' THEN ''Global'''+
                    'WHEN [year] = ''L'' THEN ''Low SDI'''+
                    'WHEN [year] = ''LM'' THEN ''Low-middle SDI'''+
                    'WHEN [year] = ''M'' THEN ''Middle SDI'''+
                    'WHEN [year] = ''H'' THEN ''High SDI'''+
                    'WHEN [year] = ''HM'' THEN ''High-middle SDI'''+
                    'ELSE ''Other'''+
                'END AS VARCHAR(15)'+
            ') AS [Location],'+
            'CAST(CAST([val] AS FLOAT) AS DECIMAL(15, 7)) AS [val],'+
            'CAST(CAST([upper] AS FLOAT) AS DECIMAL(15, 7)) AS [upper],'+
           'CAST(CAST([lower] AS FLOAT) AS DECIMAL(15, 7)) AS [lower]'+
        ' FROM ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ' '
    FROM sys.tables
    WHERE name LIKE 'BC_Percent%';

    -- Remove the first "UNION ALL"
    SET @sqlpercent = STUFF(@sqlpercent, 1, 10, '');

    -- Add the rest of the ALTER VIEW command
    SET @sqlpercent = 'ALTER VIEW [dwh].[percent1] AS ' + @sqlpercent;

    -- Execute dynamic SQL query
    EXEC sp_executesql @sqlpercent;

    -- Dynamic SQL for [dwh].[predict] view 
    DECLARE @sqlpredict NVARCHAR(MAX) = ' ';

    SELECT @sqlpredict +=
    'UNION ALL SELECT '+ 
        'CAST([measure]  AS NVARCHAR(20)) AS [measure],'+
    'CAST([location] AS NVARCHAR(10)) AS [location],'+
    'CAST([sex] AS NVARCHAR(10)) AS [sex],'+
    'CAST([age] AS NVARCHAR(25)) AS [age],'+
    'CAST([cause] AS NVARCHAR(20)) AS [cause],'+
    'CAST([metric] AS NVARCHAR(15)) AS [metric],'+
    'CAST([year] AS NVARCHAR(10)) AS [year],'+
    'CAST(CAST([val] AS float) as DECIMAL(15, 7)) AS [val],'+
    'CAST(CAST([Upper] AS float) as DECIMAL(15,7)) AS [upper],'+
    'CAST(CAST([lower] AS float) as DECIMAL(15,7)) AS [lower]'+
    ' FROM ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ' '
    FROM sys.tables
    WHERE name LIKE 'BC_predict%';

    -- Remove the first "UNION ALL"
    SET @sqlpredict = STUFF(@sqlpredict, 1, 10, '');

    -- Add the rest of the ALTER VIEW command
    SET @sqlpredict = 'ALTER VIEW [dwh].[predict] AS ' + @sqlpredict;

    -- Execute dynamic SQL query
    EXEC sp_executesql @sqlpredict;

    -- Dynamic SQL for [dwh].[region] view 
    DECLARE @sqlregion NVARCHAR(MAX) = ' ';

    SELECT @sqlregion +=
    'UNION ALL SELECT '+ 
        'CAST([measure] AS VARCHAR(15)) AS [measure],'+
        'CAST([location] AS VARCHAR(35)) AS [location],'+
        'CAST([sex] AS VARCHAR(8)) AS [sex],'+
        'CAST([age] AS VARCHAR(25)) AS [age],'+
        'CAST([cause] AS VARCHAR(20)) AS [cause],'+
        'CAST([metric] AS VARCHAR(15)) AS [metric],'+
        'CAST([year] AS VARCHAR(10)) AS [year],'+
        'CAST(CAST([val] AS FLOAT) AS DECIMAL(15, 7)) AS [val],'+
        'CAST(CAST([upper] AS FLOAT) AS DECIMAL(15, 7)) AS [upper],'+
        'CAST(CAST([lower] AS FLOAT) AS DECIMAL(15, 7)) AS [lower]'+
    ' FROM ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ' '
    FROM sys.tables
    WHERE name like 'BC_region_';

    -- Remove the first "UNION ALL"
    SET @sqlregion = STUFF(@sqlregion, 1, 10, '');

    -- Add the rest of the ALTER VIEW command
    SET @sqlregion = 'ALTER VIEW [dwh].[region] AS ' + @sqlregion;

    -- Execute dynamic SQL query
    EXEC sp_executesql @sqlregion;

    -- Dynamic SQL for [dwh].[region_sdi] view 
    DECLARE @sqlregion_sdi NVARCHAR(MAX) = '';

    SELECT @sqlregion_sdi +=
        'UNION ALL SELECT '+ 
            'CAST([measure] AS VARCHAR(15)) AS [measure],'+
            'CAST([location] as varchar(15)) as [location] ,'+
            'CAST([sex] AS VARCHAR(8)) AS [sex],'+
            'CAST([age] AS VARCHAR(25)) AS [age],'+
            'CAST([cause] AS VARCHAR(20)) AS [cause],'+
            'CAST([metric] AS VARCHAR(15)) AS [metric],'+
            'CAST([year] AS VARCHAR(10)) AS [year],'+
            'CAST(CAST([val] AS FLOAT) AS DECIMAL(15, 7)) AS [val],'+
            'CAST(CAST([upper] AS FLOAT) AS DECIMAL(15, 7)) AS [upper],'+
            'CAST(CAST([lower] AS FLOAT) AS DECIMAL(15, 7)) AS [lower]'+
        ' FROM ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ' '
    FROM sys.tables
    WHERE name LIKE 'BC_region_SDI%';

    -- Remove the first "UNION ALL"
    SET @sqlregion_sdi = STUFF(@sqlregion_sdi, 1, 10, '');

    -- Add the rest of the ALTER VIEW command
    SET @sqlregion_sdi = 'ALTER VIEW [dwh].[region_sdi] AS ' + @sqlregion_sdi;

    -- Execute dynamic SQL query
    EXEC sp_executesql @sqlregion_sdi;

    -- Dynamic SQL for [dwh].[region_Sex] view 
    DECLARE @sqlregion_sex NVARCHAR(MAX) = '';

    SELECT @sqlregion_sex +=
        'UNION ALL SELECT '+ 
            'CAST([measure] AS NVARCHAR(15)) AS [measure],'+
            'CAST([sex] AS NVARCHAR(8)) AS [sex],'+
            'CAST([age] AS NVARCHAR(25)) AS [age],'+
            'CAST([cause] AS NVARCHAR(20)) AS [cause],'+
            'CAST([metric] AS NVARCHAR(15)) AS [metric],'+
            'CAST([year] AS NVARCHAR(10)) AS [year],'+
            'CAST(CAST([val] AS FLOAT) AS DECIMAL(15, 7)) AS [val],'+
            'CAST(CAST([upper] AS FLOAT) AS DECIMAL(15, 7)) AS [upper],'+
            'CAST(CAST([lower] AS FLOAT) AS DECIMAL(15, 7)) AS [lower]'+
        ' FROM ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ' '
    FROM sys.tables
    WHERE name LIKE 'BC_region_SEX%';

    -- Remove the first "UNION ALL"
    SET @sqlregion_sex = STUFF(@sqlregion_sex, 1, 10, '');

    -- Add the rest of the ALTER VIEW command
    SET @sqlregion_sex = 'ALTER VIEW [dwh].[region_Sex] AS ' + @sqlregion_sex;

    -- Execute dynamic SQL query
    EXEC sp_executesql @sqlregion_sex;

END;
GO
