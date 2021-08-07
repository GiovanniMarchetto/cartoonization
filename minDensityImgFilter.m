%% Density Minimum Consumption Method

% Let's consider all gray levels in the image. 
%   The one with the least density is approximated 
%   to the nearest gray level.
% nRep is the number of iteration
    
function ImgDen = minDensityImgFilter(img,nRep)
    ImgDen = img;
    
    for lay = 1:size(img,3)
        a = zeros(1,255);
        for i = 1:255
            num = find(img(:,:,lay)==i);
            a(i)=size(num,1);
        end
%         for r = 1:size(img,1)
%             for c = 1:size(img,2)
%                 a(img(r,c,lay))=a(img(r,c,lay))+1;
%             end
%         end
        
        for iter = 1:nRep
            minLev = min(a(find(a)));
            
            shift=find(a==minLev,1);
            others=find(a>minLev);
            othersMin = others-shift;
            posOthers = find(othersMin==min(othersMin),1);
            pos = others(posOthers);
            
            for r = 1:size(img,1)
                for c = 1:size(img,2)
                    if (ImgDen(r,c,lay)==shift)
                        ImgDen(r,c,lay)=pos;
                    end
                end
            end
            a(shift)=0;
            a(pos)=a(pos)+minLev;
        end
    end
    
    if(false)
        figure(),imshow([img ImgDen]),
            title({"Result of the minimum density consumption method ",...
            strcat( " with ", num2str(nRep), " repetition")});
    end
end