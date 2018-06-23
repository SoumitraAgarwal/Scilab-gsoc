// Macro for supportVector regression -- Scilab 

// Function to train a supportVector regression model with given 
// rate and iterations to converge
function [theta,b] = supportVectorRegressionTrain(x, y, rate, iter, lambda, alpha)
	
	// Making an initial guess
	features = length(x(1, :))
	theta	 = 1.0/(features)*ones(1, features);
	b 		 = 1; 
	n 		 = length(x(:, 1))

	// Training
	for i = 1:iter
		for j = 1:features
			tempthet = theta
			tempthet(j) = tempthet(j)*(1 - alpha)
			loss 	 = 0;
			temploss = 0;
			for k = 1:n
				loss = loss + (1/n)*max(0, real(1 - y(i)*(x(i, :)*theta' - b)));
				temploss = temploss + (1/n)*max(0, real(1 - y(i)*(x(i, :)*tempthet' - b)));
			end
			loss = loss + lambda*norm(theta);
			temploss = temploss + lambda*norm(tempthet);

			derivative = (loss - temploss)/(alpha*tempthet(j))
			theta(j) = theta(j) + derivative*rate;			
		end	

		tempb = b*(1 - alpha)	
		loss 	 = 0;
		temploss = 0;
		for k = 1:n
			loss = loss + (1/n)*max(0, real(1 - y(i, 1)*(x(i, :)*theta' - b)));
			temploss = temploss + (1/n)*max(0, real(1 - y(i, 1)*(x(i, :)*theta' - tempb)));
		end
		loss = loss + lambda*norm(theta);
		temploss = temploss + lambda*norm(theta);

		derivative = (loss - temploss)/(alpha*b)
		b = b + derivative*rate;			
	end

endfunction


// Function to predict the target given features and model parameter theta
function ypred = supportVectorRegressionPredict(x, theta, b)
	ypred = x*theta' - b;
endfunction