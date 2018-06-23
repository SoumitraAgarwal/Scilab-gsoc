// Macro for visualisation -- Scilab GSOC

function [plot] = visualizeFit(x, y, pred) 
	
	// Create plot for features and prediction
	scatter(x, y, 1, "red", 'x')
	scatter(x, pred, "blue", "fill")
	plot = 1;
endfunction

function [plot] = visualizeSplit(x, y, flags)
	scatter(x, y,  1, flags, 'x')
	plot = 1;
endfunction