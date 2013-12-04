function  [px py pr1 pr2] = iris_detection(I, min_radius, max_radius)
    [X Y R A] = hough_circle(I, min_radius, max_radius);
    [px py pr1 pr2] = iris_prunning(X, Y, R);
