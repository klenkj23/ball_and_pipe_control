function [qNext] = getNextQ(qTable,sPrime)
%%  Gets the maximum next Q Value
% Inputs:
%  ~ qTable : holds the current values of the qTable being used
%  ~ sPrime : next predicted state of the system
% Outputs:
%  ~ a : action that should be taken returned as a PWM value, offset
%  subracted from action value
%~ actIndex : coulumn location of action 
% Created by: Jonathan Klenk , Nicholas Curcio and, Nicholas Mahon 4/28/2022
%% get next q action that has the greatest reward  
[~,index] = getAction(sPrime,qTable); % this function will find the index of the greatest future action from the state s prime

position = getPosition(sPrime); % this function will return the position we will be in at the next state 

nextState = ((position+1) * 3) - (3-index); % gets the next state from the index and position 


for i = 1:3
   
    if i == 1 % automatically stores the q value from the first index
       qNext = qTable(nextState,i) ;
    end
    
    if qNext < qTable(nextState,i) % is another action is found to be of higher value, it returns that q value instead
        qNext = qTable(nextState,i) ;
    end
    
end

end