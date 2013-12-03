function process_circles(fname, min_radius, max_radius)
    I = rgb2gray(imread(fname));
    animate_circle(I, min_radius, max_radius);
