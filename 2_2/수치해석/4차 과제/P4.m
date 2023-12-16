fprintf('2020054084 조은\n');

% 주어진 데이터
x_data = [1, 2, 3, 5, 7, 8];
y_data = [3, 6, 19, 99, 291, 444];

% 구하고자 하는 값
x_interpolate = 4;

% 1차 Lagrange 다항식
L1 = @(x) (x - x_data(2)) / (x_data(1) - x_data(2)) * y_data(1) + (x - x_data(1)) / (x_data(2) - x_data(1)) * y_data(2);

% 2차 Lagrange 다항식
L2 = @(x) (x - x_data(2)) / (x_data(1) - x_data(2)) * (x - x_data(3)) / (x_data(1) - x_data(3)) * y_data(1) + ...
          (x - x_data(1)) / (x_data(2) - x_data(1)) * (x - x_data(3)) / (x_data(2) - x_data(3)) * y_data(2) + ...
          (x - x_data(1)) / (x_data(3) - x_data(1)) * (x - x_data(2)) / (x_data(3) - x_data(2)) * y_data(3);

% 3차 Lagrange 다항식
L3 = @(x) (x - x_data(2)) / (x_data(1) - x_data(2)) * (x - x_data(3)) / (x_data(1) - x_data(3)) * (x - x_data(4)) / (x_data(1) - x_data(4)) * y_data(1) + ...
          (x - x_data(1)) / (x_data(2) - x_data(1)) * (x - x_data(3)) / (x_data(2) - x_data(3)) * (x - x_data(4)) / (x_data(2) - x_data(4)) * y_data(2) + ...
          (x - x_data(1)) / (x_data(3) - x_data(1)) * (x - x_data(2)) / (x_data(3) - x_data(2)) * (x - x_data(4)) / (x_data(3) - x_data(4)) * y_data(3) + ...
          (x - x_data(1)) / (x_data(4) - x_data(1)) * (x - x_data(2)) / (x_data(4) - x_data(2)) * (x - x_data(3)) / (x_data(4) - x_data(3)) * y_data(4);

% 결과 출력

fprintf('f1(%d) = %.2f\n\n', x_interpolate, L1(x_interpolate));

fprintf('f2(%d) = %.2f\n\n', x_interpolate, L2(x_interpolate));

fprintf('f3(%d) = %.2f\n\n', x_interpolate, L3(x_interpolate));








