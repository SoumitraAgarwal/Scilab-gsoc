// Macro to run machine learning models -- Scilab

pyImport pickle;
py = pyBuiltin();
pyImport numpy;

pyImport os.path
os = os.path;
pyImport time

function status = passwordChange(username, oldpassword, newpassword, ip, toolbox_basedir)
	main 	= pyMain()
	txt 	= mgetl(toolbox_basedir + 'macros/python_change_pass.py')
	main.opassword 	= oldpassword
	main.username 	= username
	main.npassword 	= newpassword
	main.ip 		= ip
	main.base 		= toolbox_dir
	pyEvalStr(txt)
	status 	= 1
endfunction

function status = register(username, password, ip, toolbox_basedir)
	main 	= pyMain()
	txt 	= mgetl(toolbox_basedir + 'macros/python_register.py')
	main.password 	= password
	main.user 	 	= username
	main.ip 		= ip
	main.base 	= toolbox_dir
	pyEvalStr(txt)
	status 	= 1
endfunction

function status = machineLearn(modelName, data, toolbox_dir)

	files 		= listfiles(toolbox_dir + '/data/')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl(toolbox_dir + '/data/username.data')
		password 	= mgetl(toolbox_dir + '/data/password.data')
		ip 			= mgetl(toolbox_dir + '/data/ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen(toolbox_dir + '/data/username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen(toolbox_dir + '/data/password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen(toolbox_dir + '/data/ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
	models 	= mgetl(toolbox_dir + '/macros/models')
	index 	= grep(models, modelName)
	if(length(index) == 1)
		if(strcmp(a(index), modelName) == 0)
			fprintfMat('dataMat', data)
			txt 		= mgetl(toolbox_dir + '/macros/python_local.py')
			main 		= pyMain()
			main.script	= modelName
			main.data 	= 'dataMat'
			main.user 	= username
			main.passw 	= password
			main.ip 	= ip
			main.base 	= toolbox_dir
			pyEvalStr(txt)
			status = 1
		end
	else
		disp('No such model. Please check model name.')
		status = 0
	end
endfunction


function status = machineLearnURLDownload(url, toolbox_dir)

	files 		= listfiles(toolbox_dir + '/data/')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl(toolbox_dir + '/data/username.data')
		password 	= mgetl(toolbox_dir + '/data/password.data')
		ip 			= mgetl(toolbox_dir + '/data/ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen(toolbox_dir + '/data/username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen(toolbox_dir + '/data/password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen(toolbox_dir + '/data/ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
	txt 		= mgetl(toolbox_dir + '/macros/python_download.py')
	main 		= pyMain()
	main.url 	= url
	main.user 	= username
	main.passw 	= password
	main.ip 	= ip
	pyEvalStr(txt)
	status = 1

endfunction

function status = machineLearnURL(modelName, preprocessing, toolbox_dir)

	files 		= listfiles(toolbox_dir + '/data/')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl(toolbox_dir + '/data/username.data')
		password 	= mgetl(toolbox_dir + '/data/password.data')
		ip 			= mgetl(toolbox_dir + '/data/ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen(toolbox_dir + '/data/username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen(toolbox_dir + '/data/password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen(toolbox_dir + '/data/ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
	models 	= mgetl(toolbox_dir + '/macros/models')
	index 	= grep(models, modelName)
	if(length(index) == 1)
		if(strcmp(a(index), modelName) == 0)
			txt 		= mgetl(toolbox_dir + '/macros/python_local_url.py')
			main 		= pyMain()
			main.script	= modelName
			main.prep 	= preprocessing
			main.user 	= username
			main.passw 	= password
			main.ip 	= ip
			main.base 	= toolbox_dir
			pyEvalStr(txt)
			status = 1
		end
	else
		disp('No such model. Please check model name.')
		status = 0
	end
endfunction


function status = machineLearnCustom(script, data, toolbox_dir)

	files 		= listfiles(toolbox_dir + '/data/')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl(toolbox_dir + '/data/username.data')
		password 	= mgetl(toolbox_dir + '/data/password.data')
		ip 			= mgetl(toolbox_dir + '/data/ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen(toolbox_dir + '/data/username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen(toolbox_dir + '/data/password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen(toolbox_dir + '/data/ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
	txt 		= mgetl(toolbox_dir + '/macros/python_local_custom.py')
	main 		= pyMain()
	main.script	= script
	main.data 	= data
	main.user 	= username
	main.passw 	= password
	main.ip 	= ip
	main.base 	= toolbox_dir
	pyEvalStr(txt)
	status = 1
endfunction

function status = machineLearnCustomURL(script, preprocessing, toolbox_dir)

	files 		= listfiles(toolbox_dir + '/data/')
	index 		= grep(files, 'username.data')
	username 	= ''
	password 	= ''
	ip 			= ''
	if(length(index) == 1)
		username 	= mgetl(toolbox_dir + '/data/username.data')
		password 	= mgetl(toolbox_dir + '/data/password.data')
		ip 			= mgetl(toolbox_dir + '/data/ip.data')
	else
		username 				= input('User name : ',"string")
		password 				= input('Password : ',"string")
		ip 						= input('Cloud ip : ',"string")

		fd = mopen(toolbox_dir + '/data/username.data','wt');
		mputl(username,fd);
		mclose(fd);

		fd = mopen(toolbox_dir + '/data/password.data','wt');
		mputl(password,fd);
		mclose(fd);

		fd = mopen(toolbox_dir + '/data/ip.data','wt');
		mputl(ip,fd);
		mclose(fd);
	end
	txt 		= mgetl(toolbox_dir + '/macros/python_local_custom_url.py')
	main 		= pyMain()
	main.script	= script
	main.prep 	= preprocessing
	main.user 	= username
	main.ip 	= ip
	main.passw 	= password
	main.base 	= toolbox_dir
	pyEvalStr(txt)
	status = 1
endfunction