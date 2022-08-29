function [n] = tolerance_series(tolerance)
   % parameters
   A = pi ^ 2 / 8;
   k = 100000;
   resultOfSeries = 0;
   
   % Series
   for i = 1:k
       n = i;
       term = 1/(((2 * i) - 1)^2);
       resultOfSeries = resultOfSeries + term;
       if (abs(resultOfSeries-A)) <= tolerance
           break
       end
   end
end

