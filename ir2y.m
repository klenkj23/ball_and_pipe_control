function [y, pipe_percentage] = ir2y(ir)
%% Converts IR reading from the top to the distance in meters from the bottom
% Inputs:
%  ~ ir: the IR reading from time of flight sensor
% Outputs:
%  ~ y: the distance in [m] from the bottom to the ball
%  ~ pipe_percentage: on a scale of 0 (bottom of pipe) to 1 (top of pipe)
%  where is the ball
%
% Created by:  Kyle Naddeo 2/2/2022
% Modified by: YOUR NAME and DATE

%% Parameters
% ir_bottom =   % IR reading when ball is at bottom of pipe
% ir_top    =   % "                        " top of pipe
y_top  = 0.896; % Ball at top of the pipe [m]
ir_top = (ir - 55) / 1000
ir_bottom = (y_top) - ir_top

%% Bound the IR reading and send error message 
% (remeber the IR values are inverted ie small values == large height and large values == small height)

%% Set
% pipe_percentage = 
% y = 
y = ir_bottom
pipe_percentage = (ir_bottom/y_top) * 100;
if pipe_percentage <0.8 
    pipe_percentage = 0;
end
