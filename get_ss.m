%% Get state space representation of the transfer function 
function [X,Y,stateSpace] =  get_ss(pwm,u,t,x)
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

G = tf([g2*c],[1 c 0]);


%% Get the state space from the  transfer function
stateSpace = ss(G);

%% Get the final values of [X,Y,~] 

[X,Y,~] = lsim(stateSpace,t,u,x);
