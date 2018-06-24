// Demo script for scaling to unit variance and zero mean



// Data preparation
M = csvRead('Datasets/titanic.csv')
x = M(:, 10);
x(or(isnan(x),'c'),:) = []
x = real(x);
xscale = scale(x);
disp(xscale)