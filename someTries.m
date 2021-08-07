%% Main

img = imread('.\image.tif');

if(size(img,3)>3)
    A(:,:,1)=img(:,:,1);
    A(:,:,2)=img(:,:,2);
    A(:,:,3)=img(:,:,3);
    img=A;
end

%---FIRST-ELABORATION
    %---MEDIAN
    A1 = medianCartoon(img,3,1);
    A2 = medianCartoon(img,3,10);

    % NOTA: la maschera 5x5 dà risultati poco soddisfacenti perché perde troppe
    %       informazioni utili
    % A99 = medianCartoon(img,5,1);
    % A22 = medianCartoon(img,5,10);

    %---BILATERAL
    A3 = bilaterImgFilter(img);

    %---THRESHOLDING
    localNumberThr = 5;
    if(size(img,3)==3)
        localNumberThr=10;
    end

    A4 = thrCartoon(img,localNumberThr);
    %---MED THR
    A5 = clusterCartoon(img,localNumberThr);

    %---DENSITY
    A51 = minDensityImgFilter(A3,20,0);
    A52 = densityCartoon(A3,100,0);
    figure(),imshow(A51),title("Bilateral and min density consumption")
    figure(),imshow(A52),title("Bilateral and threshold for density")

    %---MIX
    A6 = thrCartoon(A1,localNumberThr);
    A7 = thrCartoon(A2,localNumberThr);
    A8 = thrCartoon(A3,localNumberThr);
    A9 = clusterCartoon(A1,localNumberThr);
    A10 = clusterCartoon(A2,localNumberThr);
    A11 = clusterCartoon(A3,localNumberThr);
    
    %---
    NC = cartoon(double(img)/255);
    figure(),imshow(A6),title("Median and fix threshold")
    figure(),imshow(A9),title("Median and dinamic threshold")
    figure(),imshow(A7),title("Median and fix threshold")
    figure(),imshow(A10),title("Median and dinamic threshold")
    figure(),imshow(A8),title("Bilateral and fix threshold")
    figure(),imshow(A11),title("Bilateral and dinamic threshold")
    figure(),imshow(NC),title("Matlab cartoonization");
