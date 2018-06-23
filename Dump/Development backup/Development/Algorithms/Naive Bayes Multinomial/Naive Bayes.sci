// Macro for multinomial Naive Bayes -- Scilab 

// Function to return a matrix of prior probabilities
function probMat = naiveMultBayes(x, y)
	freq = tabul(y);
	entries = length(x(:, 1));
	probMat = freq;
	probMat(:, 2) = probMat(:, 2)/entries;
endfunction

// Function returns the predicted probability given the train and test
// matrices with the priors
function pred = naiveMultBayesGaussian(x, y, probMat, xtest)
	features= length(x(1, :));
	classes = length(probMat(:, 1));
	mainmat = [x, y];
	testlen	= length(xtest(:, 1))
	pred	= [];
	for k = 1:testlen
		classpred = [];
		for i = 1:classes
			subm = mainmat(find(mainmat(:, features + 1) == probMat(i, 1)), :);
			likelihood = probMat(i, 2);
			for j = 1:features
				
				counts = tabul(subm(:, j));
				likelihood 	= likelihood*counts(find(counts(:,1) == xtest(k, j)), 2);
			end

			classpred = [classpred; likelihood];
		end
		maxclass = max(classpred);
		pred = [pred; probMat(find(classpred == maxclass), 1)];
	end
endfunction