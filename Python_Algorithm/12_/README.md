Algorithm Question In Python
============================

## Question

**Write a function to calculate approximated square rooted integer value given a non-negative integer.**

- Example
```
SQRT_FLOOR(0) will return 0
SQRT_FLOOR(1) will return 1
SQRT_FLOOR(2) will return 1
SQRT_FLOOR(3) will return 1
SQRT_FLOOR(4) will return 2
SQRT_FLOOR(6) will return 2
SQRT_FLOOR(8) will return 2
SQRT_FLOOR(9) will return 3
...
SQRT_FLOOR(15) will return 3
SQRT_FLOOR(16) will return 4
```

Notes:

1. The input number will be any non-negative integers.
2. You cannot use x ** (0.5) approach to calculate Square rooted value of integer.


## Answer

### Solution 1: Approach as a search problem

Since Binary Search, log(N), is more efficient than linear search, N, we are going to implement binary search here.
Notice that any SQRT(N) value lies in [0, 1 + (N/2)].

```python
def SQRT_FLOOR(num):
    assert num >= 0
    assert isinstance(num, int)
    
    if num == 0:
        return 0
    elif num == 1:
        return 1
    
    low = 1
    high = 1 + num // 2
    while (high - low > 1):
        mid = low + (high - low) // 2
        
        if mid ** 2 == num:
            return mid
        elif mid ** 2 > num:
            high = mid
        else:
            low = mid
    
    return low


def main():
    for num in xrange(17):
        print "SQRT_FLOOR({}) will return {}".format(num, SQRT_FLOOR(num))


if __name__ == "__main__":
    main()
```

output:

```
SQRT_FLOOR(0) will return 0
SQRT_FLOOR(1) will return 1
SQRT_FLOOR(2) will return 1
SQRT_FLOOR(3) will return 1
SQRT_FLOOR(4) will return 2
SQRT_FLOOR(5) will return 2
SQRT_FLOOR(6) will return 2
SQRT_FLOOR(7) will return 2
SQRT_FLOOR(8) will return 2
SQRT_FLOOR(9) will return 3
SQRT_FLOOR(10) will return 3
SQRT_FLOOR(11) will return 3
SQRT_FLOOR(12) will return 3
SQRT_FLOOR(13) will return 3
SQRT_FLOOR(14) will return 3
SQRT_FLOOR(15) will return 3
SQRT_FLOOR(16) will return 4
```


### Solution 2: Approach as Math problem 

```python
import math

def SQRT_FLOOR2(num):
    assert num >= 0
    assert isinstance(num, int)
    
    if num == 0:
        return 0
    elif num == 1:
        return 1
    
    return int(2 ** ( 0.5 * math.log(num, 2)))


def main():
    for num in xrange(17):
        print "SQRT_FLOOR({}) will return {}".format(num, SQRT_FLOOR2(num))


if __name__ == "__main__":
    main()
```

output:

```
SQRT_FLOOR(0) will return 0
SQRT_FLOOR(1) will return 1
SQRT_FLOOR(2) will return 1
SQRT_FLOOR(3) will return 1
SQRT_FLOOR(4) will return 2
SQRT_FLOOR(5) will return 2
SQRT_FLOOR(6) will return 2
SQRT_FLOOR(7) will return 2
SQRT_FLOOR(8) will return 2
SQRT_FLOOR(9) will return 3
SQRT_FLOOR(10) will return 3
SQRT_FLOOR(11) will return 3
SQRT_FLOOR(12) will return 3
SQRT_FLOOR(13) will return 3
SQRT_FLOOR(14) will return 3
SQRT_FLOOR(15) will return 3
SQRT_FLOOR(16) will return 4
```