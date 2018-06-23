// Macro for regression Tree -- Scilab 


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

function workdir = regressionTreeTrain(x, y, entryThreshold)
	files = dir('Models')
	modelsNumber = size(files.name)(1) + 1
	mkdir('Models/Model' + string(modelsNumber))
	workdir = 'Models/Model' + string(modelsNumber) + '/'
	regressionTreeFit(1 , x, y, entryThreshold, workdir)
endfunction

// Function to return the best set of questions for a dataset with the leaf node
// having models represented by flag
function flag = regressionTreeFit(nodeNumber, x, y, entryThreshold, workdir)

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
	if(entries < entryThreshold)
		[a, b] = reglin(x', y');
		fd = mopen(workdir + 'NodeModel' + string(nodeNumber),'wt');
		mputl(string(a) + ' ' + string(b),fd);
		mclose(fd)
	else
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

		if(bestgain > 0)
			fd = mopen(workdir + 'NodeData' + string(nodeNumber),'wt');
			mputl(string(bestquest(1,1)) + ' ' + string(bestquest(2,1)),fd);
			mclose(fd)
			regressionTreeFit(2*nodeNumber, bestleftsub(:, 1:features), bestleftsub(:, features + 1:features + 1), entryThreshold, workdir)
			regressionTreeFit(2*nodeNumber + 1, bestrightsub(:, 1:features), bestrightsub(:,features + 1:features + 1), entryThreshold, workdir)
		else
			[a, b] = reglin(x', y');
			fd = mopen(workdir + 'NodeModel' + string(nodeNumber),'wt');
			p = length(a)
			for i = 1:p
				mputl(string(a(i)),fd);
			end
			mputl(string(b), fd);
			mclose(fd)
		end
	end


endfunction

function val = regressionTreePredictRow(nodeNumber, entry, workdir)
	files = dir(workdir).name
	numfiles = size(files)(1)
	flag = 0;
	val = 0;
	for j = 1:numfiles
		if(bool2s(files(j)=='NodeData' + string(nodeNumber)) == 1)
			bestquest = fscanfMat(workdir + files(j))
			if(entry(bestquest(1))>bestquest(2))
				val = regressionTreePredictRow(2*nodeNumber, entry, workdir)
			else
				val = regressionTreePredictRow(2*nodeNumber + 1, entry, workdir)
			end
			flag = 1;
			break;
		end
	end
	if(flag == 0)
		mainmat = fscanfMat(workdir + 'NodeModel' + string(nodeNumber))
		n = length(entry)
		val = entry*mainmat(1:n) + mainmat(n + 1);
	end
endfunction
// Function to predict using the questions, flag setup created using training
function pred = regressionTreePredict(nodeNumber, x, workdir)
	n = length(x(:, 1));
	pred = [];

	for i = 1:n
		pred = [pred, regressionTreePredictRow(nodeNumber, x(i, :), workdir)];
	end
endfunction