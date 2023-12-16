% set x value and n number of terms 
x = 0.3*pi; 
i = 0; 

% compute approximation 

sx = 0; 

while round(sin(x),8) ~= round(sx,8) 
    i = i + 1; 
    % compute term approximation 
    % determine the sign 
    if mod(i,2) 
        sx = sx + x^(2*i-1)/factorial(2*i-1); 
    else 
        sx = sx - x^(2*i-1)/factorial(2*i-1); 
    end 
    % print approximation 
    fprintf('\nFor number of terms: %d',i) 
    fprintf('\nThe sin(x) approximation is: %.10f',sx) 
    fprintf('\nThe true value is: %.8f',sin(0.3*pi)) 

    % copute and print error 
    error = (sin(x) - sx)/sin(x)*100; 
    fprintf('\nThe error is: %e\n',error) 

end 

fprintf('\nThe number of terms necessary to approximate')
fprintf('\nsin(0.3*pi) to 8 significant digits is %d.\n',i)