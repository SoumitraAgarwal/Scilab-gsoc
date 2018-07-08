// Macro for ridge regression -- Scilab 

// Function to train a ridge regression model with given 
// rate and iterations to converge
function theta = ridgeRegressionTrain(x, y, rate, iter, lambda)
	
	// Making an initial guess
	theta	= (1/length(x(1,:)))*ones(1, length(x(1, :)));

	// Training
	for i = 1:iter

		sigm 	=  1.0./(1.0 + exp(-x*theta'))
		theta 	= theta + rate.*(((y - sigm)'*x) - 2*lambda.*theta);
		error	= 0.5*norm(y - x*theta');
	end

endfunction


// Function to predict the target given features and model parameter theta
function ypred = ridgeRegressionPredict(x, theta)
	ypred = x*theta';
endfunction