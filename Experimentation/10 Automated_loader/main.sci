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

function status = loader(key)
	files 		= listfiles('.')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl('username.data')
		password 	= mgetl('password.data')
		ip 			= mgetl('ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen('username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen('password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen('ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
	txt 		= mgetl('../python_load.py')
	main 		= pyMain()
	main.key 	= key 
	main.user 	= username
	main.passw 	= password
	main.ip 	= ip
	pyEvalStr(txt)
	status = 1
endfunction

function status = machineLearn(modelName, data, parameters)

	files 		= listfiles('.')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl('username.data')
		password 	= mgetl('password.data')
		ip 			= mgetl('ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen('username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen('password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen('ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
	models 	= mgetl('../models')
	index 	= grep(models, modelName)
	if(length(index) > 1)
		index = index(1)
	end
	if(length(index) == 1)
		if(strcmp(models(index), modelName) == 0)
			fprintfMat('dataMat', data)
			txt 		= mgetl('../python_local.py')
			main 		= pyMain()
			main.script	= modelName
			main.data 	= 'dataMat'
			main.user 	= username
			main.passw 	= password
			main.ip 	= ip
			main.parameters = parameters
			pyEvalStr(txt)
			status = 1
		end
	else
		disp('No such model. Please check model name.')
		status = 0
	end
endfunction

function status = machineLearnURLDownload(url)

	files 		= listfiles('.')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl('username.data')
		password 	= mgetl('password.data')
		ip 			= mgetl('ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen('username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen('password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen('ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
	txt 		= mgetl('../python_download.py')
	main 		= pyMain()
	main.url 	= url
	main.user 	= username
	main.passw 	= password
	main.ip 	= ip
	pyEvalStr(txt)
	status = 1

endfunction

function status = machineLearnURL(modelName, preprocessing)

	files 		= listfiles('.')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl('username.data')
		password 	= mgetl('password.data')
		ip 			= mgetl('ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen('username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen('password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen('ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
	models 	= mgetl('../models')
	index 	= grep(models, modelName)
	if(length(index) > 1)
		index = index(1)
	end
	if(length(index) == 1)
		if(strcmp(models(index), modelName) == 0)
			txt 		= mgetl('../python_local_url.py')
			main 		= pyMain()
			main.script	= modelName
			main.prep 	= preprocessing
			main.user 	= username
			main.passw 	= password
			main.ip 	= ip
			main.parameters = parameters
			pyEvalStr(txt)
			status = 1
		end
	else
		disp('No such model. Please check model name.')
		status = 0
	end
endfunction


function status = machineLearnCustom(script, data)
	
	files 		= listfiles('.')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl('username.data')
		password 	= mgetl('password.data')
		ip 			= mgetl('ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen('username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen('password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen('ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
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

function status = machineLearnCustomURL(script, preprocessing)

	files 		= listfiles('.')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl('username.data')
		password 	= mgetl('password.data')
		ip 			= mgetl('ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen('username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen('password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen('ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
	txt 		= mgetl('../python_local_custom_url.py')
	main 		= pyMain()
	main.script	= script
	main.prep 	= preprocessing
	main.user 	= username
	main.ip 	= ip
	main.passw 	= password
	pyEvalStr(txt)
	status = 1
endfunction

function status = machinePredict(pickle, data)
	files 		= listfiles('.')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl('username.data')
		password 	= mgetl('password.data')
		ip 			= mgetl('ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen('username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen('password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen('ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
	fprintfMat('dataMat', data)
	txt 		= mgetl('../python_local_predict.py')
	main 		= pyMain()
	main.data 	= data
	main.user 	= username
	main.passw 	= password
	main.ip 	= ip
	main.model 	= pickle
	pyEvalStr(txt)
	status 		= 1
endfunction