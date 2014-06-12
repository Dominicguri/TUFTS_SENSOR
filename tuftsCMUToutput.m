function Y = tuftsCMUToutput(states, input)
% Computes the measured distance and velocity from the state space vectors
% C_(4x2), D_(2x2), states_(4x1) and input_(2x1)
% input = [height, velocity]

%% Compute delay variables [A, B, D, C]
dOrder = 2;                     % Vajta Delay order 
h = input(1);                  % distance to be measured [m]
[A, B, C, D] = ssDelay(h, dOrder);

size(A); size(B);               % <not used anywhere>

%% Compute the measured distance and velocity
Y = C * states + D * input;

% %% Check for Range
% h_max = 1.5;                    % maximum distance [m] 
% % if distance is greater than h_max, Y = [0; 0]
% if Y(1) > h_max
%     Y = zeros(2,1);
% end
% 
% 
% %% Add sensor error
% v_std = 0.06;                   % velocity standard deviation [m/s] 
% h_std = 0.001;                  % distance standard deviation [m]
% 
% % Add height error
% Y(1) = Y(1) + h_std * randn(1);
% % Add velocity error
% Y(2) = Y(2) + v_std * randn(1);

end

