function MediumEdge = edgeCorrection(originalImg,edgeImg)
    MediumEdge=originalImg;

    for r = 1:size(originalImg,1)
        for c = 1:size(originalImg,2)
            if (        (edgeImg(r,c,1)==1 && edgeImg(r,c,2)==1)...
                    ||  (edgeImg(r,c,1)==1 && edgeImg(r,c,3)==1)... 
                    ||  (edgeImg(r,c,2)==1 && edgeImg(r,c,3)==1))
              MediumEdge(r,c,:) = 0;
            end
        end
    end
end