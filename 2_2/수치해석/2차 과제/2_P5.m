
A = [10, 2, -1; -3, -6, 2; 1, 1, 5];
b = [22; -14; 14];
relativeTol = 0.05;  % 5% 상대 오차
maxIter = 100;

x = gaussSeidelWithRelativeError(A, b, relativeTol, maxIter);
disp('해:');
disp(x);

% Gauss-Seidel
function x = gaussSeidelWithRelativeError(A, b, relativeTol, maxIter)
    % A: 계수 행렬
    % b: 상수 벡터
    % relativeTol: 허용 상대 오차 (예: 0.05는 5%를 나타냅니다.)
    % maxIter: 최대 반복 횟수
    
    % 초기값
    x = zeros(size(b));
    
    % 반복 횟수
    iter = 0;
    
    while iter < maxIter
        xPrev = x;
        for i = 1:length(x)
            x(i) = (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:end) * xPrev(i+1:end)) / A(i, i);
        end
        
        fprintf('반복 %d: [x1, x2, x3] = [%f, %f, %f]\n', iter, x(1), x(2), x(3));
        
        % 각 변수 x1, x2, x3에 대한 상대 오차 계산
        relativeErrorX1 = abs((x(1) - xPrev(1)) / x(1));
        relativeErrorX2 = abs((x(2) - xPrev(2)) / x(2));
        relativeErrorX3 = abs((x(3) - xPrev(3)) / x(3));
        
        fprintf('상대 오차 (x1, x2, x3): [%e, %e, %e]\n', relativeErrorX1, relativeErrorX2, relativeErrorX3);
        
        if relativeErrorX1 < relativeTol && relativeErrorX2 < relativeTol && relativeErrorX3 < relativeTol
            fprintf('Gauss-Seidel (반복 횟수: %d)\n', iter);
            return;
        end
        
        iter = iter + 1;
    end
    
    fprintf('최대 반복 횟수 동안 수렴하지 않음\n');
end