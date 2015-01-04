# Statistics Interview Questions

## Test of Independence on Contingency Table


In 2000 the Vermont State legislature approved a bill authorizing civil unions.
The vote can be broken down by gender to produce the following 2X2 contingency table,

|        | YES | NO  | TOTAL |
|:------:|:---:|:---:|:-----:|
| WOMEN  | 35  | 9   | 44    |
| MEN    | 60  | 41  | 101   |
| TOTAL  | 95  | 50  | 145   |


### Question:

**Test the hypothesis that voting behavior is independent of gender.**


## Answer:

We have two options to perform such test using parametric models. They are Pearson's Chi-Square test (`x^2`) and
Fisher's Exact Test. In general, Fisher's Exact Test gives the exact solution but the calculation becomes slow when the sample size gets
larger. On the other hand, Pearson's Chi-Square Test gives the exact solution when the limit of sample size goes to infinity and it
gives a reasonable approximation when the sample size is bigger than 10.


### Pearson Chi-Square Test

First we need to calculate the expected frequencies for each case.

|        | YES    | NO       | TOTAL |
|:------:|:------:|:--------:|:-----:|
| WOMEN  | 28.83  | 15.17    | 44    |
| MEN    | 66.17  | 34.83    | 101   |
| TOTAL  | 95     | 50       | 145   |

**Tip**: You only need to calculate once to figure out all expected frequencies in the 2X2 contingency table.
- E(YES, WOMEN) = (95 / 145) * (44 / 145) * 145 = 28.827586207 ~ 28.83
- E(NO, WOMEN) ~ 44 - 28.83 = 15.17
- E(YES, MEN) ~ 95 - 28.83 = 66.17
- E(NO, MEN) ~ 50 - 15.17 = 34.83


Let's perform the independence test in Python.

```python
from scipy.stats import chisqprob

Chisq = (35 - 28.83)**2/28.83 + (9 - 15.17)**2/15.17 + (60 - 66.17)**2/66.17 + (41 - 34.83)**2/34.83
df = (2 - 1) * (2 - 1)

print "Chi-Sqaure Stat: {}, Degree of Freedom: {}, P-Value: {}".format(Chisq, df, chisqprob(Chisq, df))
```

Output:
```
Chi-Sqaure Stat: 5.4982584574, Degree of Freedom: 1, P-Value: 0.0190354222443
```

**We reject the null hypothesis that voting behavior is independent of gender at 95% confidence level.**

Note:
- The degree of freedom can be calculated by (num_rows - 1) * (num_cols - 1), excluding the marginal column).


### Fisher's Exact Test

Fisher's Exact Test examines the significance of the association (contingency) between the two kinds of classification.
In this particular example, Fisher's Exact Test is preferred over Pearson Chi-Square Test since the O(WOMEN, NO) = 9 and
the sample size is reasonably small.


Let's assume that we are restricted to use any library in the interview.
```python
# 1 implement Fisher's exact test for 2 by 2 contingency table
def exact_test(a, b, c, d):
    """
    | a   | b   | a+b
    | c   | d   | c+d
    | a+c | b+d | a+b+c+d

    returns the exact probability
    """
    return Choose(a + b, a) * Choose(c + d, c) / float(Choose(a + b + c + d, a + c))


# 2 implement Choose function
def Choose(n, k):
    assert n >= k

    return Factorial(n) / (Factorial(n-k) * Factorial(k))


# 3 implement Factorial function
def Factorial(n):
    assert isinstance(n, int)

    if n == 0:
        return 1
    else:
        return n * Factorial(n - 1)


def main():
    print "Fisher's Exact Test P-value: {}".format(exact_test(35, 9, 60, 41))


if __name__ == "__main__":
    main()
```

output:
```
Fisher's Exact Test P-value: 0.00937163212471
```

**We reject the null hypothesis that voting behavior is independent of gender at 99% confidence level.**

Note:
- Notice that Pearson Chi-Square approximation was slightly deviated from the exact probability when the sample size is small.


