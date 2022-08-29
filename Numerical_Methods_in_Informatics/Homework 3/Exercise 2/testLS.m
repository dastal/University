%% clear
clear;
clear clc;

%% Preparing for LS
% Parameters
g = @(x) 0.05.*sin(1000.*x) + 0.5.*cos(pi.*x) - 0.4.*sin(10.*x);
a = 0;
b = 1;
points = 50;
xxs = transpose(linspace(a,b,points));

% computing the y values
yys = g(xxs);

% 100 equispaced points for display
x_dis = linspace(0,1,100);

% Order 15 polynomial interpolation -> needs 16 data points
order15 = 16;
x_p15 = linspace(a,b,order15);
p15 = polyfit(x_p15,g(x_p15),15);
y_15 = polyval(p15,x_dis);

% Spline
sp = spline(xxs,yys,x_dis);

%% Least Square Method
% Using the data points
aas = leastSquares(xxs,yys,6);

% Out y for display -> x_dis
ls6 = x_dis*0+aas(1);
for i=1:6
   ls6=ls6+aas(i+1)*x_dis.^i;
end

% Out y for residual -> data points
ls6_points = xxs*0+aas(1);
for i=1:6
   ls6_points=ls6_points+aas(i+1)*xxs.^i;
end

% Printing the residual of the least square method -> with data points
res = norm(ls6_points-yys,2);

%% Plotting
plot (xxs,yys,'k.','markersize',14);
hold on;
plot(xxs,yys,'k','Linewidth',1.5);
plot(x_dis,ls6,'r','Linewidth',1.5);
plot(x_dis,sp,'m:','Linewidth',1.5);
plot(x_dis,y_15,'b:','Linewidth',1.5);
title("Comparison of different interpolation/regression methods");
xlabel("x");
ylabel("y");
ylim([-1.5 1]);
legend(["Nodes", "Piecewise Linear Interpolation", "Least Squares Method (degree 6)", "Piecewise Cubic Spline Interpolation","Polynomial Order 15"], "Location", "best");
savefig("PlotLS.fig");
hold off;
%close;
