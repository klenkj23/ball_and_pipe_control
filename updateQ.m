function [newQ] = updateQ(qTable,s)

alpha = 0.9; % learning rate 0<a<1, closer to one learns faster 

[~,index] = getAction(s); %gets the index for what section of q table must be updated

learnedQ = R ; %the learned q value that was found

newQ = (1-alpha)*qTable(s,index) + alpha*learnedQ;  %gets the updated q value to be put in the table

end 

