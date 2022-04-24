%%Initalize Q Randomly
function [qTable] = initQ() 
pSize = 0:0.001:0.9144; % Bin that holds all values possible for p
vSize = 0:0.1:2.5; % Bin that holds all possible velocities 

maxSize = 915 * 26; % The maximum number of elements in the Q state

qTable = rand([maxSize,3]); % generates all values for the qTable
end 