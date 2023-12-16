fprintf('2020054084 조 은\n');

% 최적화할 목적 함수의 계수
utilityCoefficients = [150, 175, 250];

% 제약 조건의 계수 행렬
conditionCoefficients = [
    7, 11, 15;
    10, 8, 12;
    1, 0, 0;
    0, 1, 0;
    0, 0, 1
];

% 제약 조건의 상수 벡터
limits = [154; 80; 9; 6; 5];

% 시작 벡터 (선택 사항, 필요에 따라 빈 배열로 둘 수 있음)
startingBase = [];

% 최적화 함수 호출
[optimalSolution, optimalUtility, iterations] = simplexMethod(conditionCoefficients, limits, utilityCoefficients, true, startingBase);

% 결과 출력
disp('최적해:');
disp(optimalSolution);
disp('최적 유틸리티:');
disp(optimalUtility);
disp('반복 횟수:');
disp(iterations);

function [optimalSolution, optimalUtility, iterations] = simplexMethod(conditionCoefficients, limits, utilityCoefficients, info, startingBase)

[tableau, defaultBase] = setUpTableau(conditionCoefficients, limits, utilityCoefficients);
if (nargin==5)                                                             
    tableau = checkValidity(tableau,startingBase);                         
    if isnan(tableau), return; end
    base = startingBase;
else
    base = defaultBase;                                                   
end
iterations = 0;
while true
    iterations = iterations + 1;
    pivot = getNewPivot(tableau);                                         
    [optimalSolution, optimalUtility] = getParameterValues(tableau, base);                  
    if info
        fprintf('Iteration %d:\n', iterations);
        fprintf('Current solution: %s \n', mat2str(optimalSolution));
        fprintf('Utility: %f \n', optimalUtility);
        disp('Tableau:');
        dispTableau(tableau);
    end  
    if isnan(pivot), return; end                                             
    base(pivot(1)) = pivot(2);                                              
    tableau = changeBase(tableau, pivot);                                 
end
end

function dispTableau(tableau)
    % 테이블의 각 열에 대한 비율 출력
    fprintf('%10s %10s %10s %10s %10s %10s %10s %10s %10s %10s\n', 'f(x, y, z)', 'x', 'y', 'z', 's1', 's2', 's3', 's4', 's5', 'Solution');

    % 마지막 행 출력
    fprintf('%10.2f ', tableau(end, end-1));
    for j = 1:size(tableau, 2)-2
        fprintf('%10.2f ', -tableau(end, j));
    end
    fprintf('%10.2f ', -tableau(end, end));
    fprintf('\n');

    % 나머지 행 출력
    for i = 1:size(tableau, 1)-1
        fprintf('%10.2f ', tableau(i, end-1));
        for j = 1:size(tableau, 2)-2
            fprintf('%10.2f ', tableau(i, j));
        end
        fprintf('%10.2f ', tableau(i, end));
        fprintf('\n');
    end

    fprintf('------------------------\n');
end


function [parameterValues, utility] = getParameterValues(tableau, base)

numberOfParameters = size(tableau,2)-2-length(base);
parameterValues = zeros(numberOfParameters,1);
for column = 1:numberOfParameters
    row = find(base==column);
    if isempty(row)
        parameterValues(column) = 0;
    else
        parameterValues(column) = tableau(row,end);
    end
end
utility = -tableau(end,end);
end

function tableau = checkValidity(tableau, startingBase)

if length(unique(startingBase))==length(startingBase)
    for i = 1:length(startingBase)
        tableau = changeBase(tableau, [i startingBase(i)]);               
    end
    for i = 1:size(tableau,1)-1
        if (isnan(tableau(i,end))||tableau(i,end)<0)                       
            disp(tableau)
            disp('Invalid base')
            tableau = nan;return;
        end
    end
end
end

function tableau = changeBase(tableau, pivot)

pivotRow = pivot(1);
pivotColumn = pivot(2);

tableau(pivotRow,:) = tableau(pivotRow,:)/tableau(pivotRow,pivotColumn);   
for i = 1:size(tableau,1)
   if i ~= pivotRow 
       tableau(i,:) = tableau(i,:)- tableau(i,pivotColumn)*tableau(pivotRow,:);
   end
end
end

function pivot = getNewPivot(tableau)

pivot = 0;
while pivot==0                                                             
    [candidateColumnShadowCost,candidateColumnIndex] = max(tableau(end,1:end-2));
    if (candidateColumnShadowCost>0)                                      
        columnIndex = candidateColumnIndex;
        column = tableau(1:end-1,columnIndex);
        limits = tableau(1:end-1,end);
        rowIndex = minPos(limits./column);
        isError = checkPosZero(column, tableau(1:end-1,end));
        if isnan(rowIndex)||isError                                        
            tableau(end,columnIndex)=-Inf;
        else
            pivot = [rowIndex columnIndex];                               
        end
    else
        disp('No further improvements possible:')                        
        pivot = nan;
    end
end

end

function [tableau, defaultBase] = setUpTableau(conditionCoefficients, limits, utilityCoefficients)

numberOfConditions = size(conditionCoefficients,1);
numberOfParameters = size(conditionCoefficients,2);

slackAndUtility = eye(numberOfConditions+1);                              
tableau = [[[conditionCoefficients;utilityCoefficients] slackAndUtility] [limits;0]];       

defaultBase = numberOfParameters+1:numberOfParameters+numberOfConditions;  
end

function I = minPos(vector)

[vector,oriIndi] = sort(vector);
for i = 1:length(vector)
    if vector(i)>0
        I=oriIndi(i);return;
    end
end
I = nan;
end

function isError = checkPosZero(column, b)

for i = 1:length(column)
    if (column(i)>0)&&(b(i)==0)
        isError = 1;
        return;
    end
    isError = 0;
end

end