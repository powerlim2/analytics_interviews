# Statistics Interview Question


## Question

```python
import numpy as np


def sample(X, prob):
    """
    np.random.random_sample() returns a random floats in the half-open interval [0.0, 1.0)
    """
    return [i for i in X if np.random.random() < prob]


def summary(X):
    """
    print size, mean, var, min, max
    """
    return "size: {}, mean: {}, variance: {}, min: {}, max: {}".format(X.size, X.mean(), X.var(), X.min(), X.max())


def main():
    mu, sd = 7, 2
    X = np.random.normal(mu, sd, 10000)  # 1000 obs from normal dist
    x = np.array(sample(X, 0.004))

    Y = np.random.poisson(mu, 10000) + np.random.normal(0, sd, 10000)
    y = np.array(sample(Y, 0.004))

    print "X | " + summary(X)
    print "x | " + summary(x)
    print "Y | " + summary(Y)
    print "y | " + summary(y)


if __name__ == "__main__":
    main()
```

output:
```
X | size: 10000, mean: 6.99968188213, variance: 3.96514778673, min: 0.151265052534, max: 14.213861675
x | size: 44, mean: 6.89536893794, variance: 5.14803146952, min: 2.9986345583, max: 12.1007511437

Y | size: 10000, mean: 6.99362587548, variance: 11.0171966541, min: -3.95134212689, max: 20.2542808768
y | size: 40, mean: 6.37770836, variance: 8.42969410924, min: 0.465564411783, max: 11.5098599441
```

- Question 1. Does the sample `x` well represents its parent `X`?
- Question 2. Does the sample `y` well represents its parent `Y`?


## Answer

When we test the difference of **two** distributions, the default choice will be K-S (Kolmogorov-Smirnov) test that
compares the cumulative distributions of two variables. If we test the difference in location of two distributions,
we can use t-test (difference in mean) and Mann-Whitney U Test (difference in mean ranks or median). When the distributions for
two samples are normal, *t-test* is an effective choice.
All other cases, *Mann-Whitney U Test* (also called *Wilcoxon Rank-Sum Test*) is preferred over t-test.
T-test is a parametric test, which assumes the distributions are normal and compares the means while Mann-Whitney U Test is a
non-parametric test that is distribution-free. In terms of efficiency, Mann-Whitney test is as nearly efficient as
t-test on normal distributions.

1. We are going to use the **unpaired t-test** to test whether the mean of `x` is the statistically identical to mean of `X`.
2. **Mann-Whitney U test** is used to test whether the mean rank of `y` is statistically identical to the mean rank of `Y`.
3. **K-S test** will be performed to test the difference in distributions of (`X` and `x`) and (`Y` and `y`).


### Unpaired T-Test

We know from the given python code that parent populations of both `x` and `X` are normally distributed and have the same
variance. This satisfies the assumption for the unpaired t-test.

Hypothesis:
- H0: The mean of `X` and the mean of `x` are equal
- H1: two means are NOT equal

```python
from scipy.stats import t
import numpy as np


def unpaired_t_test(X, Y):
    assert isinstance(X, np.ndarray)
    assert isinstance(Y, np.ndarray)

    df = (X.size + Y.size - 2)
    common_sd = np.sqrt(((X.size - 1) * X.var() + (Y.size - 1) * Y.var()) / df)
    t_stat = (X.mean() - Y.mean()) / (np.sqrt(1./X.size + 1./Y.size) * common_sd)
    p_value = t.sf(np.abs(t_stat), df) * 2  # two-sided
    return t_stat, p_value
```

output:
```
T-statistic: 0.346500839235, P-value: 0.728973613489
```

**We cannot reject the null hypothesis that the means are equal at 95% confidence level.**


### Mann-Whitney U Test

We know from the given python code that parent populations of both `y` and `Y` are not normally distributed. In this case,
we are going to compare the mean ranks of two distributions using Mann-Whitney U test.

Hypothesis:
- H0: The mean rank of `X` and the mean rank of `x` are equal
- H1: two mean ranks are NOT equal

```python
from scipy.stats import mannwhitneyu
import numpy as np

def two_sided_MWU(X, Y):
    assert isinstance(X, np.ndarray)
    assert isinstance(Y, np.ndarray)

    u_stat, p_value = mannwhitneyu(X, Y)
    return u_stat, p_value * 2
```

output:
```
U-statistic: 180513.0, P-value: 0.286813366859
```

**We cannot reject the null hypothesis that the mean ranks are equal at 95% confidence level.**


### [K-S (Kolmogorov-Smirnov) test](http://www.princeton.edu/~achaney/tmve/wiki100k/docs/Kolmogorov-Smirnov_test.html)

