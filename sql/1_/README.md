# Analytics SQL Question


### Background Data

* Table Name: content_action
* Fields:
	* date (date of content production)
	* user_id (propriety ID)
	* content_id (primary key)
	* content_type (status_update, photo, share, comment)
	* target_id (in the case of comment, this is the content_id of the original story)


Examples: Forum RSS feeds, Facebook feeds, Tweets, etc.


## Question

**Find the distribution of comments per unique original story?**


The expected outcome (given):

```
	Comment_Count     Number of Stories    Original Story Type
--------------------------------------------------------------------
	1                      344                  Status_Update
	1                      211                     Photo
	1                      105                      Share
	2                      85                     
	2
	...
```


## My Answer:


```SQL
SELECT
  STR.num_comments_for_post as Comment_Count, 
  count(*) as number_of_stories,
  ORI.content_type as Original_Story_Type
FROM (
  SELECT content_id, content_type
  FROM content_action
  GROUP BY content_id, content_type
) ORI
LEFT JOIN (
  SELECT
    target_id, 
    count(*) as num_comments_for_post
  FROM content_action
  WHERE target_id IS NOT NULL
  GROUP BY target_id 
) STR
ON STR.target_id = ORI.content_id
GROUP BY Comment_Count, Original_Story_Type
ORDER BY Comment_Count DESC
```

