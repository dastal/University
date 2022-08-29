# Data_Visualization_and_Analysis
 Advanced Data Visualisazion Course

Introduction to the fundamental principles of visual data analysis, which includes a review of signal processing, data analysis as well as basic 2D/3D image and graphics data representation and display techniques.

Concepts:
- Digital audio/visual signal representation, sampling and interpolation 
- Data mining techniques, e.g. such as clustering, principal component analysis or dimensionality reduction

Exercise 1
- Plot 1: First, create a circle plot to present the number of dogs per birth year in 2015, so x axis should be all
the birth years and y axis should be the number of dogs born in each year. Second, use proper functions
provided by the given library (detailed explanation and examples can be found in the presentation slices) to
calculate the polynomial fitting curves of different fitting degrees and plot them in P1. Add a hover tooltip to
indicate the corresponding birth year and the number of dogs in that year.
- Plot 2: Create a bar chart to present the fitting errors for each fitting degree. Of each fitting degree, use the
same color and alpha as the fitting curve in P1. Read the hints carefully to make sure that the final bars are
properly placed and colored.
- In the final dashboard, all plots should have proper chart titles and axis titles. In addition, add a legend in P1
to distinguish different fitting degrees. Adding additional stylish visual attributes is highly recommended,
such as different color schemes, line styles, etc.

Exercise 2
- Figure 1: Display the original RGB image in fig1, later add interactions with sliders.
- Select: Create an image select widget and put the two images as selection candidates. Calculate and
create necessary data for further processing.
- Sliders: Create three different sliders to interact with the original image:
- slider_noise: This slider is to adding some noise into the original image in fig1. The noise will be Salt &
Pepper. Every time when slide this slider, the noise level will be controlled by the noise_density parameter
and fig1 will update and display the corresponding noisy image.
- slider_gaussian: This slider is to apply a gaussian filter into either the noisy image (if slider_noise has been
touched before) or the original image (if there is no noise added before). Then fig1 will update and display
the de-noised image.
- slider_median: Similarly as slider_gaussian, but implement a median filter, also interact with the result of the
noisy image or the original image. Then fig1 will also update accordingly.

Exercise 3
- Step 1: First, go to the reference link and learn to visualize the Iris dataset as a scatter matrix.
- Step 2: The number of cluster k in this exercise is fixed to 3. To finish step 2, you need to
randomly pick 3 data points within the whole dataset and set them as the initial centers of the 3 clusters.
Set the color of the three centers as ‘red’, ‘green’ and ‘blue’, and the remaining 147 points as ‘grey’. Then
plot the data as in fig 1 (without the button).
- Step 3: Add a button widget and its corresponding update function (or so-called event handler).
In this function, you will calculate the new color for each point after clicking the button, that is, compute the
distances to three centers for all the data points and assign them the color of the center that is closest to
each of them. Then use this new color to construct updated datasource, which is then used for the plotting.
- Step 4: Compute the clustering purity of
your algorithm. To do so, you need to count every
time, for each of the species (50 samples), the number
of correctly clustered points. Finally display the results
in command line as shown on the right side. 
