// Macro for neural network -- Scilab 

// Function to train a neural network model
function theta = neuralNetworkTrain(x, y, hiddenLayers, batchSize, iterations)	

	files = dir('Models')
	modelsNumber = size(files.name)(1) + 1
	mkdir('Models/Model' + string(modelsNumber))
	workdir = 'Models/Model' + string(modelsNumber) + '/'


	numLayers 	= length(hiddenLayers(1,:))
	layersize 	= max(hiddenLayers)
	n 			= length(x(:,1)) 
	activation  = zeros(layersize, numlayers + 1);
	prevLayer 	= length(x(1,:))
	for i = 1:numLayers
		weightMat = zeros(prevLayer, hiddenLayers(i))
		fd = mopen(workdir + 'Weights' + string(i),'wt');
		mputl(string(weightMat),fd);
		mclose(fd)
		prevLayer = hiddenLayers(i);
	end

	weightMat = zeros(prevLayer, length(unique(y)))
	fd = mopen(workdir + 'Weights' + string(numLayers + 1),'wt');
	mputl(string(weightMat),fd);
	mclose(fd)
	prevLayer = hiddenLayers(i);

	for i = 1:iterations
	
		parseMat = x(i, :);
		// Forward propagation
		for j = 1:numlayers
			
			weightMat = 
			activation(1:hiddenLayers(j), j) = 
			parseMat = activation(1:hiddenLayers(j), j)


endfunction


// Function to predict the target given features and model parameter theta
function ypred = neuralNetworkPredict(x, model)

endfunction