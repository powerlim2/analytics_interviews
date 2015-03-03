-- Question 4 Answer


SELECT
    COL1.num_heavy_youtuber as num_heavy_youtuber,
    COL2.num_newcomers as num_newcomers,
    (COL1.num_heavy_youtuber / COL2.num_newcomers) as proportion
FROM (
    SELECT
        count(*) as num_heavy_youtuber
    FROM (
        SELECT
            device_id,
            SUM(IF(app_package_name = 'com.google.android.youtube', TIMESTAMP_TO_SEC(pause_time) - TIMESTAMP_TO_SEC(resume_time), 0)) as youtube_dur
            SUM(IF(app_package_name = 'com.whatsapp', TIMESTAMP_TO_SEC(pause_time) - TIMESTAMP_TO_SEC(resume_time), 0)) as whatsapp_dur
        FROM 
            daily_app_usage_20150304
        WHERE 
            DATE(resume_time) = '2015-03-04' OR DATE(pause_time) = '2015-03-04'
            AND DATEDIFF(TIMESTAMP(activation_date), TIMESTAMP("2015-03-04")) < 14
            AND app_package_name IN ('com.google.android.youtube', 'com.whatsapp')  -- this is optional
        GROUP BY
            device_id
        HAVING
            youtube_dur > whatsapp_dur
    )
) COL1
CROSS JOIN (
    SELECT 
        count(*) num_newcomers
    FROM (
        SELECT
            device_id        
        FROM 
            daily_app_usage_20150304
        WHERE 
            DATE(resume_time) = '2015-03-04' OR DATE(pause_time) = '2015-03-04'
            AND DATEDIFF(TIMESTAMP(activation_date), TIMESTAMP("2015-03-04")) < 14
        GROUP BY
            device_id
    )
) COL2

