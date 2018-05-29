// Demo for logistic regression -- Scilab 

getd('.')

// Data preparation
M = csvRead('train.csv')
x = M(:,[1, 2, 3, ,4 ,5 ,6, 7]);
y = M(:, 9);

y(or(isnan(x),'c'),:) = []
x(or(isnan(x),'c'),:) = []
questions = decisionTreeFit(x, y);
disp(questions)