The Kolmogorov-Smirnov test compares the cumulative distribution of the two data sets, and computes a P value that
depends on the largest discrepancy between distributions while the Mann-Whitney test first ranks all the values
from low to high, and then computes a P value that depends on the discrepancy between the mean ranks of the two groups.

The difference between K-S and MWU test are:

- The KS test is sensitive to any differences in the two distributions. Substantial differences in shape, spread or median will result in a small P value. In contrast, the MWU test is mostly sensitive to changes in the median.
- The MW test has been extended to handle tied values. The KS test does not handle ties so well. If your data are categorical, so has many ties, don't choose the KS test.

Hypothesis:
- H0: the samples were drawn from the same distribution
- H1: the samples are NOT drawn from the same distribution

```python
from scipy.stats import ks_2samp
import numpy as np

def two_sided_KS_test(X, Y):
    assert isinstance(X, np.ndarray)
    assert isinstance(Y, np.ndarray)

    ks_stat, p_value = ks_2samp(X, Y)
    return ks_stat, p_value
```

output:
```
Comparison between X and x
KS-statistic: 0.131781818182, P-value: 0.406362358384

Comparison between Y and y
KS-statistic: 0.1413, P-value: 0.377323938426
```

**We cannot reject the null hypothesis that the mean ranks are equal at 95% confidence level.**


### Full Code Implementation

```python
from scipy.stats import t, mannwhitneyu, ks_2samp
import numpy as np


def sample(X, prob):
    """
    np.random.random_sample() returns a random floats in the half-open interval [0.0, 1.0)
    """
    return [i for i in X if np.random.random() < prob]


def summary(X):
    """
    print size, mean, var, min, max
    """
    return "size: {}, mean: {}, variance: {}, min: {}, max: {}".format(X.size, X.mean(), X.var(), X.min(), X.max())


def unpaired_t_test(X, Y):
    assert isinstance(X, np.ndarray)
    assert isinstance(Y, np.ndarray)

    df = (X.size + Y.size - 2)
    common_sd = np.sqrt(((X.size - 1) * X.var() + (Y.size - 1) * Y.var()) / df)
    t_stat = (X.mean() - Y.mean()) / (np.sqrt(1./X.size + 1./Y.size) * common_sd)
    p_value = t.sf(np.abs(t_stat), df) * 2  # two-sided
    return t_stat, p_value


def two_sided_MWU(X, Y):
    assert isinstance(X, np.ndarray)
    assert isinstance(Y, np.ndarray)

    u_stat, p_value = mannwhitneyu(X, Y)
    return u_stat, p_value * 2


def two_sided_KS_test(X, Y):
    assert isinstance(X, np.ndarray)
    assert isinstance(Y, np.ndarray)

    ks_stat, p_value = ks_2samp(X, Y)
    return ks_stat, p_value


def main():
    mu, sd = 7, 2
    X = np.random.normal(mu, sd, 10000)  # 1000 obs from normal dist
    x = np.array(sample(X, 0.004))

    Y = np.random.poisson(mu, 10000) + np.random.normal(0, sd, 10000)
    y = np.array(sample(Y, 0.004))

    print "X | " + summary(X)
    print "x | " + summary(x)
    print "Y | " + summary(Y)
    print "y | " + summary(y)


    t_stat, t_prob = unpaired_t_test(X, x)
    u_stat, u_prob = two_sided_MWU(Y, y)
    ks_stat1, ks_prob1 = two_sided_KS_test(X, x)
    ks_stat2, ks_prob2 = two_sided_KS_test(Y, y)

    print "Comparison between X and x"
    print "T-statistic: {}, P-value: {}".format(t_stat, t_prob)
    print "KS-statistic: {}, P-value: {}".format(ks_stat1, ks_prob1)

    print "\nComparison between Y and y"
    print "U-statistic: {}, P-value: {}".format(u_stat, u_prob)
    print "KS-statistic: {}, P-value: {}".format(ks_stat2, ks_prob2)


if __name__ == "__main__":
    main()
```

output:
```
X | size: 10000, mean: 6.99968188213, variance: 3.96514778673, min: 0.151265052534, max: 14.213861675
x | size: 44, mean: 6.89536893794, variance: 5.14803146952, min: 2.9986345583, max: 12.1007511437
Y | size: 10000, mean: 6.99362587548, variance: 11.0171966541, min: -3.95134212689, max: 20.2542808768
y | size: 40, mean: 6.37770836, variance: 8.42969410924, min: 0.465564411783, max: 11.5098599441

Comparison between X and x
T-statistic: 0.346500839235, P-value: 0.728973613489
KS-statistic: 0.131781818182, P-value: 0.406362358384

Comparison between Y and y
U-statistic: 180513.0, P-value: 0.286813366859
KS-statistic: 0.1413, P-value: 0.377323938426
```