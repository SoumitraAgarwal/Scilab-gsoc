// Macro for train test split of dataset -- Scilab 

function xscale = scale(x)
	n 	= length(x);
	mi  = min(x);
	ma  = max(x);
	me 	= mean(x);
	std = stdev(x);
	for i=1:n
		x(i) = 1.0*(x(i) - me)/(ma - mi)
	end
	xscale = x/std;
endfunction