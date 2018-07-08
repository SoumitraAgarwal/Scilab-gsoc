// Macro for neural network -- Scilab 

// Function to train a neural network model
function workdir = neuralNetworkTrain(x, y, hiddenLayers, batchSize, iterations, rate)

	files = dir('Models')
	modelsNumber = size(files.name)(1) + 1
	mkdir('Models/Model' + string(modelsNumber))
	workdir = 'Models/Model' + string(modelsNumber) + '/'


	// Initialisation of the weight matrix models

	numLayers 	= length(hiddenLayers)
	layersize 	= max(hiddenLayers)
	n 			= length(x(:,1)) 
	prevLayer 	= length(x(1,:))
	for i = 1:numLayers
		weightMat 	= rand(prevLayer, hiddenLayers(i))
		biasMat  	= rand(hiddenLayers(i), 1)
		fprintfMat(workdir + 'Weights' + string(i),weightMat);
		fprintfMat(workdir + 'Bias' + string(i),biasMat);
		prevLayer 	= hiddenLayers(i);
	end

	weightMat 	= rand(prevLayer, length(unique(y)))
	biasMat 	= rand(length(unique(y)), 1)
	fprintfMat(workdir + 'Weights' + string(numLayers + 1), weightMat);
	fprintfMat(workdir + 'Bias' + string(numLayers + 1),biasMat);


	for i = 1:iterations
	
		index = round(1 + (n - 1).*rand(1,batchSize));
		sampleX = x(index, :);
		sampleY = y(index, :);
		errorMat = zeros(unique(y))
		

		// Forward propagation
		layerSize = length(x(1,:))
		activation = []
		for j = 1:layerSize
			activation = [activation , mean(sampleX(:, j))]
		end
		fprintfMat(workdir + 'Activation0', nearfloat("succ", activation))
		for j = 1:numLayers
			
			weightMat = fscanfMat(workdir + 'Weights' + string(j))
			biasMat = fscanfMat(workdir + 'Bias' + string(j))
			sampleX = sampleX*weightMat
			for k = 1:hiddenLayers(j)
				sampleX(:, k) = sampleX(:, k) + biasMat(k)
			end
			sampleX = 1./(1 + exp(-sampleX))
			activation = []
			for k = 1:hiddenLayers(j)
				activation = [activation , mean(sampleX(:, k))]
			end
			fprintfMat(workdir + 'Activation' + string(j), nearfloat("succ", activation))
		end


		weightMat = fscanfMat(workdir + 'Weights' + string(j + 1))
		biasMat = fscanfMat(workdir + 'Bias' + string(j + 1))
		sampleX = sampleX*weightMat
		p = length(unique(y))
		for k = 1:p
			sampleX(:, k) = sampleX(:, k) + biasMat(k)
		end	
		activation = []
		for k = 1:layerSize
			activation = [activation , mean(sampleX(:, k))]
		end
		fprintfMat(workdir + 'Activation' + string(j + 1), nearfloat("succ", activation))

		// Backward propagation
		preslayer = j + 1
		weightMat = fscanfMat(workdir + 'Weights' + string(preslayer))
		activationMat = fscanfMat(workdir + 'Activation' + string(preslayer))
		biasMat = fscanfMat(workdir + 'Bias' + string(preslayer))
		prevAct = fscanfMat(workdir + 'Activation' + string(preslayer - 1))
		weightColumns = length(weightMat(1,:))
		deltaMat = []
		yvals = tabul(sampleY)
		yvals = yvals(:, 2)'./batchSize
		for j = 1:weightColumns
			delta = (activationMat(j) - yvals(j))*activationMat(j)*(1 - activationMat(j))
			weightMat(:, j) = weightMat(:, j) - rate*delta*prevAct'
			biasMat(j) = biasMat(j) - rate*delta
			deltaMat = [deltaMat, delta]
		end
		fprintfMat(workdir + 'Weights' + string(preslayer), nearfloat("succ", weightMat))
		fprintfMat(workdir + 'Bias' + string(preslayer), nearfloat("succ", biasMat))
		fprintfMat(workdir + 'Delta' + string(preslayer), nearfloat("succ", deltaMat))
		presLayer = preslayer - 1
		for k = presLayer:-1:1

			weightMat = fscanfMat(workdir + 'Weights' + string(k))
			activationMat = fscanfMat(workdir + 'Activation' + string(k))
			biasMat = fscanfMat(workdir + 'Bias' + string(k))
			prevAct = fscanfMat(workdir + 'Activation' + string(k - 1))
			nextDel = fscanfMat(workdir + 'Delta' + string(k + 1))
			nextWeight = fscanfMat(workdir + 'Weights' + string(k + 1))
			weightColumns = length(weightMat(1,:))
			deltaMat = []
			for j = 1:weightColumns
				delta = (nextWeight(j, :)*nextDel')*activationMat(j)*(1 - activationMat(j))
				weightMat(:, j) = weightMat(:, j) - rate*delta*prevAct'
				biasMat(j) = biasMat(j) - rate*delta
				deltaMat = [deltaMat, delta]
			end
			fprintfMat(workdir + 'Weights' + string(k), nearfloat("succ", weightMat))
			fprintfMat(workdir + 'Bias' + string(k), nearfloat("succ", biasMat))
			fprintfMat(workdir + 'Delta' + string(k), nearfloat("succ", deltaMat))
		end
	end
endfunction


// Function to predict the target given features and model parameter theta
function ypred = neuralNetworkPredict(x, workdir, hiddenLayers)
	
	entries = length(x(:, 1))
	numLayers = length(hiddenLayers) + 1
	ypred = []
	for i = 1:entries
		trow = x(i, :)'
		for j = 1:numLayers
			weightMat = fscanfMat(workdir + 'Weights' + string(j))
			trow = weightMat'*trow
			trow = 1./(1 + exp(-trow))
		end

		maxVal = max(real(trow))
		ypred = [ypred, find(trow == maxVal)]
	end
endfunction