// Demo script for median



// Data preparation
M = csvRead('Datasets/titanic.csv')
x = M(:, [6, 8]);
x(:, 1) = missingMean(x(:, 1));
x(:, 2) = missingMedian(x(:, 2));
disp(x)