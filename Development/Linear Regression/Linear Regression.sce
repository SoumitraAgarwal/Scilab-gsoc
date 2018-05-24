// Standalone script for linear -- Scilab 

// Data preparation
M = csvRead('Summary of Weather.csv')
x = M(1:2000, 6);
y = M(1:2000, 5);
x = x';
y = y';

// Extracting the least square mean of that function and displaying
[a, b] = nanreglin(x, y);

// Create plot for features and prediction
scatter(x, y, 1, "red", 'x')
plot(x, a*x+b)