% Joel Villarreal
% The following file provides the coefficients of the cubic spline which
% interpolates given knots (based off of psuedo-code from Burden textbook)

% Input: 
%   n - the number of splines (one less than the number of knots
%   x - a vector of size (n + 1), the knots
%   y - a vector of size (n + 1), the function's interpolated value at the
%   knots
%   x_approx -  a vector with the numbers which we will then estimate the 
%   corresponding y-values of by a cubic spline

% Output: 
%   a - vector of size n
%   b - vector of size n
%   c - vector of size n
%   d - vector of size n
%   a, b, c, and d are such that: 
%      S(x) = S_j(x) = a_j + b_j(x — x_j) + c_j(x — x_j)^2 + d_j(x — x_j)^3
%      for x_j < x < x_j + 1
%   i.e. a, b, c, and d are the coefficients of the cubic spline which
%   interpolates the given knots x

function [a, b, c, d] = cubicSpline(n, x, y)

a = y;
b = zeros(1, n);
c = zeros(1, n + 1);
d = zeros(1, n);

% error handling
if ((length(x) ~= (n + 1)) || (length(y) ~= (n + 1))) 
    disp("MISINPUT ERROR in cubicSplnCoef"); 
end

% spacing 
h = zeros(1, n);
for i = 1 : 1 : n
    h(i) = x(i + 1) - x(i);
end

% special constant
alpha = zeros(1, n - 1); 
for i = 1 : 1 :  n - 1
    if (i > 1) 
        alpha(i) = (3 / h(i + 1)) * (a(i + 2) - a(i + 1)) - (3 / h(i)) * (a(i + 1) - a(i));
    end
end

% More special constants
l = zeros(1, n + 1);
mu = zeros(1, n + 1);
z = zeros(1, n + 1);

l(1) = 1;
mu(1) = 0;
z(1) = 0;

for i = 2 : 1 : n
    l(i) = 2 * (x(i + 1) - x(i-1)) - h(i - 1) * mu(i - 1);
    mu(i) = h(i) * l(i);
    z(i) = (alpha(i - 1) - h(i - 1) * z(i - 1)) / l(i);
end

l(n + 1) = 1;
z(n + 1) = 0;
c(n + 1)  = 0;

% Coefficients of the interpolating cubic spline
for j = n : -1 : 1
    c(j) = z(j) - mu(j)*c(j + 1);
    b(j) = (a(j + 1) - a(j)) / h(j) - h(j) * (c(j + 1) + 2 * c(j))/ 3;
    d(j) = (c(j + 1) - c(j)) / (3 * h(j));
end

end


