-- Question 1 Answer


SELECT
    app_package_name,
    count(*) as num_people
FROM (
    SELECT device_id, app_package_name    
    FROM daily_app_usage_20150304
    WHERE DATE(resume_time) = '2015-03-04' OR DATE(pause_time) = '2015-03-04'
    GROUP BY device_id, app_package_name
)
GROUP BY app_package_name
ORDER BY num_people DESC
LIMIT 10
