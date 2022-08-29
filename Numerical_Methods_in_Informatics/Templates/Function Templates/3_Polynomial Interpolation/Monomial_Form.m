function y = Monomial_Form(xdata, ydata, x)
% MONOMIAL - finds the coefficients c0,c1,...,cn such that
%   c0*xi^0 + c1*xi^1 + c2*xi^2 + ... + cn*xi^n = yi for i=0,...,n
%   where (xi,yi) is the given data for interpolation
    if ~isvector(xdata) || ~isvector(ydata)
        error(['*** The input argument XDATA and YDATA must be vectors of ',...
            'numeric type.']);
    elseif length(xdata)~=length(ydata)
        error(['*** The input argument XDATA and YDATA must be of ',...
            'the same length.']);
    end % if-elseif-flow
    
    n = length(xdata); % n pairs of data -> polynomial of degree n-1
    xdata = reshape(xdata, [], 1); % converted to column
    ydata = reshape(ydata, [], 1); % converted to column
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    A = zeros(n, n);
    for i = 1:n
        A(:,i) = xdata.^(i-1);
    end % for-loop
    
    c = A\ydata;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    sizx = size(x);
    
    x = reshape(x, [], 1);
    
    tmp = x*ones(1,n);
    for i = 1:n
        tmp(:,i) = tmp(:,i).^(i-1);
    end % for-loop
    
    y = tmp * c;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    y = reshape(y, sizx);
    
end % function monomial()