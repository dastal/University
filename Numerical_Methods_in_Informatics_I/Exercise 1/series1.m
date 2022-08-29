xValues = (10);
yValues = (10);

for i = 1:10
    xValues(i) = i;
    yValues(i) = mySeries(i);
end

% scatterplot
scatter(xValues,yValues);
axis([0 11 0.95 1.25]);
title("David Stalder");
xlabel("x-Axis");
ylabel("y-Axis");
savefig('series_plot.fig');
close;

function[resultOfSeries] = mySeries(k)
   resultOfSeries = 0;
   for i = 1:k
       term = 1/(((2 * i) - 1) ^ 2);
       resultOfSeries = resultOfSeries + term;
   end
end