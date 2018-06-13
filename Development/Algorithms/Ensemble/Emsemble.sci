// Macro for ensemble of predictors -- Scilab

// Function takes 2 predictions, target vector
// and learning rate as input and creates an 
// output for an ensemble
function pred = ensemble(pred1, pred2, y, increment)

	bestweight = 0;
	besterror = 0.5*sqrt(norm(pred2 - y));
	for weight = 0:increment:1
		thiserror = 0.5*sqrt(norm(weight*pred1 + (1 - weight)*pred2 - y))
		if(besterror > thiserror)
			besterror = thiserror;
			bestweight = weight;
		end
	end

	pred = bestweight*pred1 + (1 - bestweight)*pred2
endfunction