Algorithm Question In Python
============================

## Question:

Find the largest continuous sum in the following array of positive and negative integers.

```python
A = [1, 2, 5, 3, 6, -6, 8, -1, -4, -5, 10, 1, 2, -3]

maxContSum(A)
```

## Solution


```python
def maxContSum(List):
    assert isinstance(List, list)

    if len(A) == 0:
        return

    Msum = Csum = 0
    for element in List:
        Csum = max(Csum + element, element)  # get rid of initial negatives
        Msum = max(Msum, Csum)

    return Msum


def main():
    A = [1, 2, 5, 3, 6, -6, 8, -1, -4, -5, 10, 1, 2, -3]

    print maxcontSum(A)


if __name__ == "__main__":
    main()
```
