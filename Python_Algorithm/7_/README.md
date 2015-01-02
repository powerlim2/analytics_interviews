Algorithm Question In Python
============================

## Question:

Given a **sorted array list** with some sequenced numbers and some non-sequenced numbers.
Write an algorithm that takes this array list as an input and returns a list of (start, end) of all consecutive numbers.

Assumption:

1. Consecutive numbers have difference of 1 only.
2. There are no repeated numbers in the array list.


```
[4, 5, 6, 7, 8, 9, 12, 15, 16, 17, 18, 20, 22, 23, 24, 27]
```

## Answer:

```python
L = [4, 5, 6, 7, 8, 9, 12, 15, 16, 17, 18, 20, 22, 23, 24, 27]


def find_end(i, size, list):
    """
    Binary Search: O(lgN)
    """
    low = i
    high = size

    while low < high:
        mid = (low + high) // 2
        if (mid - low) == (list[mid] - list[low]):
            if (mid - low + 1) < (list[mid+1] - list[low]):
                return mid
            else:
                low = mid + 1
        else:
            high = mid - 1

    return low


def main():
    i = 0
    size = len(L)

    out = []
    while i < (size - 1):
        end = find_end(i, size - 1, L)
        if end != i:
            out.append((L[i], L[end]))
            i = end + 1
        else:
            i += 1

    print out


if __name__ == "__main__":
    main()
```

**Output:**

```
[(4, 9), (15, 18), (22, 24)]
```