-- Question 3 Answer


SELECT
    device_age,
    count(*) as num_devices
FROM (
    SELECT 
        device_id,
        DATEDIFF(TIMESTAMP(activation_date), TIMESTAMP("2015-03-04")) as device_age
    FROM 
        daily_app_usage_20150304
    WHERE 
        DATE(resume_time) = '2015-03-04' OR DATE(pause_time) = '2015-03-04'
        AND app_package_name = 'com.motorola.migrate'
    GROUP BY
        device_id, device_age
)
GROUP BY device_age
ORDER BY device_age ASC

