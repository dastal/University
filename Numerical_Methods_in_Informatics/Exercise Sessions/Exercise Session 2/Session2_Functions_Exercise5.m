%% Generate the vector on which the given functions will be evaluated
N=100;
a=0;
b=2;
xx=linspace(a,b,N)';

%% Define the functions to evaluate
ff=xx.^5-4*xx+1;
gg=exp(1i*xx/10);

%% Create the associated table [x, f(x)] for both functions
T1=[xx,ff];
T2=[xx,gg];

%% Equivalent (depreciated) way using loops
T=zeros(N,2);
T2=zeros(N,2);
for k=1:N
    T(k,1)=xx(k);
    T2(k,1)=xx(k);
    T(k,2)=xx(k)^5-4*xx(k)+1;
    T2(k,2)=exp(1i*xx(k)/10);
end 
