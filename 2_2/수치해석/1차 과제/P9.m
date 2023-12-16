clear close all

% set function and initial conditions
fn = @(x) 8.*sin(x).*exp(-x)-1;

% graphically
figure
fplot(fn, [0,4])
hold on
grid on
xlabel('x')
ylabel('f(x)')
legend('Function')
title('Real root')

% determine real root 
syms x

solutions = solve(fn, x, 'Real', true);
positive_x = solutions(solutions > 0);
plot(positive_x, fn(positive_x),'o','DisplayName', sprintf('Real root'))

% New Raphson method

figure 
fplot(fn, [0,4]) 
xlabel('x') 
ylabel('f(x)') 
title('New Raphson METHOD') 
grid on 
hold on 
legend('Function')

% compute derivation of fn
dfn = matlabFunction(diff(fn, x));

% initialization 
xi = 0.3;
i = 0;

fprintf('\nNew Raphson METHOD\n')

for i = 1:3
    % calculate and print root and function
    root(i) = xi - fn(xi) / dfn(xi); 
    fprintf('\nFor the %d iteration\n',i) 
    fprintf('x(i) = %.4f, fn(x(i)) = %.4f, dfn(x(i)) = %.4f\n',xi,fn(xi), dfn(xi)) 
    fprintf('x(i+1) = %.4f, f(x(i+1)) = %.4f\n',root(i),fn(root(i))) 

    % calculate and print error 
    error_a = abs((root(i)-xi)/root(i))*100; 
    fprintf('Estimated error is %.4f%%\n', error_a) 

    % plot current root 
    plot(root(i), fn(root(i)),'o','DisplayName',sprintf('Iteration %d',i))
    xi = root(i);
end

% Secant method 
figure 
fplot(fn, [0,4]) 
xlabel('x') 
ylabel('f(x)') 
title('SECANT METHOD') 
grid on 
hold on 
legend('Function')

% initialization 
x0 = 0.5;
x1 = 0.4;
i = 0;

fprintf('\nSECANT METHOD\n')

for i = 1:5
    % calculate and print root and function
    root(i) = (x0 * fn(x1) - x1 * fn(x0)) / (fn(x1) - fn(x0)); 
    fprintf('\nFor the %d iteration\n',i) 
    fprintf('x(i-1) = %.4f, fn(x(i-1)) = %.4f\n', x0, fn(x0))
    fprintf('x(i) = %.4f, fn(x(i)) = %.4f\n', x1, fn(x1))
    fprintf('x(i+1) = %.4f, f(x(i+1)) = %.4f\n',root(i),fn(root(i))) 

    % plot current root 
    plot(root(i), fn(root(i)),'o','DisplayName',sprintf('Iteration %d',i))
    x0 = x1; 
    x1 = root(i); 
end

% Secant method 
figure 
fplot(fn, [0,4]) 
xlabel('x') 
ylabel('f(x)') 
title('Modified SECANT METHOD') 
grid on 
hold on 
legend('Function')

% initialization 
x0 = 0.3;
delta = 0.01;

fprintf('\nMODIFIED SECANT METHOD\n')

for i = 1:3
    % calculate and print root and function
    root(i) = x0 - delta * fn(x0) / (fn(x0 + delta) - fn(x0)); 
    fprintf('\nFor the %d iteration\n',i)
    fprintf('x(i) = %.4f, fn(x(i)) = %.4f\n', x0, fn(x0))
    fprintf('x(i+1) = %.4f, f(x(i+1)) = %.4f\n',root(i),fn(root(i))) 

    % plot current root 
    plot(root(i), fn(root(i)),'o','DisplayName',sprintf('Iteration %d',i))
    x0 = root(i);
end
