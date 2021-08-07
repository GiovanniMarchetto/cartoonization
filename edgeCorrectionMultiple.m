function [HardEdge,MediumEdge,SoftEdge] = edgeCorrectionMultiple(originalImg,edgeImg,print)
    HardEdge=originalImg;  % black edge hard, medium and soft mode
    MediumEdge=originalImg;
    SoftEdge=originalImg;

    for r = 1:size(originalImg,1)
        for c = 1:size(originalImg,2)
            if (edgeImg(r,c,:)==1)
              HardEdge(r,c,:) = 0;
            end
            if (        (edgeImg(r,c,1)==1 && edgeImg(r,c,2)==1)...
                    ||  (edgeImg(r,c,1)==1 && edgeImg(r,c,3)==1)... 
                    ||  (edgeImg(r,c,2)==1 && edgeImg(r,c,3)==1))
              MediumEdge(r,c,:) = 0;
            end
            if (edgeImg(r,c,1)==1 || edgeImg(r,c,2)==1 || edgeImg(r,c,3)==1)
              SoftEdge(r,c,:) = 0;
            end
        end
     end
    
    if(print==true)
        figure(),imshow([HardEdge MediumEdge SoftEdge]);
    end
end