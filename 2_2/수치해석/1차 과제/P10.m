clear close all

% set function and initial conditions
fn = @(x) exp(-0.5*x).*(4-x)-2;

% New Raphson method (initial value = 2)

figure 
fplot(fn, [0,10]) 
xlabel('x') 
ylabel('f(x)') 
title('Newton Raphson METHOD initial value = 2') 
grid on 
hold on 
legend('Function')

% compute derivation of fn
syms x

dfn = matlabFunction(diff(fn, x));

% initialization 
xi = 2;
i = 1;
error_a = 100; 

fprintf('\nNewton Raphson METHOD initial value = 2\n')

while error_a >= 1
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
    i = i + 1;
end

% New Raphson method (initial value = 6)

figure 
fplot(fn, [0,10]) 
xlabel('x') 
ylabel('f(x)') 
title('Newton Raphson METHOD initial value = 6') 
grid on 
hold on 
legend('Function')

% compute derivation of fn
syms x

dfn = matlabFunction(diff(fn, x));

% initialization 
xi = 6;
i = 1;
error_a = 100; 

fprintf('\nNewton Raphson METHOD initial value = 6\n')

while error_a >= 10
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
    i = i + 1;
end

% New Raphson method (initial value = 8)

figure 
fplot(fn, [0,10]) 
xlabel('x') 
ylabel('f(x)') 
title('Newton Raphson METHOD initial value = 8') 
grid on 
hold on 
legend('Function')

% compute derivation of fn
syms x

dfn = matlabFunction(diff(fn, x));

% initialization 
xi = 8;
i = 1;
error_a = 100; 

fprintf('\nNewton Raphson METHOD initial value = 8\n')

while error_a >= 10
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
    i = i + 1;
end