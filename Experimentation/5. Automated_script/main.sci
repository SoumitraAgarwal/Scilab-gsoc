// Macro to run machine learning models -- Scilab

pyImport pickle;
py = pyBuiltin();
pyImport numpy;

pyImport os.path
os = os.path;
pyImport time

function status = passwordChange(username, oldpassword, newpassword, ip)
	main 	= pyMain()
	txt 	= mgetl('../python_change_pass.py')
	main.opassword 	= oldpassword
	main.username 	= username
	main.npassword 	= newpassword
	main.ip 		= ip
	pyEvalStr(txt)
	status 	= 1
endfunction

function status = register(username, password, ip)
	main 	= pyMain()
	txt 	= mgetl('../python_register.py')
	main.password 	= password
	main.user 	 	= username
	main.ip 		= ip
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


function status = machineLearnCustom(script, data, username, ip, password)

	txt 		= mgetl('../python_local_custom.py')
	main 		= pyMain()
	main.script	= script
	main.data 	= data
	main.user 	= username
	main.passw 	= password
	main.ip 	= ip
	pyEvalStr(txt)
	status = 1
endfunction

function status = machineLearnCustomURL(script, url, preprocessing, username, ip, password)

	txt 		= mgetl('../python_local_custom_url.py')
	main 		= pyMain()
	main.script	= script
	main.url 	= url
	main.prep 	= preprocessing
	main.user 	= username
	main.ip 	= ip
	main.passw 	= password
	pyEvalStr(txt)
	status = 1
endfunction