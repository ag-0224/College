% 방정식 정의
x = linspace(-10, 15, 100); % 그래프의 x 범위 설정

% 방정식 1: 5x + 2y = 40
y1 = (40 - 5 * x) / 2;
plot(x, y1, 'g', 'LineWidth', 2, 'DisplayName', '5x + 2y = 40');
hold on;

% 방정식 2: 6x + 6y = 60
y2 = (60 - 6 * x) / 6;
plot(x, y2, 'r', 'LineWidth', 2, 'DisplayName', '6x + 6y = 60');

% 방정식 3: 2x + 4y = 32
y3 = (32 - 2 * x) / 4;
plot(x, y3, 'b', 'LineWidth', 2, 'DisplayName', '2x + 4y = 32');

% 최대화 방정식 : 6x + 8y = 72
y4 = (72 - 6 * x) / 8;
plot(x, y4, '--k', 'LineWidth', 2, 'DisplayName', '6x + 8y = 72');

% x축 y축 그리기
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

% 축 레이블과 범례 추가
xlabel('x');
ylabel('y');
title('2020054084 조은 - 5(a) 부등식의 영역');
legend('show');
grid on;

% 계수 행렬 A
A = [2, 4; 6, 6];

% 상수 벡터 B
B = [32; 60];

% 행렬 방정식 풀기
solution = A \ B;

% y1 y2 y3 함수 정의
y1 = @(x) (32 - 2 * x) / 4;
y2 = @(x) (60 - 6 * x) / 6;
y3 = @(x) (40 - 5 * x) / 2;

% 아래 영역 색칠
x_values = linspace(0, solution(1), 100);
area(x_values, y1(x_values), 'FaceColor', [0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.5);

% 계수 행렬 C
C = [6, 6; 5, 2];

% 상수 벡터 D
D = [60; 40];

% 행렬 방정식 풀기
solution2 = C \ D;

x_values = linspace(solution(1), solution2(1), 100);
area(x_values, y2(x_values), 'FaceColor', [0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.5);

x_values = linspace(solution2(1), 40 / 5, 100);
area(x_values, y3(x_values), 'FaceColor', [0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.5);

hold off;