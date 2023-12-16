fprintf('2020054084 조은\n');

% Power equation (멱방정식)
x = [0.75, 2, 3, 4, 6, 8, 8.5];
y = [1.2, 1.95, 2, 2.4, 2.5, 2.7, 2.6];

n = length(x);
x_log = log10(x);
y_log = log10(y);
sum_log_x = sum(x_log);
sum_log_y = sum(y_log);
sum_log_xy = sum(x_log .* y_log);
sum_log_x_sq = sum(x_log.^2);

a1 = (n * sum_log_xy - sum_log_x * sum_log_y) / (n * sum_log_x_sq - sum_log_x^2);

a0 = sum_log_y / n - a1 * sum_log_x / n;
alpha = 10^a0;
beta = a1;

f_ex = @(alpha, beta, x) alpha * x.^beta;

x_new = linspace(0, 10, 100);
y_new = f_ex(alpha, beta, x_new);

% 그래프 그리기
figure;
plot(x, y, 'ro', 'DisplayName', '원본 데이터');
hold on;
plot(x_new, y_new, 'k-', 'DisplayName', 'y = ax^b');
xlabel('X');
ylabel('Y');
title('2020054084 조은 - 2(b) 멱방정식 그래프');
legend('Location', 'Best');
grid on;

% xiyi, xi^2 계산
xiyi = x_log .* y_log;
xi_square = x_log.^2;

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

% 멱방정식 모델 식 출력
fprintf('\n멱방정식 모델 식:\n');
fprintf('y = %.4f * x^%.4f\n', alpha, beta);


