// Demo for regression tree -- Scilab 

getd('.')

// Data preparation
M = csvRead('Datasets/train.csv')
x = M(:,[1 ,2, 3, 4, 5]);
y = M(:, 6);

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

y = norma(real(y));

directory		 	= regressionTreeTrain(x, y, 10);
pred				= regressionTreePredict(1, x, directory);
disp(0.5*sqrt(norm(pred - y')))