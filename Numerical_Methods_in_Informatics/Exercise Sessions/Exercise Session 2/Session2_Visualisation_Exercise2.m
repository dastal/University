%{
    Plotting the asked functions with the asked customization 
}%

close all
clear all
clc

%% ---------------------------------
% Plot the function x->x**2-0.5
disp('ex 2a')

% Define the data
x=-1:0.05:1; %vector of x
f=x.^2-.5; %vector of y

% Create a figure containing the data
fig=figure;
plot(x,f,'r--')  

% Customise it lightly
title('f=x.^2-.5');

% Save the function in different ways and formats
savefig('first_function0')
savefig(fig, 'first_function1')
saveas(fig,'first_function2')
saveas(fig,'first_function3','eps')

% Close the created figures
pause
close

%% ----------------------------------------
% Plot the function f=sin(s*x) in different colors with legend
disp('ex b')

% Create the values to evaluate the function on
x=linspace(0,2*pi, 1000);

% Define the colors to consider for each case
colors = ['b','g','r','y'];

% Creating 4 plots with different colors and functions upon the loop parameter
for s=1:4
    % Generating the data
    y=sin(s*x);
    % Creating the figure
    figure;
    % Plotting the function on the figure
    plot(x,y,'Color',colors(s));
    legend(sprintf('s = %f', s) );
end

% Closing the created figure
pause
close all

%% -------------------------------------
% Plot the function f without lines but as little black circles centered in
disp('ex c')

% Creating the evaluation points
n=(0:1000) /100; 

% Evaluating the function
g=sin(2*pi*n);

% Creating the figure
figure;
scatter(n,g,'k')

% Closing it
pause
close all
