% Program to visualise the Bernstein appromixation to the Runge function 

syms x; %symbolic variable for interpolant function
N = 100;
x_runge = linspace(-1, 1, 100);
x_bern = linspace(-1, 1, N+1);  % Nodes for the interpolant

y_runge = runge(x_runge);

bern = 0;

for i = 0:N
    % Bernstein appromixation function expression
    bern = bern + nchoosek(N, i) * x^i * (1-x)^(N-i) * runge(i/N);
end
bern = matlabFunction(bern);

%visualisation
figure;
hold on;
plot(x_runge, y_runge)
plot(x_bern, bern(x_bern), 'ro')
plot(x_runge, bern(x_runge))
legend('runge', 'bern points', 'bern func')

% Function to perform the Runge function
function res = runge(a)
    res = 1./(1+25*a.^2);
end