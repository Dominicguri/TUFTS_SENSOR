function state_der = tuftsCMUTstates(states, inputs)
% for 2-inputs 2-outputs system: The system is created from 4 transfer
% functions. if Y = [Y1; Y2], and U = [U1; U2] then the transfer function
% for the system transfer function 
% G(s) = [tf(Y1/U1) tf(Y1/U2); tf(Y2/U1) tf(Y2/U2)]

% Y1 = h'   Y2 = v'   U1 = h   U2 = v

%% Compute delay variables [A, B, D, C]
dOrder = 2;                     % Vajta Delay order 
h = inputs(1);                  % distance to be measured [m]
[A, B, C, D] = ssDelay(h, dOrder);

%% Variable Sizes <not used anywhere>
size(A);
size(states);
size(B);
size(inputs);
size(C);
size(D);
%% State Derivatives
state_der = A*states + B*inputs;
end

