# Joel Villarreal's Project 6

## Interpolating tanh(x) Using the Natural Cubic Spline

### Task 1

Approximate tanh(x) on [−3, 3] by using 11 equally space nodes and constructing the interpolating polynomial P_(10)(x). Compare results with the interpolating cubic spline S(x) constructed with those same nodes.

### Findings

It can be demonstrated graphically that given 11 nodes/knots to interpolate, the interpolating polynomial P_(10)(x), is less accurate at interpolating the function tanh(x) then the cubic spline
S(x) created with those same nodes. A graph can be generated by running the first section of Tanh_Interpolation.m.

### Task 2

Approximating tanh(x) on a larger interval [−5, 5] using more knots/nodes.

### Findings

As the interval increases, and as the number of knots/nodes increases, the interpolating polynomial P_n(x), is extremely less accurate at interpolating the function tanh(x) then the cubic spline
S(x) created with those same nodes. This makes sense, as we are not garunteed increased accuracy with increased nodes when constructing a interpolating polynomial, but we are garunteed increased accuracy with increased knots when constructing a spline. This significant accuracy difference can be seen graphically. A graph can be generated by running the second section of Tanh_Interpolation.m.

## Code

### Tanh_Interpolation.m

