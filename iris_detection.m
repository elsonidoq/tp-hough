function  [px py pr1 pr2] = iris_detection(I, min_radius, max_radius, factor)
    [X Y R A] = hough_circle(I, min_radius, max_radius, factor);
    [px py pr1 pr2] = iris_prunning(X, Y, R);

