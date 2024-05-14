function dx = system_eq(t,x)

u = @(t)10*cos(0.5*pi*t) + 3;

% define state variables
x1 = x(1);
x2 = x(2);

% initial constants
m = 8.5;
b = 0.65;
k = 2;

% define derivatives of state variables
dx = zeros(size(x));

dx(1) = x2; 
dx(2) = -(b/m)*x2 - (k/m)*x1 + (1/m)*u(t);

end
