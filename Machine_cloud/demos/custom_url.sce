// Demo script

script					= 'custom'

url 					= 'https://raw.githubusercontent.com/franklinwillemen/Machine_Learning/master/Regression/Simple_Linear_Regression/Salary_Data.csv'

preprocessing_script 	= 'preprocessing.py'
parameters 				= ''

chdir('..')
toolbox_basedir 		= pwd()
chdir('tests')

getd(toolbox_basedir + '/macros')
machineLearnURLDownload(url, toolbox_basedir)
machineLearnCustomURL(script, preprocessing_script, toolbox_basedir);
