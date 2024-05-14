function [m,b,k,theta,ymodel] = least_squares(y)

u = @(t)10*cos(0.5*pi*t) + 3;

time = 0:0.1:10;

syms s
l=20;
lambda = sym2poly((s+l)^2);

Z1 = tf([-1 0],lambda);
Z2 = tf([0 -1],lambda);
Z3 = tf([0 1],lambda);

phi1 = lsim(Z1,y,time);
phi2 = lsim(Z2,y,time);
phi3 = lsim(Z3,u(time),time);

Phi = [phi1 phi2 phi3];

theta = y'*Phi/(Phi'*Phi);

m = 1/theta(3);
b = (2*l + theta(1))*m;
k = (l*l + theta(2))*m;

ymodel = Phi*theta';

end
