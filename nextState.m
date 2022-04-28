%% Get state space representation of the transfer function 
function [sPrime,x] =  nextState(pwm,u,x)
%% Variables for the transfer function, all real world values 
syms s; %simulation variable for transfer function 
g = 9.8; %gravity 
Veq = 2.4384; %velocity required to hold the ball in air
mBall = 0.0027; %mass of the ball in kg
pair = 1.225; %air density in kg/m^3
vBall = 2.8731 * (10^-5);
%% C portion of transfer function 

c = ( (2*g)/Veq ) * ( (mBall - pair*vBall) / mBall ); 

%% Transfer function 

g2 = 6.3787 * (10^-4);

 G = tf([g2*c],[1 c 0]); % open loop transfer function 


%% Get the state space from the  transfer function
stateSpace = ss(G);

%% Get the final values of [X,Y,~] 
%from y we can get the next state
%from x we can get the next state space and gets put in

timeStep = 0.25;

tSim = [0 timeStep];

[Y,~,X] = lsim(stateSpace,u,tSim,x);

%% add calculations for y to state value
sPrime = stateFromPosition(Y(2),pwm); % next state is returned by using the current PWM and the position at the time step returned by the lsim funciton


x = X(2,:); % returns the next actions 







