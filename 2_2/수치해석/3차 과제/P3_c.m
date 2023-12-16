fprintf('2020054084 조 은\n\n');

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
disp('기본 최적 유틸리티:');
disp(optimalUtility);


% 최적화할 목적 함수의 계수
utilityCoefficients = [150, 175, 250];

% 제약 조건의 계수 행렬
conditionCoefficients = [
    10, 8, 12;
    1, 0, 0;
    0, 1, 0;
    0, 0, 1
];

% 제약 조건의 상수 벡터
limits = [80; 9; 6; 5];

% 시작 벡터 (선택 사항, 필요에 따라 빈 배열로 둘 수 있음)
startingBase = [];

% 최적화 함수 호출
[optimalSolution, optimalUtility, iterations] = simplexMethod(conditionCoefficients, limits, utilityCoefficients, true, startingBase);

% 결과 출력
disp('원료 증가 최적 유틸리티:');
disp(optimalUtility);
a = optimalUtility;

% 최적화할 목적 함수의 계수
utilityCoefficients = [150, 175, 250];

% 제약 조건의 계수 행렬
conditionCoefficients = [
    7, 11, 15;
    10, 8, 12
];

% 제약 조건의 상수 벡터
limits = [154; 80];

% 시작 벡터 (선택 사항, 필요에 따라 빈 배열로 둘 수 있음)
startingBase = [];

% 최적화 함수 호출
[optimalSolution, optimalUtility, iterations] = simplexMethod(conditionCoefficients, limits, utilityCoefficients, true, startingBase);

% 결과 출력
disp('저장량 증가 최적 유틸리티:');
disp(optimalUtility);
b = optimalUtility;

% 최적화할 목적 함수의 계수
utilityCoefficients = [150, 175, 250];

% 제약 조건의 계수 행렬
conditionCoefficients = [
    7, 11, 15;
    1, 0, 0;
    0, 1, 0;
    0, 0, 1
];

% 제약 조건의 상수 벡터
limits = [154; 9; 6; 5];

% 시작 벡터 (선택 사항, 필요에 따라 빈 배열로 둘 수 있음)
startingBase = [];

% 최적화 함수 호출
[optimalSolution, optimalUtility, iterations] = simplexMethod(conditionCoefficients, limits, utilityCoefficients, true, startingBase);

% 결과 출력
disp('생산 시간 증가 최적 유틸리티:');
disp(optimalUtility);
c = optimalUtility;

maxValue = max([a, b, c]);

% 결과 출력
if maxValue == a
    fprintf('원료 증가가 가장 많은 이윤을 남길 수 있습니다.\n');
elseif maxValue == b
    fprintf('저장량 증가가 가장 많은 이윤을 남길 수 있습니다.\n');
else
    fprintf('생산시간 증가가 가장 많은 이윤을 남길 수 있습니다.\n');
end

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
          
        if isnan(pivot), return; end                                             
        base(pivot(1)) = pivot(2);                                              
        tableau = changeBase(tableau, pivot);                                 
    end
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
