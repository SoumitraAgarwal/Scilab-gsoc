// Demo script for median

getd('.')

// Data preparation
M = csvRead('Datasets/titanic.csv')
x = M(:, [6, 8]);
y = M(:, 2)

y(or(isnan(x),'c'),:) = []
x(or(isnan(x),'c'),:) = []

disp(tabul(y))
[xnew, ynew] = rebalanceOver(x, y);
disp(tabul(ynew))
[xnew, ynew] = rebalanceCluster(x, y, 3);
disp(tabul(ynew))