# Data_Visualization_Concepts
Basic Data Visualization Course

Introduction to the fundamental principles and techniques for the visualization of scalar, abstract, spatial, multidimensional as well as graph and hierarchical data.


## Exercise 1
- Plot 1: Create a vertically stacked bar chart and present the total number of dogs in Zürich in each year for
each gender. Create also a hover tooltip for indicating the corresponding year, the number of male dogs and
the number of female dogs.
- Plot 2: Combine a circle plot and a line plot in one figure to present the number of dogs per birth year for
the newest data set. Also add a hover tooltip, indicating the corresponding birth year, and the number of
dogs in that year.
- Plot 3: Create a pie chart to present the number of dogs with their name starting with a certain character.
E.g. dog’s name starting with A, B and C should be aggregated in one sector, D, E, F be in another sector,
etc.
- In the final dashboard, all plots should have proper chart titles and axis titles. In addition, P1 and P3 should
have legends to distinguish different contents. Adding additional stylish visual attributes is highly
recommended, such as different color schemes, label orientations, etc.

## Exercise 2
- Figure 1: Display the original RGB image in fig1, later add interaction with sliders.
- Figure 2: Compute the Red, Green, and Blue components of the original RGB image and store them as image
arrays. Finally display both the RGB image and three color components R, G, and B in four subfigures in
fig2.
- Figure: Convert the original RGB image into YUV form. Compute the corresponding Y, U, V components and
store them as image arrays. Finally display both YUV image and three components Y, U, and V in four
subfigures in fig3.
- Tab: Put fig2 and fig3 in navigation tabs called tab.
slider: Create a slider to interact with the original image. This slider is to adding some noise into the original
image in fig1. The noise will be Salt & Pepper noise (pixel values of black or white) with noise_density (if
noise_density = 10, it means that the noisy pixels will occupy 10% of input’s image total pixels) randomly
distributed to the image. Every time when slide this slider, the noise level will be controlled by the
noise_density parameter and fig1 will update and display the corresponding noisy image.
- In the final dashboard, set proper titles for plots and slider

## Exercise 3
- Stage 1: Process the dataset using Pandas in the way that it can be properly used by the
program and be able to produce the result as shown in fig1. Pay attention that in fig 1 the order of the four
coordinates is different from the oder of the data you have, you will need to first change the order of the
attributes.
- Stage 2: Due to certain flaws in the reference code, the result in fig1 is basically incorrect
regarding the y scale (the left three y axes are wrong). Your task in this stage is to check and correct the
reference code and produce the correct parallel coordinates plot as shown in fig2.
- Stage 3: To make the parallel coordinates plot more pleasing and easier to read, you are asked to
add two more features based on your result as in fig2, and produce the final result as in fig3.
- Feature 1: remove the upper and lower border of the whole plot.
- Feature 2: add title for the plot and four labels for each of the vertical coordinate.

## Exercise 4
Two Pandas DataFrames, countries_df, and indicators_df will be generated after running the skeleton. The
‘first one contains geopolitical information about every country (182 countries are presented, those lack of
data are deleted), and the second one contains different development indicators per country and year. As a
starting point, you can first download and run this simple Gapminder implementation made with Bokeh in
Jupyter Notebook and, once this is working, make necessary modifications and play with the data provided
in this exercise (The data provided is the most up-to-date and contains more information).
