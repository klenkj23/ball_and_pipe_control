function[s]= stateFromPosition(y,pwm)
%%  Initalizes the random Q-table
% Inputs:
%  ~ y : current position of the ball 
%  ~ pwm : current pwm value 
% Outputs:
%  ~ s : current state based on the given position and pwm
% Created by: Jonathan Klenk , Nicholas Curcio and, Nicholas Mahon 4/28/2022
%% Gets the state from the position and pwm values

if y < 0 % y cannot be less than 0
    y = 0;
end

if y > 0.92 % y cannot be geater than the height of the pipe
    y = 0.92;
end


offset = 2727;

PWM = offset + pwm;

rise = 3200; % PWM value to get the ball to rise slowly 3200
fall = 2500; % PWM value to get the ball to fall slowly 2500
stay = 2670; % PWM value to get the ball to stay where it is at 2670

%actList = [fall,stay,rise] ;

s = round( ((y*100)+1)*3); % finds the state at the given position for the rise pwm


if PWM == stay % if the pwm is staying in place, go back a state
    s = s - 1;
end

if PWM == fall % if the pwm is falling, go back 2 states
    s = s - 2;
end


end 
