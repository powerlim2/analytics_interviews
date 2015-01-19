-- answer for SQL Q1

SELECT
  STR.num_comments_for_post as Comment_Count, 
  count(*) as number_of_stories,
  ORI.content_type as Original_Story_Type
FROM (
  SELECT content_id, content_type
  FROM content_action
  GROUP BY content_id, content_type
) ORI
JOIN (
  SELECT
    target_id, 
    count(*) as num_comments_for_post
  FROM content_action
  WHERE target_id IS NOT NULL
  GROUP BY target_id 
) STR
ON ORI.content_id = STR.target_id
GROUP BY Comment_Count, Original_Story_Type
ORDER BY Comment_Count DESC