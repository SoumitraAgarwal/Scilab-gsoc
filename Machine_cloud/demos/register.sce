// Demo script for linear regression

username 				= 'soumitra'
password 				= 'abc123'
ip 						= '35.237.174.190'

chdir('..')
toolbox_basedir 		= pwd()
chdir('tests')

getd(toolbox_basedir + '/macros')

register(username, ip, password, toolbox_basedir);