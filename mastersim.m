function simstates = mastersim(t, states)
% Place-holder function for the overall simulation to be called by ODE$%
% generates a simulated input using wpi_hv(), computes tuftsCMUT states
% derivatives using tuftsCMUTstates(), and tuftsCMUT output using
% tuftsCMUToutput()
u = wpi_hv(t);

%% 
simstates = tuftsCMUTstates(states, u);
global Yout
YY = tuftsCMUToutput(states, u);
Yout = [Yout YY];

global TY
TY = [TY t];

fprintf('Running..\n')
end