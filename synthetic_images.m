function imgs = synthetic_images()
    width = 200; 
    height = 200;
    centerx = width/2;
    centery = height/2;
    imgs= zeros(12, height, width, 'uint8');

    imgs(1,:,:) = fill_rec(imgs(1,:,:), 50, 50);

    imgs(2,:,:) = fill_rec(imgs(2,:,:), 50, 50, 50, 50);

    imgs(3,:,:) = fill_rec(imgs(3,:,:), 50, 100);

    imgs(4,:,:) = fill_rec(imgs(4,:,:), 50, 80, -50, -50);
    imgs(4,:,:) = fill_rec(imgs(4,:,:), 80, 30, 50, -50);

    imgs(5,:,:) = fill_rec(imgs(5,:,:), 1, height);

    imgs(6,:,:) = fill_rec(imgs(6,:,:), 1, height);
    imgs(6,:,:) = imrotate(squeeze(imgs(6,:,:)), 45, 'bilinear', 'crop');

    imgs(7,:,:) = fill_rec(imgs(7,:,:), 1, height);
    imgs(7,:,:) = imrotate(squeeze(imgs(7,:,:)), 90, 'bilinear', 'crop');

    offset = -50;
    for i = 1:10
        imgs(8,:,:) = fill_rec(imgs(8,:,:), height, 1, 0, offset + i*width/20);
    end

    offset = -50;
    for i = 1:20
        imgs(9,:,:) = fill_rec(imgs(9,:,:), height, 1, 0, offset + i*width/40);
    end

    offset = -100;
    for i = 1:10
        imgs(10,:,:) = fill_rec(imgs(10,:,:), height, 1, 0, offset + i*width/20);
    end
    imgs(10,:,:) = imrotate(squeeze(imgs(10,:,:)), 45, 'bilinear', 'crop');

    for i = 1:10
        imgs(11,:,:) = fill_rec(imgs(11,:,:), 1, width, offset + i*height/20, 0);
    end

    imgs(12,:,:) = fill_rec(imgs(12,:,:), 1, width);



