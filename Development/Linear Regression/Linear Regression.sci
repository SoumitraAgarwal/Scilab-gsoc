// Macro script for linear regression -- Scilab 

function [a,b] = linearRegressionTrain(x,y)
	
	// Extracting the least square mean of that function and displaying
	[a, b] = nanreglin(x, y);

endfunction


function pred = linearRegressionPredict(x, a, b)

	pred = a*x + b;
	
endfunction

function pred = linearRegressionPredictPlot(x, a, b)

	pred = a*x + b;
	// Create plot for features and prediction
	scatter(x, y, 1, "red", 'x')
	scatter(x, pred, "blue", "fill")

endfunction