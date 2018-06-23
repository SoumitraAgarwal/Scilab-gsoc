// Macro for Decision Tree -- Scilab 


// Function to get the gini impurity of a vector
function gini = giniImpurity(rows)
	counts 	= tabul(rows);
	entries = length(rows(:, 1))
	gini 	= 1;
	classes = length(counts(:, 1))
	for i = 1:classes
		gini = gini - (counts(i, 2)*counts(i, 2))/(entries*entries);
	end
endfunction

// Function to get the information gain via some split on a feature set
function uncertainity = infoGain(left, right, current_uncertainity)
	uncertainity = current_uncertainity - (length(left(:, 1))*giniImpurity(left) + length(right(:, 1))*giniImpurity(right))/(length(left(:, 1)) + length(right(:, 1)))
endfunction


// Function to return the best set of questions for a dataset with the leaf node
// having models represented by flag
function [questions, flag] = decisionTreeFit(x, y)

	features 	= length(x(1, :))
	entries 	= length(x(:, 1))
	bestquest	= []
	questions 	= [];		
	impurity 	= giniImpurity(y);
	flag 		= [];
	mainmat 	= [x, y];
	bestgain 	= 0
	bestleftsub = []
	bestrightsub = []
	for i = 1:features
		sorted_vals = gsort(x(:, i))

		// Grid search through possible splits/questions to find 
		// the one with the maximum information gain

		for j = 2:entries - 1
			leftsubm 	= mainmat(find(mainmat(:, i)) > sorted_vals(j), :);
			rightsubm	= mainmat(find(mainmat(:, i)) <= sorted_vals(j), :);
			if(length(leftsubm(:, 1))~=0 && length(rightsubm(:, 1))~=0)
				newGain 	= infoGain(leftsubm(:, features + 1), rightsubm(:, features + 1), impurity);
				if(newGain > bestgain)
					bestgain = newGain;
					bestquest = [i; sorted_vals(j)];
					bestleftsub = leftsubm;
					bestrightsub = rightsubm;
				end
				if(newGain < 0)
					break
				end
			end
		end
	end

	// Store the set of questions in a tree form with 
	// leaf node flags representing models
	if(bestgain > 0)
		[leftquest, leftflag] = decisionTreeFit(bestleftsub(:, 1:features), bestleftsub(:, features + 1));
		[rightquest, rightflag] = decisionTreeFit(bestrightsub(:, 1:features), bestrightsub(:, features + 1));
		questions = zeros(2, 1 + 2*max(length(leftquest(1, :)), length(rightquest(1, :))))
		flag = -1*ones(2, 1 + 2*max(length(leftquest(1, :)), length(rightquest(1, :))))
		questions(:, 1) = [bestquest];
		left = length(leftquest(1, :))
		if(left == 0)
			flag(1,1) = bestleftsub(1, features + 1);
		end
		right = length(rightquest(1, :))
		if(right == 0)
			flag(2,1) = bestrightsub(1, features + 1);
		end
		put = 1;
		start = 2;
		if(left < right)
			leftquest = [leftquest, zeros(2, right - left)]
			leftflag  = [leftflag, -1*ones(2, right - left)]
		elseif(right < left)
			rightquest = [rightquest, zeros(2, left - right)]
			rightflag = [rightflag, -1*ones(2, left - right)]
		end

		while(1)
			questions(:, start:min(start + put - 1, length(questions))) = leftquest(:, floor(start/2):floor(start/2) + put - 1)
			questions(:, (start + put):min(start + 2*put - 1, length(questions))) = rightquest(:, floor(start/2):floor(start/2) + put - 1)
			flag(:, start:min(start + put - 1, length(flag))) = leftflag(:,floor(start/2):floor(start/2) + put - 1)
			flag(:, start + put:min(start + 2*put - 1, length(flag))) = rightflag(:, floor(start/2):floor(start/2) + put - 1)
			start = start + 2*put;
			put = 2*put;
			if(start >= length(questions(1, :)))
				break
			end
		end
	end
endfunction

// Function to predict using the questions, flag setup created using training
function pred = decisionTreePredict(x, questions, flag)
	n = length(x(:, 1));
	pred = [];
	for i = 1:n
		j = 1
		while(1)
			if(x(i, questions(1, j)) > questions(2, j))
				if(flag(1, j) == -1)
					j = 2*j;
				else
					pred = [pred, flag(1, j	)];
					break;
				end
			else
				if(flag(2, j) == -1)
					j = 2*j + 1;
				else
					pred = [pred, flag(2, j)];
					break;
				end
			end
		end
	end
endfunction