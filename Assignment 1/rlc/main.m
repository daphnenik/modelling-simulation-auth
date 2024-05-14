%% Modeling and Simulation of Dynamic Systems
% Work 1, Exercise 2
% Dafni Nikolaidou  10546

clear;
clc;
format long;

step = 1e-2;
t_stop = 10;
time = 0:step:t_stop;
N = length(time);

% inputs
u1 = @(t)3*sin(pi*t);
u2 = 2.5*ones(1,N);

% Correct values for VC, VR
flag = 0;
[VcReal,VrReal] = getV(time,N,flag);

[theta,Vcmodel] = least_squares(VcReal,u1,u2,time);

Vrmodel = u1(time) + u2 - Vcmodel;

% Incorrent values for VC, VR
flag = 1;
fprintf('\nSystem with outliers\n');

[VcRealError,VrRealError] = getV(time,N,flag);

[thetaError,VcmodelError] = least_squares(VcRealError,u1,u2,time);

VrmodelError = u1(time) + u2 - VcmodelError;

% Plots (correct values)
subplot(1,3,1)
plot(time, VcReal, 'LineWidth', 1);
title('Real $V_{C}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{1}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,2)
plot(time, Vcmodel, 'LineWidth', 1);
title('Model $V_{C}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{1}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,3)
plot(time, (VcReal-Vcmodel), 'LineWidth', 1);
title('$e_{V_{C}}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$V_{C,real} - V_{C,model}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)');
print('vc', '-dpng', '-r500');

figure;
subplot(1,3,1)
plot(time, VrReal', 'LineWidth', 1);
title('$Real V_{R}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{2}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,2)
plot(time, Vrmodel', 'LineWidth', 1);
title('Model $V_{R}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{2}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,3)
plot(time, (VrReal-Vrmodel), 'LineWidth', 1);
title('$e_{V_{R}}$', 'Interpreter', 'Latex', 'fontsize', 12);
ylabel('$V_{R,real} - V_{R,model}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)', 'Interpreter', 'Latex', 'fontsize', 12);
print('vr', '-dpng', '-r300');

%% Plots (incorrect values)
figure;
subplot(1,3,1)

plot(time, VcRealError, 'LineWidth', 1);
title('Real $V_{C}$ for incorrect values','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{1}$', 'Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)');

subplot(1,3,2)
plot(time, VcmodelError, 'LineWidth', 1);
title('Model $V_{C}$ (incorrect values)','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{1}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,3)

plot(time, VcRealError-VcmodelError, 'LineWidth', 1);
title('$e_{V_{C}}$ (incorrect values)','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$V_{C,real} - V_{C,model}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);
print('vc_error', '-dpng', '-r300');
 
figure;
subplot(1,3,1)
plot(time, VrRealError, 'LineWidth', 1);
title('Real $V_{R}$ (incorrect values)','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{2}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,2)
plot(time, VrmodelError, 'LineWidth', 1);
title('Model $V_{R}$ (incorrect values)','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{2}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);

subplot(1,3,3)
plot(time, VrRealError-VrmodelError, 'LineWidth', 1);
title('$e_{V_{R}}$ (incorrect values)','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$V_{R,real} - V_{R,model}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);
print('vr_error', '-dpng', '-r300');

