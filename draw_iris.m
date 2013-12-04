function draw_iris(I, min_radius, max_radius)
    figure;
    colormap gray;
    [X Y R1 R2] = iris_detection(I, min_radius, max_radius);
    alpha = 0.8;
    I = double(I);
    for i = 1:size(X)
        I = plot_circle(I, X(i), Y(i), R1(i));
        I = plot_circle(I, X(i), Y(i), R2(i));
    end
    imagesc(I);
