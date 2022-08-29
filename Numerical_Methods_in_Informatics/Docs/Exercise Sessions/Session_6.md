# Exercise Session 6

[Link to Exercise Session 6](https://github.com/dastal/Numerical_Methods_in_Informatics/tree/master/Exercise%20Sessions/Exercise%20Session%206)

## Exercise 1: Shaping a wandering path with quadratic splines

William is in charge of the installation of a wandering path from Graubnden to
Linthal. He only knows the location of yellow indication sticks along the way
and needs to design the walking path between them. As for safety a smooth
path is preferred, William wants to retrieve a continuous and differentiable path
from the location of the indication sticks.

The considered area surrounding Graubnden and Linthal is represented as a
rectangle [0,2] x [1.5,9] whithin which the location (x; y) of the sticks are
given as follows.

| x | y |
| ------ | ------ |
| 0.25 | 1.7057 |
| 0.75 | 2.7449 |
| 1.3 | 2.5580 |
| 1.7 | 3.0326 |
| 1.9 | 7.8285 |

There are 5 indication sticks along the way, splitting the hike into 4 intervals.
A solution to William's problem is to nd on each part of the way a second
order polynomial, knowing that the entire way should be smooth. Please help
William to reconstruct the path by nding the quadratic interpolating spline!

### Exercise 1.1: Using a hands-on approach

#### 1.1.1 

Derive the constraints that will allow William to reconstruct the path.
More precisely, out of the given sticks locations:

- derive the constraints so that the renewed path passes through the sticks (global continuity),
- derive the constraints required to get a smooth path (derivative continuity),
- assume that the second oder derivative at the start of the path is null (the path starts as a straight line) and derive from this a third constraint over the first subinterval

#### 1.1.2
Given the obtained constraints, retrieve the coeffcients of the quadratic
interpolating spline within each of the four subintervals. More precisely:

- compute hi the length of the interval i,
- compute ai, bi and ci the coeffcients of the quadratic spline within each subinterval (i.e. for i (element of {0, ... ,3}).

#### 1.1.3
Given the obtained coeffcients, the nodes abscissa and a set of x locations to evaluate the y location for, define a function f that returns the corresponding interpolated (x,y) points lying on the reconstructed path.
- Pay attention of which interpolating quadratic polynomial to use at a given point.
- Define your function such that it accepts vector shaped x whose value do not necessarily belong to the same subinterval.

#### 1.1.4
Plot the signalization sticks and the reconstructed path.
- Use a marker of your choice to materialize the signalization sticks.
- Use one different color per interpolation curve obtained on each subinterval.
- Do not forget title, legend and labels

### Exercise 1.2: Making use of the interpolating spline
Last year, a tourist got lost along the path. The rescue team guessed he missed
the path around the x-position x = 1.45.

#### 1.2.1
Use your interpolating spline to find the corresponding y value so that the point (x,y) lies on the reconstructed path

#### 1.2.2
Modify the above plotting instruction to plot the path in blue for all subintervals and the previous indication sticks in red. Add a yellow marker corresponding to where William should add a stick so that no one gets lost this season.
 
### Exercise 1.3: Generate the wandering path using a linear-system solver
Let us now improve the above script to accept any number of sticks and solve
the coupled constraints globally. Assume that the sticks location as given to
you as an (x,y) location list and assuming that the second oder derivative at
the start of the path is null. (We consider that the path starts at the minimum
value of x within the given data)

#### 1.3.1
Given the above constraints for all subintervals, derive the matrix and
vector associated to the corresponding linear system.

#### 1.3.2
Solve the system using any method pre-implemented in Matlab

#### 1.3.3
Rewrite your global interpolation spline function using this time the linear
solver to retrieve the spline's coeffcients.

#### 1.3.4 Test your interpolation function by adding interpolation points in location
of your choice. To see the impact of new points and/or far-away locations,
plot the signalization sticks and the reconstructed path as above.

#### 1.3.5
Load the binary file `Data.mat` containing an extensive range of sticks
locations. Try your interpolation routine on it.
