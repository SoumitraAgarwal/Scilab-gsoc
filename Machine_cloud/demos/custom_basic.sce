// Demo script

data 	 				= input('Name of processed dataset : ',"string")
script					= input('Name of the custom script : ', "string")
algorithm 				= input('Algorithm to run : ',"string")
toolbox_basedir 		= input('Base directory for toolbox : ', "string")

getd(toolbox_basedir + '/macros')

machineLearnCustom(script, data, toolbox_basedir)