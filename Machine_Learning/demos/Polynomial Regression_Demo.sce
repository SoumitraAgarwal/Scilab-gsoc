// Demo for polynomial regression -- Scilab 

getd('../macros')


// Data preparation
M = csvRead('Datasets/weather.csv')
x = M(1:2000, 6);
y = M(1:2000, 5);

// Data cleaning
non_nan = find(~isnan(x))
x		= x(non_nan)
y		= y(non_nan)

// Degree input
degree = 3;

cf = PolynomialRegressionTrain(x, y, degree)
pred = PolynomialRegressionPredict(x,cf)