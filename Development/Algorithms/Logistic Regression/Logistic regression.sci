// Macro for logistic regression -- Scilab 

function theta = logisticRegressionTrain(x, y, rate, iter)
	
	// Making an initial guess
	theta	= 0.5*ones(1, length(x(1, :)));

	// Training
	for i = 1:iter

		sigm 	=  1.0./(1.0 + exp(-x*theta'))
		theta 	= theta + rate.*((y - sigm)'*x);
		error	= 0.5*norm(y - x*theta');
		disp(error)
	end

endfunction

function ypred = logisticRegressionPredict(x, theta)
	ypred = 1.0./(1.0 + exp(-x*theta'));
endfunction