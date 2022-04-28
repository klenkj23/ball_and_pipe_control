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
   11. [ General Use ](#general)
   12. [ Function 1 ](#f1)
   13. [ Function 2 ](#f2)
   14. [ Function n ](#fn)

   
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

explain why we chose q-learning, first simulating then IRL tests

   
<a name="QLearning"></a>
# Q-Learning

<a name="Description"></a>
### Description

   describe the basic theory behind q-learning

<a name="how"></a>
### How will it work?
   
   explain how q learning will work in a practical sense
   
<a name="applying"></a>
### Applying Q-Learning to Ball and Pipe
   
   describe in detail how we will use q-learning for the ball and pipe

<a name="code"></a>
# How to use our code
   
<a name="general"></a>
### General Use
   
   give overview to how the code works as a whole
 
<a name="f1"></a>
### Function 1
   
   explain how function 1 works
  
<a name="f2"></a>
### Function 2
   
   explain how function 2 works
  
<a name="fn"></a>
### Function n
   
   explain how function n works
   
   
   
   
   
## Authors

Contributors names and contact info

ex. Dominique Pizzie  
ex. [@DomPizzie](https://twitter.com/dompizzie)
