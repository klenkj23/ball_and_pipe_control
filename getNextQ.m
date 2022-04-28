%% get next q action that has the greatest reward  

function [qNext] = getNextQ(qTable,sPrime)

[~,index] = getAction(sPrime,qTable);

position = getPosition(sPrime);

nextState = ((position+1) * 3) - (3-index);


for i = 1:3
   
    if i == 1
       qNext = qTable(nextState,i) ;
    end
    
    if qNext < qTable(nextState,i) 
        qNext = qTable(nextState,i) ;
    end
    
end

end