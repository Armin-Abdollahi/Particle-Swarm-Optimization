# Particle-Swarm-Optimization

![Screenshot (5)](https://user-images.githubusercontent.com/103449830/231280146-2d3fcddb-2f5c-47fc-82dc-c9c046d48a03.png)

Well, first of all, let me give an explanation about the code files that exist.

We have a series of functions that we know what the optimal result will be (such as the Rosen Brock function and the Sphere function).

We use the PSO algorithm for these functions to check whether our algorithm works correctly or not.

Sphere function and Rosen Brock function take their minimum value at a specific and different point. We reach this minimum value by the PSO algorithm.
For Sphere, the minimum value is 0 and for Rosen Brock, is 1.

These 2 functions are used to test meta-heuristic algorithms, and both functions are also used in continuous optimization problems.
 
---

The first task in our PSO code section is to define the problem. That is, we set the objective function, we set the number of decision variables and the range in which the decision variable moves.

The second part of our code is to set the parameters of the PSO algorithm. Such as nPop / Max_iteration / r1 / r2 / c1 / c2 and w.

The next part or the third part of our code is initialization. we determine the position of each particle in space randomly.

The fourth part of the main loop of the particle swarm algorithm. That is, it determines and calculates the values of the new position at each step.

And at the end, there is the Result section, which plots the output result for us.

Another point is that you should never confuse population size (nPop) with the number of decision  variables (nVar).
The population size (nPop) shows the number of PSO algorithm particles that spread in our search space and in the Lower Bound and Upper Bound range and find the optimal solution for the decision variables.

Now what are the decision variables!?

- Decision variables are variables foe which we want to find the optimal solution. For example, what values does the Sphere function optimize for? In the Sphere function, the value of 0 is optimized, but we want to reach the value of 0 with the help of the PSO algorithm.




--THE END--


