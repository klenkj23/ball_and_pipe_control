%% Get Reward Function 

function [r] = getReward(currentPosition,finalPosition,currentPwm)

goalPWM = 2670-2727.0447;

if currentPosition == finalPosition && currentPwm == goalPWM
 r = 10;
else 
   r = -1;
end

end