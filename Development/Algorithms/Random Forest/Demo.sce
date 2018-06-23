// Demo for Random Forest -- Scilab 

getd('.')

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

trees = 4
samplesize = 100

ypred = randomForest(x, y, trees, samplesize, x)
disp(0.5*sqrt(norm(y - ypred')))