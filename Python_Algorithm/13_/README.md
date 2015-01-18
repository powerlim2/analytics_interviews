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
    
    num = str(num)
    L = N = len(num)
    
    if N == 1:
        return int(num)
    
    i = N - 2
    while N > 0:
        if int(num[i]) >= int(num[i+1]):
            i -= 1
        else:
            return int(num[:i] + num[i+1] + "".join(sorted(num[i] + num[i+2:])))
        N -= 1
    
    return int(num)


def main():
    print next_largest(5476)


if __name__ == "__main__":
    main()
```

output:

```
5647
```