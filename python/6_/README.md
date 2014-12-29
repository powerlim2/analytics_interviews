# Python Programming Interview Question 6

### Question:

```python
1. list = [ [ ] ] * 5
2. list  # output?

3. list[0].append(10)
4. list  # output?

5. list[1].append(20)
6. list  # output?

7. list.append(30)
8. list  # output?
```



### Answer:

```
2. [[], [], [], [], []]

4. [[10], [10], [10], [10], [10]]

6. [[10, 20], [10, 20], [10, 20] [10, 20] [10, 20]]

8. [[10, 20], [10, 20], [10, 20] [10, 20] [10, 20], 30]
```

**Key Idea:**

- `list = [ [ ] ] * 5` creates a list of 5 references to the same list.
