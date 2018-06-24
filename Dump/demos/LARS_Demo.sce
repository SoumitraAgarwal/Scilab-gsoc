// Demo script for LARS regression

getd('.')

// Data preparation
M = csvRead('Datasets/weather.csv')
x = M(1:2000, 6);
y = M(1:2000, 5);

iter = 100
rate = 0.5

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
x(:, 1) = norma(x(:, 1))

theta = LARSRegressionTrain(x, y, iter, rate)
pred = LARSRegressionPredictPlot(x,y,theta)
disp(0.5*sqrt(norm(y - pred)))