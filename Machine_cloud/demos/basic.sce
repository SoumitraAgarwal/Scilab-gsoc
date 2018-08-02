// Demo script

M = csvRead('Salary_Data.csv')
M(or(isnan(M),'c'),:) = []

data 					= M
algorithm 				= 'linear_regression'
parameters 				= ''

chdir('..')
toolbox_basedir 		= pwd()
chdir('tests')

getd(toolbox_basedir + '/macros')

machineLearn(algorithm, data, toolbox_basedir, parameters)