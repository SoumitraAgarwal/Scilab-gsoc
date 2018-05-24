// Standalone script for polynomial regression -- Scilab 

// Data preparation
M = csvRead('Summary of Weather.csv')
x = M(1:2000, 6);
y = M(1:2000, 5);

// Data cleaning
non_nan = find(~isnan(x))
x		= x(non_nan)
y		= y(non_nan)

// Degree input
degree = 3;

// Setup for polynomial regression
A = ones(length(x), degree + 1)
for i=1:degree
    A(:,i+1) = x(:).^i
end


// Prediction preparation
cf 		= pinv(A)*y;
pred 	= A*cf; 

scatter(x, y, 1, "red", 'x')
scatter(x, pred, "blue", "fill")