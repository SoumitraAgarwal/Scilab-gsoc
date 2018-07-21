// Demo script

data 	 				= input('Name of processed dataset : ',"string")
algorithm 				= input('Algorithm to run : ',"string")
toolbox_basedir 		= input('Base directory for toolbox : ', "string")

getd('..')

machineLearn(algorithm, data, toolbox_basedir, '');