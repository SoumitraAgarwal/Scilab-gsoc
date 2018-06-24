// Demo for affinity -- Scilab 

// Data preparation
M = csvRead('Datasets/forestfires.csv')
x = M(1:100, [6, 8]);

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

flags = affinityCluster(x, 4, 4);
disp(flags)
scatter(x(:, 2), x(:, 1),  1, flags, 'x')