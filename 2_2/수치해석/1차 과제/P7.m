clear close all 

% set function 

fn =@(x) 4.*x.^3 -6.*x.^2 + 7.*x -2.3;

% bisection method 

% initialization 
xl = 0; 
xu = 1; 
i = 0; 
error_a = 100; 

% plot roots initialization 
figure 
fplot(fn, [xl xu]) 
xlabel('x') 
ylabel('f(x)') 
title('Roots in each iteration') 
grid on 
hold on
legend('Function')

% determine real root
syms x

solutions = solve(fn, x, 'Real', true);
plot(solutions, fn(solutions),'o','DisplayName', sprintf('Real root'))
fprintf('The real root is %.8f\n', solutions)

while error_a >= 10
    i = i+1; 
    % calculate and print root and function 
    xr(i) = (xl+xu)/2; 
    fprintf('\nFor the %d iteration\n',i) 
    fprintf('xl = %.2f, f(xl) = %.2f\n',xl,fn(xl)) 
    fprintf('xu = %.2f, f(xu) = %.2f\n',xu,fn(xu)) 
    fprintf('The root is %.4f\n', xr(i)) 
    fprintf('The function value is %.4f\n',fn(xr(i))) 
    
    % calculate and print error 
    if i == 1 
        % do nothing 
    else 
        error_a = abs((xr(i)-xr(i-1))/xr(i))*100; 
        fprintf('Estimated error is %.2f%%\n', error_a) 
    end 
    
    % plot current root 
    plot(xr(i), fn(xr(i)),'o','DisplayName',sprintf('Iteration %d',i)) 
    
    % change interval borders with the new root 
    if fn(xl)*fn(xr(i)) > 0 
        xl = xr(i); 
    else 
        xu = xr(i); 
    end 

end