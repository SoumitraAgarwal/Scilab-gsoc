// Demo script for linear regression

username 				= input('User name : ',"string")
password 				= input('Password : ',"string")
ip 						= input('Cloud ip : ',"string")
toolbox_basedir 		= input('Base directory for toolbox : ', "string")

getd(toolbox_basedir + '/macros')

register(username, ip, password, toolbox_basedir);