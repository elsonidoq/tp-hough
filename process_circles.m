function process_circles(fname, min_radius, max_radius)
    I = rgb2gray(imread(fname));
    [X Y R A] = hough_circle(I, min_radius, max_radius);
    animation(I, A);
