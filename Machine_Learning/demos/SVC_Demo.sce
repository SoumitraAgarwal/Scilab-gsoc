// Demo for supportVector classification -- Scilab 



// Data preparation
M = csvRead('Datasets/titanic.csv')
x = M(:, [3,6]);
y = M(:, 2);

// Data cleaning
function xnorm = norma(x)
	n 	= length(x)
	mi  = min(x)
	ma  = max(x)
	for i=1:n
		x(i) = 1.0*(x(i) - mi)/(ma - mi)
	end

	xnorm = x
endfunction

y(or(isnan(x),'c'),:) = []
x(or(isnan(x),'c'),:) = []

x(:, 1) = norma(real(x(:, 1)))
x(:, 2) = norma(real(x(:, 2)))

iter = 50
rate = 0.02
lambda = 1
alpha = 0.0000002

[theta, b] = supportVectorclassificationTrain(x, y, rate, iter, lambda, alpha)
ypred = supportVectorclassificationPredict(x, theta, b)
disp(tabul(y))
disp(tabul(ypred))
disp(tabul(y - ypred))