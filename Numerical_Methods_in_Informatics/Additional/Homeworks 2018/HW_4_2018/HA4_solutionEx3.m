
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
%% Exercise 3

close all
clear all
clc

% Ex 3a)

% Load the image data
image = imread('lena.png');

m=size(image,1);
n=size(image,2);
 
% Fast Fourier Transformation
t= fft2(image);

% number of coefficients to keep for the compression
percent=5;
DIM = floor(m*(percent*0.01));

% neglect unnecessary coefficients
t(DIM+1:end,DIM+1:end) = 0;

%Inverse of Fast Fourier Transformaion
I_reduced = cast(ifft2(t), class(image));

%Save the new computed image
imwrite(I_reduced,'reduced_lena.png')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Ex 3b)

% Load the image data in double-type form
I=mat2gray(image);
m=size(I,1);
n=size(I,2);

[x,y]=meshgrid(1:n,1:m);

% refine the mesh for the interpolation
percent=5;
[p,q]=meshgrid(1:percent*0.01:n,1:percent*0.01:m);

% perform the interpolation
I_improved=interp2(x,y,I,p,q,'bicubic');

%Save the new computed image
imwrite(I_improved,'improved_lena.png')

% Final plot of the images
subplot(1,3,1), imshow(image)
subplot(1,3,2), imshow(I_reduced)
subplot(1,3,3), imshow(I_improved)
