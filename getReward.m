%% Get Reward Function 

function [r] = getReward(currentPosition,finalPosition,currentPwm)

goalPWM = 2670-2727.0447; % the goal PWM is the PWM at which the ball stays still minus the offset

if currentPosition == finalPosition && currentPwm == goalPWM % is the PWM is steady state and the position is the goal position the system gets rewarded 
 r = 10;
else % if the system is not in the right spot, it gets reward taken away
   r = -1;
end

end