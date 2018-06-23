// Macro for single perceptron -- Scilab 

// Function to train a single perceptron model with given 
// rate and iterations to converge
function theta = perceptronTrain(x, y, rate, iter)
	
	// Making an initial guess
	theta	= (1.0/length(x(1, :)))*ones(1, length(x(1, :)));

	// Training
	for i = 1:iter

		sigm 	=  x*theta';
		theta 	= theta + rate.*((y - sigm)'*x);
		error	= 0.5*norm(y - x*theta');
		disp(error)
	end

endfunction


// Function to predict the target given features and model parameter theta
function ypred = perceptronPredict(x, theta)
	ypred = 1.0./(1.0 + exp(-x*theta'));
endfunction