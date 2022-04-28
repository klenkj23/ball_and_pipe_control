%% Get action function 
%takes in the state value and then returns the action needed to be taken
function [a,actIndex] = getAction(s,qTable)


%Initalizeing the diffrent action values
rise = 3000; % PWM value to get the ball to rise slowly 3200
fall = 2400; % PWM value to get the ball to fall slowly 2500
stay = 2700; % PWM value to get the ball to stay where it is at 2670

offset = 2727;

act = 0;
val = 0;

for i = 1:3
    
    if i == 1 
        val = qTable(s,i);
        act = i; % values the index of the action 
    end
    if val <  qTable(s,i)
        val = qTable(s,i);
        act = i; % values the index of the action 
    end
end

actList = [fall,stay,rise] ;

a = actList(act) - offset;

actIndex = act;


end