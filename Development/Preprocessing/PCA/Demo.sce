// Demo script for PCA

getd('.')

// Data preparation
M = csvRead('Datasets/titanic.csv')
x = M(:, [2,3,6,7,8,10]);
x(or(isnan(x),'c'),:) = []
x = real(x);
pca = PCA(x);
disp(pca)