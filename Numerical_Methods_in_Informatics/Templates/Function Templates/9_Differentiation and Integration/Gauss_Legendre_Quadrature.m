function [Igauss] = Gauss_Legendre_Quadrature(yi_bar,alpha_bar)
    % Gauss-Legendre Formula

    % Resizing the weights
    alpha = (b-a)/2.*alpha_bar;

    % Resizig the value
    yi = (a+b)/2+(b-a)/2.*yi_bar;

    %% Theoretical result slide 18 of 9_DiffInt.pdf 
    %% Possibly need to change!
    amid = 128/225;
    aa = 1/900*(322+13*sqrt(70));
    ab = 1/900*(322-13*sqrt(70));
    alpha_bar_theo = [ab aa amid aa ab];

    ya = 1/21*sqrt(245-14*sqrt(70));
    yb = 1/21*sqrt(245+14*sqrt(70));
    yi_bar_theo = [-yb -ya 0 ya yb];

    % Computing the errors
    error_alpha_bar = max(abs(alpha_bar-alpha_bar_theo));
    error_yi_bar = max(abs(yi_bar-yi_bar_theo));

    fprintf("\n---------------------------------------\n");
    fprintf("\nError on the weights: %.1e\n", error_alpha_bar);
    fprintf("\nError on the nodes: %.1e\n", error_yi_bar);

    %% Gauss quadrature

    Igauss = sum(alpha.*f(yi));
    fprintf("\n---------------------------------------\n");
    fprintf("\nExact value of the integral: %.5f\n", Itheo);
    fprintf("\nGauss quadrature of the integral: %.5f\n", Igauss);

    fprintf("\nAbsolute error on the integral: %.5f\n", abs(Itheo-Igauss));
    fprintf("\nRelative error on the integral: %.5f %%\n", abs((Itheo-Igauss)/Itheo)*100);
end

