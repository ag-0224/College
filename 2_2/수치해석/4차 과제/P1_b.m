fprintf('2020054084 조은\n');

% 주어진 데이터
x = [1 2 3 4 5 6 7 8 9];
y = [1 1.5 2 3 4 5 8 10 13];

% 최소제곱 회귀분석
coefficients = polyfit(x, y, 1);
slope = coefficients(1);
intercept = coefficients(2);

% 다항 회귀 (2차 다항식)
degree = 2;
coefficients_poly = polyfit(x, y, degree);

% 상수항 계산
coefficients_poly(3) = mean(y) - coefficients_poly(2) * mean(x) - coefficients_poly(1) * mean(x.^2);

% x 값에서 다항식 계산
yFit_poly = polyval(coefficients_poly, x);

% 잔차 계산
residuals_poly = y - yFit_poly;

% Σ(yi - mean(y))^2 계산
Sst = sum((y - mean(y)).^2);

% 추정값의 표준오차 계산
yFit = polyval(coefficients, x);
residuals = y - yFit;
RMSE_poly = sqrt(sum(residuals.^2) / (length(x) - (2 + 1))); 

% 상관계수 계산 (corrcoef 함수 사용)
correlation_poly = (Sst - RMSE_poly) / Sst;

% 다항 회귀 결과 출력
fprintf('계수:\n');
fprintf('a0 (상수항): %.5f\n', coefficients_poly(3));
fprintf('a1 (1차항): %.4f\n', coefficients_poly(2));
fprintf('a2 (2차항): %.4f\n', coefficients_poly(1));
fprintf('추정값의 표준오차: %.4f\n', RMSE_poly);
fprintf('상관계수: %.4f\n\n', correlation_poly);

% i, xi^2, xi^3, xi^4, xiyi, xi^2yi 계산
n = length(x);
i = 1:n;
xi_square = x.^2;
xi_cube = x.^3;
xi_quartic = x.^4;
xiyi = x .* y;
xi_square_yi = xi_square .* y;

% 결과 출력
fprintf('%-3s %-5s %-5s %-5s %-5s %-5s\n', 'i', 'xi^2', 'xi^3', 'xi^4', 'xiyi', 'xi^2yi');
fprintf('%-3d %-5d %-5d %-5d %-5d %-5d\n', [i; xi_square; xi_cube; xi_quartic; xiyi; xi_square_yi]);

% 각 열의 합 계산 및 출력
sum_xi_square = sum(xi_square);
sum_xi_cube = sum(xi_cube);
sum_xi_quartic = sum(xi_quartic);
sum_xiyi = sum(xiyi);
sum_xi_square_yi = sum(xi_square_yi);
fprintf('Sum: %-5d %-5d %-5d %-5d %-5d\n', sum_xi_square, sum_xi_cube, sum_xi_quartic, sum_xiyi, sum_xi_square_yi);

% 데이터와 회귀 곡선 그리기
figure;
plot(x, y, 'o', 'DisplayName', '데이터');
hold on;
plot(x, yFit_poly, '-', 'DisplayName', '다항 회귀 (2차 다항식)');
xlabel('x');
ylabel('y');
title('2020054084 조은 - 1(b) 그래프');
legend('Location', 'Best');
grid on;

% 적합성 평가
fprintf('\n적합성 평가:\n');
fprintf('다항식 회귀분석 모델을 사용할 경우 %.1f%%의 초기 불확실성이 명확해집니다.\n', correlation_poly.^2 * 100);

fprintf('\n(a)에서 구한 결과와 비교한 결과:\n');
fprintf('다항식 회귀분석 모델이 더 명확합니다.\n');






