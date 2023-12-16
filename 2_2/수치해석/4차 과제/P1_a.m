fprintf('2020054084 조은\n');

% 주어진 데이터
x = [1 2 3 4 5 6 7 8 9];
y = [1 1.5 2 3 4 5 8 10 13];

% 최소제곱 회귀분석
coefficients = polyfit(x, y, 1);
slope = coefficients(1);
intercept = coefficients(2);

% 추정값의 표준오차 계산
yFit = polyval(coefficients, x);
residuals = y - yFit;
SE = sqrt(sum(residuals.^2) / (length(x) - 2)); 

% 상관계수 계산 (corrcoef 함수 사용)
correlation_matrix = corrcoef(x, y);
correlation = correlation_matrix(1, 2);

% i, xiyi, xi^2, yi^2 계산
n = length(x);
i = 1:n;
xiyi = x .* y;
xi_square = x.^2;
yi_square = y.^2;

% 결과 출력
fprintf('기울기: %.4f\n', slope);
fprintf('절편: %.4f\n', intercept);
fprintf('추정값의 표준오차 : %.4f\n', SE);
fprintf('상관계수: %.4f\n\n', correlation);

fprintf('%-3s %-5s %-3s %-5s\n', 'i', 'xiyi', 'xi^2', 'yi^2');
fprintf('%-3d %-5d %-3d %-0.2f\n', [i; xiyi; xi_square; yi_square]);

% 각 열의 합 계산 및 출력
sum_iyi = sum(xiyi);
sum_xi_square = sum(xi_square);
sum_yi_square = sum(yi_square);
fprintf('Sum: %-5d %-3d %-5.2f\n', sum_iyi, sum_xi_square, sum_yi_square);

% 그래프 그리기
figure;
plot(x, y, 'o', 'DisplayName', '데이터');
hold on;
plot(x, yFit, '-', 'DisplayName', '최소제곱 회귀직선');
xlabel('x');
ylabel('y');
title('2020054084 조은 - 1(a) 그래프');
legend('Location', 'Best');
grid on;

% 적합성 평가
fprintf('\n적합성 평가:\n');
fprintf('선형 모델을 사용할 경우 %.1f%%의 초기 불확실성이 명확해집니다.\n', correlation.^2 * 100);













