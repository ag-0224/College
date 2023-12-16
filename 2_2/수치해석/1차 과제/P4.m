clear

% function 
f = @(x) 25*x^3-6*x^2+7*x-88; 

% true value 
true_val = f(2.5)

% function derivations 
df = matlabFunction(diff(sym(f))); 
ddf = matlabFunction(diff(sym(f),2)); 
dddf = matlabFunction(diff(sym(f),3));

% step 
h = 2.5-1; 

% zero order 
f_0 = f(1); 
error_t_0 = abs((true_val - f_0)/true_val)*100; 
fprintf('\nFor zero-order approximation the value is: %.4f\n', f_0) 
fprintf('while the true error is %.8f%%.\n',error_t_0) 

% first order 
f_1 = f(1) + df(1)*h; 
error_t_1 = abs((true_val - f_1)/true_val)*100;

fprintf('\nFor first-order approximation the value is: %.4f\n', f_1) 
fprintf('while the true error is %.8f%%.\n',error_t_1) 

% second order 
f_2 = f(1) + df(1)*h + ddf(1)/factorial(2)*h^2; 
error_t_2 = abs((true_val - f_2)/true_val)*100; 
fprintf('\nFor second-order approximation the value is: %.4f\n', f_2) 
fprintf('while the true error is %.8f%%.\n',error_t_2) 

% third order 
f_3 = f(1) + df(1)*h + ddf(1)/factorial(2)*h^2 + dddf()/factorial(3)*h^3; 
error_t_3 = abs((true_val - f_3)/true_val)*100; 
fprintf('\nFor third-order approximation the value is: %.4f\n', f_3) 
fprintf('while the true error is %.8f%%.\n',error_t_3) 