function I = draw_circles(I, min_radius, max_radius, factor)
    [X Y R A] = hough_circle(I, min_radius, max_radius, factor);


    [mesh_x, mesh_y] = meshgrid(1:size(I,2), 1:size(I,1));

    for i=1:length(X)
        x = X(i);
        y = Y(i);
        r = R(i);

        I = plot_circle(I, x, y, r);
    end

        


