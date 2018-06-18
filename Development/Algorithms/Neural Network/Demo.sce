// Demo for neural network -- Scilab 

getd('.')

// Data preparation
M = csvRead('train.csv')
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


iter = 40
rate = 0.000002

theta = neuralNetworkTrain(x, y, rate, iter)
ypred = neuralNetworkPredict(x, theta)