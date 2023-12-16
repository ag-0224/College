fprintf('2020054084 조은\n\n');

% 함수 정의: f(x) = sin(x)
f = @(x) sin(x);

% 주어진 값
x = pi/4;
h = pi/12;

% 참값 계산
true_value = cos(x);

% 필요한 값 계산
y_i_2 = f(x - 2 * h);
y_i_1 = f(x - h);
y_i = f(x);
y_i1 = f(x + h);
y_i2 = f(x + 2 * h);

% 전진차분 (O(h))
forward_diff = (y_i1 - y_i) / h;
forward_error = abs((forward_diff - true_value) / true_value) * 100;

% 전진 차분 (O(h^2))
forward_diff_2 = (-y_i2 + 4 * y_i1 - 3 * y_i) / (2 * h);
forward_error_2 = abs((forward_diff_2 - true_value) / true_value) * 100;

% 후진차분 (O(h))
backward_diff = (y_i - y_i_1) / h;
backward_error = abs((backward_diff - true_value) / true_value) * 100;

% 후진차분 (O(h^2))
backward_diff_2 = (3 * y_i - 4 * y_i_1 + y_i_2) / (2 * h);
backward_error_2 = abs((backward_diff_2 - true_value) / true_value) * 100;

% 중앙차분 (O(h^2)
central_diff_2 = (y_i1 - y_i_1) / (2 * h);
central_error_2 = abs((central_diff_2 - true_value) / true_value) * 100;

% 중앙차분 (O(h^4)
central_diff_4 = (-y_i2 + 8 * y_i1 - 8 * y_i_1 + y_i_2) / (12 * h);
central_error_4 = abs((central_diff_4 - true_value) / true_value) * 100;

% 결과 출력
disp(['참값: ', num2str(true_value)]);
disp(['전진차분 O(h)근삿값: ', num2str(forward_diff), ', 상대 오차: ', num2str(forward_error), '%']);
disp(['전진차분 O(h^2) 근삿값: ', num2str(forward_diff_2), ', 상대 오차: ', num2str(forward_error_2), '%']);
disp(['후진차분 O(h) 근삿값: ', num2str(backward_diff), ', 상대 오차: ', num2str(backward_error), '%']);
disp(['후진차분 O(h^2) 근삿값: ', num2str(backward_diff_2), ', 상대 오차: ', num2str(backward_error_2), '%']);
disp(['중앙차분 O(h^2) 근삿값: ', num2str(central_diff_2), ', 상대 오차: ', num2str(central_error_2), '%']);
disp(['중앙차분 O(h^4) 근삿값: ', num2str(central_diff_4), ', 상대 오차: ', num2str(central_error_4), '%']);