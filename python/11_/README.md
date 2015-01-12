Algorithm Question In Python
============================

## Question

This is a string manipulation question. Write a function to reverse words in the specified string.

* Example:

```
"Hello World!" -> "World! Hello"
```


## Solution using built-in python functions

```python
def reverse_words(Sentence):
    assert isinstance(Sentence, str)

    return " ".join(Sentence.split()[::-1])


def main():
    S = "Hello World!"

    print reverse_words(S)


if __name__ == "__main__":
    main()
```

**output:**

```
World! Hello
```

