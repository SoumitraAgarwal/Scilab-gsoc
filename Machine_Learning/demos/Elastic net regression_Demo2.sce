// Demo for elastic regression -- Scilab 

getd('../macros')


// Data preparation
M = csvRead('Datasets/forestfires.csv')
x = M(:, [5,6,7,8]);
y = M(:, 13);

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


iter = 60
rate = 0.8
lambda1 = 0.01
lambda2 = 0.02

theta = elasticRegressionTrain(x, y, rate, iter, lambda1, lambda2)
ypred = elasticRegressionPredict(x, theta)