function fib=fibo_loops(n)
    % Note: rename the function to fibo_loops
    % fibonacci with loop. 
    %Input: positive integer n. Output: the n-th Fibonacci's number 
    
    % Initialisation
    fib_1=1;
    fib_2=1;
    
    % Initial checkup
    if n==1 || n==2
        fib=1;
    
    % Main iteration
    else
        for k=3:n
            fib=fib_2+fib_1;
            fib_2=fib_1;
            fib_1=fib;
        end
    end
end

