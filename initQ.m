function [qTable] = initQ() 
%%  Initalizes the random Q-table
% Outputs:
%  ~ qTable : randomized Q-table
% Created by: Jonathan Klenk , Nicholas Curcio and, Nicholas Mahon 4/28/2022
%% Initalize Q Randomly, this function will be replaced with an existing
%qTable once it is finished
pSize = 93; % Bin that holds all values possible for p
vSize = 3; % Bin that holds all possible velocities 

totalSize = pSize * vSize;

qTable = rand([totalSize,3]); % generates all values for the qTable
end 