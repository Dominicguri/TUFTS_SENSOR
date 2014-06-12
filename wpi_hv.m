function u = wpi_hv(t)
%% sinusoidal varying v
T = 5;             % Period = 0.5
A = .4;           % Amplitude = 0.5
h = 1 + A * sin(2*pi*(1/T)*t);      
v = 2*pi*(1/T)* A* cos(2*pi*(1/T)*t);
u = [h; v];
end

