// Macro for 1 hot encoding of dataset -- Scilab 

function [categories, encode] = hotEncode(x)
	
	categories 	= unique(x);
	sizeM		= size(x(:, 1))(1);
	items 		= size(categories)(1);
	encode 		= [];
	for i = 1:sizeM
		p = grep(categories,x(i));
		encode = [encode; zeros(1, p - 1), 1, zeros(1, items - p)];
	end
	
endfunction