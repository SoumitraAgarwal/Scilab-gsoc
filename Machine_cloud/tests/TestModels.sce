M = csvRead('Salary_Data.csv')
M(or(isnan(M),'c'),:) = []

data 					= M
chdir('..')
toolbox_basedir 		= pwd()
chdir('tests')

getd(toolbox_basedir + '/macros')

models = mgetl('../macros/models')
numfiles = size(models)
for i = 23:numfiles(1)
	model = models(i)
	disp('Running ' + string(i) + ' of ' + string(numfiles(1)) + ' : ' + model)
	machineLearn(model, data, toolbox_basedir, '')
end