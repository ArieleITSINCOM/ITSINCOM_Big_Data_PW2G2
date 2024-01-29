CREATE VIEW ml.risk_rate_sdi as 
select 
  P.[location]
    , P.[year]
    , P.[cause]
    , P.[val] AS [ASR]
    , R.[val] AS [Rate_tot]
from [ml].[Percent1] as P
inner join 
[ml].[region_sdi] as R
on
P.[location] = R.[location] 
and 
P.[year] = R.[year]
where 
P.[measure] = 'Deaths'
and
R.[measure] = 'Deaths'
and
P.[metric] = 'Rate'
and 
R.[metric] = 'Rate'
and  
P.[age] = 'All ages'
and 
R.[age] = 'All ages'
 
select * from dwh.test_aml