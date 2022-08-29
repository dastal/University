function [ df ] = approx_der( f, x0, h)
    % Approximate derivative of f in x0 with increment h
    % NOTE: rename this file to approx_der.m
    df=(f(x0+h)-f(x0))/h;
end

 
