// Demo script for linear regression

getd('../')
M = csvRead('Salary_Data.csv');
M(or(isnan(M),'c'),:) = [];

X = M(:, 1)
y = M(:, 2)
// machineLearn('linear_regression', M, 'fit_intercept=False');
machinePredict('attributes.p', X)