// Demo script

data 	 				= input('Name of processed dataset : ',"string")
algorithm 				= input('Algorithm to run : ',"string")
toolbox_basedir 		= input('Base directory for toolbox : ', "string")

getd(toolbox_basedir + '/macros')

machineLearn(algorithm, data, toolbox_basedir);