// Macro for PCA of dataset -- Scilab 

function pcaDataset = PCA(x)
	
	width 	= length(x(1, :));
	n 		= length(x(:, 1));
	means 	= [];
	for i = 1:width
		means = [means, mean(x(:, i))];
	end
	for i = 1:n
		x(i, :) = x(i, :) - means;
	end

	covarianceMat 	= cov(x);
	[eigenVector, eigenVals] 		= spec(covarianceMat); 
	eigenVector = flipdim(eigenVector, 2);
	eigenVals = diag(eigenVals)
	pcaDataset = eigenVector'*x';
	pcaDataset = pcaDataset';
endfunction