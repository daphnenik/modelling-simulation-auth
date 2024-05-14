function [VcReal,VrReal] = getV(time,N,flag)

VrReal = zeros(1,N);
VcReal = zeros(1,N);
[VrReal,VcReal]=v(time);

% getting some wrong values to observe the model's behaviour
if (flag == 1)
% random values between 50 and 100
a = 10;
b = 50;

 for i=1:5
     VcReal(:,randi(N)) = (b-a)*rand() + a;
     VrReal(:,randi(N)) = (b-a)*rand() + a;
 end
end

end
