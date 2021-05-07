% Function to solve the linear system Ax = b by
% performing Gaussian Elimination 
function [x] = GaussianElim(A, b)
    % returns the solution of Ax = b
    n = length(b);
    for i = 1:n-1
       % Elimination steps
       for j = i+1:n
            A(j, i+1:end)  =  A(j, i+1:end) - (A(j, i)/A(i, i))*A(i, i+1:end);
            b(j) = b(j) - A(j, i)/A(i, i)*b(i);
                
       end  
       A(i+1:end, i) = 0;
    % At this point A is an upper-triangular matrix   
    end
    
    % Substitution steps to find the value of x
    for i = n:-1:1
       b(i) = (b(i)-A(i, i+1:end)*b(i+1:end))/A(i, i); 
    end
    x=b;
end