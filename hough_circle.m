function A = hough_circle(I, min_radius, max_radius)
    borders = edge(I, 'canny');
    A = hough_acum_circle(borders, min_radius, max_radius);
