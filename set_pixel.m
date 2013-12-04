function I = set_pixel(I, x, y, v)
    if x > 0 && x < size(I,1) && y > 0 && y < size(I,2)
        I(x,y) = v;
    else
        a=1
    end
