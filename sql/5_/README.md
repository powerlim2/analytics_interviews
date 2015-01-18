# Analytics SQL Question

Pageview Event Logging:

```
member_id   page_key    page_sequence
1   Home    1
1   Profile 2
2   Profile 1
2   Edit    2
2   Groups  3
2   Company 4
2   Home    5
3   Home    1
3   Profile 2
4   Groups  1
3   Home    3
4   Search  2
5   Registration    1
5   Home    2
4   Jobs    3
1   Home    3
2   Profile 6
6   Search  1
```

## Question 1

**What was the last page that each member visited?**


Expected Output:

```
1   Home
2   Profile
3   Home
4   Jobs
5   Home
6   Search
```

### Answer

```sql
SELECT
    MEMBER.member_id as member_id,
    MEMBER.page_key as page_key 
FROM (
    SELECT
        member_id, page_key, page_sequence
    FROM
        Pageview_Event_Logging
) MEMBER
JOIN (
    SELECT
        member_id, max(page_sequence) as last_page
    FROM
        Pageview_Event_Logging
    GROUP BY member_id
) PAGE
ON MEMBER.member_id = PAGE.member_id AND MEMBER.last_page = PAGE.page_sequence
```


## Question 2

**Now, Answer the Question 1 using Python**

* Assume we have the csv file: `Pageview_Event_Logging.csv`


### Answer

The key here is to use two dictionaries.

```python
import csv

def last_page(csvfile):
    member = {}
    page = {}

    with open(csvfile, 'r') as input:
        input.readline()  # skip title
        
        for line in csv.reader(input):
            id, Pkey, Pseq = line

            if member.has_key(id):
                if member.get(id) < Pseq:
                    member[id] = Pseq
                    page[id] = Pkey
            
            else:
                member[id] = Pseq
                page[id] = Pkey
    
    return page


def main():
    lastP = last_page("Pageview_Event_Logging.csv")
    
    for k, v in lastP.iteritems():
        print "%s\t%s" % (k, v)


if __name__ == "__main__":
    main()
```

