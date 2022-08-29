function[firstN] = tolerance_series(tolerance)
   A = pi ^ 2 / 8;
   k = 100000;
   resultOfSeries = 0;
   for i = 1:k
       firstN = i;
       term = 1/(((2 * i) - 1)^2);
       resultOfSeries = resultOfSeries + term;
       if (abs(resultOfSeries-A)) <= tolerance
           break
       end
   end
end