function y=fibo_no_loops(n)
    % Note: rename the function to fibo_no_loops.m
    % Fibonacci with recursion. 
    % Input: positive integer n. 
    % Output: the n-th Fibonacci's number 

    % Make a special case for the early outputs
    if n==1 || n==2
        y=1;
    % Main recursion
    else
        y=ex22_fibo_no_loops(n-2)+ex22_fibo_no_loops(n-1);
    end

end
