fprintf('2020054084 조은\n');

% 데이터
x = [0.75, 2, 3, 4, 6, 8, 8.5];
y = [1.2, 1.95, 2, 2.4, 2.5, 2.7, 2.6];

% 2차 다항식 회귀
coefficients_poly = polyfit(x, y, 2);

% 추정값 계산
y_fit_poly = polyval(coefficients_poly, x);

% 잔차 계산
residuals_poly = y - y_fit_poly;

% i, xi^2, xi^3, xi^4, xiyi, xi^2yi 계산
n = length(x);
i = 1:n;
xi_square = x.^2;
xi_cube = x.^3;
xi_quartic = x.^4;
xiyi = x .* y;
xi_square_yi = xi_square .* y;

fprintf('계수:\n');
fprintf('a0 (상수항): %.5f\n', coefficients_poly(3));
fprintf('a1 (1차항): %.4f\n', coefficients_poly(2));
fprintf('a2 (2차항): %.4f\n', coefficients_poly(1));
fprintf('\n');

% 결과 출력
fprintf('%-3s %-10s %-10s %-10s %-10s %-10s\n', 'i', 'xi^2', 'xi^3', 'xi^4', 'xiyi', 'xi^2yi');
fprintf('%-3d %-10.4f %-10.4f %-10.4f %-10.4f %-10.4f\n', [i; xi_square; xi_cube; xi_quartic; xiyi; xi_square_yi]);

% 각 열의 합 계산 및 출력
sum_xi_square = sum(xi_square);
sum_xi_cube = sum(xi_cube);
sum_xi_quartic = sum(xi_quartic);
sum_xiyi = sum(xiyi);
sum_xi_square_yi = sum(xi_square_yi);
fprintf('Sum: %-10.4f %-10.4f %-10.4f %-10.4f %-10.4f\n', sum_xi_square, sum_xi_cube, sum_xi_quartic, sum_xiyi, sum_xi_square_yi);

% 회귀식의 계수와 결과적인 식 출력
a2 = coefficients_poly(1);
a1 = coefficients_poly(2);
a0 = coefficients_poly(3);

fprintf('\n2차 다항식 회귀식:\n');
fprintf('y = %.4fx^2 + %.4fx + %.4f\n', a2, a1, a0);

% 새로운 x 값 생성
x_new = linspace(0, 9, 100);
y_new_poly = polyval(coefficients_poly, x_new);

% 그래프 그리기
figure;
plot(x, y, 'ro', 'DisplayName', '원본 데이터');
hold on;
plot(x_new, y_new_poly, 'k-', 'DisplayName', '2차 다항식 회귀');
xlabel('X');
ylabel('Y');
title('2020054084 조은 - 2(c) 포물선 그래프');
legend('Location', 'Best');
grid on;

