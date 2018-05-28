// Macro for Naive Bayes -- Scilab 

function probMat = naiveBayes(x, y)
	freq = tabul(y);
	entries = length(x(:, 1));
	probMat = freq;
	probMat(:, 2) = probMat(:, 2)/entries;
endfunction

function pred = naiveBayesGaussian(x, y, probMat, xtest)
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
				//disp(j)
				meanf 		= mean(subm(:, j));
				varf 		= variance(subm(:, j));
				likelihood 	= likelihood*exp(-((xtest(k, j)- meanf)^2)/(2*varf))/sqrt(2*%pi*varf);
			end

			classpred = [classpred; likelihood];
		end
		maxclass = max(classpred);
		pred = [pred; probMat(find(classpred == maxclass), 1)];
	end
endfunction