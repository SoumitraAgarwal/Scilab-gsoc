// Demo script for normalization

getd('.')

// Data preparation
M = csvRead('train.csv')
x = M(:, [6, 10]);
x = real(x);
normx = normalize(x);
disp(normx)