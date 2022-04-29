function [position] = getPosition(s)
%%  Gets the position from the state 
% Inputs:
%  ~ s : current state of the system
% Outputs:
%  ~ position : position of the ball in the pipe
% Created by: Jonathan Klenk , Nicholas Curcio and, Nicholas Mahon 4/28/2022
%% Get Position 
position = (round(s/3)); % gets the position from the current state the system is at 

if position > 92 %must bound the position so that the system cannot try and go further than the ball and pipe will allow
    position = 92;
end

end