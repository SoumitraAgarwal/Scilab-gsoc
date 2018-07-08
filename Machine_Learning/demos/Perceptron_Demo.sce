// Demo for single perceptron -- Scilab 

getd('../macros')


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


iter = 40
rate = 0.000002

theta = perceptronTrain(x, y, rate, iter)
ypred = perceptronPredict(x, theta)