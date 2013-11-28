function animation(img, hough)
    figure
    colormap gray
    dif = size(hough,1) - size(img,1);
    offset = (dif-1)/2 + 1;
    idx = 1;
    for rad=1:size(hough,3)
        if sum(sum(hough(:,:,rad))) == 0
            continue
        end
        M = squeeze(hough(offset:end-offset,offset:end-offset,rad))*0.8 + double(img)*0.2;
        imagesc(M); 
        mov(idx) = getframe;
        idx=idx+1;
    end
    movie(mov)
