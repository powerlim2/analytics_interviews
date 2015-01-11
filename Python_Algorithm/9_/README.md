Algorithm Question In Python
============================

## Question:

We have 3 string variables: A, B and C. Assume A, B and C are all unique, which means that there do not exist repetitive characters.
We want to check whether C is a complete ordered shuffle of A and B. How would you write a function to solve this problem efficiently?

```python
A = "abcd"
B = "efgh"
C1 = "abefcgdh"  # ordered and complete
C2 = "bacdefgh"  # not ordered for A
C3 = "abecdfhg"  # not ordered for B
C4 = "abcde"     # not complete

for C in [C1, C2, C3, C4]:
    print is_shuffled(A, B, C)
```

**Expected Outcome:**

```
True
False
False
False
```

## Solution 1: O(len(A) * len(B))

- Approach: recursive + cache

```python
def is_shuffled(A, B, C, cache=set()):
    assert isinstance(A, str)
    assert isinstance(B, str)
    assert isinstance(C, str)

    # case 0: check cached values
    if (A, B) in cache:
        return False

    numA, numB, numC = len(A), len(B), len(C)

    # case 1: when c is incomplete shuffle of A and B
    if numA + numB != numC:  # incomplete
        return False

    # case 2: when any of shuffle element is empty
    if numA == 0 or numB == 0:
        if A + B == C:
            return True
        else:  # not ordered
            return False

    # Recursion
    if A[0] == C[0]:
        return is_shuffled(A[1:], B, C[1:])  # move onto the next character in C
    elif B[0] == C[0]:
        return is_shuffled(A, B[1:], C[1:])  # move onto the next character in C
    else:
        cache.add( (A, B) )
        return False


def main():
    '''
    testing
    '''
    A = "abcd"
    B = "efgh"
    C1 = "abefcgdh"  # ordered and complete
    C2 = "bacdefgh"  # not ordered for A
    C3 = "abecdfhg"  # not ordered for B
    C4 = "abcde"   # not complete

    for C in [C1, C2, C3, C4]:
        print is_shuffled2(A, B, C)


if __name__ == "__main__":
    main()
```

**output:**
```
True
False
False
False
```


## Solution 2: O(len(C))

- Approach: using two pointers and iterating the list C

```python
def is_shuffled2(A, B, C):
    assert isinstance(A, str)
    assert isinstance(B, str)
    assert isinstance(C, str)

    numA, numB, numC = len(A), len(B), len(C)

    # case 1: when c is incomplete shuffle of A and B
    if numA + numB != numC:  # incomplete
        return False

    # case 2: when any of shuffle element is empty
    if numA == 0 or numB == 0:
        if A + B == C:
            return True
        else:  # not ordered
            return False

    a, b = 0, 0  # pointers for lists A and B respectively
    for c in C:
        if a < numA and c == A[a]:
            a += 1
        elif b < numB and c == B[b]:
            b += 1
        else:
            return False

    return True


def main():
    '''
    testing
    '''
    A = "abcd"
    B = "efgh"
    C1 = "abefcgdh"  # ordered and complete
    C2 = "bacdefgh"  # not ordered for A
    C3 = "abecdfhg"  # not ordered for B
    C4 = "abcde"   # not complete

    for C in [C1, C2, C3, C4]:
        print is_shuffled2(A, B, C)


if __name__ == "__main__":
    main()
```

**output:**

```
True
False
False
False
```

## Efficiency Comparison

```
In [48]: %timeit is_shuffled(A, B, C1)
100000 loops, best of 3: 10.6 us per loop

In [49]: %timeit is_shuffled2(A, B, C1)
100000 loops, best of 3: 3.05 us per loop
```

* `is_shuffled2()` is more than 3 times faster than `is_shuffled()` for the given sample.