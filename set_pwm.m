function action = set_pwm(device, pwm_value)
%% Sets the PWM of the fan
% Inputs:
%  ~ device: serialport object controlling the real world system
%  ~ pwm_value: A value from 0 to 4095 to set the pulse width modulation of
%  the actuator
% Outputs:
%  ~ action: the control action to change the PWM
%
% Created by:  Kyle Naddeo 2/4/2022
% Modified by: Jonathan Klenk 4/28/2022

%% Force PWM value to be valid
% pwm_value = % Bound value to limits 0 to 4095
if pwm_value < 0 || pwm_value > 4095 % bounds the PWM limits so they must be within bounds 
    pwm_value = 0;
end
%% Send Command
% action = % string value of pwm_value
% use the serialport() command options to change the PWM value to action

val = sprintf('P%04.f',pwm_value); % formats the value for the controller
write(device,val,"string"); % writes to the device to change PWM
end