// Macro for lasso regression -- Scilab 

// Function to train a lasso regression model with given 
// rate and iterations to converge
function theta = lassoRegressionTrain(x, y, rate, iter, lambda)
	
	// Making an initial guess
	theta	= (1/length(x(1,:)))*ones(1, length(x(1, :)));

	features = length(x(1, :));
	// Training
	for i = 1:iter
		for j = 1:features
			xtemp = x
			thetaTemp = theta
			
			if(j == 1)
				xtemp = xtemp(:, 2:features)
				thetaTemp = thetaTemp(2:features)
			else
				xtemp = [xtemp(1:j-1), x(j + 1:features)];
				thetaTemp = [thetaTemp(1:j-1), thetaTemp(j + 1:features)];
			end

			if((xtemp*thetaTemp' - y)'*xtemp < -lambda/2)
				theta(1, j) = theta(1, j) + rate*lambda/2;
			elseif((xtemp*thetaTemp' - y)'*xtemp > lambda/2)
				theta(1, j) = theta(1, j) - rate*lambda/2;
			else
				theta(1, j) = 0;
			end
		
		end
		error	= 0.5*norm(y - x*theta');
	end

endfunction


// Function to predict the target given features and model parameter theta
function ypred = lassoRegressionPredict(x, theta)
	ypred = x*theta';
endfunction