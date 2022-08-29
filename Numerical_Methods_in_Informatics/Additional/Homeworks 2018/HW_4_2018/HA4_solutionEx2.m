
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
%            
%                            SOLUTION 4th Homework Assignment              
%                            
%                                        in 
%
%                      Numerical Methods for  Scientific Computing
%
%
%
%            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

clc
clear all
close all

% Exercise 2a

fun=inline('abs(x-pi/12)','x');

a=-1;
b=1;
x_dis=linspace(a,b,1000);
f_dis=fun(x_dis);

% Ex 2a)
figure(1)
plot(x_dis, f_dis,'--k','linewidth',4)
title('Plot of f(x)=abs(x-pi/12)');
xlabel('x')
ylabel('y')

%% Ex 2b)
yt_I=[];
err_I=[];

g=[5 10 15];

for n=g
    
    % equispaced nodes
    h=(b-a)/n;
    x_nod=a:h:b;
    f_nod=fun(x_nod);

    % interpolation 
    P=polyfit(x_nod,f_nod,n);
    y_I=polyval(P,x_dis);
    
    % save data and compute the error
    yt_I=[yt_I; y_I];
    err_I=[err_I; abs(y_I-f_dis)];
       
end


err_max_L=max(err_I, [], 2)';

figure(2)
plot(x_dis, f_dis, '--k','linewidth',4)
hold on
plot(x_dis, yt_I, 'linewidth',2)
hold on
title('Lagrange interpolation with equispaced nodes')
xlabel('x')
ylabel('y')
legend('Exact','n=5', 'n=10','n=15')


fprintf('Lagrange Interpolation of degree %3d has maximum error %f\n', [g; err_max_L])

%%

% Ex 2c)
yt_I=[];
err_I=[];

g=2:25;

for n=g
    
    % Chebychev nodes
    i=0:n;
    x_loc=-cos(i*pi/n);
    x_nod=(a+b)/2 + (b-a)/2*x_loc;
    f_nod=fun(x_nod);

    % interpolation 
    P=polyfit(x_nod,f_nod,n);
    y_I=polyval(P,x_dis);
    
    % save data and compute the error
    yt_I=[yt_I; y_I];
    err_I=[err_I; abs(y_I-f_dis)];
       
end


err_max_CL=max(err_I, [], 2)';

figure(3)
for i=1:length(g)
    plot(x_dis, f_dis, '--k','linewidth',4)
    hold on
    plot(x_dis, yt_I(1:i,:))
    hold on
    title('Lagrange interpolation with Chebychev nodes')
    legend(strvcat('f(x)',[repmat('n=', i,1) num2str(g(1:i)')]),...
        'Location', 'NorthEastOutside')
    xlabel('x')
    ylabel('y')
    
    hold off
    pause(0.5)
end

fprintf('Lagrange Interpolation of degree %3d has maximum error %f\n', [g; err_max_CL])


y1=1./g;
y2=1./(g.^2);
figure(4)
loglog(g,err_max_CL,'-b',g,y1,'--k',g,y2,'--k', 'linewidth',2)
title('Error of the Lagrangian interpolation with Chebychev nodes')
xlabel(' Degree')
ylabel(' Maximum Error')
legend('Error', 'Reference',1)



%% Ex 2d)
yt_I=[];
err_I=[];

g=2.^(1:7);

for n=g
    
    % nodes
    h=(b-a)/n;
    x_nod=a:h:b;
    f_nod=fun(x_nod);
    

    % interpolation 
    y_I=interp1(x_nod,f_nod,x_dis);
    
    % save data and compute the error
    yt_I=[yt_I; y_I];
    err_I=[err_I; abs(y_I-f_dis)];
       
end


err_max_PL=max(err_I, [], 2)';

figure(5)
    plot(x_dis, f_dis, '--k','linewidth',4)
    hold on
    plot(x_dis, yt_I)
    hold on
    title('Piecewise linear interpolation with equispaced nodes')
    legend(strvcat('f(x)',[repmat('n=',length(g),1) num2str(g')]),...
        'Location', 'NorthEastOutside')
    xlabel('x')
    ylabel('y')
    
fprintf('Lagrange Interpolation of degree %3d has maximum error %f\n', [g; err_max_PL])


h=(b-a)./g;
y1=h;
y2=h.^2;
figure(6)
loglog(h,err_max_PL,'-b',h,y1,'--k',h,y2,'--k', 'linewidth',2)
title('Error of the Piecewise Linear interpolation with equispaced nodes')
xlabel('Amplitude: h=(b-a)/g')
ylabel(' Maximum Error')
legend('Error', 'Reference',1)


% Final comparison
g_CL=2:25;
g_PL=2.^(1:5);
y1=1./g_PL;
y2=1./(g_PL.^2);

figure(7)
loglog(g_CL,err_max_CL,'-b', g_PL, err_max_PL(1:5),'-r',g_PL,y1,'--k', g_PL,y2,'--k')
title('Comparison of the maximum error of the interpolation')
xlabel('Degree')
ylabel('Maximum error')
legend('Legendre (Chebychev nodes)',' Piecewise lin','Reference',1)


