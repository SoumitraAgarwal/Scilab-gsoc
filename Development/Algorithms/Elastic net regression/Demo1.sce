// Demo for elastic regression -- Scilab 

getd('.')

// Data preparation
M = csvRead('Datasets/titanic.csv')
x = M(:, [3,6]);
y = M(:, 2);

// Data cleaning
function xnorm = norma(x)
	n 	= length(x)
	disp(x)
	mi  = min(x)
	ma  = max(x)
	for i=1:n
		x(i) = 1.0*(x(i) - mi)/(ma - mi)
	end

	xnorm = x
endfunction

y(or(isnan(x),'c'),:) = []
x(or(isnan(x),'c'),:) = []


iter = 150
rate = 0.5
lambda1 = 0.01
lambda2 = 0.05

theta = elasticRegressionTrain(x, y, rate, iter, lambda1, lambda2)
ypred = elasticRegressionPredict(x, theta)