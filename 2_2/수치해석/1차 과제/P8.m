clear close all 

% set function 
fn = @(x) 0.7 - log(x.^4); 
 
% bisection method 
fprintf('BISECTION METHOD\n') 

% initialization 
xl = 0.5; 
xu = 2; 

% plot roots initialization 
figure 
fplot(fn, [xl xu]) 
xlabel('x') 
ylabel('f(x)') 
title('BISECTION METHOD') 
grid on 
hold on 
legend('Function') 

% determine real root 
syms x

solutions = solve(fn, x, 'Real', true);
positive_x = solutions(solutions > 0);
plot(positive_x, fn(positive_x),'o','DisplayName', sprintf('Real root'))

for i = 1:3 
    % calculate and print root and function 
    xr(i) = (xl+xu)/2; 
    fprintf('\nFor the %d iteration\n',i) 
    fprintf('xl = %.2f, f(xl) = %.2f\n',xl,fn(xl)) 
    fprintf('xu = %.2f, f(xu) = %.2f\n',xu,fn(xu)) 
    fprintf('The root is %.4f\n', xr(i)) 
    fprintf('The function value is %.4f\n',fn(xr(i))) % calculate and print error 
    % plot current root 
    plot(xr(i), fn(xr(i)),'o','DisplayName',sprintf('Iteration %d',i)) % change interval borders with the new root 
    if fn(xl)*fn(xr(i)) > 0 xl = xr(i); 
    else xu = xr(i); 
    end 
end 

% c) false position method 
fprintf('\nFALSE POSITION METHOD\n') 

% initialization 
xl = 0.5; 
xu = 2; 
% plot roots initialization 
figure 
fplot(fn,[xl, xu]) 
xlabel('x') 
ylabel('f(x)') 
title('FALSE POSITION') 
grid on 
hold on 
legend('Function')
% determine real root 
syms x

solutions = solve(fn, x, 'Real', true);
positive_x = solutions(solutions > 0);
plot(positive_x, fn(positive_x),'o','DisplayName', sprintf('Real root'))

% false-position method 
for i = 1:3 
    % calculate and print root and function 
    xr(i) = xu - (fn(xu)*(xl-xu))/(fn(xl)-fn(xu));
    fprintf('\nFor the %d iteration\n',i)
    fprintf('xl = %.2f, f(xl) = %.2f\n',xl,fn(xl)) 
    fprintf('xu = %.2f, f(xu) = %.2f\n',xu,fn(xu)) 
    fprintf('The root is %.4f\n', xr(i)) 
    fprintf('The function value is %.4f\n',fn(xr(i))) % calculate and print error 
    % plot current root 
    plot(xr(i), fn(xr(i)),'o','DisplayName',sprintf('Iteration %d',i)) % change interval borders with the new root 
    if sign(fn(xr(i))) == sign(fn(xl)) xl = xr(i); 
    else xu = xr(i); 
    end 
end