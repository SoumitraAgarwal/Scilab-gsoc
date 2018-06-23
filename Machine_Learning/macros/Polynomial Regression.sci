// Macro script for polynomial regression -- Scilab 

// Function to train a polynomial regression model with stated degree
function cf = PolynomialRegressionTrain(x, y, degree)
	
	// Setup for polynomial regression
	A = ones(length(x), degree + 1)
	for i=1:degree
	    A(:,i+1) = x(:).^i
	end
	cf 		= pinv(A)*y;
endfunction


// Function to predict the target variable using the coefficients from train
function pred = PolynomialRegressionPredict(x, cf)

	// Setup for polynomial regression matrix
	A = ones(length(x), degree + 1)
	for i=1:degree
	    A(:,i+1) = x(:).^i
	end
	// Prediction preparation
	pred 	= A*cf; 

endfunction