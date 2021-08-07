%% Main
clearvars
close all

img = imread('..\alpi.tif');

C1 = cartoon2(img,10);
C11 = addEdge(C1);
figure(),imshow([C1,C11]),title("Cartoonization first mode");

C2 = cartoon3(img,10);
C22 = addEdge(C2);
figure(),imshow([C2,C22]),title("Cartoonization second mode");

NC = cartoon(double(img)/255);
figure(),imshow(NC),title("Matlab cartoonization");