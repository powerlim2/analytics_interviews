# Modeling Interview Question

## Regression Analysis


### Question

How do you detect *outliers* when you perform a regression analysis?


### Answer

An outlier is a value that differs significantly from the rest of data points or significantly deviates from the general trend.

A naive approach to detect outlier is to draw **box-and-whisker plot** or calculate IQR (interquantile range).
Generally speaking, the rule of thumb is that if a point is larger than 3rd quantile + 1.5 * IQR or smaller than 1st quantile - 1.5 * IQR
, it is considered as an outlier. This approach simple but effectively detect points that differ significantly from the rest of data points.

In order to detect outliers that deviate from its general trend, we need to calculate the **studentized residuals** (y-axis)
and **leverage statistics** (x-axis). Generally speaking, observations whose |studentized redisuals| > 3 are possible outliers (y-axis).
In regression analysis, outliers are observations for which the response (y_i) is unusual given the predictor (x_i). Observations
that a predictor value is unusual given the response value is called *a high leverage point* (x-axis). Leverage statistic is
the same as the diagonal entries of the hat matrix. The leverage statistic is always between `1 / n` and `1` and the average leverage
for all the observations is always equal to `(p + 1) / n`. An observation with is leverage statistic that greatly exceeds
the average leverage value is possible high leverage point.

Briefly speaking, an *influential point* is an outlier that greatly affects the slope of the regression line. Not every outliers are
influential points. We can find the influential points with **Cook's Distance**. The rule of thumb is that a point with its
corresponding Cook's Distance > 1 is considered as an influential point.