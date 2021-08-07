%% Bilater Function

function BilateralImg = bilaterImgFilter(img)
    BilateralImg=img;
    
    I = double(img);

    halfwindowsize = 5;
    sigma_d = 4; 
    sigma_r = .2;
    
    for lay = 1:size(I,3)
        BilateralImg(:,:,lay) = bfilter2(I(:,:,lay)/255,halfwindowsize,[sigma_d, sigma_r])*255;
    end
    
    if(false)
        figure(),imshow([img BilateralImg]),
            title({"Cartoonization with the bilateral filter ",...
            strcat( "[\sigma_d=", num2str(sigma_d),...
                    ", \sigma_r=", num2str(sigma_r), "] ",...
                    "halfwindowsize=", num2str(halfwindowsize))});
    end
end