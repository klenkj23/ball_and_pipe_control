%% actionFromState: this function will determine the state based on the current distance and pwm and return the next action 

function [a] = actionFromState(qTable,pwm,y)

offset = 2727;

s = stateFromPosition(y,pwm); % get the current state from the given values

a = getAction(s,qTable) ; % get the action from the current state

a = a + offset;
end
