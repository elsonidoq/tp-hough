function [X Y R A] = hough_circle(I, min_radius, max_radius, factor)
    if nargin < 2
        min_radius = 10;
        max_radius = min(size(I, 1), size(I, 2));
    end
    if nargin < 4
        factor = 0.55;
    end

    borders = edge(I, 'canny');
    A = hough_acum_circle(borders, min_radius, max_radius);

    X = zeros(0, 1);
    Y = zeros(0, 1);
    R = zeros(0, 1);
    for r = min_radius:max_radius
        thresh = 2 * pi * r * factor;
        [x y] = find(squeeze(A(:, :, r - min_radius + 1)) > thresh);
        X = [X ; x];
        Y = [Y ; y];
        R = [R ; repmat([r], size(x), 1)];
    end
