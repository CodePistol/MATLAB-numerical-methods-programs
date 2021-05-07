% Program to implement Lagrange interpolation at Chebushev nodes
N=15;
nodes = zeros(N,1);

% Chebyshev nodes
for i=1:N
    nodes(i) = cos((2*i-1)*pi/(2*N));
end

% Values of the Runge function at the Chebyshev nodes
y = 1./(1+25*nodes.^2);

syms x
L=[];
for j = 1:N
    Lj= 1;
   for i = 1:N
       % Lagrange polynomial expression
      if i~=j
          Lj = Lj * (x-nodes(i))/(nodes(j) - nodes(i));
      end
   end
   
   L = [L Lj]; 
   
end
length(L)
p =L*y;     % The complete Lagrange interpolant function
px = matlabFunction(p);
%for plotting interpolation functions
        xval = linspace(-1, 1, 100);
        yval = px(xval);

% Visualization of results        
figure
plot(xval, yval)
hold on
plot(nodes, y,'or')
plot(xval, 1./(1+25*xval.^2))
legend('Interpolated', 'nodes', 'actual')
title(['Chebyshev ', 'N=',num2str(N)])