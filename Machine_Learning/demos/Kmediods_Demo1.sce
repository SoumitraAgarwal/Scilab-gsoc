// Demo for Kmediods -- Scilab 

// Data preparation
M = csvRead('Datasets/titanic.csv')
x = M(1:200, [6, 10]);

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

x(or(isnan(x),'c'),:) = []

x(:, 2) = norma(real(x(:, 2)))
x(:, 1) = norma(real(x(:, 1)))

flags = KmediodsCluster(x, 2);
disp(flags)
scatter(x(:, 2), x(:, 1),  1, flags, 'x')