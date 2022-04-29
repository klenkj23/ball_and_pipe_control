# Ball and Pipe Controller

This is the Ball and Pipe Project for group <names>

# Table of Contents
   1. [ Overview ](#Overview)
   2. [ What is this project? ](#proj)
   3. [ The Ball and Pipe ](#BnP)
   4. [ Why use reinforcement Learning? ](#RL)
   5. [ Our Approach ](#approach)
   6. [ Q-Learning ](#QLearning)
   7. [ Description ](#Description)
   8. [ How will it work? ](#how)
   9. [ Applying Q-Learning to Ball and Pipe ](#applying)
   10. [ How to use our code ](#code)
   11. [ Function Quick Start Guide ](#quickStart)
   12. [Set Up Guide](#f1)
   13. [Important Variables](#f2)

   
<a name="Overview"></a>
# Overview

<a name="proj"></a>
### What is this project?
   
The Ball and Pipe system is the final project of the Systems and Control I, spring 2022 course. This project consists of using the Systems & Control Floating Ball Apparatus (SCFBA) and an assigned controller to control the height of a ping pong ball in the tube. Reinforcement learning will be used to train the controller to keep the ball at the desired height.  

<a name="BnP"></a>
### The Ball and Pipe

The SCFBA consists of a clear tube that contains a ping pong ball. At the botton of the tube is a DC fan that pushes air into the tube which in turn raises the ball in the tube. At the top of the tube, an optical sensor can determine the position of the ball in the tube and also helps to contain the ball in the pipe. An attached microcontroller is used to read from the sensor and control the DC fan. The microcontroller sends a PWM signal to the fan to adjust the RPM which directly controls the height of the ball. The PWM signal can be manually controlled on the SCFBA or by connecting a computer. The connected computer can directly set the PWM or use a program to set the PWM. 

<a name="RL"></a>
### Why use reinforcement learning?

In a general sense, reinforement learning is traning a program or system (the agent) to make decisions based on a reward. By rewarding the desired actions, the agent can determine the best actions to complete a certain task. Reinforcement learning is very useful in systems that are very difficult to model. In terms of the ball and pipe system, a reward can be assigned to properties such as the height or velocity of the ball. The agent can then try different actions, such as changing the PWM value, to achieve the highest reward possible. As the agent keeps trying different actions, it can remember or store previous actions to keep improving. Reinforcement learning can be implemented through many different algorithms. 

<a name="approach"></a>
### Our Approach

For our attempt at the ball and pipe, we chose a type of reinforcement learning called Q-learning. This is a model free algorithm that takes information about the current state of the system and determines the best action to get to the next best state. This involes populating a Q-table with Q-values which gives information about the current and next state, actions, and rewards. Q-tables can get fairly large based on the complexity of the system so we will first use a simulation to populate the Q-table with approximate values. Once we have a preliminary Q-table, we will use the SCFBA to refine the table with "real-world" testing. 

   
<a name="QLearning"></a>
# Q-Learning

<a name="Description"></a>
### Description
At the heart of Q-Learning is the Q-table. This table is made of up every single state the system could possible be in and each action the system can take from that given state. At each of these points in the table a reward value of Q value is listed that is attached to the given action that can be taken from the given state. The computer will always choose the highest reward or Q value and take the associated action. Once a Q-table is complete, the computer will be able to look up what action it should take from any given possible state to get to the desired endpoint. Essentially, the computer is given a massive look up table that tells it what to do at any given point in order tto get where it needs to.


<a name="how"></a>
### How will it work?
The idea of Q-learning is fantastic. The computer is given a table that tells it what to do at any given moment to get to the desired outcome and it just follows the table to get there. The real challenge of Q-learning is building a Q-table to pull values from. To do this there are two requirements. One is the agent, this agent’s goal is to take the current state and reward values and determine where to go next in the system. This is important because it is what allows the computer to make decisions based on the Q-table values. The next important step is using Bellman’s Equation to continually update the Q-table values based on a variety of factors. This will make more sense in context. To start a Q-table all the rewards assigned to each possible action that can be taken from each possible state are random. This means the agent will just be randomly deciding where to go for a little while. However, as the system jumps from state to state based on semi-random actions, each Q-value will be updated. Once the agent selects an action based on the Q-value, the Bellman's Equation will be used to determine how good that Q-value really is.  If the original Q-value is very high but it is not actually a good action, the Bellman’s Equation will lower the Q-value at that point. The equation will also raise the Q-value if the action is better than originally listed. The longer the machine is allowed to learn the more accurate each Q-value resulting in a table that could tell the computer what to do at any given state. However, there is no perfect Q-table and real-world learning can take a long time in order to get a useable system. Advancements in computing greatly improve this process by letting engineers simulate the learning process instead of having to update the Q-values using the real-world system which is what was done for this project in order to complete a Q-table within the allotted time frame. 
   
<a name="applying"></a>
### Applying Q-Learning to Ball and Pipe
The first step to apply this to the ball and pipe system is communicating with the fan controller and the time of fight sensor. This is done through a serial communication set up between MATLAB and the controller built into the ball and pipe system. By sending commands laid out by the data sheet, we can give actions that set the fan speed through PWM values and ask for data related to the system. Ideally, from this point the entire Q-table training would be done using the physical ball and pipe system. However, due to time constraints it makes more sense for our group to preform the training in a simulation and then have the agent read the completed Q-table for the real-world implementation. To simulate the ball and pipe system we will first develop a transfer function relating the PWM input to the position the ball will be in after the PWM input is applied. This transfer function is shown in the code in the nextState.m file from lines 10 to 19. This transfer function will then be transformed into a state space model so that the lsim function in MATLAB can be applied. This function will accept the current action and state as well as the state space model and the time step that needs to be simulated. Given these inputs the function will return the state at each point of the time step and the position of the ball at each point of the time step. The values at the end of the time step give the future state to feedback into the lsim function and the predicted position of the ball given the PWM input. This process can be looped indefinitely and allows us to simulate the moment of the ball without the ball and pipe system. The same logic state previously about the functionality of Q learning is applied. This also allows us to develop an estimated Q-table at a much quicker rate because we are now only limited by the speed of the computer process and not the speed of the ball moving around the pipe. After the final Q-table is developed, our computer just needs to look up the correct action for any given state to get the ball to the desired location. One last note, this simulation can only find a Q table for one given final state. Our group choose to have it try and force the ball to hover in the middle of the pipe.

<a name="code"></a>
# How to use our code
   
<a name="quickStart"></a>
### Function Quick Start Guide
   real_world.m
	This function holds the loop that controls the real-world ball and pipe system and is what calls all the other functions while the system is running. This is the main function for real world use of the ball and pipe system. The Q-table being used must also be initialized in this function. 

read_data.m
	This function will return all of the data output from the controller during operation. The main information our code is concerned with is the current height of the ball. This function allows us to get the height of the ball from the time of flight sensor. This function is sent the device variable which holds the baud rate and COM port used and returns the distance and other values form the controller.

set_pwm.m
	This function when called will set the pwm of the fan to the pwm input of the function call. This is the main action function that lets us control the flight of the ball in the ball and pipe system. This function is sent the device variable and the pwm value and then sets the PWM for the controller.

ir2y.m 
	This function is used to convert the IR reading from the time of flight sensor into the actual distance in meters that the ball is above the bottom of the pipe. This function is sent the IR reading and returns the distance of the ball from the bottom of the pipe in meters and also the percentage of the pipe that is below the ball. 
	
actionFromState.m
	Based on the given position of the ball and the current PWM value of the fan, this function will return what the next action is from the supplied Q-table. This function is the real-world agent of the system. 

qtableSim.m 
	This function is in essence the simulation equivalent of the real_world.m function. This function is what creates the Q table from the initial random values. Changing one line allows the user to also simulate with an already existing Q table to get an even better Q table so long as it is an iteration from this code. 

getAction.m
	This function is sent the current state and Q table and returns the action that should be take as well as the column the action is from. This function is used to get the action for the simulation and the real-world systems.

stateFromPosition.m
	This function is sent the current position and pwm value and returns that corresponding state. This function is used to get the state for the simulation and the real-world systems.

getNextQ.m
	This function is given the Q-table and the next state and returns the highest Q value from that next state. This function is important for the calculation of the Bellman’s Equation.

getPosition.m
	This function is sent the current state and returns the position of the ball associated with that state. 

getReward.m 
	This function is sent the current position, the goal position and the current PWM value and returns the reward associated with those values. If the system is in the right spot it will reward it but if it is in the wrong state it will get a small penalty. 

initQ.m
	This function is not sent any variables when called and it returns an randomly initalized Q-table. This function is only necessary for the first time the code is used. After completing one simulation the resulting Q-table should be used. 

nextState.m
	This function is sent the pwm, a 2x1 matrix of actions and a 2x1 martix of the state space and returns the next state and the next state space x value. This function is vital to the simulation because it allows us to predict the outcome of a certain PWM input value. Without the ability to get the next state this entire program would not function. 

 
<a name="f1"></a>
### Set Up Guide
   To begin install all of the files in the repository. From here there are two main paths.

 If you are interested in running the code to generate an entire Q-table from scratch using the simulation designed please open the following files: qtableSim.m , initQ.m , nextState.m , stateFromPosition.m , getAction.m , getNextQ.m , getPosition.m and , getReward.m. Then run the qtableSim.m function. In total, this took the computer originally used around an hour to completely finish. This may vary depending on the capabilities of the computer hardware being used. After the program is finished running, you will be left with a variable called ‘qTable’ which has the entire simulated results of the Q-table. Clicking on this variable will open matrix that can be copied and pasted into google sheets or excel.

If you are interested in using the supplied Q-table to control the real-world ball and pipe system please open the following files: real_world.m , read_data.m , set_pwm.m , ir2y.m , actionFromState.m , stateFromPosition.m and , getAction.m. In addition to these MATLAB files you will need to import the Q-table excel file that is also supplied in the repository. This file is named QTable.xlsx. The named excel file will hold the Q-table that is acquired from the initial simulation. More excel sheets may be added in the future that have different iterations of Q-tables and they should all function by following the same process. To import the excel file into MATLAB go to the HOME tab and select the import data button. This will open the file explorer, find and select the excel file in the file explorer. The excel sheet consists of 4 colums, the first column holds the state and the next three columns hold the Q-values associated with taking an action in that column from the given state. Highlight every value in columns 2-4, this is selecting every Q-value. Up in the top banner use the dropdown menu under output type to select the output type numeric matrix. Finally, select the Import Selection Button. This will import the table as a 279x3 matrix name QTable. Once this is done and the COM port is specified correctly, run the real_world.m function to start the ball and pipe system. To see how to specify the COM port see the important variables section in teh READ.ME.

  
<a name="f2"></a>
### Important Variables
r : located in getReward.m, this variable controls the reward given for getting to the final state and the small penalty for not getting to the right. This can be changed to effect how the system is rewarded based on its’ actions.

rise, fall, stay : located in getAction.m and stateFromPosition.m. These variables hold the PWM values for the three different actions the system can take from any given Y position. These can be changed to suit the needs of the user. Currently the values cause the ball to stay put and rise or fall slowly. 

device : located in real_world.m, this variable holds the COM port that the ball and pipe controller is hooked up to as well as the baud rate for the controller. 

sample_rate : located in real_world.m, this variable holds the value at which the system samples the position of the ball. This can be changed so that the system makes decision faster or slower. 

action : located in real_world.m, this variable holds the value for the initial action of the system. It is currently set to have the system set itself to the PWM making the ball stay still.  

qTable :  located in real_world.m, this variable holds the completed Q-table for the agent to look at. This is also where the system saves the values imported from the excel sheet. If you would like to use a different excel sheet, the assignment should happen here. 

sample_rate : located in qtableSim.m, this variable holds the time step interval that the lsim function simulates to. 

alpha : located in qtableSim.m, this variable holds the learning rate of the system. This controls how quickly the system is ready to accept new Q-values in the Q-table. Closer to 1 is faster and closer to 0 is slower. 

gamma : located in qtableSim.m, this variable holds the discount fact which controls how heavily the system weights the future Q-values. Closer to 1 means they are considered more heavily and closer to 0 means they are not considered as much. 

goalPWM : located in qtableSim.m, this variable holds the goal PWM value and is also equal to the PWM found to cause the ball to stay still. 

goalPosition : located in qtableSim.m, this variable holds the goal position for the system to try and get to and stablize at. If this variable is changes a new Q-table must be made for that goal position. This is because the entire previous Q-table is only designed to get to the goal position stated during its’ creation. 

  
   
   
   
   
   
## Authors
Jonathan Klenk : klenkj23@students.rowan.edu 
Nicholas Curcio : curcio64@students.rowan.edu
Nicholas Mahon : mahonn76@students.rowan.edu

