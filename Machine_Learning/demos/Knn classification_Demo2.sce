// Demo for K Nearest neighbours classification  -- Scilab 



// Data preparation
M = csvRead('Datasets/forestfires.csv')
x = M(:, [6, 7, 8, 10]);
y = M(:, 13);

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

n = length(y(:, 1))
for i = 1:n
	if(y(i)>0)
		y(i) = 1
	end
end
pred = knn(x, y, x, 3);
disp(0.5*norm(pred' - y))