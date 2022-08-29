function [interppoints] = Interpolating_Solver(xx, xtest)

    % Initialising the interpolated vector
    ytest = [];
    xtt   = [];

    % Getting the interpolation coefficients from the nodes
    coeff = QuadraticSpline_Solver(xx);

    % Evaluate the points values depending on in which interval they lie
    for inter = 1:(length(xx)-1)

       % Retrieving the points living in the interval inter-1
        index = find((xx(inter+1)>=xtest) .* (xx(inter)<=xtest));

        % Tabulating the values
        xtemp = xtest(index);

        if ~isempty(index)

            % Constructing the determination matrix and retrieving the
            % interpolated values
            A = [ ones(1, length(index)); xtemp; xtemp.^2];
            values = coeff(inter,:)*A;

            % Reconstructing the values within this interval
            ytest = [ytest, values];
            xtt   = [xtt, xtest(index)];
        end
    end
    
    % Returning the interpolated xy valyes
    interppoints = [xtt; ytest]';
    
end