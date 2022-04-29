function [a,actIndex] = getAction(s,qTable)
%%  Given a state and the qTable the function will return the action that 
%%should be taken as well as the column that action is in

% Inputs:
%  ~ s : current state of the system
%  ~ qTable : holds the current values of the qTable being used
% Outputs:
%  ~ a : action that should be taken returned as a PWM value, offset
%  subracted from action value
%~ actIndex : coulumn location of action 
% Created by: Jonathan Klenk 4/28/2022

%% Get action function 

%Initalizeing the diffrent action values
rise = 3000; % PWM value to get the ball to rise slowly 3200
fall = 2400; % PWM value to get the ball to fall slowly 2500
stay = 2700; % PWM value to get the ball to stay where it is at 2670

offset = 2727; % stores offset value

% variable initalization 
act = 0;
val = 0;

for i = 1:3
    
    if i == 1 % automatically sets the value to the first index
        val = qTable(s,i);
        act = i; % values the index of the action 
    end
    if val <  qTable(s,i) % checks to see if the  value is greater at any other in the index of the table
        val = qTable(s,i);
        act = i; % values the index of the action 
    end
end

actList = [fall,stay,rise] ; % list of actions that line up with the q table indexs

a = actList(act) - offset; % gets the action from the list, must be offset for the transfer function 

actIndex = act; % also returns the index of the function


end