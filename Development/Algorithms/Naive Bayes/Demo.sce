// Demo for logistic regression -- Scilab 

getd('.')

// Data preparation
M = csvRead('train.csv')
x = M(:, [1,2,3,4,5,6,7,8]);
y = M(:, 9);

y(or(isnan(x),'c'),:) = []
x(or(isnan(x),'c'),:) = []

probMat = naiveBayes(x, y)
testx = x;
pred = naiveBayesGaussian(x, y, probMat, testx)
disp(0.5*sqrt(norm(y - pred)))