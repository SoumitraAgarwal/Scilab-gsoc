// Demo script for Binarization

getd('.')

// Data preparation
M = csvRead('train.csv')
x = M(:, 10);
x(or(isnan(x),'c'),:) = []
x = real(x);
x = binarize(x);
disp(tabul(x))