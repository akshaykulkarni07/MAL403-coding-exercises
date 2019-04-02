%% heuristic method to find estimate of an condition number
clear all

n=input('column/row')
for i = 1 : n
    for j = 1 : n
        a(i, j) = input('elements-')
    end
end
a = reshape(a, n, n);

x1(1) = 1;
y1(1) = a(1,1);
for i = 2 : n
    s1 = 0;
    for j = 1 : i - 1
        s1 = s1 + a(i, j) * x1(j);
    end
    if abs(a(i, i) + s1) > abs(a(i, i) - s1)
        x1(i) = 1;
    else
        x1(i) = -1;
    end
    y1(i, i) = a(i, i) * x1(i) + s1;
end
a_2_norm = norm(y1) / sqrt(n);

x2(1) = 1;
y2(1) = 1 / a(1, 1);
for i = 2 : n - 1
    s2 = 0;
    for j = 1 : i - 1
        s2 = s2 + a(i, j) * y2(j);
    end
    y2(i) = -(s2 + sign(s2)) / a(i, i);
end
a_inv_norm = norm(y2) / sqrt(n);

est_cond_no = a_2_norm * a_inv_norm;