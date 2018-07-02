// Demo for neural network -- Scilab 



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

iter = 100
rate = 0.0002

theta = neuralNetworkTrain(x, y, [5,3,5], 50, iter, rate)
ypred = neuralNetworkPredict(x, theta, [5,3,5])
disp(0.5*sqrt(norm(ypred' - y)))