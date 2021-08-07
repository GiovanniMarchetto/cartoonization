%% Density Consumption Method

% Consider a number of intervals (forming clusters). 
%   For each interval I take the most present gray level 
%   and set all values in the cluster to that value.

% nThr is the number of threshold, some examples: 5, 10, 15, 20, 50, 100

function ImgOutput = densityCartoon(img,nThr)
    
    ImgOutput = img;

    for lay = 1:size(img,3)
        a = reshape(img(:,:,lay),1,[]);
        resto = mod(size(a,2),nThr);
        if(resto>0)
            for i = 1: nThr-resto
                a(end+1)=0;
            end
        end
        a = sort(a);
        a = reshape(a,[],nThr);
        
        sizeLev=zeros(1,256);
        for i = 1:256
            sizeLev(i) = size(find(img(:,:,lay)==i),1);
        end

        for i = 1:nThr
            mini = min(a(:,i));
            maxi = max(a(:,i));
            for r = 1:size(img,1)
                for c = 1:size(img,2)
                    if (ImgOutput(r,c,lay)>=mini)
                        if(ImgOutput(r,c,lay)<=maxi)
                            maxVal = max(sizeLev((mini+1):(maxi+1)));
                            ImgOutput(r,c,lay) = find(sizeLev==maxVal,1)-1;
                        end
                    end
                end
            end
        end
    end
    
    if(false)
        figure(),imshow([img ImgOutput]),
            title({"Cartoonization with the density+clusters method ",...
            strcat( " with ", num2str(nThr), " level of gray")});
    end
end

