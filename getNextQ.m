%% get next q action that has the greatest reward  

function [qNext] = getNextQ(qTable,sPrime)

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