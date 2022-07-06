clear all; clc;

%% Parameters
Pre_infec = 5.2; %Duration that people spent in E group to go to I group
f = 1/Pre_infec; %

Duration = 7;  % Duration spent in I group and go to recovery
r=1/Duration;  %

R_0 = 2.2; % A single infected person will infect about 2.2 others in a totally susceptible population

N = 1391.93e6; % Population of  INDIA (2020)
beta = R_0/(N*Duration); %beta is the contact rate


%% Differential equations
tspan = 0:1:365; % We will observe what happens over the next year
%create initial value matrix: succeptible exposed infected recovered  dead 
y0 = [N-28, 0, 360, 3, 7]; % Coronavirus count of INDIA (Mar 22, 2020)

[t,y]=ode45(@(t,y) ode_fun_simple(t,y,beta), tspan, y0);


%% plot
plot(t,y,'LineWidth', 1.5, 'MarkerSize', 18)
legend('Susceptible','Pre-Infectious','Infectious','Recovered','Death', 'Location', 'Best')
xlabel('Days after March 12, 2020')
ylabel('Population')
title('Predicted Spread of COVID-19 in INDIA')
grid on;
grid minor;
set(gca, 'FontSize', 26)


