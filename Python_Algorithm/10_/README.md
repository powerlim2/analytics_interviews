Algorithm Question In Python
============================

## Question:

Find the largest continuous sum in the following array of positive and negative integers.

```python
A = [-5, 1, 2, 5, 3, 6, -6, 8, -1, -4, -5, 10, 1, 2, -3]

maxContSum(A)
```

## Solution: O(n)


```python
def maxContSum(List):
    assert isinstance(List, list)

    if len(List) == 0:
        return

    Msum = Csum = -9999
    for element in List:
        Csum = max(Csum + element, element)  # get rid of initial negatives
        Msum = max(Msum, Csum)

    return Msum


def main():
    A = [-5, 1, 2, 5, 3, 6, -6, 8, -1, -4, -5, 10, 1, 2, -3]

    print maxContSum(A)


if __name__ == "__main__":
    main()
```

**output:**

```
22
```


## Question 2

Find **the starting position and the ending position** of the largest continuous sum in the following array of positive and negative integers.

```python
A = [-5, 1, 2, 5, 3, 6, -6, 8, -1, -4, -5, 10, 1, 2, -3]

maxContSumPosition(A)
```


## Solution: O(n)

```python
def maxContSumPosition(List):
    assert isinstance(List, list)

    if len(List) == 0:
        return

    Msum = Csum = -9999
    s = e = 0
    for i in xrange(len(List)):
        if Csum + List[i] > List[i]:
            Csum += List[i]
        else:  # get rid of initial negatives
            s = i
            Csum = List[i]

        if Csum > Msum:
            e = i
            Msum = Csum

    return {'start': s, 'end': e, '_sum': Msum}


def main():
    A = [-5, 1, 2, 5, 3, 6, -6, 8, -1, -4, -5, 10, 1, 2, -3]

    print maxContSumPosition(A)


if __name__ == "__main__":
    main()
```

**output:**

```
{'_sum': 22, 'start': 1, 'end': 13}
```