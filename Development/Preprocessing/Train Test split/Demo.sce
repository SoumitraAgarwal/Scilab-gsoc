// Demo script for linear regression

getd('.')

// Data preparation
M = csvRead('Summary of Weather.csv')
x = M(1:2000, 6);
y = M(1:2000, 5);

[trainX, testX, trainY, testY] = trainTestSplit(x, y, 0.8);
disp(size(x))
disp(size(y))
disp(size(trainX))
disp(size(trainY))
disp(size(testX))
disp(size(testY))