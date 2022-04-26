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

s = 1; %s is the current state

x = [0 0]; % inital state, must be same length as actions 

pwm = 0; % inital PWM value



%% episode section, update the qTable
epStart = 1;
epEnd = 92;

alpha = 0.5; % learning rate

gamma = 0.5; % discount factor

for ep = epStart:epEnd
    
    position = ep; % get the position from the episode value
    goal = 5; %get a random goal value
    
    for t = 1:sample_rate:1000
    % Update q value
    [action,index] = getAction(s,qTable);  % get action for the given state
    
    u = [action action]; %saves u value from the actions gotten
    
    [sPrime,xNew] = nextState(pwm,u,t,x); %returns s' so that the next state has been found
    
    reward = getReward(position,goal,action); %gets the reward value for the update equation 
    
    qTable(s,index) = qTable(s,index) + alpha * reward + gamma * getAction(sPrime,qTable) - qTable(s,index);
    
    % get values for next update
    
    s = sPrime; 
    
    x = xNew;
    
    position = getPosition(s); % finds the position from the state
    
    
    end
end















