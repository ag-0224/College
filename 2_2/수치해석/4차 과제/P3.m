fprintf('2020054084 조은\n');

% 주어진 데이터
x_data = [1, 2, 3, 5, 7, 8];
y_data = [3, 6, 19, 99, 291, 444];

% 구하고자 하는 값
x_interpolate = 4;

% 1차 뉴턴 다항식 계수 계산
f_x0 = y_data(1);  % f[x0]
f_x0_x1 = (y_data(2) - y_data(1)) / (x_data(2) - x_data(1));  % f[x1, x0]

% 1차 뉴턴 다항식
func1 = @(x) f_x0 + f_x0_x1 * (x - x_data(1));

% 결과 출력
fprintf('1차 뉴턴 다항식: P1(x) = %.2f + %.2f(x - %d)\n', f_x0, f_x0_x1, x_data(1));
fprintf('f1(%d) = %.2f\n\n', x_interpolate, func1(x_interpolate)); 

% 2차 뉴턴 다항식의 계수 계산
f_x0 = y_data(1);
f_x1_x0 = (y_data(2) - y_data(1)) / (x_data(2) - x_data(1)); % f[x1, x0]
f_x2_x1 = (y_data(3) - y_data(2)) / (x_data(3) - x_data(2)); % f[x2, x1]
f_x2_x1_x0 = (f_x2_x1 - f_x1_x0) / (x_data(3) - x_data(1)); % f[x2, x1, x0]

% 2차 뉴턴 다항식
func2 = @(x) f_x0 + f_x1_x0 * (x - x_data(1)) + f_x2_x1_x0 * (x - x_data(1)) * (x - x_data(2));

% 결과 출력
fprintf('2차 뉴턴 다항식: P2(x) = %.2f + %.2f(x - %d) + %.2f(x - %d)(x - %d)\n', f_x0, f_x1_x0, x_data(1), f_x2_x1_x0, x_data(1), x_data(2));
fprintf('f2(%d) = %.2f\n\n', x_interpolate, func2(x_interpolate));

% 3차 뉴턴 다항식 계수 계산
f_x0 = y_data(1);
f_x1_x0 = (y_data(2) - y_data(1)) / (x_data(2) - x_data(1)); 
f_x2_x1 = (y_data(3) - y_data(2)) / (x_data(3) - x_data(2));
f_x3_x2 = (y_data(4) - y_data(3)) / (x_data(4) - x_data(3));
f_x2_x1_x0 = (f_x2_x1 - f_x1_x0) / (x_data(3) - x_data(1));
f_x3_x2_x1 = (f_x3_x2 - f_x2_x1) / (x_data(4) - x_data(2));  
f_x3_x2_x1_x0 = (f_x3_x2_x1 - f_x2_x1_x0) / (x_data(4) - x_data(1));  

% 3차 뉴턴 다항식
func3 = @(x) f_x0 + f_x1_x0 * (x - x_data(1)) + f_x2_x1_x0 * (x - x_data(1)) * (x - x_data(2)) + f_x3_x2_x1_x0 * (x - x_data(1)) * (x - x_data(2)) * (x - x_data(3));

% 결과 출력
fprintf('3차 뉴턴 다항식: P3(x) = %.2f + %.2f(x - %d) + %.2f(x - %d)(x - %d) + %.2f(x - %d)(x - %d)(x - %d)\n', f_x0, f_x1_x0, x_data(1), f_x2_x1_x0, x_data(1), x_data(2), f_x3_x2_x1_x0, x_data(1), x_data(2), x_data(3));
fprintf('f2(%d) = %.2f\n\n', x_interpolate, func3(x_interpolate));

% 4차 뉴턴 다항식 계수 계산
f_x0 = y_data(1);
f_x1_x0 = (y_data(2) - y_data(1)) / (x_data(2) - x_data(1)); 
f_x2_x1 = (y_data(3) - y_data(2)) / (x_data(3) - x_data(2));
f_x3_x2 = (y_data(4) - y_data(3)) / (x_data(4) - x_data(3));
f_x4_x3 = (y_data(5) - y_data(4)) / (x_data(5) - x_data(4));
f_x2_x1_x0 = (f_x2_x1 - f_x1_x0) / (x_data(3) - x_data(1));
f_x3_x2_x1 = (f_x3_x2 - f_x2_x1) / (x_data(4) - x_data(2));
f_x4_x3_x2 = (f_x4_x3 - f_x3_x2) / (x_data(5) - x_data(3));
f_x3_x2_x1_x0 = (f_x3_x2_x1 - f_x2_x1_x0) / (x_data(4) - x_data(1)); 
f_x4_x3_x2_x1 = (f_x4_x3_x2 - f_x3_x2_x1) / (x_data(5) - x_data(2));
f_x4_x3_x2_x1_x0 = (f_x4_x3_x2_x1 - f_x3_x2_x1_x0) / (x_data(5) - x_data(1));

% 4차 뉴턴 다항식
func4 = @(x) f_x0 + f_x1_x0 * (x - x_data(1)) + f_x2_x1_x0 * (x - x_data(1)) * (x - x_data(2)) + f_x3_x2_x1_x0 * (x - x_data(1)) * (x - x_data(2)) * (x - x_data(3)) + f_x4_x3_x2_x1_x0 * (x - x_data(1)) * (x - x_data(2)) * (x - x_data(3)) * (x - x_data(4));

fprintf('4차 뉴턴 다항식: P4(x) = %.2f + %.2f(x - %d) + %.2f(x - %d)(x - %d) + %.2f(x - %d)(x - %d)(x - %d) + %.2f(x - %d)(x - %d)(x - %d)(x - %d)\n', f_x0, f_x1_x0, x_data(1), f_x2_x1_x0, x_data(1), x_data(2), f_x3_x2_x1_x0, x_data(1), x_data(2), x_data(3), f_x4_x3_x2_x1_x0, x_data(1), x_data(2), x_data(3), x_data(4));
fprintf('f4(%d) = %.2f\n', x_interpolate, func4(x_interpolate));





