// Macro to run machine learning models -- Scilab

pyImport pickle;
py = pyBuiltin();
pyImport numpy;

pyImport os.path
os = os.path;
pyImport time

function status = machineLearn(modelName, data, username, ip)

	if(strcmp(modelName, 'linear_regression') == 0)
		fprintfMat('dataMat', data)
		txt 		= mgetl('../python_local.py')
		main 		= pyMain()
		main.script	= modelName
		main.data 	= 'dataMat'
		main.user 	= username
		main.ip 	= ip
		pyEvalStr(txt)
		status = 1
	else
		disp('No such model. Please check model name.')
		status = 0
	end
endfunction

function status = machineLearnURL(modelName, url, preprocessing, username, ip)

	if(strcmp(modelName, 'linear_regression') == 0)
		txt 		= mgetl('../python_local_url.py')
		main 		= pyMain()
		main.script	= modelName
		main.url 	= url
		main.prep 	= preprocessing
		main.user 	= username
		main.ip 	= ip
		pyEvalStr(txt)
		status = 1
	else
		disp('No such model. Please check model name.')
		status = 0
	end
endfunction