%% Main
clearvars
close all

img = imread('.\image.tif');

C1 = cartoon2(img,10);
figure(),imshow(C1),title("Cartoonization first mode");

C2 = cartoon3(img,10);
figure(),imshow(C2),title("Cartoonization second mode");

NC = cartoon(double(img)/255);
figure(),imshow(NC),title("Matlab cartoonization");
