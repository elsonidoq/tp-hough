function animation(img, hough)
    figure
    colormap gray
    dif = size(hough,1) - size(img,1);
    offset = (dif-1)/2 + 1;
    alpha = 0.9;
    for rad=1:size(hough,3)
        if sum(sum(hough(:,:,rad))) == 0
            continue
        end
        M = squeeze(hough(offset:end-offset,offset:end-offset,rad))*alpha + double(img)*(1-alpha);
        imagesc(M); 
        pause(1.0/10);
        %mov(idx) = getframe;
        %idx=idx+1;
    end
    %length(mov)
    %movie(mov)
