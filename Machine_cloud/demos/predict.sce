// Demo script

pickle 	 				= input('Pickle file with model : ',"string")
data 	 				= input('Name of processed dataset : ',"string")
toolbox_basedir 		= input('Base directory for toolbox : ', "string")

getd(toolbox_basedir + '/macros')

machinePredict(pickle, data, toolbox_basedir);
