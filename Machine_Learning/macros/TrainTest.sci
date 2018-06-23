// Macro for train test split of dataset -- Scilab 

function [trainX, testX, trainY, testY] = trainTestSplit(x, y, trainsize)
	n		= length(x(:,1));
	feature = length(x(1, :));
	target	= length(y(1, :));
	mainmat = [x, y];
	rperm	= grand(1, "prm", mainmat);
	trainX	= rperm(1:n*trainsize, 1:feature);
	testX	= rperm(n*trainsize + 1:n, 1:feature);
	trainY	= rperm(1:n*trainsize, feature + 1:feature + target);
	testY	= rperm(n*trainsize + 1:n, feature + 1:feature + target);
endfunction