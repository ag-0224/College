clear

% function
f = @(x) 25*x^3-6*x^2+7*x-88;

h = 0.25;

fprintf('f(2+h) is %.8f.\n',f(2+h))
fprintf('f(2) is %.8f.\n',f(2))
fprintf('f(2-h) is %.8f.\n',f(2-h))

result = (f(2+h) - 2 * f(2) + f(2-h)) / (h * h);

fprintf('ddf(2) is %.8f.\n',result)

fprintf('\n')

h = 0.125;

fprintf('f(2+h) is %.8f.\n',f(2+h))
fprintf('f(2) is %.8f.\n',f(2))
fprintf('f(2-h) is %.8f.\n',f(2-h))

result = (f(2+h) - 2 * f(2) + f(2-h)) / (h * h);

fprintf('ddf(2) is %.8f.\n',result)