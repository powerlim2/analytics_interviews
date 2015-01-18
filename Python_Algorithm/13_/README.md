Algorithm Question In Python
============================

## Question

**Write a function to find the next largest integer with the same digits **


* For example:

    ```
    5476  ->  5647
    ```

Note:

- If the input value is the maximum possible integer with the same digits or the single digit integer,
the function will return the input value.


## Answer

```python
def next_largest(num):
    assert isinstance(num, int)
    assert num >= 0
    
    strNum = str(num)
    length = len(strNum)
    
    for i in range(length-2, -1, -1):
        if strNum[i] < strNum[i+1]:
            temp = sorted(strNum[i:]) 
            next = temp.pop(1)
            return int(strNum[:i] + next + ''.join(temp))
            
    return num


def main():
    print next_largest(5476)


if __name__ == "__main__":
    main()
```

output:

```
5647
```