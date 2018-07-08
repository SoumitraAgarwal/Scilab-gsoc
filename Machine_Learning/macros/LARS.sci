// Macro script for LARS regression -- Scilab 

// Function to get coefficients for a line fit to features x given target y
function theta = LARSRegressionTrain(x,y, iter, rate)
	
	// Making an initial guess
	theta	= zeros(1, length(x(1, :)) + 1);
	features = length(x(1, :) + 1)
	x = [ones(length(x(:, 1)), 1), x]
	residue = y;
	// Training
	for i = 1:iter

		maxcovar = -1;
		maxfeature = 1;
		for j = 1:features
			predictor 	= x(:, j);
			presVar 	= correl(predictor, residue);
			if(presVar > maxcovar)
				maxcovar = presVar
				maxfeature = j;		
			end
		end

		delta = rate*sign(residue'*x(:, maxfeature));
		theta(maxfeature) = theta(maxfeature) + delta;
		residue = residue - delta*x(:, maxfeature);

	end

endfunction

// Function to predict the target for some feature set x and coefficient theta
function pred = LARSRegressionPredict(x, theta)
	
	x = [x, ones(length(x(:, 1)), 1)]
	pred = theta*x;
	
endfunction

function pred = LARSRegressionPredictPlot(x, y, theta)

	x1 = [ones(length(x(:, 1)), 1), x]
	pred = x1*theta';
	// Create plot for features and prediction
	scatter(x, y, 1, "red", 'x')
	scatter(x, pred, 1, "blue", "fill")

endfunction