fprintf('2020054084 조 은\n');

% 주어진 함수
f = @(x) 3 + 6*x + 5*x^2 + 3*x^3 + 4*x^4;

% 초기값 설정
x0 = -1;

% 상대오차 설정
epsilon_s = 0.01; % 1%

fprintf('Iter\t x\t\t f''(x)\t\t f''''(x)\t\t 상대오차\n');
fprintf('----------------------------------------------------\n');

iter = 0;

while iter < 100 % 최대 100회까지 반복
    f_x0 = f(x0);

    % 도함수 계산
    df_x0 = 6 + 10*x0 + 9*x0^2 + 16*x0^3;

    % 이계 도함수 계산
    d2f_x0 = 10 + 18*x0 + 48*x0^2;

    % 새로운 점 계산
    if d2f_x0 ~= 0
        x_new = x0 - df_x0 / d2f_x0;
    else
        fprintf('이차 도함수가 0이므로 계산할 수 없습니다.\n');
        break;
    end

    % 상대오차 계산
    ea = abs((x_new - x0) / x_new);

    % 도함수 계산
    df_x_new = 6 + 10*x_new + 9*x_new^2 + 16*x_new^3;

    % 이계 도함수 계산
    d2f_x_new = 10 + 18*x_new + 48*x_new^2;

    fprintf('%d\t %.6f\t %.6f\t %.6f\t %.6f\n', iter, x_new, df_x_new, d2f_x_new, ea);

    % 수렴 조건 확인
    if ea <= epsilon_s
        break;
    end

    % 다음 반복을 위해 새로운 점으로 초기값 설정
    x0 = x_new;
    iter = iter + 1;
end

fprintf('----------------------------------------------------\n');
fprintf('최솟값을 가지는 x: %.6f\n', x_new);
fprintf('최솟값: %.6f\n', f(x_new));
