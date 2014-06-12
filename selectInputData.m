function [t,v] = selectInputData(text,tperiod,tstop,tsampling)


% [u,t] = gensig(type,tau,Tf,Ts) 
t = [];
v = [];
switch text
    case 1
        [v,t] = gensig('sin',tperiod,tstop,tsampling);
        fprintf('\n Sine Waveform Generated \n');
    case 2
        [v,t] = gensig('pulse',tperiod,tstop,tsampling);
        fprintf('\n Pulse Waveform Generated \n');
    case 3
        [v,t] = gensig('square',tperiod,tstop,tsampling);
        v = v - 0.5;
        fprintf('\n Square Waveform Generated \n');
end

end

