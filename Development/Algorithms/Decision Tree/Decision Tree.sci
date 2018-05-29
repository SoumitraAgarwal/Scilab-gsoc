// Macro for Naive Bayes -- Scilab 

function gini = giniImpurity(rows)
	counts 	= tabul(rows);
	entries = length(rows(:, 1))
	gini 	= 1;
	classes = length(counts(:, 1))
	for i = 1:classes
		gini = gini - (counts(i, 2)*counts(i, 2))/(entries*entries);
	end
endfunction

function uncertainity = infoGain(left, right, current_uncertainity)
	uncertainity = current_uncertainity - (length(left(:, 1))*giniImpurity(left) + length(right(:, 1))*giniImpurity(right))/(length(left(:, 1)) + length(right(:, 1)))
endfunction

function questions = decisionTreeFit(x, y)

	features 	= length(x(1, :))
	entries 	= length(x(:, 1))
	bestquest	= []
	questions 	= [];		
	impurity 	= giniImpurity(y);
	mainmat 	= [x, y];
	bestgain 	= 0
	bestleftsub = []
	bestrightsub = []
	for i = 1:features
		sorted_vals = gsort(x(:, i))
		for j = 1:entries
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

	if(bestgain > 0)
		questions = [bestquest, decisionTreeFit(bestleftsub(:, 1:features), bestleftsub(:, features + 1)), decisionTreeFit(bestrightsub(:, 1:features), bestrightsub(:, features + 1))];

	end
endfunction