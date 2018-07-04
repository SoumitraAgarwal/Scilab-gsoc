// Demo script for linear regression

getd('../')

// Data preparation
M = csvRead('Salary_Data.csv')
M(or(isnan(M),'c'),:) = []

machineLearn('linear_regression', M);