function animate_circle(I, min_radius, max_radius)
    figure;
    colormap gray;
    [X Y R A] = hough_circle(I, min_radius, max_radius);
    alpha = 0.9;
    I = double(I);
    for rad = 1:size(A, 3)
        M = squeeze(A(:, :, rad)) * alpha + I * (1 - alpha);
        imagesc(M);
        pause(0.1);
        ind = find(R==min_radius + rad - 1);
        if size(ind, 1) > 0
            M(X(ind), :) = 100;
            M(:, Y(ind)) = 100;
            imagesc(M);
            pause(3.0);
        end
    end
