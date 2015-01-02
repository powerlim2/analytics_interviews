Facebook Algorithm Question In Python
=====================================

## Question:

**Given an array of integers, find all pairs that two values sum to a given value.**

Example:
```
When we have a list that is [1, 2, 3, 5, 6, 8, 10],
if the value is 6, it returns [(1, 5)].
if the value is 7, it returns [(1, 6), (2, 5)].
if the value is 0, it returns [].
```

Note:
- what if there is more than one copy of the same pair, return once.
- Do not return a reverse of a pair.


## Answer:

There exists 3 ways to solve this problem: the simplest way, a better way, the best way.
The simplest way is to do exhaustive search that is a good to start out the analysis but it is inefficient.
A better way is to do two pointer search which is more efficient than the simplest approach.
The best way is to use set data structure and it finds an answer in the linear time.


### Naive Approach Using Exhaustive Search: O(N^2)

```python
def exists_sum1(arr, value):
    assert isinstance(value, int)
    assert isinstance(arr, list)

    if len(arr) < 2: return []
    return [(arr[i] , arr[j]) for i in xrange(len(arr)) for j in xrange(i+1, len(arr)-1) if arr[i] + arr[j] == value]


def main():
    L = [1, 2, 3, 5, 6, 8, 10]
    for i in [6, 7, 0]:
        print exists_sum1(L, i)


if __name__ == "__main__":
    main()
```


### A better Approach Using Two Pointer Search: O(NlgN)

```python
def exists_sum2(arr, value):
    assert isinstance(value, int)
    assert isinstance(arr, list)

    if len(arr) < 2: return []
    List = sorted(arr)  # O(NlgN)

    out = []
    left, right = 0, len(List) - 1

    while left < right:
        Sum = List[left] + List[right]

        if Sum == value:
            out.append((List[left], List[right]))
            left += 1
        elif Sum < value:
            left += 1
        else:
            right -= 1

    return out


def main():
    L = [1, 2, 3, 5, 6, 8, 10]
    for i in [6, 7, 0]:
        print exists_sum2(L, i)


if __name__ == "__main__":
    main()
```


### The best Approach Using Set: O(N)

```python
def exists_sum3(arr, value):
    assert isinstance(value, int)
    assert isinstance(arr, list)

    if len(arr) < 2: return []

    searched = set()
    out = set()

    for num in arr:
        target = value - num

        if target not in searched:
            searched.add(num)
        else:
            out.add( (min(num, target), max(num, target)) )

    return list(out)


def main():
    L = [1, 2, 3, 5, 6, 8, 10]
    for i in [6, 7, 0]:
        print exists_sum3(L, i)


if __name__ == "__main__":
    main()
```
