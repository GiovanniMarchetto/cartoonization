%% Median cartoonization
% n         is the size of the square matrix of the filter
%   --> better 3 or 5
% times     is the number of times that is done the filter
%   --> 1 to 10

function MedianImg = medianCartoon(img,n,times)

    MedianImg = img;
    
    for lay = 1:size(img,3)
        for i = 1:times
            g = medfilt2(MedianImg(:,:,lay),[n n]);
            MedianImg(:,:,lay) = g;
        end
    end
    
    if(false)
        figure(),imshow([img MedianImg]),
            title({"Cartoonization with the median filter ",...
            strcat( "[", num2str(n), "x", num2str(n), "] ",...
                    "for ", num2str(times)," times")});
    end
end