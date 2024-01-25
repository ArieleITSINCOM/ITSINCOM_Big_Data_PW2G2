/*
    - Data Explor
    - Article URL: https://www.nature.com/articles/s41597-023-02253-5#Sec17
    - the data records part states that the ratios are calcultaed by 100.000
    - The quintiles of the SDI index are used to define low (~20), low-middle (~40), middle (~60), middle-high (~80) and high (~100) SDI countries in 201927
    - 
*/
--------------------------------------------------------------------------------------------------------------------------------------------
/*stg.BC_nation1*/
-- SELECT TOP 8000 * FROM [stg].[BC_nation1] ORDER BY NEWID(), year -- 51.408 rows
select count(*) from stg.BC_nation1
/*
the cases are counted
measure: what the row means e.g. deaths, incidence, rate
- HOW ARE THE RATIOS CALCULATED? AGE? REGION? --> likely by location
    - measure:
        - incidence: portion of population affected
        - deaths: no. of death
    - location: the observed nation
    - sex: the genders observed
    - age:
        - all ages: s.e.
        - Age-standardized: age is processed in ways that makes ages more comparable
    
    - val: avg of the value (cases/deaths?)
        - upper: max of the values(?)
        - lower: min of the values(?)
*/
--------------------------------------------------------------------------------------------------------------------------------------------

/*[stg].[BC_Percent1]*/
-- SELECT * FROM stg.bc_percent1 -- 5.040 rows
/*
for each measure (DALYs, Deaths), calculates number, percent, rate using ALL ages on based on sdi location and time-wise on a (likely) 6-month basis

    - measure: DALY, anni di "vita sana" persi per malattia https://www.who.int/data/gho/indicator-metadata-registry/imr-details/158
    - location: date
    - sex: genderes included in the analysis
    - age: age group taken into account (only "All ages")
    - cause: cause of the DALYs
    - val: avg of the value (cases/deaths?)
    - year: stating the SDI of that particular range of people
        - upper: max of the values(?)
        - lower: min of the values(?)
    - 
*/

--------------------------------------------------------------------------------------------------------------------------------------------


/*[stg].[BC_predict1]*/
-- SELECT TOP 8000 * FROM [stg].[BC_predict1] ORDER BY NEWID(), year -- 41.832
/*
    - measure: as before
    - location: only china or global
    - sex: as before
    - age: age interval
    - cause: only breast cancer
    - year s.e.
    - val: as before
*/
--------------------------------------------------------------------------------------------------------------------------------------------

/*[stg].[BC_region1]*/
-- SELECT * FROM [stg].[BC_region1] -- 3.696
/*
for each year and for each location death and incidence are measured, number and rate are calculated on all ages, execpt rate that is measured once more with age-standardized


    - measure:
        - rate: LIKELY death rate(?)
        - incidence: portion of population affected
        - deaths: no. of death
    - age:
        - all ages: s.e.
        - Age-standardized: age is processed in ways that makes ages more comparable
*/
--------------------------------------------------------------------------------------------------------------------------------------------


/*[stg].[BC_region_SDI1]*/
-- SELECT * FROM [stg].[BC_region_SDI1] -- 1008
/*
by article: mortality/morbidity by SDI
504 rows are death are 504 rows are incidence

for each year, 18 rows are deaths, 18 are incidence

for each year and for each location death and incidence are measured, number and rate are calculated on all ages, execpt rate that is measured once more with age-standardized
*/

--------------------------------------------------------------------------------------------------------------------------------------------

/*[stg].[BC_region_SEX1]*/
-- SELECT * FROM [stg].[BC_region_SEX1] --504
/*
For each measure, for each gender, number and rate are calculated on all ages, execpt rate that is measured once more with age-standardized
*/

--------------------------------------------------------------------------------------------------------------------------------------------

/*[stg].[HDI_1990]*/

-- SELECT * FROM [stg].[HDI_1990] --142
 /*
 contains the HDI of each country in 1990
 */


--------------------------------------------------------------------------------------------------------------------------------------------

/*[stg].[IHME_POP_2017_2100_POP_REFERENC]*/
-- SELECT TOP 6000 * FROM [stg].[IHME_POP_2017_2100_POP_REFERENC] --ORDER BY NEWID() -- 892.416

/*SELECT sex, count(*) FROM stg.IHME_POP_2017_2100_POP_REFERENC GROUP BY sex*/ -- 50%/50% between male and female

/*
scenario name always "reference"
measure name always "population"
half the rows are for female and for male

forecasts data for each location 
*/
--------------------------------------------------------------------------------------------------------------------------------------------

/*[stg].[World_population_age_standard]*/
-- SELECT * FROM [stg].[World_population_age_standard] --24 rows
/*
    - age: age group
    - std_population: std. population
population standards by age group
*/

