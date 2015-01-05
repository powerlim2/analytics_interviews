# Modeling Interview Question

## Gradient Descent Question

With your choice of software tool, implement the **batch gradient descent algorithm**
to uncover the linear relationship between speed and break distance:

` break distance = b0 + b1 * speed`

Find the optimal b0 and b1. You can use linear algebra or matrix operation libraries.


Gradient Descent API:
```java
GradientDescent Class
=====================================
get_beta()                                  // receive the betas
get_mse()                                   // receive the mean squared error
summary()                                   // print out the gradient search iteration summary
run(max_iter = 2000, alpha = 1e-4)          // run gradient descent iterations and returns the betas and sse

__gradient_step()                           // internal function to make a gradient step
```

Use the following data set to model the relationship between *break distance* and *speed*:
```python
# speed vs. break distance data set

speed = [4,	4,	7,	7,	8,	9,	10,	10,	10,	11,	11,	12,	12,	12,	12,	13,	13,	13,	13,	14,	14,	14,	14,
15,	15,	15,	16,	16,	17,	17,	17,	18,	18, 18,	18,	19,	19,	19,	20, 20,	20,	20,	20,	22,	23,	24,	24,	24,	24,	25]

break_distance = [2, 10, 4,	22,	16,	10,	18,	26,	34,	17,	28,	14,	20,	24,	28,	26,	34,	34,	46,	26,	36,	60,	80,
20,	26,	54,	32,	40,	32,	40, 50,	42,	56,	76,	84, 36,	46,	68,	32,	48, 52,	56,	64,	66,	54,	70, 92,	93,	120, 85]
```

## Answer:

My choice of software is Python 2.7 and I use the numpy package.

```python
import numpy as np


class GradientDescent:
    """
    ********************************
    Batch Gradient Descent Algorithm
    ********************************
    Author: Joon Lim

    """
    def __init__(self, x, y):
        assert len(x) == len(y)

        self.x = np.array([np.ones(len(x)), x]).transpose()
        self.y = np.array(y)
        self.__mse = None
        self.__beta = np.ones(self.x.shape[1])  # initial beta set to 1
        self.__summary = "Gradient Search Iteration Summary\n\n"

    def summary(self):
        print self.__summary

    def run(self, max_iter = 2000, alpha = 1e-4):
        """
        if MSE converges during the iteration, finish the iteration and return the beta and MSE.
        """
        converge = False
        previous_mse = 99999
        step = 0
        while (not converge and step < max_iter):
            mse = self.__gradient_step(alpha, step)
            if abs(previous_mse - mse) < 1e-4:
                converge = True
            previous_mse = mse
            step += 1

        return self.__beta, self.__mse * 2

    def __gradient_step(self, alpha, step):
        """
        batch gradient descent iteration step
        """
        y_hat = self.x.dot(self.__beta)
        error = y_hat - self.y
        self.__mse = 1. / (2 * len(y_hat)) * np.sum(error)
        gradient = 1. / len(y_hat) * self.x.transpose().dot(error)
        self.__beta -= alpha * gradient
        self.__summary += "Iter: {}, mse: {}, beta: {}\n".format(step, self.__mse * 2, self.__beta)

        return self.__mse

    def get_beta(self):
        if self.__mse is not None:
            return self.__beta
        return

    def get_mse(self):
        if self.__mse is not None:
            return self.__mse * 2
        return


def main():
    speed = [4,	4,	7,	7,	8,	9,	10,	10,	10,	11,	11,	12,	12,	12,	12,	13,	13,	13,	13,	14,	14,	14,	14,
    15,	15,	15,	16,	16,	17,	17,	17,	18,	18, 18,	18,	19,	19,	19,	20, 20,	20,	20,	20,	22,	23,	24,	24,	24,	24,	25]
    break_distance = [2, 10, 4,	22,	16,	10,	18,	26,	34,	17,	28,	14,	20,	24,	28,	26,	34,	34,	46,	26,	36,	60,	80,
    20,	26,	54,	32,	40,	32,	40, 50,	42,	56,	76,	84, 36,	46,	68,	32,	48, 52,	56,	64,	66,	54,	70, 92,	93,	120, 85]

    SLR = GradientDescent(speed, break_distance)
    beta, mse = SLR.run(max_iter = 2000, alpha = 1e-4)

    SLR.summary()
    print "\n"
    print "break_distance = {} + {} * speed".format(beta[0], beta[1])
    print dir(SLR)

if __name__ == "__main__":
    main()
```

