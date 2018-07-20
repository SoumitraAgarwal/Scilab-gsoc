// Demo script for linear regression

getd('../')
M = csvRead('Salary_Data.csv')
M(or(isnan(M),'c'),:) = []

machineLearn('logistic_regression', M, '');