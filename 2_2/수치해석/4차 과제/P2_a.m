fprintf('2020054084 조은\n');

% 포화 성장률 모델 (Saturation-growth-rate equation)
% 데이터 (x, y)에 대한 적합

clear; % 작업 환경 초기화

x = [0.75, 2, 3, 4, 6, 8, 8.5];
y = [1.2, 1.95, 2, 2.4, 2.5, 2.7, 2.6];

n = length(x);
y_in = 1./y;
x_in = 1./x;
sum_x_in = sum(x_in);
sum_y_in = sum(y_in);
sum_xy_in = sum(x_in .* y_in);
sum_x_in_sq = sum(x_in.^2);

a1 = (n * sum_xy_in - sum_x_in * sum_y_in) / (n * sum_x_in_sq - sum_x_in^2);

a0 = sum_y_in / n - a1 * sum_x_in / n;
alpha = 1 / a0;
beta = a1 / a0;

f_ex = @(alpha, beta, x) alpha * x ./ (beta + x);

x_new = linspace(0, 10, 100);
y_new = f_ex(alpha, beta, x_new);

% 그래프 그리기
figure;
plot(x, y, 'ro', 'DisplayName', '원본 데이터');
hold on;
plot(x_new, y_new, 'k-', 'DisplayName', 'y = alpha * x / (beta + x)');
xlabel('X');
ylabel('Y');
title('2020054084 조은 2(a) 포화 성장률 모델 그래프');
legend('Location', 'Best');
grid on;

% xiyi, xi^2 출력
xiyi = x_in .* y_in;
xi_square = x_in.^2;

% 결과 출력
fprintf('\n');
fprintf('a1 : %.4f\n', a1);
fprintf('a0 : %.4f\n', a0);
fprintf('alpha: %.4f\n', alpha);
fprintf('beta: %.4f\n', beta);

fprintf('\n');
fprintf('%-5s %-10s %-10s\n', 'i', 'xiyi', 'xi^2');
for i = 1:n
    fprintf('%-5d %-10.4f %-10.4f\n', i, xiyi(i), xi_square(i));
end

% 각 열의 합 계산 및 출력
sum_xiyi = sum(xiyi);
sum_xi_square = sum(xi_square);
fprintf('Sum:   %-10.4f %-10.4f\n', sum_xiyi, sum_xi_square);

% 포화 성장률 모델 식 출력
fprintf('\n포화 성장률 모델 식:\n');
fprintf('y = %.4f * x / (%.4f + x)\n', alpha, beta);


