fprintf('2020054084 조은\n\n');

% 주어진 함수
fun = @(x) 1 - exp(-x);

% 적분 구간 설정
a = 0;
b = 3;

% (a) 해석적 적분 계산
analytical_result = integral(fun, a, b);

% (b) 단일 적용 사다리꼴 공식
trapezoidal_single = (b - a) * (fun(a) + fun(b)) / 2;
trapezoidal_single_error = abs((trapezoidal_single - analytical_result) / analytical_result) * 100;

% (c1) 합성 사다리꼴 공식 (n = 2)
n = 2;
h = (b - a) / n;
trapezoidal_composite_n2 = h * (fun(a) + 2 * fun((a + b) / 2) + fun(b)) / 2;
trapezoidal_composite_n2_error = abs((trapezoidal_composite_n2 - analytical_result) / analytical_result) * 100;

% (c2) 합성 사다리꼴 공식 (n = 4)
n = 4;
h = (b - a) / n;
trapezoidal_composite_n4 = h * (fun(a) + 2 * (fun(a + h) + fun(a + 2 * h) + fun(a + 3 * h)) + fun(b)) / 2;
trapezoidal_composite_n4_error = abs((trapezoidal_composite_n4 - analytical_result) / analytical_result) * 100;

% (d) 단일 적용 Simpson 1/3 공식
simpson13_single = (b - a) * (fun(a) + 4 * fun((a + b) / 2) + fun(b)) / 6;
simpson13_single_error = abs((simpson13_single - analytical_result) / analytical_result) * 100;

% (e) 합성 Simpson 1/3 공식 (n = 4)
n = 4;
h = (b - a) / n;
simpson13_composite_n4 = h * (fun(a) + 4 * (fun(a + h) + fun(a + 3 * h)) + 2 * fun(a + 2 * h) + fun(b)) / 3;
simpson13_composite_n4_error = abs((simpson13_composite_n4 - analytical_result) / analytical_result) * 100;

% (f) 단일 적용 Simpson 3/8 공식
simpson38_single = (b - a) * (fun(a) + 3 * fun((2 * a + b) / 3) + 3 * fun((a + 2 * b) / 3) + fun(b)) / 8;
simpson38_single_error = abs((simpson38_single - analytical_result) / analytical_result) * 100;

% (g) 합성 Simpson 3/8 공식 (n = 5)
n = 5;
h = (b - a) / n;
simpson38_composite_n5_I1 = (2 * h - a) * (fun(a) + 4 * fun(a + h) + fun(a + 2 * h)) / 6;
simpson38_composite_n5_I2 = (b - 2 * h) * (fun(a + 2 * h) + 4 * (fun(a + 3 * h) + fun(a + 4 * h)) + fun(b)) / 8;
simpson38_composite_n5 = simpson38_composite_n5_I1 + simpson38_composite_n5_I2;
simpson38_composite_n5_error = abs((simpson38_composite_n5 - analytical_result) / analytical_result) * 100;

% 결과 출력
disp(['(a) 해석적 적분 결과: ', num2str(analytical_result)]);
disp(['(b) 단일 적용 사다리꼴 공식 결과: ', num2str(trapezoidal_single), ', 상대 오차: ', num2str(trapezoidal_single_error), '%']);
disp(['(c1) 합성 사다리꼴 공식 (n = 2) 결과: ', num2str(trapezoidal_composite_n2), ', 상대 오차: ', num2str(trapezoidal_composite_n2_error), '%']);
disp(['(c2) 합성 사다리꼴 공식 (n = 4) 결과: ', num2str(trapezoidal_composite_n4), ', 상대 오차: ', num2str(trapezoidal_composite_n4_error), '%']);
disp(['(d) 단일 적용 Simpson 1/3 공식 결과: ', num2str(simpson13_single), ', 상대 오차: ', num2str(simpson13_single_error), '%']);
disp(['(e) 합성 Simpson 1/3 공식 (n = 4) 결과: ', num2str(simpson13_composite_n4), ', 상대 오차: ', num2str(simpson13_composite_n4_error), '%']);
disp(['(f) 단일 적용 Simpson 3/8 공식 결과: ', num2str(simpson38_single), ', 상대 오차: ', num2str(simpson38_single_error), '%']);
disp(['(g) 합성 Simpson 3/8 공식 (n = 5) 결과: ', num2str(simpson38_composite_n5), ', 상대 오차: ', num2str(simpson38_composite_n5_error), '%']);
