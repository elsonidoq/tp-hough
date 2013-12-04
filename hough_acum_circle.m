function A = hough_acum_circle(M, min_radius, max_radius)
    [X Y] = meshgrid(0:2*max_radius, 0:2*max_radius);
    circle_mask = round(sqrt((X-max_radius).^2 + (Y-max_radius).^2));
    circle_mask(circle_mask<min_radius | circle_mask>max_radius) = 0;
    [cx cy cr] = find(circle_mask);

    [n m] = size(M);
    delta_radius = max_radius - min_radius + 1;
    A = zeros(n+2*max_radius+1, m+2*max_radius+1, delta_radius);

    [xs ys] = find(M);
    for i=1:length(xs)
        x = xs(i);
        y = ys(i);

        xidx = cx+x+1;
        yidx = cy+y+1;
        ridx = cr-min_radius+1;
        mask = xidx > 0 & xidx < size(A,1) & yidx > 0 & yidx < size(A,2); 
        idx = sub2ind(size(A), xidx(mask), yidx(mask), ridx(mask));

        A(idx) = 1 + A(idx);
    end
    A = A(max_radius:n+max_radius-1, max_radius:m+max_radius-1, :);
