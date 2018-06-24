// Demo for lasso regression -- Scilab 



// Data preparation
M = csvRead('forestfires.csv')
x = M(:, [5,6]);
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

n = length(y(:, 1))
for i = 1:n
	if(y(i)>0)
		y(i) = 1
	end
end

iter = 65
rate = 0.15
lambda = 0.1

theta = lassoRegressionTrain(x, y, rate, iter, lambda)
ypred = lassoRegressionPredict(x, theta)