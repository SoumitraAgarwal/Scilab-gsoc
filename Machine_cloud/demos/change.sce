// Demo script for linear regression

username 				= 'soumitra'
oldpassword				= 'abc123'
ip 						= '35.237.174.190'
newpassword 			= input('Enter new password : ', string)
chdir('..')
toolbox_basedir 		= pwd()
chdir('tests')

getd(toolbox_basedir + '/macros')

passwordChange(username, oldpassword, newpassword, ip, toolbox_basedir)