-- Question 2 Answer

-- Assumption: there is no duplication error in the raw data.


SELECT
    app_package_name,
    AVG(dur_secs) as avg_dur_secs
FROM (
    SELECT 
        app_package_name,
        TIMESTAMP_TO_SEC(pause_time) - TIMESTAMP_TO_SEC(resume_time) as dur_secs
    FROM 
        daily_app_usage_20150304
    WHERE 
        DATE(resume_time) = '2015-03-04' OR DATE(pause_time) = '2015-03-04'
        AND app_package_name LIKE 'com.motorola.%'
)
GROUP BY app_package_name
