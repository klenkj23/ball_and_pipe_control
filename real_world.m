% A MATLAB script to control Rowans Systems & Control Floating Ball 
% Apparatus designed by Mario Leone, Karl Dyer and Michelle Frolio. 
% The current control method is Q-Learning.
%
% Created by Kyle Naddeo, Mon Jan 3 11:19:49 EST 
% Modified by Jonathan Klenk 4/28/2022

%% Start fresh
close all; clc; clear device;

%% Connect to device
% device = open serial communication in the proper COM port
device = serialport("COM4",19200);

%% Parameters
target      = 0.5;   % Desired height of the ball [m]
sample_rate = 0.25;  % Amount of time between controll actions [s]

%% Give an initial burst to lift ball and keep in air
set_pwm(device,2670); % this is the stay in place value for the ball and pipe

%% Initialize variables
 action  = 2670; % Same value of last set_pwm   

qTable = QTable; % get values from the excel sheet 

y = 0;

%% Feedback loop
while true
    %% Read current height
    % [add_proper_args] = read_data(add_proper_args);
    %y = ir2y(add_proper_args); % Convert from IR reading to distance from bottom [m]
     [distance,manual_pwm,target,deadpan] = read_data(device);
     y = ir2y(distance) % outputs the current position of the ball 
    %% Control
    [action] = actionFromState(qTable,action,y); % get the action from the given state 
    action % this was left in so that the action can be seen as well as the current position 
    set_pwm(device,action); % set the PWM from the action function

    % Wait for next sample
    pause(sample_rate);
end
