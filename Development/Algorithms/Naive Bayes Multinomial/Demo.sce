// Demo for multinomial naive bayes regression -- Scilab 

getd('.')

// Data preparation
M = csvRead('train.csv')
x = M(:, 1);
y = M(:, 9);

y(or(isnan(x),'c'),:) = []
x(or(isnan(x),'c'),:) = []

probMat = naiveMultBayes(x, y)
testx = x;
pred = naiveMultBayesGaussian(x, y, probMat, testx)
disp(0.5*sqrt(norm(y - pred)))