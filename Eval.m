% Joel Villarreal
% The following code was given in class
% function evaluation - via interpolation
function [value] = Eval(n,x,a,t)
temp=a(end);
for i=n-1:-1:0
    temp=(temp)*(t-x(i+1))+a(i+1);
end
value=temp;
end
