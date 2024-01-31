ALTER VIEW ml.clust_country_avgASR_SDI_HDI90
AS
SELECT
    scras.country
    ,AVG(scras.ASR) AS avg_ASR
    ,AVG(scras.SDI) AS SDI
    ,AVG(hdi.HDI) AS HDI90
    ,AVG(nat.upper) as upper
    ,AVG(nat.lower) as lower
    ,AVG(nat.lower) as val
FROM
    ml.sdicluster_country_risk_asr_sdi as scras
INNER JOIN
    dwh.HDI_1990 as hdi
    ON
    scras.country = hdi.Country
INNER JOIN
    dwh.nation as nat
    ON
    nat.[location] = scras.country
WHERE
    nat.measure = 'Deaths'
    AND
    nat.metric = 'Rate'
    AND
    nat.age = 'Age-standardized'
GROUP BY
    scras.country

-- SELECT top 1* FROM ml.clust_country_avgASR_SDI_HDI90

-- SELECT TOP 100 * FROM ml.sdicluster_country_risk_asr_sdi
-- SELECT TOP 100 * FROM dwh.HDI_1990
-- SELECT TOP 100 * FROM dwh.nation