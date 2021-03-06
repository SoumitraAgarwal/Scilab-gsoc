// Macro to run machine learning models -- Scilab

pyImport pickle;
py = pyBuiltin();
pyImport numpy;

pyImport os.path
os = os.path;
pyImport time

function status = passwordChange(username, oldpassword, newpassword)
	main 	= pyMain()
	txt 	= mgetl('../python_change_pass.py')
	main.opassword 	= oldpassword
	main.username 	= username
	main.npassword 	= newpassword
	pyEvalStr(txt)
	status 	= 1
endfunction

function status = register(username, password)
	main 	= pyMain()
	txt 	= mgetl('../python_register.py')
	main.password 	= password
	main.username 	= username
	pyEvalStr(txt)
	status 	= 1
endfunction

function status = machineLearn(modelName, data, username, ip, password)

	if(strcmp(modelName, 'linear_regression') == 0)
		fprintfMat('dataMat', data)
		txt 		= mgetl('../python_local.py')
		main 		= pyMain()
		main.script	= modelName
		main.data 	= 'dataMat'
		main.user 	= username
		main.passw 	= password
		main.ip 	= ip
		pyEvalStr(txt)
		status = 1
	else
		disp('No such model. Please check model name.')
		status = 0
	end
endfunction

function status = machineLearnURL(modelName, url, preprocessing, username, ip, password)

	if(strcmp(modelName, 'linear_regression') == 0)
		txt 		= mgetl('../python_local_url.py')
		main 		= pyMain()
		main.script	= modelName
		main.url 	= url
		main.prep 	= preprocessing
		main.user 	= username
		main.passw 	= password
		main.ip 	= ip
		pyEvalStr(txt)
		status = 1
	else
		disp('No such model. Please check model name.')
		status = 0
	end
endfunction