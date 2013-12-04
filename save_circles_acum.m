function save_circles_acum(A, rs, fname)
    [n m k] = size(A);
    A = reshape(A, k, n*m);

    ts = [];
    for i=1:length(rs)
        ts(i) = compute_perimeter(rs(i));
    end


    save(fname, 'A', 'ts', 'rs')
