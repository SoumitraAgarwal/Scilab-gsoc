// Demo script for linear regression

getd('../macros')


// Data preparation
M = csvRead('Datasets/weather.csv')
x = M(1:2000, 6);
y = M(1:2000, 5);
x = x';
y = y';

[a, b] = linearRegressionTrain(x, y)
pred = linearRegressionPredictPlot(x, a, b)