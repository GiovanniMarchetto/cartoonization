function ImgWithEdge = addEdge(originalImg)
    ImgWithEdge = originalImg;
    BW = originalImg;
    
    for lay = 1:size(originalImg,3)
        BW(:,:,lay) = edge(originalImg(:,:,lay),'canny');
    end
    
    if(size(originalImg,3)==3)
        ImgWithEdge = edgeCorrection(originalImg,BW);
    else
        for ind = 1:size(originalImg,1)*size(originalImg,2)
            if (BW(ind)==1)
                ImgWithEdge(ind) = 0;
            end
        end
    end
end