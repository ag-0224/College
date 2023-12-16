fprintf('2020054084 조은\n\n');

% 주어진 데이터
x = [1, 2, 3, 5, 7, 8];
y = [3, 6, 19, 99, 291, 444];

% (a)
cubic_spline_result1 = cubic_spline(x, y, 4);
cubic_spline_result2 = cubic_spline(x, y, 2.5);

fprintf('f3(%.1f): %.4f\n', 4, cubic_spline_result1);
fprintf('f3(%.1f): %.4f\n', 2.5, cubic_spline_result2);

fprintf('\n');

% (b)
cubic_spline_result3 = cubic_spline(x, y, 3);
quadratic_spline_result = quadratic_spline(x, y, 3);

fprintf('f3(%.1f): %.4f\n', 3, cubic_spline_result3);
fprintf('f2(%.1f): %.4f\n', 3, quadratic_spline_result);


function result = cubic_spline(x, a, interp_points)
    n = length(x);
    b = zeros(1, n - 1);
    c = zeros(1, n);
    d = zeros(1, n - 1);
    h = zeros(1, n - 1);
    alpha = zeros(1, n - 1);
    l = zeros(1, n);
    u = zeros(1, n - 1);
    z = zeros(1, n);
    
    % Step 1
    for i = 1:(n - 1)
        h(i) = x(i + 1) - x(i);
    end

    % Step 2
    for i = 2:(n - 1)
        alpha(i) = 3 * (a(i + 1) - a(i)) / h(i) - 3 * (a(i) - a(i - 1)) / h(i - 1);
    end

    % Step 3
    l(1) = 1;
    u(1) = 0;
    z(1) = 0;

    % Step 4
    for i = 2:(n - 1)
        l(i) = 2 * (x(i + 1) - x(i - 1)) - h(i - 1) * u(i - 1);
        u(i) = h(i) / l(i);
        z(i) = (alpha(i) - h(i - 1) * z(i - 1)) / l(i);
    end

    % Step 5
    l(n) = 1;
    z(n) = 0;
    c(n) = 0;

    % Step 6
    for j = (n - 1):-1:1
        c(j) = z(j) - u(j) * c(j + 1);
        b(j) = (a(j + 1) - a(j)) / h(j) - h(j) * (c(j + 1) + 2 * c(j)) / 3;
        d(j) = (c(j + 1) - c(j)) / (3 * h(j));
    end

    % Evaluate spline at interpolation points
    result = zeros(size(interp_points));
    for i = 1:length(interp_points)
        x_interp = interp_points(i);
        j = find(x_interp >= x, 1, 'last');
        if isempty(j)
            error('Interpolation point is outside the given data range.');
        end
        x_offset = x_interp - x(j);
        result(i) = a(j) + b(j) * x_offset + c(j) * x_offset^2 + d(j) * x_offset^3;
    end
end

function result = quadratic_spline(x, y, interp_points)
    n = length(x) - 1;

    a = zeros(1, n);
    b = zeros(1, n);
    c = zeros(1, n);

    for i = 1:n
        a(i) = y(i);
        b(i) = (y(i+1) - y(i)) / (x(i+1) - x(i));
        c(i) = (x(i+1) * y(i) - x(i) * y(i+1)) / (x(i+1) - x(i));
    end

    % Evaluate spline at interpolation points
    result = zeros(size(interp_points));
    for i = 1:length(interp_points)
        x_interp = interp_points(i);
        j = find(x_interp >= x, 1, 'last');
        if isempty(j)
            error('Interpolation point is outside the given data range.');
        end
        x_offset = x_interp - x(j);
        result(i) = a(j) + b(j) * x_offset + c(j) * x_offset^2;
    end
end















