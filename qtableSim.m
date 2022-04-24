%Start fresh
close all; clc; clear device;
%% Parameters
target      = 0.5;   % Desired height of the ball [m]
sample_rate = 0.25;  % Amount of time between controll actions [s]

%% Initialize variables
% action      = ; % Same value of last set_pwm   
error       = 0;
error_sum   = 0;
qTable = initQ();


%% Start from state 0 

s = 0; %s is the current state

[action,index] = getAction(s,qTable);  % get action  for state 0

t = [0,sample_rate]; % time thing 

u = [action,action]; % actions from state 0

x = [0 0]; % inital state, must be same length as actions 

[X,Y,stateSpace] = get_ss(0,t,u,x); % find state space for starting system 

%% episode section, update the qTable

finY = 0.5; % wanted final position 

while finY ~= Y % until the final position is equal to the given position 
    
    qTable(s,index) = qUpdate(qTable,s); % updates the current value in the q table
    
end

