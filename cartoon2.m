function ImgCartoon = cartoon2(originalImg,nThr)

    if exist('applycform','file')
       img = applycform(originalImg,makecform('srgb2lab'));
    else
       img = colorspace('Lab<-RGB',originalImg);
    end
    
    img(:,:,1) = thrCartoon(bilaterImgFilter(img(:,:,1)),nThr);

    if exist('applycform','file')
       ImgCartoon = applycform(img,makecform('lab2srgb'));
    else
       ImgCartoon = colorspace('RGB<-Lab',img);
    end
end