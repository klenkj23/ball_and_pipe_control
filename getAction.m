%% Get action function 
%takes in the state value and then returns the action needed to be taken
function [a,actIndex] = getAction(s,qTable)

%Initalizeing the diffrent action values
rise = 3200; % PWM value to get the ball to rise slowly 
fall = 2500; % PWM value to get the ball to fall slowly 
stay = 2670; % PWM value to get the ball to stay where it is at 

act = 0;
val = 0;

for i = 1:3
    if val < qTable(s,i) % checks if the value of the action is greater in another position 
        val = qTable(s,i); % saves the current highest action value 
        actIndex = i; % values the index of the action 
    end
end

actList = [rise,stay,fall] ;

a = actList(i);


end