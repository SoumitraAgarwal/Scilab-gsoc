// Demo script for median

getd('.')

// Data preparation
M = csvRead('train.csv')
x = M(:, [6, 8]);
x(:, 1) = missingMean(x(:, 1));
x(:, 2) = missingMedian(x(:, 2));
disp(x)