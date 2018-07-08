// Demo script for normalization

getd('../macros')


// Data preparation
M = csvRead('Datasets/titanic.csv')
x = M(:, [6, 10]);
x = real(x);
normx = normalize(x);
disp(normx)