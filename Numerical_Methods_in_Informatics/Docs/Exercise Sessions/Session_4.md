# Exercise Session 4

[Link to Exercise Session 4](https://github.com/dastal/Numerical_Methods_in_Informatics/tree/master/Exercise%20Sessions/Exercise%20Session%204/Exercise%201)

## Exercise 1
Fixed Point Iteration

### Exercise 1a
Write a function `FixedPoint.m` that computes the zero of a given function f by the fixed point
method.

| Input| |
| ------------- |-------------|
| func | Function handle of f(x) |
| a | The left bound of the considered interval |
| b | The right bound of the considered interval |
| n | The number of iterations to perform |

| Output| |
| ------------- |-------------|
| xs | The successive abscissas of the approximated zero |

### Exercise 1b
Use the previous function to compute the zero of the function `f(x) = exp(-x) - x` by the fixed point method, using the iteration function `g(x) = exp(-x)`.

### Exercise 1c
What can you say about convergence? According to the Lecture slides, page 20, check in particular that

- Existence of the fixed point: we can find an interval [a,b] in which g(x) is continuous and where g(x) (is element of) [a, b] (for all) x 2 [a,b] (e.g. a = 0, b = 1).
- Convergence of fixed point iterations: we can find L < 1 for which the Banach Fixed Point Theorem is fulfilled, or `|Phi'(alpha)| < 1`. The convergence is linear.

## Exercise 2
We consider here the errors made by the xed point method.

### Exercise 2a
Apply the previous function FixedPoint to find the zero of the function `x -> (x-2)^3` on the interval [0.5,3.5] for a number of iterations ranging from 10 to 104.

### Exercise 2b
Store the results of the iteration above in a vector, and compute the absolute error with
respect to the exact solution.

### Exercise 2c
Determine the order of convergence of the method:

- define `e(k) = |x(k)-x|`, with x as the exact solution,
- assume `e(k+1) ~= C(e(k))^p
- compute `p ~= (log(e(k+1))-log(e(k)))/(log(e(k))-log(e(k1)))`
- plot, with different p values

Do not look at only one values, wait for some iterations before computing p, etc...

### Exercise 2d
Compare your results with the interpretation of the output from the built-in function `polyfit.m`.

## Exercise 3
The price of a certain product has been recorded once per week for 5 weeks. With the abscissa
measured in days, the following data were acquired: (0, 100), (7, 98), (14, 80), (21, 92),(28, 75),
(35,70). The aim is to predict the price for next week (e.g., for days 42).

- Plot the data.
- Find a suitable polynomial interpolant to predict the required value (*Hint*: look at the data behavior).
- Comment.
