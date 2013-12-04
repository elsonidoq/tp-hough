function [A rhos] = hough_line(I, thetas, rho_resolution)
    borders = edge(I, 'canny');
    [A rhos] = hough_acum_line(borders, thetas, rho_resolution);
