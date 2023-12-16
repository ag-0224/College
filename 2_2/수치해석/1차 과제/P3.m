% set x value and n number of terms 
x = 0.25 * pi; 
i = 0; 

% compute approximation 

ax = 0; 

while i < 10
    i = i + 1; 
    % compute term approximation 
    % determine the sign
    pre_ax = ax;

    if mod(i,2) 
        ax = ax + x^(2 * i - 1) / (2 * i - 1); 
    else 
        ax = ax - x^(2 * i - 1) / (2 * i - 1); 
    end 
    % print approximation 
    fprintf('\nFor number of terms: %d',i-1) 
    fprintf('\nThe arctan(x) approximation is: %.10f',ax)
    fprintf('\nThe arctan(x) pre_approximation is: %.10f',pre_ax)
    fprintf('\nThe true value is: %.8f',atan(x)) 

    % copute and print error 
    error = (atan(x) - ax) / atan(x) * 100;
    error2 = (ax - pre_ax) / ax * 100;
    fprintf('\nThe t_error is: %e',abs(error))
    fprintf('\nThe a_error is: %e\n', abs(error2))

end 

fprintf('\nThe number of terms necessary to approximate')
fprintf('\narctan(0.25*pi) to 8 significant digits is %d.\n',i)