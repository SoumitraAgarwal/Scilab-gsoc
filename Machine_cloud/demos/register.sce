// Demo script for linear regression

data_url 				= input('URL for the dataset : ',"string")
algorithm 				= input('Algorithm to run : ',"string")
preprocessing_script 	= input('Preprocessing script : ',"string")
username 				= input('User name : ',"string")
password 				= input('Password : ',"string")
ip 						= input('Cloud ip : ',"string")
toolbox_basedir 		= input('Base directory for toolbox : ', "string")

getd(toolbox_basedir + '/macros')

machineLearnURL(algorithm, data_url, preprocessing_script, username, ip, password, toolbox_basedir);
