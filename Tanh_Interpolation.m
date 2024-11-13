% Joel Villarreal
% The following script provides code for interpolating tanh(x) with equally
% spaced nodes/knots using a polynomial vs. with a cubic spline

%% Using 11 Equally Spaced Nodes/Knots on Interval [-3, 3]
clear
clc

% [-3, 3]
a = -3;
b = 3;

% 11 equally spaced interpolated nodes/knots
n = 11;
h = (b - a) / (n - 1);
nodes = a : h : b;

% Finer solution, to show indescrepencies
x = a: h/8 : b;
y_exact = tanh(x);

% Interpolating polynomial P_(11)(x)
y_interpolated = tanh(nodes);
coef_poly = Coef(n-1,nodes,y_interpolated);
y_poly_estimate = zeros(size(x));
for i = 1 : length(x)
    y_poly_estimate(i) = Eval(n,nodes,coef_poly,x(i));
end

% Cubic spline (Matlab spline() is the natural cubic spline)
% y_cubic_spline = spline(nodes, y_interpolated, x);

% My cubic spline code
[a_coef, b_coef, c_coef, d_coef] = cubicSpline(n - 1, nodes, y_interpolated);

my_cubic_spline = zeros(size(x));
for i = length(x) : -1 : 1
    for j = n - 1 : -1 : 1
        diff = x(i) - nodes(j);
        if diff >= 0
            break;
        end
    end
    my_cubic_spline(i) = a_coef(j) + b_coef(j) * (diff) + c_coef(j) * (diff)^2 + d_coef(j) * (diff)^3;
end

% plot 
plot (x, y_poly_estimate, "r-", ...
    x, my_cubic_spline, 'b-', ...
    nodes, y_interpolated, 'ko', ...
    x, y_exact, 'k--');
title("Interpolating tanh(x), Polynomial P_1_1(x) " + ...
    "vs. Cubic Spline S(x)");
legend("P_1_0(x)", "S(x)", "nodes/knots", "tanh(x)")

%% On the Interval [-5, 5], with many Nodes/Knots
clear
clc

% [-5, 5]
a = -5;
b = 5;

% Many equally spaced interpolated nodes/knots
n = 126;
h = (b - a) / (n - 1);
nodes = a : h : b;

% Finer solution, to show indescrepencies
x = a: h/8 : b;
y_exact = tanh(x);

% Interpolating polynomial P_(11)(x)
y_interpolated = tanh(nodes);
coef_poly = Coef(n-1,nodes,y_interpolated);
y_poly_estimate = zeros(size(x));
for i = 1 : length(x)
    y_poly_estimate(i) = Eval(n,nodes,coef_poly,x(i));
end

% Cubic spline (Matlab spline() is the natural cubic spline)
% y_cubic_spline = spline(nodes, y_interpolated, x);
% My cubic spline code
[a_coef, b_coef, c_coef, d_coef] = cubicSpline(n - 1, nodes, y_interpolated);

my_cubic_spline = zeros(size(x));
for i = length(x) : -1 : 1
    for j = n - 1 : -1 : 1
        diff = x(i) - nodes(j);
        if diff >= 0
            break;
        end
    end
    my_cubic_spline(i) = a_coef(j) + b_coef(j) * (diff) + c_coef(j) * (diff)^2 + d_coef(j) * (diff)^3;
end


% plot 
plot (x, y_poly_estimate, "r-", ...
    x, my_cubic_spline, 'b-', ...
    nodes, y_interpolated, 'ko', ...
    x, y_exact, 'k--');
xlim([a, b])
ylim([-1.5, 1.5])
title("Interpolating tanh(x), Polynomial P_1_1(x) " + ...
    "vs. Cubic Spline S(x)");
legend("P_1_2_5(x)", "S(x)", "nodes/knots", "tanh(x)")