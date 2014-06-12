Author: Dominic Guri
Date: 06/12/2014

This project is the first matlab simulation version of the cMUT distance and velocity measurement sensor. 

http://www.tufts.edu/~rwhite07/PRESENTATIONS_REPORTS/Shin_SNA2014_InPrint.pdf

Testing Functions:
main() - this is a test function that is used to call ode45 for a test simulation. In this function, basic parameters like simulation time span and initial conditions can be set. 

mastersim() - this describes the system of equations to be solved. This is similar to a function that describes the system dynamics and environment where the sensor is going to be used.

wpi_hv() - this creates a distance-velocity combination at a given time t. The output is a 2x1 vector [height; velocity]

=======================================================================
CMUT FUNCTIONS: [keep these four functions in the same directory]

tuftsCMUTstates() - computes the state-derivatives for the cMUT simulation. For n-th order delay approximation, the output of this function is an nx1 matrix. 

tuftsCMUToutput() - outputs the simulated sensor measurements for the height and velocity - [h_measured; v_measured]

ssDelay() - converts the delay transfer functions into state space for a 2-2-MIMO system.

vajtadelay() - this is a "modified Pade Approximation" function with an order range of 1 to 5. The differences between the Pade Approximation and the Vajta Approximation are discussed in the following paper.

http://wwwhome.math.utwente.nl/~vajtam/publications/temp00-pade.pdf

Notes:
1. The tuftsCMUToutput simulates a +/-0.06m/s standard deviation on the velocity output and +/-0.01m on the distance measurement.

2. Current delay time constant (timeConst) depends on the distance measured - this is based on assumming that the processing time is significantly dominated by the time it takes for a pulse to be transmitted, reflected, and detected. 
		
		timeConst = 2*h/c
	h = distance to be measured
	c = speed of sound

3. The delay order of 2 was used.

4. Basic Simulation function-call-tree

main
	|
	|
	|ode45(mastersim())
		|
		|wpi_hv()
		|tuftsCMUTstates()
			|
			|ssDelay() [order n]
				|
				|vajtadelay()
			>> return state derivatives [nx1]
		|
		|tuftsCMUToutput()
			|
			|ssDelay() [order n]
				|
				|vajtadelay()
			>> return output [2x1] (i.e. height and velocity in that order)
			
NB: Because the time constant changes and the required independence of tuftsCMUToutput() and tuftsCMUTstates(), ssDelay() is called twice in every mastersim() call. 
* This can be avoided by creating cMUT class instead of an independent function set





















