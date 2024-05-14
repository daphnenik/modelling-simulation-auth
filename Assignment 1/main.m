%% Modelling and Simulation of Dynamic Systems
% Work 1, Exercise 1
% Dafni Nikolaidou  10546

time_range = 0:0.1:10;
y0 = [0 0];

[tsol,ysol] = ode45('system_eq', time_range, y0);

y = ysol(:,1);

[est_m,est_b,est_k,est_theta,ymodel] = least_squares(y);

figure;
subplot(1,3,1)
plot(tsol, y, 'LineWidth', 1);
title('Real output','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{real}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);

% figure;
subplot(1,3,2)
plot(tsol, ymodel, 'LineWidth', 1);
title('Model output','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{model}$','Interpreter', 'Latex', 'fontsize', 12);

% figure;
subplot(1,3,3)
Error_Y = y - ymodel;
plot(tsol, Error_Y, 'LineWidth', 1);
title('$e_{y}$','Interpreter', 'Latex', 'fontsize', 12);
xlabel('Time (sec)','Interpreter', 'Latex', 'fontsize', 12);
ylabel('$y_{real} - y_{model}$','Interpreter', 'Latex', 'fontsize', 12);
