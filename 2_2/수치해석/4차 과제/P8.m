fprintf('2020054084 조은\n');

syms x;

% 주어진 함수
fun = @(x) x .* exp(2*x);

% 적분 구간
a = 0;
b = 3;

% Richardson 적분
[I, steps] = rich(fun, a, b, 5);

% 참값 계산 (적분값의 정확한 값)
true_value = integral(fun, a, b);

% 근사 오차 및 전체 오차 계산
epsilon_a = abs(true_value - I);
epsilon_t = abs(true_value - I) / abs(true_value);

% 결과 및 과정 출력
fprintf('적분값: %.6f\n', I);
fprintf('참값: %.6f\n', true_value);
fprintf('근사 오차 (εa): %.6e\n', epsilon_a);
fprintf('전체 오차 (εt): %.6e\n', epsilon_t);
fprintf('근사 오차가 전체 오차보다 크다.\n')

% Romberg Algorithm iterations
function [r, ma] = rich(func, a, b, max)
    n = 1;
    ma(1,1) = trap(func, a, b, n);
    iter = 0;
    fprintf('R(%d,1): %.6f\n', iter, ma(1,1));
    
    while iter < max
        iter = iter + 1;
        n = 2^iter;
        ma(iter+1,1) = trap(func, a, b, n);
        fprintf('R(%d,1): %.6f\n', iter, ma(iter+1,1));
        
        for k = 2:iter+1
            i = iter - k + 2;
            ma(i,k) = (4^(k-1) * ma(i+1,k-1) - ma(i,k-1)) / (4^(k-1) - 1);
            fprintf('R(%d,%d): %.6f\n', iter, k, ma(i,k));
        end
    end
    
    r = ma(1, iter+1);
end

function t = trap(func, a, b, n)
    h = (b - a) / n;
    x = a + h: h: b - h;
    t = (h / 2) * (func(a) + func(b) + 2 * sum(func(x)));
end



