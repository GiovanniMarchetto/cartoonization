%% Thresholding Method Function

% I divide the 256 levels of gray in nThr intervals, 
%   the values within each threshold are approximated 
%   to the average value of the interval
% nThr is the number of threshold, some examples: 5, 10, 15, 20, 50, 100 

function ImgThr = thrCartoon(img,nThr)
    
    righe = size(img,1);
    colonne = size(img,2);
    
    ImgThr = img;

    for lay = 1:size(img,3)
        for i = 1:nThr
            min = (i-1) * 256/nThr;
            max = i * 256/nThr;
            med = (min+max)/2;
            for r = 1:righe
                for c = 1:colonne
                    if (ImgThr(r,c,lay) >= min)
                        if(ImgThr(r,c,lay) <= max)
                            ImgThr(r,c,lay) = med;
                        end
                    end
                end
            end
        end

    end
    
    if(false)
        figure(),imshow([img ImgThr]),
            title({"Cartoonization with the thresholding method ",...
            strcat( " with ", num2str(nThr), " level of gray")});
    end
end