function result = gausslegendre (iterations)
    a = 1;
    b = 1 / sqrt(2);
    p = 1;
    t = 0.25;

    for i = 1:iterations
        an = a;
        a = (a + b) / 2;
        b = sqrt(an * b);
        t = t - p * (an - a) ^ 2;
        p = 2 * p;
    endfor

    result = (a + b) ^ 2 / (4 * t);
endfunction

disp (gausslegendre (10))