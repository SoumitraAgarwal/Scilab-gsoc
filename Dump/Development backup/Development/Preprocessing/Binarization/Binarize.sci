// Macro for binarization of dataset -- Scilab 

function binarx = binarize(x)
	
	n 	= length(x)
	mi  = min(x)
	ma  = max(x)
	for i=1:n
		x(i) = 1.0*(x(i) - mi)/(ma - mi);
		if(x(i) >= 0.5)
			x(i) = 1;
		else
			x(i) = 0;
		end
	end

	binarx = x
	
endfunction