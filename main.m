% Dominic Guri
% 06/11/2014
% Overall Test Simulation 


close all; clear all; clc
tstart = 0.3;
tstop = 0.4;
tspan = [tstart tstop];
tsampling = 0.01;
delayOrder = 2;
delayTimeConst = .15;
ic = [0; 0; 0; 0];                      % Initial Conditions

%% Global Variables
% used to stote the height and velocity measured in mastersim()
global Yout 
global TY
Y = [];

%% Test: Overall simulation using tufts functions
[tsim, ysim] = ode45(@mastersim, tspan, ic);
plot(TY,Yout(1,:), TY, Yout(2,:))
legend('Height(m)','Velocity (m/s)')
xlabel('Time (s)')
