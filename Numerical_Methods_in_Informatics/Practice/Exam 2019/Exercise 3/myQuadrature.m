function [quad] = myQuadrature(f,a,b,M)
    xxs = linspace(a,b,M+1);

    y_st = [-1, -0.2, 0.6];
    a_st = [1/3, 5/6, 5/6];

    quad = 0;

    for i = 1:M
       sub = 0;
       a_part = xxs(i);
       b_part = xxs(i+1);
       for j = 1:3
         y_j =  ((a_part + b_part)/2) + ((b_part - a_part)/2) * y_st(j);
         a_j = ((b_part -a_part)/2) * a_st(j);
         f_y = f(y_j);
         sub_part = a_j * f_y;
         sub = sub + sub_part;       
       end
       quad = quad + sub; 
    end
end
