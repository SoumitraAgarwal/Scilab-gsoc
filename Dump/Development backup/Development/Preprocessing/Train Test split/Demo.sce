// Demo script for train test split

getd('.')

// Data preparation
M = csvRead('Summary of Weather.csv')
x = M(1:2000, [6, 10]);