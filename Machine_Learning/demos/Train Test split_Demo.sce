// Demo script for train test split



// Data preparation
M = csvRead('Datasets/weather.csv')
x = M(1:2000, [6, 10]);

[trainX, testX, trainY, testY] = trainTestSplit(x, y, 0.8)