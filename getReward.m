function [r] = getReward(currentPosition,finalPosition,currentPwm)
%%  Gets the position from the state 
% Inputs:
%  ~ currentPosition : current position of the system
%  ~ finalPosition : desired final state of the system
%  ~ currentPwm : current pwm of the system
% Outputs:
%  ~ r : reward given to the system
% Created by: Jonathan Klenk , Nicholas Curcio and, Nicholas Mahon 4/28/2022
%% Get Reward Function 


goalPWM = 2670-2727.0447; % the goal PWM is the PWM at which the ball stays still minus the offset

if currentPosition == finalPosition && currentPwm == goalPWM % is the PWM is steady state and the position is the goal position the system gets rewarded 
 r = 10;
else % if the system is not in the right spot, it gets reward taken away
   r = -1;
end

end