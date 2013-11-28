function A = myHoughLines(M, thetas, rho_resulution)
    [xs ys] = find(M);

    Thetas = repmat(thetas, length(xs), 1);
    Xs = repmat(xs, 1, length(thetas));
    Ys = repmat(ys, 1, length(thetas));


    eRhos = Xs.*cos(Thetas) + Ys.*sin(Thetas);

    rhos = linspace(-norm(size(M)), norm(size(M)), norm(size(M))/rho_resulution);
    eRhosShape = size(eRhos);
    rhos_idx = quantiz(eRhos(:), rhos);
    rhos_idx = reshape(rhos_idx, eRhosShape);
    rhos_idx = rhos_idx';

    A = zeros(length(thetas), length(rhos));

    for theta_idx=1:length(thetas)
        h = histc(rhos_idx(theta_idx,:), 1:length(rhos));
        A(theta_idx, :)= A(theta_idx, :) + h;
    end
    A = A';
