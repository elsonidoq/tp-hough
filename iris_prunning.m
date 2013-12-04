function [px py pr1 pr2] = iris_prunning(X,Y,R)
    px = [];
    py = [];
    pr = [];

    % prunning repeated
    for i = 1:length(X)
        add = true;
        v1 = [X(i) Y(i) R(i)];
        for j = 1:length(px)
            v2 = [px(j) py(j) pr(j)];
            if sum(abs(v1-v2)) < 5
                add = false;
            end
        end
        if add
            px(length(px)+1) = X(i);
            py(length(py)+1) = Y(i);
            pr(length(pr)+1) = R(i);
        end
    end

    pr1=pr; pr2=pr;
    X = px;
    Y = py;
    R = pr;

    px = [];
    py = [];
    pr1 = [];
    pr2 = [];
    % return only concentrical
    for i = 1:length(X)
        add = false;
        center1 = [X(i) Y(i)];
        r1 = R(i);
        for j = 1:length(X)
            if i == j
                continue
            end
            center2 = [X(j) Y(j)];
            r2 = R(j);
            if sum(abs(center1-center2)) < 20 && r2 > r1*1.25
                px(length(px)+1) = X(i);
                py(length(py)+1) = Y(i);
                pr1(length(pr1)+1) = r1;
                pr2(length(pr2)+1) = r2;
            end
        end
    end
