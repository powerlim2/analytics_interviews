Algorithm Question In Python
============================

## Question

**Write a function to find the next largest integer with the same digits **


* For example:

    ```
    5476  ->  5647
    5454 ->   5544
    ```

Note:

- If the input value is the maximum possible integer with the same digits or the single digit integer,
the function will return the input value.


## Answer

```python
def next_largest(num):
    assert isinstance(num, int)
    assert num >= 0
    
    Snum = str(num)
    
    for i in range(len(Snum)-2, -1, -1):
        if Snum[i] < Snum[i+1]:
            tmp = sorted(Snum[i:])
            next = tmp.pop(tmp.index(sorted(set(Snum[i:]))[1]))
            return int(Snum[:i] + next + ''.join(tmp))
            
    return num


def main():
    print next_largest(5476)
    print next_largest(5454)


if __name__ == "__main__":
    main()
```

output:

```
5647
5544
```