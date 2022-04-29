
function [a] = actionFromState(qTable,pwm,y)
%%  This function will determine the state based on the current distance and pwm and return the next action
% Inputs:
%  ~ qTable : holds the current values of the qTable being used
%  ~ pwm : current pwm value
%  ~ y : current ball position 
% Outputs:
%  ~ a : action that should be taken returned as a PWM value
%
% Created by: Jonathan Klenk 4/28/2022

%% function code
offset = 2727; % offset for PWM value 

s = stateFromPosition(y,pwm); % get the current state from the given values

a = getAction(s,qTable) ; % get the action from the current state

a = a + offset; % adds offset back to action so that the action returned is the actual PWM value
end
