// Demo for decision tree -- Scilab 

getd('../macros')

// Data preparation
M = csvRead('Datasets/standard.csv')
x = M(:,[2, 3,4 ,5 ,6]);
y = M(:, 9);

y(or(isnan(x),'c'),:) = []
x(or(isnan(x),'c'),:) = []
[questions,flag] 	= decisionTreeFit(x, y);
pred				= decisionTreePredict(x, questions, flag);
disp(0.5*norm(pred' - y))