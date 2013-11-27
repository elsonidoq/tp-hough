function res = fill_rec(img, height, width, transy, transx)
    if nargin == 3
        transx = 0;
        transy = 0;
    elseif nargin ==4 
        transy = 0;
    end

    img = squeeze(img);
    [img_height img_width] = size(img);
    centerx = img_width/2;
    centery = img_height/2;

    offsetx = 0;
    offsety = 0;
    if mod(width,2) == 1
        offsetx = 1;
        width = width-1;
    end
    if mod(height,2) == 1
        offsety = 1;
        height = height-1;
    end
    xslice = 1 + (centerx -offsetx - width/2):(centerx + width/2);
    yslice = 1 + (centery - offsety - height/2):(centery + height/2);

    img(yslice - transy, xslice-transx) = 255;
    res = img;
