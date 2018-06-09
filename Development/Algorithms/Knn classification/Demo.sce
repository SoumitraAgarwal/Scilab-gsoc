// Demo for K Nearest neighbours classification  -- Scilab 

getd('.')

// Data preparation
M = csvRead('train.csv')
x = M(1:200, [6, 7, 8, 10]);
y = M(1:200, 2);

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

x(:, 4) = norma(real(x(:, 2)))
x(:, 3) = norma(real(x(:, 2)))
x(:, 2) = norma(real(x(:, 2)))
x(:, 1) = norma(real(x(:, 1)))

pred = knn(x, y, x, 3);
disp(0.5*norm(pred' - y))