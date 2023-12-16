fprintf('2020054084 조은\n\n');

% 주어진 함수
f = @(x) x .* exp(2*x);

% 2점 Gauss-Legendre 적분
x2 = [-sqrt(3)/3, sqrt(3)/3];
integral_2 = (3/2) * sum(f(3/2 * x2 + 3/2));

% 3점 Gauss-Legendre 적분
x3 = [-sqrt(3/5), 0, sqrt(3/5)];
w3 = [5/9, 8/9, 5/9];
integral_3 = (3/2) * sum(w3 .* f(3/2 * x3 + 3/2));

% 4점 Gauss-Legendre 적분
w41 = (18 + sqrt(30)) / 36;
w42 = (18 - sqrt(30)) / 36;
x4 = [-sqrt(3/7 + 2/7*sqrt(6/5)), -sqrt(3/7 - 2/7*sqrt(6/5)), sqrt(3/7 - 2/7*sqrt(6/5)), sqrt(3/7 + 2/7*sqrt(6/5))];
w4 = [w42, w41, w41, w42];
integral_4 = (3/2) * sum(w4 .* f(3/2 * x4 + 3/2));

% 정확한 적분값 (해석적 해)
exact_integral = integral(f, 0, 3);

% 각 경우의 적분 오차 계산
epsilon_2 = abs(exact_integral - integral_2) / exact_integral * 100;
epsilon_3 = abs(exact_integral - integral_3) / exact_integral * 100;
epsilon_4 = abs(exact_integral - integral_4) / exact_integral * 100;

% 결과 출력
fprintf('2점 Gauss-Legendre 적분값: %.4f, 참 상대 오차: %.5f\n', integral_2, epsilon_2);
fprintf('3점 Gauss-Legendre 적분값: %.4f, 참 상대 오차: %.5f\n', integral_3, epsilon_3);
fprintf('4점 Gauss-Legendre 적분값: %.4f, 참 상대 오차: %.5f\n', integral_4, epsilon_4);














