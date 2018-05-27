// Macro script for polynomial regression -- Scilab 

function cf = PolynomialRegressionTrain(x, y, degree)
	// Setup for polynomial regression
	A = ones(length(x), degree + 1)
	for i=1:degree
	    A(:,i+1) = x(:).^i
	end
	cf 		= pinv(A)*y;
endfunction

function pred = PolynomialRegressionPredict(x, cf)

	// Setup for polynomial regression matrix
	A = ones(length(x), degree + 1)
	for i=1:degree
	    A(:,i+1) = x(:).^i
	end
	// Prediction preparation
	pred 	= A*cf; 

endfunction

function pred = PolynomialRegressionPredictPlot(x,cf)
	
	// Setup for polynomial regression matrix
	A = ones(length(x), degree + 1)
	for i=1:degree
	    A(:,i+1) = x(:).^i
	end
	// Prediction preparation
	pred 	= A*cf; 

	scatter(x, y, 1, "red", 'x')
	scatter(x, pred, "blue", "fill")

endfunction