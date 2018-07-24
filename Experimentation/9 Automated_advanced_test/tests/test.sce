// Demo script for linear regression

getd('../')
M = csvRead('Salary_Data.csv')
M(or(isnan(M),'c'),:) = []

X = M(:, 1)
y = M(:, 2)


models = mgetl('models')
params = mgetl('parameters')

nummodels = size(models)
nummodels = nummodels(1)

for i = 1:nummodels
	disp('Running test for ' + models(i) + ' with params ' + params(i))
	machineLearn(models(i), M, params(i));
	//machinePredict('attributes.p', X)
	break
end