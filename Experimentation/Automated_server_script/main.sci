// Macro to run machine learning models -- Scilab

pyImport pickle;
py = pyBuiltin();
pyImport numpy;

pyImport os.path
os = os.path;
pyImport time

function status = machineLearn(modelName, data)

	if(strcmp(modelName, 'linear_regression') == 0)
		fprintfMat('dataMat', data)
		txt 		= mgetl('../python_local.py')
		main 		= pyMain()
		main.script	= modelName
		main.data 	= 'dataMat'
		pyEvalStr(txt)
		status = 1
	else
		disp('No such model. Please check model name.')
		status = 0
	end