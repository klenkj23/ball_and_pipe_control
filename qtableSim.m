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

s = 20; %s is the current state

x = [0 0]; % inital state, must be same length as actions 

pwm = 2670; % inital PWM value



%% episode section, update the qTable
epStart = 1;
epEnd = 260;

alpha = 0.5; % learning rate

gamma = 0.5; % discount factor

goalPWM = 2670; % the goal PWM is to stay still 

goalPosition = 50; % the goal position given as the position of the ball * 100

for ep = epStart:epEnd % each episode marks a diffrent starting position for the system
    ep % outputs the episode so that you can tell how far you are in the simulation
    s = ep;
    position = getPosition(s) % finds the position from the state
    
    for t = 1:sample_rate:1000
    % Update q value
    [action,index] = getAction(s,qTable);  % get action for the given state
    
    u = [action,action]; %saves u value from the actions gotten
    
    [sPrime,xNew] = nextState(action,u,x); %returns s' so that the next state has been found
    
    reward = getReward(position,goalPosition,action); %gets the reward value for the update equation 
    
    qUp = qTable(s,index) + alpha * reward + gamma * getNextQ(qTable,sPrime) - qTable(s,index); % need next q value not next action 
    qTable(s,index) = qUp;
    % get values for next update
    
    s = sPrime;
    
    x = xNew;
    position = getPosition(s); % finds the position from the state
    
    end
end















