# Python Programming Interview Question 7

### Question:

What is the difference between `range()` and `xrange()` in python 2.7?


### Answer:

`xrange()` is a generator, which is much faster and memory efficient compared to `range()`. In terms of performance, when iterating over a large range, `xrange()` is better. When you need to work with a list of all numbers in a specific range, `range()` is preferred over `xrange()`.

- `range()` returns a list.
- `xrange()` returns an object that works like a interator.