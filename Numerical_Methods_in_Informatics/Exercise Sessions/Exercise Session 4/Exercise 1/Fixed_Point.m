function [xs] = Fixed_Point(func,a,b,n)
    % Create a first guess (kind of random function)
    x0 = a+0.8*(b-a);
    
    % Intialise the array to store the x values
    xs = [x0];
    
    % Iteration on the prescribed number of iterations
    for it=1:n
       % Evaluate the value of the iteration function at the given point
       x1 = func(x0);
       
       % Update the current value
       x0 = x1;
       
       % Store the newly recived value
       xs = [xs; x1];
    end
end

