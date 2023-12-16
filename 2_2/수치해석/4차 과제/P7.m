fprintf('2020054084 조은\n\n');

% 주어진 함수
fun = @(x) x.^2 .* exp(x);

% 적분 구간 설정
a = 0;
b = 3;

% 해석적 적분 계산
analytical_result = integral(fun, a, b);

% 수치 적분 - 사다리꼴 공식
n = 4; % 하위 구간 수
h = (b - a) / n;
x_values = a:h:b;

trapezoidal_result = (h / 2) * (fun(a) + 2 * sum(fun(x_values(2:end-1))) + fun(b));

% 수치 적분 - Simpson 1/3 공식
if mod(n, 2) == 0
    simpson_result = (h / 3) * (fun(a) + 4 * sum(fun(x_values(2:2:end-1))) + 2 * sum(fun(x_values(3:2:end-2))) + fun(b));
else
    simpson_result = NaN; % Simpson 1/3 공식은 홀수 구간에 대해 정의되지 않음
end

% 백분율 상대 오차 계산
trapezoidal_error = abs((trapezoidal_result - analytical_result) / analytical_result) * 100;
simpson_error = abs((simpson_result - analytical_result) / analytical_result) * 100;
composite_error = abs((composite_result - analytical_result) / analytical_result) * 100;

% 결과 출력
disp(['해석적인 방법 적분 결과: ', num2str(analytical_result)]);
disp(['사다리꼴 공식 수치 적분 결과: ', num2str(trapezoidal_result), ', 상대 오차: ', num2str(trapezoidal_error), '%']);
disp(['Simpson 1/3 공식 수치 적분 결과: ', num2str(simpson_result), ', 상대 오차: ', num2str(simpson_error), '%']);
