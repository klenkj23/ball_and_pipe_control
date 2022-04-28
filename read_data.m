function [distance,manual_pwm,target,deadpan] = read_data(device)
%% Reads data sent back from Ball and Pipe system
% Inputs:
%  ~ device: serialport object controlling the real world system
% Outputs:
%  ~ distance: the IR reading from the time of flight sensor
%  ~ pwm: the PWM from the manual knob of the system (NOT THE SAME AS THE
%  PWM YOU MAY SET THROUGH SERIAL COMMUNICATION)
%  ~ target: the desired height of the ball set by the manual knob of the
%  system
%  ~ deadpan: the time delay after an action set by the manual knob of the
%  system
%
% Created by:  Kyle Naddeo 1/3/2022
% Modified by: Jonathan Klenk 4/28/2022

%% Ask nicely for data
% use the serialport() command options to write the correct letter to the
% system (Hint: the letters are in the spec sheet)

%requests a single string from the PID
write(device,'S',"Char");
%% Read data
% use the serialport() command options to read the response

%Count is the number of characters we would liek to read
count = 20;

%DATA saves the single string returned from the PID with all of the current
%data avalible 
DATA = read(device,count,"string");
%% Translate
% translate the response to 4 doubles using str2double() and
% extractBetween() (Hint: the response is in the spec sheet)
% distance   = 
% manual_pwm = 
% target     = 
% deadpan    = 

%saves all of the values to strings 
distanceSTR = extractBetween(DATA,2,5);
manual_pwmSTR = extractBetween(DATA,7,10);
targetSTR = extractBetween(DATA,12,15);
deadpanSTR = extractBetween(DATA,17,20);

%turns all of the strings into doubles givving us the values we want
distance = str2double(distanceSTR);
manual_pwm = str2double(manual_pwmSTR);
target = str2double(targetSTR);
deadpan = str2double(deadpanSTR);

end