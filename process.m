function process(fname, algorithm, min_radius, max_radius)
    RGB = imread(fname);
    I  = rgb2gray(RGB);
    BW = edge(I,'canny');


    if strcmp(algorithm,'circles') == 1
        a = myHoughCircles(BW, min_radius, max_radius);
    elseif strcmp(algorithm,'rectangles') == 1
        a = myHoughRectangles(BW, min_radius, max_radius);
    end 

    animation(I, a);

