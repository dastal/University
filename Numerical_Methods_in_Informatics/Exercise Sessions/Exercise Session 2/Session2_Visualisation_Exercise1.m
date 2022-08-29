%{
    Script to plot two functions on a same figure with detailed informations
}%

%% Define the data to plot

% Points to evaluate the functions on
x=linspace(0,1);

% Evaluated functions to plot
f=exp(x/10).*sin(2*pi*x);
g=log(3+x).*cos(4*pi*x);


%% Plot the data and customize the plot

% Open the figure
fig=figure()

% Plot the representation of the two functions on the same figure
hold on
plot(x,f,'r--')
plot(x,g,'b-.')

% Customize the plot
title('Cute functions')
xlabel('Time')
ylabel('Money')
axis([0 1 -2 2])
legend('Marc', 'John')

% Saving and closing 
savefig(fig,'my_first_functions')
close all 
