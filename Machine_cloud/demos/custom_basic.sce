// Demo script

data 					= 'Salary_Data.csv'

pres 					= 'custom'
chdir('..')
toolbox_basedir 		= pwd()
chdir('tests')

getd(toolbox_basedir + '/macros')

machineLearnCustom(pres, data, toolbox_basedir)