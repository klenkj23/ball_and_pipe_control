%% Get Reward Function 

function [r] = getReward(currentPosition,finalPosition,currentPwm)

if currentPosition == finalPosition && currentPwm == 2670-2727.0447
 r = 10;
else 
   r = -1;
end

end