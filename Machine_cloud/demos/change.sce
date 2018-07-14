// Demo script for linear regression

username 				= input('User name : ',"string")
oldpassword 			= input('Password : ',"string")
newpassword 			= input('New password : ', "string")
ip 						= input('Cloud ip : ',"string")
toolbox_basedir 		= input('Base directory for toolbox : ', "string")

getd(toolbox_basedir + '/macros')

passwordChange(username, oldpassword, newpassword, ip, toolbox_basedir)