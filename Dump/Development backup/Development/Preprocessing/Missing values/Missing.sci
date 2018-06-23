// Macro for missing values of dataset -- Scilab 

function fill = missingMean(x)
	
	n 		= length(x(:, 1));
	fill 	= x;
	x(or(isnan(x),'c'),:) = [];
	xmean 	= mean(x);
	for i = 1:n
		if(isnan(fill(i, 1)))
			fill(i, 1) = xmean;
		end
	end
endfunction


function fill = missingMedian(x)
	n 		= length(x(:, 1));
	fill 	= x
	x(or(isnan(x),'c'),:) = []
	xmedian	= median(x);
	for i = 1:n
		if(isnan(fill(i, 1)))
			fill(i, 1) = xmedian;
		end
	end
	
endfunction