fprintf('2020054084 조 은\n');

% 1(a).m

% 예제 함수 정의
f = @(x) 4*x - 1.8*x^2 + 1.2*x^3 - 0.3*x^4;

% 초기 구간 설정
xl = -2;
xu = 4;

% 수렴 조건 설정
es = 0.01; 
maxit = 50;  % 최대 반복 횟수 50으로 설정

% goldmin 함수 호출
[x, fx, ea, iter] = goldmin(f, xl, xu, es, maxit);

% 결과 출력
fprintf('-----------------------------------------------------------\n');
fprintf('최적해 x: %.6f\n', x);
fprintf('최댓값 y: %.6f\n', fx);
fprintf('상대 오차: %.6f%%\n', ea);
fprintf('반복 횟수: %d\n', iter);

function [x, fx, ea, iter] = goldmin(f, xl, xu, es, maxit, varargin)
    if nargin < 3
        error('At least 3 input arguments required');
    end
    
    if nargin < 4 || isempty(es)
        es = 0.0001;
    end
    
    if nargin < 5 || isempty(maxit)
        maxit = 50;
    end

    phi = (sqrt(5) - 1) / 2;
    iter = 0;

    fprintf('Iter\t xl\t\t f(xl)\t\t x2\t\t f(x2)\t\t x1\t\t f(x1)\t\t xu\t\t f(xu)\t\t d\n');
    fprintf('----------------------------------------------------------------------------------\n');

    while true
        d = phi * (xu - xl);
        x1 = xl + d;
        x2 = xu - d;

        f_xl = f(xl, varargin{:});
        f_x2 = f(x2, varargin{:});
        f_x1 = f(x1, varargin{:});
        f_xu = f(xu, varargin{:});

        fprintf('%d\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', iter, xl, f_xl, x2, f_x2, x1, f_x1, xu, f_xu, d);

        if f_x1 > f_x2
            xopt = x1;
            xl = x2;
        else
            xopt = x2;
            xu = x1;
        end

        iter = iter + 1;

        if xopt ~= 0
            ea = (1 - phi) * abs((xu - xl) / xopt);
        end

        if ea <= es || iter >= maxit
            break;
        end
    end

    x = xopt;
    fx = f(xopt, varargin{:});
end