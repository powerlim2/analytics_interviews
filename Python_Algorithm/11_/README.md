

## Question

Find the first non-repeated (unique) alphabet character in the given string (case insensitive).

```python
example = "That's not surprising, says Valerie Wilson, labor economist at the Economic Policy Institute, \
since whites usually see larger gains earlier in economic recoveries. Those with lower levels of education \
and higher unemployment rates benefit later."
```


## Answer: O(n)

```python
def first_unique_alphabet(String):
    assert isinstance(String, str)

    if not String:
        return

    alphabet = "abcdefghijklmnopqrstuvwxyz"
    lookup = {}
    lowered = String.lower()
    for char in lowered:
        if char in alphabet:
            if not lookup.has_key(char):
                lookup[char] = 1
            else:
                lookup[char] += 1

    for i in xrange(len(String)):
        if lookup.get(lowered[i]) == 1:
            return String[i]
    return


def main():
    example = "That's not surprising, says Valerie Wilson, labor economist at the Economic Policy Institute, \
    since whites usually see larger gains earlier in economic recoveries. Those with lower levels of education \
    or higher unemployment rates benefit later."

    print first_unique_alphabet(example)


if __name__ == "__main__":
    main()
```

**output:**

```
d
```