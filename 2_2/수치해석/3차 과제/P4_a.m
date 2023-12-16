% 방정식 정의
x = linspace(-10, 10, 100); % 그래프의 x 범위 설정

% 방정식 1: 1.2x + 2.25y = 14 
y1 = (14 - 1.2 * x) / 2.25;
plot(x, y1, 'g', 'LineWidth', 2, 'DisplayName', '1.2x + 2.25y = 14');
hold on;

% 방정식 2: x + 1.1y = 8 
y2 = (8 - x) / 1.1;
plot(x, y2, 'r', 'LineWidth', 2, 'DisplayName', 'x + 1.1y = 8');

% 방정식 3: 2.5x + y = 9 
y3 = 9 - 2.5 * x;
plot(x, y3, 'b', 'LineWidth', 2, 'DisplayName', '2.5x + y = 9');

% 최대화 방정식 : 1.75x + 1.25y = 9.3079  
y4 = (9.3079 - 1.75 * x) / 1.25;
plot(x, y4, '--k', 'LineWidth', 2, 'DisplayName', '1.75x + 1.25y = 9.3079');

% x축 y축 그리기
ax = gca
ax.XAxisLocation = 'origin'
ax.YAxisLocation = 'origin'

% 축 레이블과 범례 추가
xlabel('x');
ylabel('y');
legend('show');
grid on;
title('2020054084 조은 - 4(a) 부등식의 영역');

% 계수 행렬 A
A = [1.2, 2.25; 2.5, 1];

% 상수 벡터 B
B = [14; 9];

% 행렬 방정식 풀기
solution = A \ B;

% y1 y3 함수 정의
y1 = @(x) (14 - 1.2*x) / 2.25;
y3 = @(x) 9 - 2.5 * x;

% 아래 영역 색칠
x_values = linspace(0, solution(1), 100);
area(x_values, y1(x_values), 'FaceColor', [0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.5);

x_values = linspace(solution(1), 9 / 2.5, 100);
area(x_values, y3(x_values), 'FaceColor', [0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.5);

hold off;


