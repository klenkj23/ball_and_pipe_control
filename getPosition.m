%% Get Position 

function [position] = getPosition(s)

position = (round(s/3)); % gets the position from the current state the system is at 

if position > 92 %must bound the position so that the system cannot try and go further than the ball and pipe will allow
    position = 92;
end

end