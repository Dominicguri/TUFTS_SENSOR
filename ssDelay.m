function [A, B, C, D] = ssDelay(dist, dOrder)
% Computes state space delay using the Vajta Approximation <modified Pade
% Approximation> dist represents the distance to be measured and dOrder is
% the order of the Vadja Approximation <modified Pade Approximation>

%% Set Time Constant
c = 343;                        % speed of sound [m/s]
h = dist;                       % requested height measurement [m]
tconst = 2 * h/ c;              % time delay [dominated by time of travel]
    

%% Get Vajta Delay Approximation 
[dNUM, dDEN] = vajtadelay(tconst, dOrder);  % delay tf
d_SYS = tf(dNUM, dDEN);                 % v_out due to v_in & vice-versa
v_hSYS = 0;                             % v_out due to v_in & vice-versa
SYS_tf = [d_SYS, v_hSYS; v_hSYS d_SYS]; % MIMO transfer function
SYS_ss = ss(SYS_tf);                    % MIMO <tf2ss>

A = SYS_ss.a; B = SYS_ss.b; C = SYS_ss.c; D = SYS_ss.d;

end

