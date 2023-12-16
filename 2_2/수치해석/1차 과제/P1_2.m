% 입력값 x 정의
x = 5;

% 참값 계산
true_value = exp(-x);

% Maclaurin 급수 근사값 초기화
approx_value = 1;

% 항의 개수 설정
n = 20;

% 참 상대오차 및 근삿값 상대오차 초기화
value = zeros(1, n);
true_relative_error = zeros(1, n);
approx_relative_error = zeros(1, n);

for i = 1:n
    % Maclaurin 급수 항 계산
    term = x^i / factorial(i);
    
    % Maclaurin 급수 근사값 업데이트
    pre_approx_value = approx_value
    approx_value = approx_value + term;

    r_pre_approx_value = 1 / pre_approx_value;
    r_approx_value = 1 / approx_value;

    % 항 계산
    value(i) = 1 / approx_value;

    % 참 상대오차 계산
    true_relative_error(i) = (true_value - r_approx_value) / true_value;
    
    % 근삿값 상대오차 계산
    approx_relative_error(i) = (r_approx_value - r_pre_approx_value) / r_approx_value;
end

% 결과 출력
format shortG;
fprintf('항 계산:\n');
disp(value);

fprintf('참 상대오차:\n');
disp(true_relative_error);

fprintf('근삿값 상대오차:\n');
disp(approx_relative_error);