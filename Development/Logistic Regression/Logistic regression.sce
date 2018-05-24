// Standalone script for logistic regression -- Scilab 

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


// Skipping normalisation
// x(:, 2) 		= norma(x(:,2))

// Making an initial guess
theta	= 0.5*ones(1, length(x(1, :)));


// Training

iter = 20
rate = 0.000002

for i = 1:iter

	sigm 	=  1.0./(1.0 + exp(-x*theta'))
	theta 	= theta + rate*(y - sigm)'*x;
	error	= 0.5*norm(y - x*theta');
	disp(error)
end
