// Demo script

data_url 				= input('URL for the dataset : ',"string")
script					= input('Name of the custom script : ', "string")
preprocessing_script 	= input('Preprocessing script : ',"string")
toolbox_basedir 		= input('Base directory for toolbox : ', "string")

getd(toolbox_basedir + '/macros')

machineLearnCustomURL(script, data_url, preprocessing_script, toolbox_basedir);
