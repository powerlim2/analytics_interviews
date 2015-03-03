# Analytics SQL Question

```
Table: daily_app_usage_20150304
Fields: 
    1. device_id: string (unique device identification number)
    2. resume_time: timestamp (application start time)                                 
    3. pause_time: timestamp (application end time)
    4. app_package_name: string (application android package name)
    5. activation_date: string (when the device was first activated)


example (first 5 rows):
 
 device_id     resume_time            pause_time          app_package_name      activation_date
===============================================================================================
  NFEXW2   2015-03-04 04:32:13   2015-03-04 04:39:11   com.motorola.MotGallery2   2014-12-06
  NFEXW2   2015-03-04 04:25:55   2015-03-04 04:30:21   com.motorola.camera        2014-12-06
  GEXF55   2015-03-04 07:11:22   2015-03-04 09:11:41   com.android.systemui       2014-01-04
  GEXF55   1970-01-01 00:00:00   1970-01-01 00:00:03   com.facebook.katana        2014-01-04
  BEXZY7   2015-03-04 01:57:02   2015-03-04 02:08:09   com.android.dialer         2014-05-05
                                            ...
```

- Helper functions:
    1. `DATE(<timestamp>)` will change the **timestamp** to date **string** (e.g. 2015-03-04 04:32:13 -> 2015-03-04)
    2. `DATEDIFF(<timestamp1>, <timestamp2>)` will return the difference in days as **INTEGER**.
    3. `TIMESTAMP("2014-03-04")` will covert a date string to a timestamp. (will return 2014-03-04 00:00:00)
    4. `TIMESTAMP_TO_SEC(<timestamp>)` will covert timestamp to seconds.


## Question 1

**On March 4th, 2015, what is the top 10 most popular app and how many people used them?**

Expected Outcome:
```
com.motorola.MotGallery2   4500000
com.android.chrome         3000000
com.facebook.katana        2900000
...
```

## Question 2

**What is the average usage time (in seconds) for each motorola app on March 4th, 2015?**

Expected Outcome:
```
com.motorola.MotGallery2    35
com.motorola.camera         11
com.motorola.migrate        3540
...
```

## Question 3

**What is the distribution of device age (in days) for the ones, which used `com.motorola.migrate` (the motorola migrate) app on March 4th, 2015?**

Expected Outcome:
```
0   7500
1   8000
2   10000
3   6000
4   3000
5   2200
...
```

Here the first column indicates the device age and the second column indicates the number of devices.


# Question 4

**On March 4th, 2015, among those people who have recently activated their device (device age < 14 days),
How many people use youtube `com.google.android.youtube` more than Whatsapp `com.whatsapp`?**



 