#######################################################
## HW1 Solution
## Part 1: ...
## Part 2: ...

## Author: Tatiana L. G. <tatiana@sirius.utp.edu.co>
## Created: 
## Version: 0.0.1 
#######################################################

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
graphics_toolkit fltk;
clear; clc; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load transformed image >>projected<<
%[ztransf, imgtransf, W, H] = zimread('../imgs/building.png');
[ztransf, imgtransf, W, H] = zimread('../imgs/tiles.png');
%[ztransf, imgtransf, W, H] = zimread('../imgs/test_1.jpg');

imshow(imgtransf);
hold on;

%Read 4 pts from the corners
[x,y] = ginput(4);
scatter(x,y,5,'r');

%TODO: Ask the teacher how to get these values o.O
%xp=[50;130;130;50];
%yp=[50;50;130;130];
xp=[0;W;W;0];
yp=[0;0;H;H];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Find transformation matrix from 2 sets of 4 points in the
%original and transformed image
Hmat = zfindH(x,y,xp,yp);
Hinv = pinv(Hmat);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Finds the corresponding original no transformed points (x,y) 
ix1dorig = zfindX(Hinv,W,H);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create new vector image from transformed indexes and transformed rgb channels
zorig = zmaptovec(ix1dorig, ztransf, W*H);
%Transform vector to matrix image
imgorig = zimasmat(zorig, W, H);

figure(2);
imshow(imgorig);


