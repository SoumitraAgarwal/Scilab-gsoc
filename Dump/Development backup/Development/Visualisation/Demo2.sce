// Macro for visualisation -- Scialb GSOC

clear();

getd('.')
getd('../Algorithms/Linear Regression')

// Data preparation
M = csvRead('Summary of Weather.csv')
x = M(1:2000, 6);
y = M(1:2000, 5);
x = x';
y = y';

[a, b] = linearRegressionTrain(x, y)
pred = a*x + b;
plot = visualizeFit(x, y, pred)