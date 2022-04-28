%%Initalize Q Randomly
function [qTable] = initQ() 
pSize = 93; % Bin that holds all values possible for p
vSize = 3; % Bin that holds all possible velocities 

totalSize = pSize * vSize;

qTable = rand([totalSize,3]); % generates all values for the qTable
end 