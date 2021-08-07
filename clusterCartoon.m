%% Dynamic Thresholding Method Function

% I divide the gray levels present in nClu clusters of equal size 
%       and approximate all values within each cluster 
%       to the median of the respective cluster
% nClu is the number of threshold, some examples: 5, 10, 15, 20, 50, 100

function ImgClu = clusterCartoon(img,nClu)
    
    ImgClu = img;

    for lay = 1:size(img,3)
        a = reshape(img(:,:,lay),1,[]);
        resto = mod(size(a,2),nClu);
        if(resto>0)
            for i = 1: nClu-resto
                a(end+1)=0;
            end
        end
        a = sort(a);
        a = reshape(a,[],nClu);

        for i = 1:nClu
            mini = min(a(:,i));
            maxi = max(a(:,i));
            medi = median(a(:,i));
            for r = 1:size(img,1)
                for c = 1:size(img,2)
                    if (ImgClu(r,c,lay)>=mini)
                        if(ImgClu(r,c,lay)<=maxi)
                            ImgClu(r,c,lay) = medi;
                        end
                    end
                end
            end
        end
    end
    
    if(false)
        figure(),imshow([img ImgClu]),
            title({"Cartoonization with the cluster method ",...
            strcat( " with ", num2str(nClu), " level of gray")});
    end
end