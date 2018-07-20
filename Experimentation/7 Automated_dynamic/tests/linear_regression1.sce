// Demo script for linear regression

getd('../')
M = csvRead('Salary_Data.csv')
M(or(isnan(M),'c'),:) = []

machineLearn('linear_regression', M, 'fit_intercept=False');