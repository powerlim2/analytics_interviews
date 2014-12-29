# Python Programming Interview Question 5

### Functional Programming (closure) Question:

**What will be the output of the code below?**


```python
def multipliers():
    return [lambda x: i * x for i in range(4)]

print [m(2) for m in multipliers()]
```

Screen Output
```
[6, 6, 6, 6]
```

How would you modify the definition of `multipliers` to produce the desired behavior?


### Answer1: by using Python Generator (yield)

```python
def multipliers():
    for i in range(4):
        yield lambda x: i * x

print [m(2) for m in multipliers()]
```

### Answer2: closure with immediate binding

```python
def multipliers():
    return [lambda x, i=i : i * x for i in range(4)]

print [m(2) for m in multipliers()]
```

```
[0, 2, 4, 6]
```

**Explanation:**
Regardless of which of the returned functions is called, the for loop has completed and i is left with its final value of 3. Therefore, they all return a value of 6 (= 3 * 2).